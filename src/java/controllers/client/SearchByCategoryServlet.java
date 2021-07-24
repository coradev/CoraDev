/*
 * Created: 03-22-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client;

import dal.CategoryDAO;
import dal.CourseDAO;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Course;
import seo.Seo;

public class SearchByCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //SEO Friendly
        Seo seo = new Seo();
        seo.setTitle("All courses - CoraDev");
        seo.setDescription("All courses from FUCode, Learn to code from zero to hero.");
        request.setAttribute("seo", seo);
        try {
            String listid[] = request.getParameterValues("categoryid");
            request.setAttribute("listid", listid);

            List<String> list = Arrays.asList(listid);
            String result = String.join(",", list);

            CourseDAO coursedao = new CourseDAO();
            List<Course> courses = coursedao.searchByCategoryId(result);
            request.setAttribute("coursesForEachPage", courses);
        } catch (Exception e) {
            ListCoursesServlet lcs = new ListCoursesServlet();
            lcs.doGet(request, response);
        }

        //get category
        CategoryDAO categorydao = new CategoryDAO();
        List<Category> categories = categorydao.listAll();
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("views/oldclient/coursesPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String listid[] = request.getParameterValues("categoryid");
        List<String> list = Arrays.asList(listid);
        String result = String.join(",", list);

        CourseDAO coursedao = new CourseDAO();
        List<Course> courses = coursedao.searchByCategoryId(result);
        request.setAttribute("coursesForEachPage", courses);
        //request.getRequestDispatcher("views/oldclient/coursesPage.jsp").forward(request, response);
    }
}
