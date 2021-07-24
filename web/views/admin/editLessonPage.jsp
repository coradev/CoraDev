<%-- 
    Document   : editLessonPage
    Created on : Mar 21, 2021, 1:50:03 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../component/admin-require-logged.jsp" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>CoraDev - Programming For Beginner</title>
        <!-- Bootstrap Core CSS -->
        <link href="../../static/admin/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="../../static/admin/css/metisMenu.min.css" rel="stylesheet">
        <!-- Timeline CSS -->
        <link href="../../static/admin/css/timeline.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../../static/admin/css/startmin.css" rel="stylesheet">
        <!-- Morris Charts CSS -->
        <link href="../../static/admin/css/morris.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="../../static/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- jQuery -->
        <script src="../../static/admin/js/jquery.min.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <%@include file="../component/navigationComponent.jsp" %>
            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header"><a href="/admin-chapter?chapaction=edit&chapterid=${lesson.chapter_id}&courseid=${course.id}" class="btn btn-primary btn-sm"><i class="fa fa-arrow-circle-left"></i> Back </a> Edit Lesson </h1>
                        </div>
                    </div>




                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Lesson of Chapter - ${course.title}
                                </div>
                                <div class="panel-body">
                                    <form method="GET" action="/admin-lesson">
                                        <input type="hidden" name="lessaction" value="update"/>
                                        <input type="hidden" name="lessonid" value="${lesson.id}"/>
                                        <input type="hidden" name="courseid" value="${courseid}"/>
                                        <div class="col-lg-8">
                                            <div class="form-group">
                                                <label>Lesson title</label>                                            
                                                <input class="form-control" id="lesson_name" name="lesson_name" value="${lesson.title}" required/>
                                            </div>
                                            <div class="form-group">
                                                <label>Lesson video</label>
                                                <input class="form-control" id="lesson_video" name="lesson_video" value="${lesson.video_link}" required/>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label>Chapter name</label>
                                                <select class="form-control" name="chapter_id">
                                                    <c:forEach items="${chapters}" var="chapter">

                                                        <c:if test="${chapter.id == lesson.chapter_id}">
                                                            <option value="${chapter.id}" selected>${chapter.name}</option>
                                                        </c:if>
                                                        <c:if test="${chapter.id != lesson.chapter_id}">
                                                            <option value="${chapter.id}">${chapter.name}</option>
                                                        </c:if>

                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <button type="submit" id="addLessonButton" class="btn btn-primary">Update Lesson</button>

                                        </div>

                                    </form>
                                </div>
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap Core JavaScript -->
        <script src="../../static/admin/js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../../static/admin/js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../../static/admin/js/startmin.js"></script>
    </body>
</html>
