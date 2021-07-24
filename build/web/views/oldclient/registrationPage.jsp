<%-- 
    Document   : registrationPage
    Created on : Mar 1, 2021, 3:30:12 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>System Registration</title>
        <link rel="stylesheet" href="../../../static/oldclient/css/login/style.css">

    </head>

    <body>
        <div class="main">
            <form action="register" method="POST" class="form" id="form">
                <h3 class="heading">System Registration</h3>
                <p class="desc">Learn To Code In FUCode ❤️</p>

                <c:set value="${ms}" var="ms"></c:set>
                <c:if test="${ms != null}">
                    <div class="spacer"></div>
                    <div class="ms">${ms}</div>
                </c:if>
                <div class="spacer"></div>

                <div class="form-group">
                    <label for="fullname" class="form-label">Your full name</label>
                    <input id="fullname" name="fullname" type="text" placeholder="EX: Nguyen Quang Truong"
                           class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input id="email" name="email" type="text" placeholder="EX: email@domain.com" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input id="password" name="password" type="password" placeholder="Input password" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password_confirmation" class="form-label">Reinput password</label>
                    <input id="password_confirmation" name="password_confirmation" placeholder="Enter your password again"
                           type="password" class="form-control">
                    <span class="form-message"></span>
                </div>

                <button class="form-submit" type="submit">Register</button>
                <div class="spacer"></div>
                <a href="/reset" class="text">Forgot password?</a>
                <a href="/login" class="text">Go to login!</a>
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
                        Validator.isRequired('#fullname', 'Please input your full name'),
                        Validator.isEmail('#email'),
                        Validator.minLength('#password', 6),
                        Validator.isRequired('#password_confirmation'),
                        Validator.isConfirmed('#password_confirmation', function () {
                            return document.querySelector('#form #password').value;
                        }, 'The password is not correct')
                    ],
                    // onSubmit: function (data) {
                    //     // Call API
                    //     console.log(data);
                    // }
                });
            });
        </script>
        <!-- partial -->
        <script src="../../../static/oldclient/js/login/script.js"></script>

    </body>

</html>
