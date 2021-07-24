<%-- 
    Document   : paymentPage
    Created on : Mar 24, 2021, 12:03:12 AM
    Author     : admin
--%>

<%@page import="seo.Seo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            seo.Seo seo = new Seo();
            seo.setTitle("PAYMENT");
            request.setAttribute("seo", seo);
        %>
        <%@include file="../component/require-logged.jsp" %>
        <%@include file="../component/headComponent.jsp" %>
    </head>
    <body>
        <%@include file="../component/headerComponent.jsp" %>
        <%@include file="../component/beforeHeaderComponent.jsp" %>



        <div class="container my-5">
            <h3 class="h3 text-info">PAYMENT INFO</h3>
            <div class="d-flex bd-highlight ">
                <div class="p-2 w-50 bd-highlight border border-warning">
                    <b class="ml-5 text-black">BIDV</b>
                </div>
                <div class="p-2 w-100 bd-highlight border border-warning">
                    <div><span class="text-black">Account holder:</span>  <span class="text-danger h5">Nguyen Quang Truong</span></div>
                    <div><span class="text-black">Account number:</span>  <span class="text-danger h5">42710000476106</span></div>
                    <div><span class="text-black">Content:</span> Name course + Account ID</div>
                </div>
            </div>

            <div class="d-flex bd-highlight ">
                <div class="p-2 w-50 bd-highlight border border-warning">
                    <b class="ml-5 text-black">TPBANK</b>
                </div>
                <div class="p-2 w-100 bd-highlight border border-warning">
                    <div><span class="text-black">Account holder:</span>  <span class="text-danger h5">Nguyen Quang Truong</span></div>
                    <div><span class="text-black">Account number:</span>  <span class="text-danger h5">02781573001</span></div>
                    <div><span class="text-black">Content:</span> Name course + Account ID</div>
                </div>
            </div>

            <div class="d-flex bd-highlight ">
                <div class="p-2 w-50 bd-highlight border border-warning">
                    <b class="ml-5 text-black">MOMO</b>
                </div>
                <div class="p-2 w-100 bd-highlight border border-warning">
                    <div><span class="text-black">Account holder:</span>  <span class="text-danger h5">Quang Truong</span></div>
                    <div><span class="text-black">Account number:</span>  <span class="text-danger h5">0352918986</span></div>
                    <div><span class="text-black">Content:</span> Name course + Account ID</div>
                </div>
            </div>
        </div>


        <%@include file="../component/footerComponent.jsp" %>
        <%@include file="../component/scriptComponent.jsp" %>

    </body>
</html>
