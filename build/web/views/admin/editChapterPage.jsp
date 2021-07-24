<%-- 
    Document   : editChapterPage
    Created on : Mar 20, 2021, 7:12:14 PM
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
            <c:set var="chapter" value="${chapter}"/>
            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header"><a href="/editcourse?id=${courseid}" class="btn btn-primary btn-sm"><i class="fa fa-arrow-circle-left"></i> Back </a> Edit Chapter </h1>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Edit Chapter
                                </div>
                                <div class="panel-body">

                                    <form method="GET">
                                        <div class="col-lg-8">
                                            <input type="hidden" name="chapaction" value="update" />
                                            <input type="hidden" name="chapterid" value="${chapter.id}"/>
                                            <input type="hidden" name="courseid" value="${courseid}" />
                                            <input class="form-control" id="chapter_name" name="chapter_name" value="${chapter.name}"/>

                                        </div>
                                        <div class="col-lg-4">
                                            <button type="submit" formaction="/admin-chapter" class="btn btn-primary">Update Chapter</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>


                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Lesson of Chapter
                                </div>
                                <div class="panel-body">
                                    <form method="POST" action="/admin-lesson">
                                        <div class="col-lg-8">
                                            <input type="hidden" id="lessaction" name="lessaction" value="add" />
                                            <input class="form-control" id="lesson_name" name="lesson_name" placeholder="Lesson name" required/><br>
                                            <input class="form-control" id="lesson_video" name="lesson_video" placeholder="Lesson video link" required/>
                                            <input type="hidden" id="chapter_id" name="chapter_id" value="${chapter.id}"/>
                                            <input type="hidden" id="course_id" name="course_id" value="${courseid}" />
                                        </div>
                                        <div class="col-lg-4">
                                            <button type="submit" id="addLessonButton" class="btn btn-primary">Add Lesson</button>
                                        </div>
                                    </form>
                                    <table id="lessontable" class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col">NO.</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Video</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="no" value="0"/>
                                            <c:forEach items="${lessons}" var="l">
                                                <tr>
                                                    <th scope="row">${no = no + 1}</th>
                                                    <td>${l.title}</td>
                                                    <td>${l.video_link}</td>
                                                    <td>
                                                        <form method="GET">
                                                            <input type="hidden" name="lessaction" value="delete" />
                                                            <input type="hidden" name="lessonid" value="${l.id}"/>
                                                            <input type="hidden" name="chapterid" value="${chapter.id}"/>
                                                            <input type="hidden" name="courseid" value="${courseid}"/>

                                                            <a class="btn btn-danger btn-sm" href="/admin-lesson?lessaction=edit&lessonid=${l.id}&chapterid=${chapter.id}&courseid=${courseid}">edit</a> &nbsp; 
                                                            <button class="btn btn-primary btn-sm" formaction="/admin-lesson" type="submit">delete</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>


                                </div>
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
            </div>
        </div>


        <script>
            $(document).ready(function () {
                $('#addLessonButton').on('click', function () {
                    var formData = {
                        lessaction: $("#lessaction").val(),
                        lesson_name: $("#lesson_name").val(),
                        lesson_video: $("#lesson_video").val(),
                        chapter_id: $("#chapter_id").val(),
                        course_id: $("#course_id").val(),
                        id: $("#course_id").val()
                    };
                    $.ajax({
                        type: "POST",
                        url: "/admin-lesson",
                        data: formData,
                    }).done(function (data) {
                        console.log(data);
                        $("#lessontable").load(" #lessontable");
                    });
                    event.preventDefault();
                });
            });
        </script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../../static/admin/js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../../static/admin/js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../../static/admin/js/startmin.js"></script>
    </body>
</html>
