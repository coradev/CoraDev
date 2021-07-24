<%-- 
    Document   : myChangePasswordPage
    Created on : Mar 24, 2021, 9:10:54 PM
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
            seo.setTitle("Change Password");
            request.setAttribute("seo", seo);
        %>
        <%@include file="../component/require-logged.jsp" %>
        <%@include file="../component/headComponent.jsp" %>
    </head>
    <body>
        <%@include file="../component/headerComponent.jsp" %>
        <%@include file="../component/beforeHeaderComponent.jsp" %>



        <div class="container my-5">
            <div class="container my-5">
                <h3 class="h3 text-info">${ms}</h3>
                <div class="d-flex bd-highlight ">

                    <form id="form" action="mychangepassword" method="POST" class="p-2 w-100 bd-highlight border border-warning">
                        <div class="m-2"><span class="text-danger">Your ID: </span>  <input type="text" class="form-control" value="${studentedit.id}" disabled/></div>
                        <div class="m-2 form-group">
                            <label for="oldpass" class="text-black">Your password:</label>
                            <input id="oldpass" type="password" name="oldpass" class="form-control"/>
                        </div>

                        <div class="m-2 form-group">
                            <label for="password" class="ml-2 text-black">New password:</label>
                            <input id="password" type="password" name="newpass" class="form-control"/>
                            <span class="ml-4 form-message text-danger"></span>
                        </div>
                        <button class="ml-2 btn btn-success">Save</button>
                    </form>
                </div>
            </div>
        </div>


        <%@include file="../component/footerComponent.jsp" %>
        <%@include file="../component/scriptComponent.jsp" %>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                Validator({
                    form: '#form',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.minLength('#password', 6),
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
