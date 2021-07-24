/*
 * Created: 03-01-2021 by truongnq2k.
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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Course;
import seo.Seo;

public class ListCoursesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //SEO Friendly
        Seo seo = new Seo();
        seo.setTitle("All courses - CoraDev");
        seo.setDescription("All courses from FUCode, Learn to code from zero to hero.");
        request.setAttribute("seo", seo);

        CourseDAO cdb = new CourseDAO();

        String page = request.getParameter("page");

        //Set page for root course page
        if (page == null || page.equals("")) {
            page = "" + 1;
        }
        //for style active
        request.setAttribute("PAGE", page);
        int pageNumber = Integer.parseInt(page);

        int countPage = cdb.countPage();
        request.setAttribute("countPage", countPage);

        //get list courses for each pageNumber
        List<Course> coursesForEachPage = cdb.getCourseByPageNumber(pageNumber);

        
        //get category
        CategoryDAO categorydao = new CategoryDAO();
        List<Category> categories = categorydao.listAll();
        request.setAttribute("categories", categories);

        request.setAttribute("coursesForEachPage", coursesForEachPage);
        request.getRequestDispatcher("views/oldclient/coursesPage.jsp").forward(request, response);
    }
}
