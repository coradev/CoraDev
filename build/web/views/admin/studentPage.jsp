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
                            <h1 class="page-header">Student Dashboard</h1>
                        </div>
                    </div>
                    <form class="col-lg-4" action="admin-student" method="POST">
                        <c:if test="${studentedit != null}">
                            <div class="form-group">
                                <label for="fullname">Full name</label>
                                <input type="text" class="form-control" id="fullname" name="name" value="${studentedit.name}">
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" name="email" value="${studentedit.email}">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="text" class="form-control" id="password" name="password" value="${studentedit.password}">
                            </div>
                            <button type="submit" class="btn btn-danger" formaction="admin-student?action=update&id=${studentedit.id}">Update</button>
                            <a class="btn btn-primary" href="/admin-student">Add New</a>
                        </c:if>
                        <c:if test="${studentedit == null}">
                            <div class="form-group">
                                <label for="fullname">Full name</label>
                                <input type="text" class="form-control" id="fullname" name="name">
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password">
                            </div>
                            <button type="submit" class="btn btn-primary" formaction="admin-student?action=add">Add New</button>
                        </c:if>
                    </form>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-6">
                        <form method="GET">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search student..." name="search" value="${search}" >
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>

                        <h1 class="text-center">${ms}</h1>

                        <hr>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">NO.</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="no" value="0"/>
                                <c:forEach items="${students}" var="s">
                                    <tr>
                                        <th scope="row">${no = no + 1}</th>
                                        <td>${s.name}</td>
                                        <td>${s.email}</td>
                                        <td>
                                            <form method="POST">
                                                <button class="btn btn-danger btn-sm" formaction="admin-student?action=edit&id=${s.id}">edit</button> &nbsp; 
                                                <button class="btn btn-primary btn-sm" formaction="admin-student?action=delete&id=${s.id}">delete</button>
                                            </form>
                                        </td>
                                    </tr>
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
