/*
 * Created: 03-18-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controller;

import dal.StudentDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Student;

public class StudentServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        StudentDAO sdb = new StudentDAO();
        
        String ms = "";
        
        try {
            String search = request.getParameter("search");
            request.setAttribute("search", search);
            if (!search.isEmpty() || search != null) {
                List<Student> students = sdb.search(search);
                if (students.isEmpty()) {
                    ms = "Not found!";
                    throw new Exception();
                }
                request.setAttribute("students", students);
            }
        } catch (Exception e) {
            List<Student> students = sdb.listAll();
            request.setAttribute("students", students);
        }
        request.setAttribute("ms", ms);
        request.getRequestDispatcher("views/admin/studentPage.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        
        switch (action) {
            case "add":
                insert(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "update":
                update(request, response);
                break;
            default:
                break;
        }
        response.sendRedirect("/admin-student");
    }
    
    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        StudentDAO sdb = new StudentDAO();
        Student s = new Student();
        s.setName(name);
        s.setEmail(email);
        s.setPassword(password);
        sdb.insert(s);
    }
    
    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String id = request.getParameter("id");
        StudentDAO sdb = new StudentDAO();
        sdb.delete(id);
    }
    
    protected void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String id = request.getParameter("id");
        StudentDAO sdb = new StudentDAO();
        request.setAttribute("studentedit", sdb.findById(id));
        
        List<Student> students = sdb.listAll();
        request.setAttribute("students", students);
        
        request.getRequestDispatcher("views/admin/studentPage.jsp").forward(request, response);
    }
    
    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        StudentDAO sdb = new StudentDAO();
        Student s = new Student();
        s.setId(Integer.parseInt(id));
        s.setName(name);
        s.setEmail(email);
        s.setPassword(pass);
        sdb.update(s);
    }
    
}
