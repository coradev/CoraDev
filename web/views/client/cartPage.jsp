<%-- 
    Document   : cartPage
    Created on : Mar 22, 2021, 10:52:44 PM
    Author     : admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../component/require-logged.jsp" %>
        <%@include file="../component/headComponent.jsp" %>
    </head>
    <body>
        <%@include file="../component/headerComponent.jsp" %>
        <%@include file="../component/beforeHeaderComponent.jsp" %>



        <c:set value="${sessionScope.cart}" var="cart"/>
        <c:if test="${sessionScope.quantityitem != null && sessionScope.quantityitem != 0}">
            <div class="container my-5">
                <table class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Course name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set value="0" var="count" />
                        <c:forEach items="${cart.items}" var="item">
                            <tr>
                                <th scope="row">${count = count + 1}</th>
                                <td>${item.course.title}</td>
                                <td>${item.course.fee}</td>
                                <td>
                                    <form method="post">
                                        <input type="hidden" name="courseid" value="${item.course.id}"/>
                                        <button class="btn btn-danger" formaction="/removeitem">remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <form action="/checkout" method="POST">
                    <button class="btn btn-success" type="submit">Check out</button>
                </form>
            </div>
        </c:if>
        <c:if test="${sessionScope.quantityitem == null || sessionScope.quantityitem == 0}">
            <h2 class="my-5 text-center">CART IS EMPTY !!</h2>
        </c:if>




        <%@include file="../component/footerComponent.jsp" %>
        <%@include file="../component/scriptComponent.jsp" %>

    </body>
</html>
