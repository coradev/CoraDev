/*
 * Created: 03-21-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client;

import dal.CommentDAO;
import dal.CourseDAO;
import dal.EnrollmentDAO;
import dal.LessonDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Comment;
import model.Course;
import model.Enrollment;
import model.Lesson;
import model.Student;
import seo.Seo;

public class ClientLessonServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseid = request.getParameter("courseid");
        String lessonid = request.getParameter("lessonid");
        request.setAttribute("lessonid", lessonid);
        String chapterid = request.getParameter("chapterid");
        request.setAttribute("chapterid", chapterid);

        //Enrollment for display add to cart button
        try {
            HttpSession session = request.getSession();
            Student s = (Student) session.getAttribute("studentlogged");
            EnrollmentDAO enrollmentdao = new EnrollmentDAO();
            List<Enrollment> enrollments = enrollmentdao.getEnrollByStudentId(String.valueOf(s.getId()));
            request.setAttribute("enrollments", enrollments);

            ClientLessonServlet cls = new ClientLessonServlet();
            if (cls.checkStudentEnroll(request, response, enrollments, courseid)) {
                for (Enrollment e : enrollments) {
                    if (e.getCourse_id() == Integer.parseInt(courseid)) {
                        if (!e.isIs_paid_subscription()) {
                            String ms = "You must buy this course to learn!";
                            request.getRequestDispatcher("/views/client/checkBuyCourse.jsp").forward(request, response);
                        }
                    }
                }
            } else {
                request.getRequestDispatcher("/views/client/checkBuyCourse.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("login");
        }

        //Get Course
        CourseDAO cdb = new CourseDAO();
        Course course = cdb.findById(courseid);
        request.setAttribute("course", course);

        //What you’ll learn?
        String purport[] = course.getPurport().split("\n");
        request.setAttribute("purport", purport);

        LessonDAO ldb = new LessonDAO();
        Lesson lesson = ldb.findById(lessonid);
        request.setAttribute("lesson", lesson);

        //Load comment
        CommentDAO commentdao = new CommentDAO();
        List<Comment> comments = commentdao.listAll(lessonid);
        request.setAttribute("comments", comments);

        //SEO Friendly
        Seo seo = new Seo();
        seo.setTitle(lesson.getTitle());
        seo.setDescription(course.getIntroduce());
        request.setAttribute("seo", seo);

        request.getRequestDispatcher("views/client/lessonPage.jsp").forward(request, response);
    }

    //student enroll => true , no enroll => false
    protected boolean checkStudentEnroll(HttpServletRequest request, HttpServletResponse response, List<Enrollment> enrollments, String courseid)
            throws ServletException, IOException {
        for (Enrollment e : enrollments) {
            if (e.getCourse_id() == Integer.parseInt(courseid)) {
                return true;
            }
        }
        return false;
    }

}
