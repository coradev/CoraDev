<%-- 
    Document   : studentPage
    Created on : Mar 18, 2021, 11:42:34 AM
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
                            <h1 class="page-header">Category Dashboard</h1>
                        </div>
                    </div>

                    <form class="col-lg-4" action="category" method="POST">
                        <c:if test="${categorybyid != null}">
                            <div class="form-group">
                                <label for="categoryid"> Category id:</label>
                                <input type="text" class="form-control" id="categoryid" name="categoryid" disabled value="${categorybyid.id}"/>
                            </div>
                            <div class="form-group">
                                <label for="cate-old"> Category old:</label>
                                <input type="text" class="form-control" id="cate-old" name="categoryid" disabled value="${categorybyid.name}"/>
                            </div>
                            <div class="form-group">
                                <label for="cate-new"> Category new:</label>
                                <input type="text" class="form-control" id="cate-new" name="categoryname" required value="${categorybyid.name}" />
                            </div>
                            <button class="btn btn-danger" formaction="admin-category?action=update&id=${categorybyid.id}">Update</button>
                        </c:if>
                        <c:if test="${categorybyid == null}">
                            <div class="form-group">
                                <label for="cate-new"> Category name: </label>
                                <input type="text" class="form-control" id="cate-new" name="categoryname" required />
                            </div>
                            <button class="btn btn-primary" formaction="admin-category?action=add">Add</button>
                        </c:if>
                    </form>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-6">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>NO.</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="no" value="0"/>
                                <c:forEach items="${categories}" var="cat">
                                <form method="POST">
                                    <tr>
                                        <td>${no = no + 1}</td>
                                        <td>${cat.name}</td>
                                        <td>
                                            <button class="btn btn-danger btn-sm" formaction="admin-category?action=edit&id=${cat.id}">Edit</button>
                                            <button class="btn btn-primary btn-sm" formaction="admin-category?action=delete&id=${cat.id}">Delete</button>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        <script src="../../static/admin/js/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../../static/admin/js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../../static/admin/js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../../static/admin/js/startmin.js"></script>
    </body>
</html>
