<%-- 
    Document   : dashboardPage
    Created on : Mar 25, 2021, 1:18:15 AM
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
        <script src="https://www.gstatic.com/charts/loader.js"></script>
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: '/apichart',
                    dataType: 'JSON',
                    success: function (result) {
                        google.charts.load('current', {
                            'packages': ['corechart']
                        });
                        google.charts.setOnLoadCallback(function () {
                            drawChart(result);
                        });
                    }
                });
                function drawChart(result) {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'CateName');
                    data.addColumn('number', 'CateNum');
                    var dataArray = [];
                    $.each(result, function (i, obj) {
                        dataArray.push([obj.catename, obj.catenum]);
                    });
                    data.addRows(dataArray);
                    var piechart_options = {
                        title: 'Số khóa học có trong danh mục khóa học',
                        width: 600,
                        height: 600
                    };
                    var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
                    piechart.draw(data, piechart_options);
                }
            });
        </script>
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
                            <h1 class="page-header">Dashboard</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <table class="columns">
                            <tr>
                                <td>
                                    <div id="piechart_div"></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        </div>


        <!-- Bootstrap Core JavaScript -->
        <script src="../../static/admin/js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../../static/admin/js/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../../static/admin/js/startmin.js"></script>
    </body>
</html>


