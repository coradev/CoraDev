/*
 * Created: 03-21-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controller;

import dal.ChapterDAO;
import dal.CourseDAO;
import dal.LessonDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Chapter;
import model.Course;
import model.Lesson;
import util.GetYoutubeId;

public class LessonServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            String lessaction = request.getParameter("lessaction");
            switch (lessaction) {
                case "edit":
                    edit(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
                default:
                    break;
            }
        } catch (IOException | ServletException e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String lessaction = request.getParameter("lessaction");
        switch (lessaction) {
            case "add":
                insert(request, response);
                break;
            default:
                break;
        }

    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LessonDAO lessondao = new LessonDAO();
        String chapter_id = request.getParameter("chapter_id");
        String lesson_name = request.getParameter("lesson_name");
        String lesson_video = request.getParameter("lesson_video");

        GetYoutubeId getYt = new GetYoutubeId();
        lesson_video = getYt.getID(lesson_video);

        Lesson lesson = new Lesson();
        lesson.setChapter_id(Integer.parseInt(chapter_id));
        lesson.setTitle(lesson_name);
        lesson.setVideo_link(lesson_video);

        lessondao.insert(lesson);

        List<Lesson> lessons = lessondao.findByChapterId(chapter_id);
        request.setAttribute("lessons", lessons);

        response.setContentType("text/plain");
        response.getWriter().write("done");

    }

    protected void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lessonid = request.getParameter("lessonid");
        String courseid = request.getParameter("courseid");

        LessonDAO lessondao = new LessonDAO();
        Lesson lesson = lessondao.findById(lessonid);

        ChapterDAO chapterdao = new ChapterDAO();
        List<Chapter> chapters = chapterdao.findByCourseId(courseid);

        CourseDAO coursedao = new CourseDAO();
        Course course = coursedao.findById(courseid);
        request.setAttribute("course", course);

        request.setAttribute("lesson", lesson);
        request.setAttribute("chapters", chapters);
        request.setAttribute("courseid", courseid);

        request.getRequestDispatcher("views/admin/editLessonPage.jsp").forward(request, response);

    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String lessonid = request.getParameter("lessonid");
        String courseid = request.getParameter("courseid");
        String lesson_name = request.getParameter("lesson_name");
        String lesson_video = request.getParameter("lesson_video");
        GetYoutubeId getYt = new GetYoutubeId();
        lesson_video = getYt.getID(lesson_video);

        String chapter_id = request.getParameter("chapter_id");

        Lesson lesson = new Lesson();
        lesson.setChapter_id(Integer.parseInt(chapter_id));
        lesson.setTitle(lesson_name);
        lesson.setVideo_link(lesson_video);
        lesson.setId(Integer.parseInt(lessonid));

        LessonDAO lessondao = new LessonDAO();

        lessondao.update(lesson);

        Lesson l = lessondao.findById(lessonid);

        CourseDAO coursedao = new CourseDAO();
        Course course = coursedao.findById(courseid);
        request.setAttribute("course", course);

        ChapterDAO chapterdao = new ChapterDAO();
        List<Chapter> chapters = chapterdao.findByCourseId(courseid);

        request.setAttribute("lesson", l);
        request.setAttribute("chapters", chapters);
        request.setAttribute("courseid", courseid);

        request.getRequestDispatcher("views/admin/editLessonPage.jsp").forward(request, response);

    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lessonid = request.getParameter("lessonid");
        String chapterid = request.getParameter("chapterid");
        String courseid = request.getParameter("courseid");

        LessonDAO lessondao = new LessonDAO();
        lessondao.delete(lessonid);

        response.sendRedirect("/admin-chapter?chapaction=edit&chapterid=" + chapterid + "&courseid=" + courseid);

    }

}
