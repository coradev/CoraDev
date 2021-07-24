<%-- 
    Document   : homePage
    Created on : Mar 1, 2021, 3:25:32 PM
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
        <!-- HEADER -->
        <%@include file="../component/headerComponent.jsp" %>
        <!-- END HEADER -->

        <div class="hero-wrap js-fullheight" style="background-image: url('../../static/oldclient/images/home-img.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center" data-scrollax-parent="true">
                    <div class="col-md-7 ftco-animate">
                        <span class="subheading">Welcome to FUCode</span>
                        <h1 class="mb-4">LEARN TO CODE: <br> FROM ZERO TO HERO</h1>
                        <p class="caps">Easier to get started with coding on FUCode</p>
                        <p class="mb-0"><a href="/courses" class="btn btn-success">Our Course</a> 
                            <a href="#" class="btn btn-white">Learn More</a></p>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row">
                    <c:forEach items="${courseHome}" var="course">
                        <div class="col-md-4 d-flex align-items-stretch ftco-animate">
                            <div class="project-wrap">
                                <a href="/coursedetail?courseid=${course.id}" class="img" style="background-image: url(/upload/${course.cover_image});">
                                    <span class="price">$${course.fee}</span>
                                </a>
                                <div class="text p-4">
                                    <h3><a href="/coursedetail?courseid=${course.id}">${course.title}</a></h3>
                                    <p class="text-limit">${course.introduce}</p>   
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <button onclick="viewAllCourse()" class="btn form-submit" id="view-all">View All Course</button>
                </div>
            </div>
        </section>

        <script>
            function viewAllCourse() {
                window.location.href = "/courses";
            }
        </script>

        <%@include file="../component/footerComponent.jsp" %>
        <%@include file="../component/scriptComponent.jsp" %>
    </body>
</html>
