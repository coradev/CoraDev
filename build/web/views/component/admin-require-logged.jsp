<%-- 
    Document   : admin-require-logged
    Created on : Mar 22, 2021, 3:58:17 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // http 1.1
            response.setHeader("Pragma", "no-cache"); // http 1.0
            response.setHeader("Expires", "0"); // Proxies
            if (session.getAttribute("adminlogged") == null) {
                response.sendRedirect("/admin");
            }
        %>
        <c:set var="admin" value="${sessionScope.adminlogged}" />