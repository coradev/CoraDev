<%-- 
    Document   : resetPasswordPage
    Created on : Mar 1, 2021, 3:29:47 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>System Reset Password</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="stylesheet" href="../../static/oldclient/css/login/style.css">

    </head>
    <body>
        <div class="main">
            <form action="reset" method="POST" class="form" id="form">
                <h3 class="heading">System Reset Password</h3>
                <p class="desc">Learn To Code In FUCode ❤️</p>
                
                <c:set value="${ms}" var="ms"></c:set>
                <c:if test="${ms != null}">
                    <div class="spacer"></div>
                    <div class="ms">${ms}</div>
                </c:if>
                <div class="spacer"></div>

                <div class="form-group">
                    <label for="email" class="form-label">Enter email to reset password</label>
                    <input id="email" name="email" type="text" placeholder="EX: email@domain.com" class="form-control">
                    <span class="form-message"></span>
                </div>

                <button class="form-submit">Reset password</button>

                <div class="spacer"></div>

                <a href="/login" class="text">Go to login!</a>
                <a href="/register" class="text">Register account?</a>
            </form>

        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Mong muốn của chúng ta
                Validator({
                    form: '#form',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isEmail('#email'),
                    ],
//                    onSubmit: function (data) {
//                        $(document).on("click", "#reset", function () {
//                            $.post("/reset", function (responseText) {
//                                $("#message").text(responseText);
//                            });
//                        });
//                        console.log(data);
//                    }
                });
            });


        </script>
        <!-- partial -->
        <script src="../../static/oldclient/js/login/script.js"></script>
    </body>
</html>
