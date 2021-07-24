<%-- 
    Document   : loginPage
    Created on : Mar 1, 2021, 3:29:11 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>System Login</title>
        <link rel="stylesheet" href="../../static/oldclient/css/login/style.css" type="text/css"/>
        <%@include file="../component/require-logout.jsp" %>
    </head>
    <body>
        <div class="main">

            <form action="${actionpage}" method="POST" class="form" id="form">
                <h3 class="heading">System Login</h3>
                <p class="desc">Learn To Code In CoraDev ❤️</p>
                
                <c:set value="${ms}" var="ms"></c:set>
                <c:if test="${ms != null}">
                    <div class="spacer"></div>
                    <div class="ms">${ms}</div>
                </c:if>
                
                <div class="spacer"></div>

                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input id="email" name="email" type="text" placeholder="EX: email@domain.com" value="truong@gmail.com" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input id="password" name="password" type="password" placeholder="Input password" value="123321a" class="form-control">
                    <span class="form-message"></span>
                </div>

                <button class="form-submit" type="submit">Login</button>


                <div class="spacer"></div>
                <a href="/reset" class="text">Forgot password?</a>
                <a href="/register" class="text">Register account?</a>
            </form>

        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                Validator({
                    form: '#form',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isEmail('#email'),
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
