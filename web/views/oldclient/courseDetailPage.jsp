<%-- 
    Document   : courseDetailPage
    Created on : Mar 1, 2021, 3:37:42 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../component/require-logged.jsp" %>
        <%@include file="../component/require-bought.jsp" %>
        <%@include file="../component/seoComponent.jsp" %>
        <%@include file="../component/cssComponent.jsp" %>
    </head>
    <body>
        <%@include file="../component/headerComponent.jsp" %>
        <%@include file="../component/beforeHeaderComponent.jsp" %>
        <c:set var="course" value="${course}"></c:set>

            <section class="ftco-section ftco-no-pt ftco-no-pb">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 ftco-animate py-md-5 mt-md-5">
                            <h2 class="my-4">#1. Course Description</h2>
                            <p>${course.introduce}</p>
                        <h2 class="mb-3">#2. Course Lesson</h2>
                        <div id="accordion">
                            <c:set var="accordionCount" value="0" />
                            <c:set var="chapCount" value="0" />
                            <c:set var="lesCount" value="0" />

                            <c:forEach items="${course.chapters}" var="chapter">
                                <div class="card m-lesson mt-1">       
                                    <a class="card-header collapsed bg-fullstack text-cl-black pointer text-black no-copy" data-toggle="collapse" data-target="#chapter${accordionCount}">
                                        ➤ Chapter ${chapCount = chapCount + 1}: ${chapter.name}
                                    </a>
                                    <div id="chapter${accordionCount}" class="panel-collapse collapse ${accordionCount = accordionCount + 1}" data-parent="#accordion">
                                        <ul class="list-group">
                                            <c:forEach items="${chapter.lessons}" var="lesson">
                                                <li class="list-group-item" id="demo">
                                                    <i class="fas fa-play-circle mr-2" style="color:orange"></i>
                                                    <a href="/lessons?courseid=${course.id}&chapterid=${chapter.id}&lessonid=${lesson.id}" style="color: black" >${lesCount = lesCount + 1}. ${lesson.title}</a>
                                                </li>
                                            </c:forEach>
                                        </ul> 
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <h2 class="mb-3">#3. What you’ll learn? </h2>
                        <ul>
                            <c:forEach var="pur" items="${purport}">
                                <li>${pur}</li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="col-lg-4 sidebar ftco-animate pl-md-4 py-md-5">
                        <div class="sidebar-box mt-md-5 bg-light">
                            <div class="card" style="width: 100%;">
                                <div class="card-body">
                                    <iframe class="card-img-top" src="https://www.youtube.com/embed/${course.intro_video}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                    <h5 class="card-title text-center">Introduction Video</h5>
                                    <c:if test="${checkaccesscourse == false}">
                                        <form action="/addtocart" method="POST">
                                            <input type="hidden" name="courseid" value="${course.id}"/>
                                            <input type="submit" class="btn form-submit text-white" value="Add to cart"></input>
                                        </form>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="../component/footerComponent.jsp" %>
        <%@include file="../component/scriptComponent.jsp" %>
    </body>
</html>
