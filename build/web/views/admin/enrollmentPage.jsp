<%-- 
    Document   : enrollmentPage
    Created on : Mar 23, 2021, 9:23:32 AM
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
        <!-- DataTables CSS -->
        <link href="../../static/admin/css/dataTables/dataTables.bootstrap.css" rel="stylesheet">
        <!-- DataTables Responsive CSS -->
        <link href="../../static/admin/css/dataTables/dataTables.responsive.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../../static/admin/css/startmin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="../../static/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- jQuery -->
        <script src="../../static/admin/js/jquery.min.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <%@include file="../component/navigationComponent.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Student Enrollment</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    CoraDev
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-course">
                                            <thead>
                                                <tr>
                                                    <th>Enrollment ID</th>
                                                    <th>Student Name</th>
                                                    <th>Course Bought</th>
                                                    <th>Fee Of Course</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="enrollment" items="${enrollments}">
                                                    <tr>
                                                        <td>${enrollment.id}</td>
                                                        <td>${enrollment.student_name}</td>
                                                        <td>${enrollment.course_bought}</td>
                                                        <td class="center">$ ${enrollment.fee} USD</td>
                                                        <td class="center">
                                                            <form action="/enrollment" method="POST">
                                                                <input type="hidden" name="enrollmentid" value="${enrollment.id}"/>
                                                                <input type="radio" name="enrollactive" checked value="1">Active
                                                                <input type="radio" name="enrollactive" <c:if test="${enrollment.is_paid_subscription == false}" >checked</c:if> value="0">Deactive
                                                                    <button type="submit">save</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        </div>

        <script>
            $(document).ready(function () {
                $('#dataTables-course').DataTable({
                    responsive: true
                });
            });
        </script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../../static/admin/js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../../static/admin/js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../../static/admin/js/startmin.js"></script>
        <!-- DataTables JavaScript -->
        <script src="../../static/admin/js/dataTables/jquery.dataTables.min.js"></script>
        <script src="../../static/admin/js/dataTables/dataTables.bootstrap.min.js"></script>
    </body>
</html>
