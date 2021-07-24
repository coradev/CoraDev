<%
    if (session.getAttribute("studentlogged") != null) {
        response.sendRedirect("/");
    }
%>