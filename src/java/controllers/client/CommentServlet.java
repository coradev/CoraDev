/*
 * Created: 03-22-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client;

import dal.CommentDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Comment;

public class CommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/404");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String studentid = request.getParameter("studentid");
        String lessonid = request.getParameter("lessonid");
        String commentpurport = request.getParameter("commentpurport");

        Comment comment = new Comment();
        comment.setLesson_id(Integer.parseInt(lessonid));
        comment.setStudent_id(Integer.parseInt(studentid));
        comment.setPurport(commentpurport);

        CommentDAO commentdao = new CommentDAO();
        commentdao.insert(comment);

        response.setContentType("text/plain");
        response.getWriter().write("add commentdone");
    }

}
