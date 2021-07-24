<%-- 
    Document   : headerComponent
    Created on : Mar 5, 2021, 9:27:44 PM
    Author     : admin
--%>
<c:set var="student" value="${sessionScope.studentlogged}" />
<nav id="navheader" class="navbar navbar-expand-lg ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a href="/"><img class="nav-logo" src="../../static/oldclient/images/logo.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav m-auto">
                <li class="nav-item active"><a href="/" class="nav-link">HOME</a></li>
                <li class="nav-item"><a href="/courses" class="nav-link">COURSE</a></li>
                <li class="nav-item"><a href="#" class="nav-link">BLOG</a></li>
                <li class="nav-item"><a href="/payment" class="nav-link">PAYMENT</a></li>
            </ul>
            <ul class="navbar-nav dropdown">
                <img src="../../../static/oldclient/images/avatar.png" width="35px" height="35px"
                     style="border-radius: 50px; margin-top: 0.6rem;">
                <a class="nav-link text-white align-content-center mt-1 dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">${student.name}</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/mycourse">My course</a></li>
                    <li><a class="dropdown-item" href="/myeditprofile">Edit profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/mychangepassword">Change password</a></li>
                </ul>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="/cart" class="nav-link">
                        <i class="fas fa-shopping-cart fa-2x">
                            <c:if test="${quantityitem != null}">
                                (${quantityitem})
                            </c:if>
                        </i>
                        <c:if test="${quantityitem == null}">
                            (0)
                        </c:if>
                    </a>
                </li>
                <li class="nav-item"><a href="logout" class="nav-link"><i class="fas fa-sign-out-alt fa-2x"></i></a>
                </li>
            </ul>
        </div>
    </div>
</nav>