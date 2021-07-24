<%-- 
    Document   : myCoursePage
    Created on : Mar 24, 2021, 9:03:03 PM
    Author     : admin
--%>

<%@page import="seo.Seo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            seo.Seo seo = new Seo();
            seo.setTitle("My Course");
            request.setAttribute("seo", seo);
        %>
        <%@include file="../component/headComponent.jsp" %>
    </head>
    <body>
        <%@include file="../component/headerComponent.jsp" %>
        <%@include file="../component/beforeHeaderComponent.jsp" %>



        <div class="container my-5">
            <c:if test="${enrollments != null && not empty enrollments}">
                <div class="container my-5">
                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Course name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set value="0" var="count"/>
                            <c:forEach items="${enrollments}" var="e" >
                                <tr>
                                    <th scope="row">${count = count + 1}</th>
                                    <td>${e.course_bought}</td>
                                    <td>${e.fee} USD</td>
                                    <td>
                                        <c:if test="${e.is_paid_subscription}">
                                            <div class="text-success" >Activated</div>
                                        </c:if>
                                        <c:if test="${not e.is_paid_subscription}">
                                            <div class="text-danger" >Not activated</div>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <form action="/payment" method="GET">
                        <p class="mb-5 text-center text-danger h4">If you haven't paid yet! You need to pay for the course approval for you by the administration!
                            <button class="btn btn-success" type="submit">PAYMENT</button>
                        </p>
                    </form>
                </div>
            </c:if>
            <c:if test="${enrollments == null || empty enrollments}">
                <h2 class="my-5 text-center">YOU HAS NO COURSE !!</h2>
            </c:if>
        </div>


        <%@include file="../component/footerComponent.jsp" %>
        <%@include file="../component/scriptComponent.jsp" %>

    </body>
</html>
