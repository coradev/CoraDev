<%-- 
    Document   : navigationComponent
    Created on : Mar 21, 2021, 2:43:00 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">CoraDev</a>
    </div>
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <!-- Top Navigation: Right Menu -->
    <ul class="nav navbar-right navbar-top-links">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> ${admin.name} <b class="caret"></b>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="/adlogout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar -->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="/dashboard" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <li>
                    <a href="/admin-student"><i class="fa fa-users fa-fw"></i> Student</a>
                </li>
                <li>
                    <a href="/admin-category"><i class="fa fa-sitemap fa-fw"></i> Category</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-book fa-fw"></i> Course<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/addcourse">Add Course</a>
                        </li>
                        <li>
                            <a href="/listcourse">List Course</a>
                        </li>
                        <li>
                            <a href="/enrollment">Enrollment</a>
                        </li>
                    </ul>
                </li>


        </div>
    </div>
</nav>