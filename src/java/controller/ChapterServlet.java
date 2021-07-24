/*
 * Created: 03-20-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controller;

import dal.ChapterDAO;
import dal.LessonDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Chapter;
import model.Lesson;

public class ChapterServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        try {
            String chapaction = request.getParameter("chapaction");
            switch (chapaction) {
                case "edit":
                    edit(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                case "delete":
                    delete(request, response);
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
        
        String chapaction = request.getParameter("chapaction");
        switch (chapaction) {
            case "add":
                insert(request, response);
                break;
            default:
                break;
        }
        
    }
    
    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ChapterDAO chapterdao = new ChapterDAO();
        String courseid = request.getParameter("courseid");
        String chaptername = request.getParameter("chapter_name");
        
        Chapter chapter = new Chapter();
        chapter.setCourse_id(Integer.parseInt(courseid));
        chapter.setName(chaptername);
        chapterdao.insert(chapter);
        
        response.setContentType("text/plain");
        response.getWriter().write("done");
    }
    
    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ChapterDAO chapterdao = new ChapterDAO();
        String chapterid = request.getParameter("chapterid");
        String courseid = request.getParameter("courseid");
        chapterdao.delete(chapterid);
        response.sendRedirect("/editcourse?id=" + courseid);
    }
    
    protected void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ChapterDAO chapterdao = new ChapterDAO();
        String courseid = request.getParameter("courseid");
        String chapterid = request.getParameter("chapterid");
        Chapter chapter = chapterdao.findById(chapterid);
        request.setAttribute("chapter", chapter);
        request.setAttribute("courseid", courseid);

        //lesson
        LessonDAO lessondao = new LessonDAO();
        List<Lesson> lessons = lessondao.findByChapterId(chapterid);
        request.setAttribute("lessons", lessons);
        
        request.getRequestDispatcher("views/admin/editChapterPage.jsp").forward(request, response);
    }
    
    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ChapterDAO chapterdao = new ChapterDAO();
        String chaptername = request.getParameter("chapter_name");
        String chapterid = request.getParameter("chapterid");
        String courseid = request.getParameter("courseid");
        
        Chapter c = new Chapter();
        c.setName(chaptername);
        c.setId(Integer.parseInt(chapterid));
        
        request.setAttribute("courseid", courseid);
        
        chapterdao.update(c);
        Chapter chapter = chapterdao.findById(chapterid);
        request.setAttribute("chapter", chapter);

        //lesson
        LessonDAO lessondao = new LessonDAO();
        List<Lesson> lessons = lessondao.findByChapterId(chapterid);
        request.setAttribute("lessons", lessons);
        
        request.getRequestDispatcher("views/admin/editChapterPage.jsp").forward(request, response);
    }
}
