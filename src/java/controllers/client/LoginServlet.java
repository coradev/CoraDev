/*
 * Created: 03-01-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client;

import dal.StudentDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Student;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = "login";
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

        StudentDAO udb = new StudentDAO();
        Student student = udb.getStudent(email, password);

        String ms;

        if (student == null) {
            ms = "Check your account again!";
            request.setAttribute("ms", ms);
            request.getRequestDispatcher("views/oldclient/loginPage.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("studentlogged", student);
            response.sendRedirect("/");
        }
    }
}
