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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Student;

public class MyEditProfilePageServlet extends HttpServlet {
    
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
        request.getRequestDispatcher("views/client/myEditProfilePage.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String stname = request.getParameter("stname");
        String stmail = request.getParameter("stmail");
        
        HttpSession session = request.getSession();
        Student loggedStudent = (Student) session.getAttribute("studentlogged");
        
        StudentDAO sdb = new StudentDAO();

        //check existed mail
        List<Student> students = sdb.listAllExcludeByid(String.valueOf(loggedStudent.getId()));
        
        String ms = "";
        if (sdb.checkStudentExistByEmail(stmail, students) != null) {
            ms = "Email is existed in system!";
            request.setAttribute("studentedit", loggedStudent);
        } else {
            Student editStudent = new Student();
            editStudent.setId(loggedStudent.getId());
            editStudent.setName(stname);
            editStudent.setEmail(stmail);
            editStudent.setPassword(loggedStudent.getPassword());
            sdb.update(editStudent);
            session.setAttribute("studentlogged", editStudent);
            request.setAttribute("studentedit", editStudent);
            ms = "Update successfully!";
        }
        request.setAttribute("ms", ms);
        
        request.getRequestDispatcher("views/client/myEditProfilePage.jsp").forward(request, response);
    }
}
