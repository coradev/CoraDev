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

public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("views/oldclient/resetPasswordPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        StudentDAO udb = new StudentDAO();
        List<Student> students = udb.listAll();
        Student s = udb.checkStudentExistByEmail(email, students);
        String ms;
        if (s != null) {
            ms = "Your email: " + s.getEmail() + " <br> Password: " + s.getPassword();
        } else {
            ms = "Account isn't exist in out system!!";
        }
        //response.getWriter().write(ms);
        request.setAttribute("ms", ms);
        request.getRequestDispatcher("views/oldclient/resetPasswordPage.jsp").forward(request, response);

    }

}
