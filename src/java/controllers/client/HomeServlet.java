/*
 * Created: 03-05-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client;

import dal.CourseDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import seo.Seo;

public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //SEO Friendly
        Seo seo = new Seo();
        seo.setTitle("Learn to code easily with CoraDev");
        seo.setDescription("CoraDev is an online interactive platform that helps users to learn, practice coding skills and join the developer community with millions of programmers.");
        request.setAttribute("seo", seo);

        CourseDAO cdb = new CourseDAO();
        List<Course> courses = cdb.getCourseForHome();
        request.setAttribute("courseHome", courses);
        request.getRequestDispatcher("views/oldclient/homePage.jsp").forward(request, response);
    }
}
