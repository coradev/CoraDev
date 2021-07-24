<%-- 
    Document   : lessonPage
    Created on : Mar 21, 2021, 10:07:59 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <%@include file="../component/require-logged.jsp" %>
        <!--Lesson CSS-->
        <link href="../../static/oldclient/css/lesson.css" rel="stylesheet">
        <%@include file="../component/seoComponent.jsp" %>
        <link href="../../static/client/css/bootstrap.css" rel="stylesheet">
        <link href="../../static/client/css/main.css" rel="stylesheet">
        <link href="../../static/client/css/responsive.css" rel="stylesheet">
        <link rel="shortcut icon" href="../../static/client/images/favicon.png" type="image/x-icon">
        <link rel="icon" href="../../static/client/images/favicon.png" type="image/x-icon">
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Titillium+Web:wght@300;400;600;700;900&display=swap"
            rel="stylesheet">
        <!-- Responsive -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

    </head>

    <body>
        <div class="page-wrapper">
            <!-- Preloader -->
            <div class="preloader"></div>

            <header class="header">
                <ul class="header__navbar">
                    <li class="header__navbar-item">
                        <a href="/coursedetail?courseid=${course.id}">
                            <img src="../../static/oldclient/images/back.svg" class="header__navbar-back">
                        </a>
                    </li>
                    <li class="header__navbar-item">
                        <a href="/">
                            <img class="header__navbar-logo" src="../../static/oldclient/images/logo.png">
                        </a>
                    </li>
                    <span class="header__navbar-line"></span>
                    <li class="header__navbar-item header__navbar-title"> ${lesson.title} </li>
                </ul>
            </header>

            <!-- Intro Section -->
            <section class="intro-section-two">
                <div class="patern-layer-one paroller" data-paroller-factor="0.40" data-paroller-factor-lg="0.20"
                     data-paroller-type="foreground" data-paroller-direction="vertical"
                     style="background-image: url(../../static/client/images/icons/icon-1.png)"></div>
                <div class="patern-layer-two paroller" data-paroller-factor="0.40" data-paroller-factor-lg="-0.20"
                     data-paroller-type="foreground" data-paroller-direction="vertical"
                     style="background-image: url(../../static/client/images/icons/icon-2.png)"></div>
                <div class="circle-one"></div>
                <div class="auto-container">

                    <div class="inner-container">
                        <div class="row clearfix">

                            <!-- Content Column -->
                            <div class="content-column col-lg-8 col-md-12 col-sm-12">
                                <div class="inner-column">

                                    <div class="course-video-box">
                                        <div style="padding:56.25% 0 0 0;position:relative;">
                                            <iframe style="position:absolute;top:0;left:0;width:100%;height:100%;" src="https://www.youtube.com/embed/${lesson.video_link}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                        </div>
                                    </div>

                                    <!-- Intro Info Tabs-->
                                    <div class="intro-info-tabs">
                                        <!-- Intro Tabs-->
                                        <div class="intro-tabs tabs-box">

                                            <!--Tab Btns-->
                                            <ul class="tab-btns tab-buttons clearfix">
                                                <li data-tab="#prod-reviews" class="tab-btn active-btn">Comments</li>
                                                <li data-tab="#prod-overview" class="tab-btn">Overview</li>
                                            </ul>

                                            <!-- Comment Form -->
                                            <div class="comment-form">
                                                <div class="group-title"><h4>Leave Comment</h4></div>
                                                <!--Comment Form-->
                                                <form method="POST" action="/comment" >
                                                    <div class="row clearfix">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                            <!--get student id login in session-->
                                                            <input type="hidden" id="studentid" name="studentid" value="${sessionScope.studentlogged.id}"/>
                                                            <input type="hidden" id="lessonid" name="lessonid" value="${lesson.id}"/>
                                                            <textarea class="" id="commentpurport" name="commentpurport" placeholder="Write your comment..."></textarea>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                            <button class="theme-btn btn-style-three" id="buttonAddComment" type="submit"><span class="txt">Submit Your Comment <i class="fa fa-angle-right"></i></span></button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <!--End Comment Form -->

                                            <!--Tabs Container-->
                                            <div class="tabs-content">

                                                <!-- Tab -->
                                                <div class="tab active-tab" id="prod-reviews">
                                                    <div id="commentdiv" class="content">
                                                        <c:if test="${empty comments}">
                                                            <h4 class="centered">No comment in this lesson!</h4>
                                                        </c:if>

                                                        <c:if test="${!empty comments}">
                                                            <c:forEach items="${comments}" var="comment">
                                                                <div class="cource-review-box">
                                                                    <h4>${comment.student_name}</h4>
                                                                    <div class="text">↳ ${comment.purport}</div>
                                                                </div>
                                                            </c:forEach>
                                                        </c:if>

                                                    </div>
                                                </div>

                                                <!--Tab-->
                                                <div class="tab" id="prod-overview">
                                                    <div class="content">
                                                        <!-- Cource Overview -->
                                                        <div class="course-overview">
                                                            <div class="inner-box">
                                                                <h4>${course.title}</h4>
                                                                <p>${course.introduce}</p>
                                                                <h3>What you’ll learn?</h3>
                                                                <ul class="review-list">
                                                                    <c:forEach var="pur" items="${purport}">
                                                                        <li>
                                                                            ${pur}
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <!-- Accordian Column -->
                            <div class="accordian-column col-lg-4 col-md-12 col-sm-12">
                                <div class="inner-column sticky-top">
                                    <h4>Table of contents</h4>
                                    <!-- Accordion Box -->

                                    <ul class="accordion-box style-two">
                                        <!-- Block -->

                                        <c:forEach items="${course.chapters}" var="chapter">
                                            <c:if test="${chapter.id == chapterid}">
                                                <li class="accordion block">
                                                    <div class="acc-btn">
                                                        <div class="icon-outer"><span
                                                                class="icon icon-plus flaticon-angle-arrow-down"></span></div>
                                                            ${chapter.name}
                                                    </div>
                                                    <div class="acc-content current">
                                                        <c:forEach items="${chapter.lessons}" var="lesson">
                                                            <div class="content">
                                                                <div class="clearfix">
                                                                    <div class="pull-left">
                                                                        <a href="/lessons?courseid=${course.id}&chapterid=${chapter.id}&lessonid=${lesson.id}"
                                                                           class="play-icon"><span class="fa fa-play">
                                                                                <c:if test="${lesson.id == lessonid}">
                                                                                    <i class="ripple"></i>
                                                                                </c:if>
                                                                            </span>${lesson.title}</a>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                        </c:forEach>
                                                    </div>
                                                </li>
                                            </c:if>
                                            <c:if test="${chapter.id != chapterid}">
                                                <li class="accordion block">
                                                    <div class="acc-btn">
                                                        <div class="icon-outer"><span
                                                                class="icon icon-plus flaticon-angle-arrow-down"></span></div>
                                                            ${chapter.name}
                                                    </div>
                                                    <div class="acc-content">
                                                        <c:forEach items="${chapter.lessons}" var="lesson">
                                                            <div class="content">
                                                                <div class="clearfix">
                                                                    <div class="pull-left">
                                                                        <a href="/lessons?courseid=${course.id}&chapterid=${chapter.id}&lessonid=${lesson.id}"
                                                                           class="play-icon"><span class="fa fa-play">
                                                                            </span>${lesson.title}</a>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                        </c:forEach>
                                                    </div>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </section>
            <!-- End intro Courses -->

        </div>
        <!--End pagewrapper-->
        <!--Scroll to top-->
        <div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-arrow-circle-up"></span></div>

        <script src="../../static/client/js/jquery.js"></script>
        <script src="../../static/client/js/popper.min.js"></script>
        <script src="../../static/client/js/jquery.scrollTo.js"></script>
        <script src="../../static/client/js/bootstrap.min.js"></script>
        <script src="../../static/client/js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="../../static/client/js/jquery.fancybox.js"></script>
        <script src="../../static/client/js/appear.js"></script>
        <script src="../../static/client/js/swiper.min.js"></script>
        <script src="../../static/client/js/element-in-view.js"></script>
        <script src="../../static/client/js/jquery.paroller.min.js"></script>
        <script src="../../static/client/js/parallax.min.js"></script>
        <script src="../../static/client/js/tilt.jquery.min.js"></script>
        <!--Master Slider-->
        <script src="../../static/client/js/jquery.easing.min.js"></script>
        <script src="../../static/client/js/owl.js"></script>
        <script src="../../static/client/js/wow.js"></script>
        <script src="../../static/client/js/jquery-ui.js"></script>
        <script src="../../static/client/js/script.js"></script>

        <script>
            $(document).ready(function () {
                $('#buttonAddComment').on('click', function () {
                    var formData = {
                        studentid: $("#studentid").val(),
                        lessonid: $("#lessonid").val(),
                        commentpurport: $("#commentpurport").val()
                    };
                    $.ajax({
                        type: "POST",
                        url: "/comment",
                        data: formData
                    }).done(function (data) {
                        console.log(data);
                        $("#commentdiv").load(" #commentdiv");
                        $('#commentpurport').val('');

                    });
                    event.preventDefault();
                });
            });
        </script>

    </body>

</html>