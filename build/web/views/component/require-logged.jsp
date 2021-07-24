<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // http 1.1
    response.setHeader("Pragma", "no-cache"); // http 1.0
    response.setHeader("Expires", "0"); // Proxies
    if (session.getAttribute("studentlogged") == null) {
        response.sendRedirect("/login");
    }
%>