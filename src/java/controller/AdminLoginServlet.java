/*
 * Created: 03-22-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controller;

import dal.AdminDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin;

public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = "admin";
        request.setAttribute("actionpage", action);
        request.getRequestDispatcher("views/oldclient/loginPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDAO admindao = new AdminDAO();
        Admin admin = admindao.getAdmin(email, password);
        if (admin == null) {
            String ms = "Try again !";
            request.setAttribute("ms", ms);
            String action = "admin";
            request.setAttribute("actionpage", action);
            request.getRequestDispatcher("views/oldclient/loginPage.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("adminlogged", admin);
            response.sendRedirect("/dashboard");
        }
    }
}
