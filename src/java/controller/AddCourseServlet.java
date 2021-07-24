/*
 * Created: 03-20-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controller;

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
import util.GetYoutubeId;

public class AddCourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        CategoryDAO categorydao = new CategoryDAO();
        List<Category> categories = categorydao.listAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("views/admin/addCoursePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String title = request.getParameter("course-title");
        String introduce = request.getParameter("course-introduce");
        String content = request.getParameter("course-content");
        String fee = request.getParameter("course-fee");
        String image = request.getParameter("course-image");

        String video = request.getParameter("course-video");
        GetYoutubeId getYt = new GetYoutubeId();
        video = getYt.getID(video);

        String category = request.getParameter("course-category");

        Course c = new Course();

        c.setAdmin_id(1);
        c.setCategory_id(Integer.parseInt(category));
        c.setTitle(title);
        c.setFee(Float.parseFloat(fee));
        c.setIntroduce(introduce);
        c.setPurport(content);
        c.setCover_image(image);
        c.setIntro_video(video);

        String ms = "";
        try {
            CourseDAO coursedao = new CourseDAO();
            coursedao.insert(c);
            ms = "Add Success";
        } catch (Exception e) {
            ms = "Add Error";
        }
        response.sendRedirect("/listcourse");
    }
}
