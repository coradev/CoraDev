<%-- 
    Document   : myEditProfilePage
    Created on : Mar 24, 2021, 9:08:04 PM
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
            seo.setTitle("Edit Profile");
            request.setAttribute("seo", seo);
        %>
        <%@include file="../component/require-logged.jsp" %>
        <%@include file="../component/headComponent.jsp" %>
    </head>
    <body>
        <%@include file="../component/headerComponent.jsp" %>
        <%@include file="../component/beforeHeaderComponent.jsp" %>

        <div class="container my-5">
            <h3 class="h3 text-info">YOUR INFO</h3>
            <div class="d-flex bd-highlight ">

                <form id="form" action="myeditprofile" method="POST" class="p-2 w-100 bd-highlight border border-warning">
                    <div class="m-2"><span class="text-danger">Your ID: </span>  <input type="text" class="form-control" value="${studentedit.id}" disabled/></div>
                    <div class="m-2 form-group">
                        <label for="name" class="text-black">Mail Address:</label>
                        <input id="name" type="text" name="stname" value="${studentedit.name}" class="form-control"/>
                    </div>

                    <div class="m-2 form-group">
                        <label for="email" class="text-black">Mail Address:</label>
                        <input id="email" type="text" name="stmail" value="${studentedit.email}" class="form-control"/>
                        <span class="ml-4 form-message text-danger">${ms}</span>
                    </div>
                    <button class="ml-2 btn btn-success">Save</button>
                </form>
            </div>
        </div>

        <%@include file="../component/footerComponent.jsp" %>
        <%@include file="../component/scriptComponent.jsp" %>

        <!--JS check email-->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                Validator({
                    form: '#form',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isEmail('#email'),
                    ],
                    // onSubmit: function (data) {
                    //     // Call API
                    //     console.log(data);
                    // }
                });
            });
        </script>
        <script src="../../static/oldclient/js/login/script.js"></script>

    </body>
</html>
