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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Student;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("views/oldclient/registrationPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password_confirmation");

        StudentDAO sdb = new StudentDAO();
        List<Student> students = sdb.listAll();
        String ms;
        if (sdb.checkStudentExistByEmail(email, students) != null) {
            ms = "Email is existed in system!";
            request.setAttribute("ms", ms);
            request.getRequestDispatcher("views/oldclient/registrationPage.jsp").forward(request, response);
        } else {
            ms = "Register successfully!";
            request.setAttribute("ms", ms);
            model.Student s = new model.Student();
            s.setName(fullname);
            s.setEmail(email);
            s.setPassword(password);
            sdb.insert(s);
            String action = "login";
            request.setAttribute("actionpage", action);
            request.getRequestDispatcher("views/oldclient/loginPage.jsp").forward(request, response);
        }

    }
}
