<%-- 
    Document   : addCoursePage
    Created on : Mar 19, 2021, 10:11:53 PM
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
                            <h1 class="page-header"><a href="/listcourse" class="btn btn-primary btn-sm"><i class="fa fa-arrow-circle-left"></i> Back </a> Add Course </h1>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    CoraDev
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <form role="form" action="addcourse" method="POST" id="fileUploadForm">
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <label>Course Title</label>
                                                    <input class="form-control" name="course-title" required>
                                                </div>

                                                <div class="form-group">
                                                    <label>Introduce</label>
                                                    <textarea class="form-control" rows="3"
                                                              name="course-introduce" required></textarea>
                                                </div>

                                                <div class="form-group">
                                                    <label>Content</label>
                                                    <textarea class="form-control" rows="12"
                                                              name="course-content" required></textarea>
                                                </div>


                                            </div>
                                            <div class="col-lg-3">
                                                <label for="fee">Fee of course</label>
                                                <div class="form-group input-group">
                                                    <span class="input-group-addon">$</span>
                                                    <input type="number" class="form-control right" id="fee"
                                                           name="course-fee" value="0" required>
                                                    <span class="input-group-addon">.00</span>
                                                </div>
                                                <label>Cover image</label>
                                                <div id="inputfile" class="form-group">
                                                    <div class="form-group">
                                                        <input class="form-control" type="file" name="file" id="file" />
                                                    </div>
                                                </div>
                                                <img id="imagedisplay" src="/upload/default.svg" width="100%" />
                                                <div id="editfile" class="form-group has-success" >
                                                    <input style="cursor: pointer" type="text" class="form-control" id="imagecover" data-toggle="tooltip" data-placement="top" title="Double click!" name="course-image" value="default.svg" >
                                                </div>

                                                <div class="form-group has-error">
                                                    <label class="control-label" for="videointro">Video intro</label>
                                                    <input type="text" class="form-control" id="videointro"
                                                           placeholder="https://www.youtube.com/watch?v=ytid"
                                                           name="course-video">
                                                </div>
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <select class="form-control" name="course-category">
                                                        <c:forEach items="${categories}" var="category">
                                                            <option value="${category.id}">${category.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Add Course</button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
            </div>
        </div>

        <script>
            $("#editfile").dblclick(function () {
                $("#inputfile").css("display", "block");
            });

            $(document).ready(function () {
                $("input[name='file']").change(function () {
                    //stop submit the form, we will post it manually.
                    event.preventDefault();
                    // Get form
                    var form = $('#fileUploadForm')[0];
                    // Create an FormData object 
                    var data = new FormData(form);
                    // disabled the submit button
                    $.ajax({
                        type: "POST",
                        enctype: 'multipart/form-data',
                        url: "/UploadServlet",
                        data: data,
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 600000,
                        success: function (data) {
                            $("#imagecover").text(data);
                            console.log("SUCCESS : ", data);
                            document.getElementById('imagecover').value = data;
                            $("#imagedisplay").attr("src", "/upload/" + data);
                            $("#inputfile").css("display", "none");
                        },
                        error: function (e) {
                            $("#imagecover").text(e.responseText);
                            console.log("ERROR : ", e);
                        }
                    });
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
