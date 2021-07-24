/*
 * Created: 03-23-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controller;

import dal.EnrollmentDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Enrollment;

public class EnrollmentServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EnrollmentDAO enrollmentdao = new EnrollmentDAO();
        List<Enrollment> enrollments = enrollmentdao.getAll();
        request.setAttribute("enrollments", enrollments);
        request.getRequestDispatcher("views/admin/enrollmentPage.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String enrollmentid = request.getParameter("enrollmentid");
        String enrollactive = request.getParameter("enrollactive");
        EnrollmentDAO enrollmentdao = new EnrollmentDAO();
        enrollmentdao.update(Integer.parseInt(enrollactive), Integer.parseInt(enrollmentid));
        response.sendRedirect("/enrollment");
    }
}
