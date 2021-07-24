/*
 * Created: 03-24-2021 by truongnq2k.
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

public class MyChangePasswordPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession();
            Student s = (Student) session.getAttribute("studentlogged");
            request.setAttribute("studentedit", s);
        } catch (Exception e) {
            response.sendRedirect("/login");
        }

        request.getRequestDispatcher("views/client/myChangePasswordPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");

        try {
            HttpSession session = request.getSession();
            Student s = (Student) session.getAttribute("studentlogged");
            String ms = "";
            if (s.getPassword().equals(oldpass)) {
                Student changePassStudent = new Student();
                changePassStudent.setId(s.getId());
                changePassStudent.setName(s.getName());
                changePassStudent.setEmail(s.getEmail());
                changePassStudent.setPassword(newpass);
                StudentDAO sdb = new StudentDAO();
                sdb.update(changePassStudent);
                ms = "Update successfully!";
                session.setAttribute("studentlogged", changePassStudent);
                request.setAttribute("studentedit", changePassStudent);
            } else {
                //incorrect oldpass
                request.setAttribute("studentedit", s);
                ms = "Old password incorrect!";
            }
            request.setAttribute("ms", ms);

        } catch (Exception e) {
            response.sendRedirect("/login");
        }

        request.getRequestDispatcher("views/client/myChangePasswordPage.jsp").forward(request, response);

    }
}
