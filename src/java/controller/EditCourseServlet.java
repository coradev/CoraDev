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
import dal.ChapterDAO;
import dal.CourseDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Chapter;
import model.Course;

public class EditCourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String courseid = request.getParameter("id");
        CourseDAO coursedao = new CourseDAO();
        Course course = coursedao.findById(courseid);

        CategoryDAO categorydao = new CategoryDAO();
        List<Category> categories = categorydao.listAll();

        ChapterDAO chapterdao = new ChapterDAO();
        List<Chapter> chapters = chapterdao.findByCourseId(courseid);

        request.setAttribute("chapters", chapters);
        request.setAttribute("categories", categories);
        request.setAttribute("course", course);
        request.getRequestDispatcher("views/admin/editCoursePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String courseid = request.getParameter("id");
        String title = request.getParameter("course-title");
        String introduce = request.getParameter("course-introduce");
        String content = request.getParameter("course-content");
        String fee = request.getParameter("course-fee");
        String image = request.getParameter("course-image");
        String video = request.getParameter("course-video");
        String category = request.getParameter("course-category");

        Course c = new Course();
        c.setTitle(title);
        c.setFee(Float.parseFloat(fee));
        c.setIntroduce(introduce);
        c.setPurport(content);
        c.setCover_image(image);
        c.setIntro_video(video);
        c.setCategory_id(Integer.parseInt(category));
        c.setId(Integer.parseInt(courseid));

        String ms = "";
        try {
            CourseDAO coursedao = new CourseDAO();
            coursedao.update(c);
            ms = "Update Success";
        } catch (Exception e) {
            ms = "Update Error";
        }

        response.sendRedirect("/listcourse");
    }

}
