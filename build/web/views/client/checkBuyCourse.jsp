<%-- 
    Document   : checkBuyCourse
    Created on : Mar 24, 2021, 12:02:17 AM
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
            seo.setTitle("ACCESS DENIED!");
            request.setAttribute("seo", seo);
        %>
        <%@include file="../component/headComponent.jsp" %>
    </head>
    <body>
        <%@include file="../component/headerComponent.jsp" %>
        <%@include file="../component/beforeHeaderComponent.jsp" %>
        <h2 class="my-5 text-center">YOU NEED ACCESS TO LEARN !!</h2>
        <div class="container">
            <p class="mb-5 text-center text-danger h4">If you haven't paid yet! You need to pay for the course approval for you by the administration!</p>
        </div>
        <%@include file="../component/footerComponent.jsp" %>
        <%@include file="../component/scriptComponent.jsp" %>

    </body>
</html>
