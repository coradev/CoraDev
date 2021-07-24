<%-- 
    Document   : coursesPage
    Created on : Mar 1, 2021, 3:33:48 PM
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

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 sidebar">
                        <div class="sidebar-box bg-white p-4 ftco-animate">
                            <h3 class="heading-sidebar">Course Category</h3>
                            <form method="GET" action="/searchbycategory" class="browse-form">
                                <c:forEach items="${categories}" var="cate">
                                    <label for="${cate.id}">
                                        <input type="checkbox" id="${cate.id}" name="categoryid" 
                                               <c:forEach items="${listid}" var="cateid">
                                                   <c:if test="${cateid == cate.id}"> checked </c:if>      
                                               </c:forEach>
                                               value="${cate.id}">${cate.name}
                                    </label>
                                </c:forEach>    
                                <button type="submit" class="btn form-submit">Filter</button>       
                            </form>
                        </div>

                    </div>

                    <div id="listcourse" class="col-lg-9">
                        <div class="row">
                            <c:if test="${empty coursesForEachPage}">
                                <h2>Category is empty course!</h2>
                            </c:if>
                            <c:forEach items="${coursesForEachPage}" var="course">
                                <div class="col-md-6 d-flex align-items-stretch ftco-animate">
                                    <div class="project-wrap">
                                        <a href="/coursedetail?courseid=${course.id}" class="img" style="background-image: url(/upload/${course.cover_image});">
                                            <span class="price">
                                                $ ${course.fee}
                                            </span>
                                        </a>
                                        <div class="text p-4">
                                            <h3><a href="/coursedetail?courseid=${course.id}">${course.title}</a></h3>
                                            <p class="text-limit">${course.introduce}</p>                                             
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <c:if test="${countPage != null}">
                            <!--PAGING-->
                            <ul>
                                <c:forEach begin="1" end="${countPage}" var="p">
                                    <li class="${p == PAGE ? "active":""}">
                                        <a href="courses?page=${p}">${p}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <!--END PAGING-->
                        </c:if>
                    </div>
                </div>
        </section>
        <%@include file="../component/footerComponent.jsp" %>
        <%@include file="../component/scriptComponent.jsp" %>


    </body>
</html>
