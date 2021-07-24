/*
 * Created: 03-24-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client;

import dal.EnrollmentDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Enrollment;
import model.Student;

public class MyCoursePageServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            HttpSession session = request.getSession();
            Student s = (Student) session.getAttribute("studentlogged");
            
            EnrollmentDAO edb = new EnrollmentDAO();
            List<Enrollment> enrollments = edb.getEnrollByStudentId(String.valueOf(s.getId()));
            request.setAttribute("enrollments", enrollments);
        } catch (Exception e) {
            response.sendRedirect("/login");
        }
        
        request.getRequestDispatcher("views/client/myCoursePage.jsp").forward(request, response);
    }
}
