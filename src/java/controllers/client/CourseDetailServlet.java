/*
 * Created: 03-21-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client;

import dal.CourseDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import seo.Seo;

public class CourseDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get Course
        String courseid = request.getParameter("courseid");
        CourseDAO cdb = new CourseDAO();
        Course course = cdb.findById(courseid);
        request.setAttribute("course", course);

        //What you’ll learn?
        String purport[] = course.getPurport().split("\n");
        request.setAttribute("purport", purport);

        //SEO Friendly
        Seo seo = new Seo();
        seo.setTitle(course.getTitle());
        seo.setDescription(course.getIntroduce());
        request.setAttribute("seo", seo);

        request.getRequestDispatcher("views/oldclient/courseDetailPage.jsp").forward(request, response);
    }
}
