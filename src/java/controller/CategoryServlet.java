/*
 * Created: 03-18-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controller;

import dal.CategoryDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

public class CategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        CategoryDAO cdb = new CategoryDAO();
        List<Category> categories = cdb.listAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("views/admin/categoryPage.jsp").forward(request, response);

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
        response.sendRedirect("/admin-category");

    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        CategoryDAO cdb = new CategoryDAO();
        String categoryname = request.getParameter("categoryname");
        Category category = new Category();
        category.setName(categoryname);
        cdb.insert(category);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cdb = new CategoryDAO();
        String id = request.getParameter("id");
        cdb.delete(id);
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        CategoryDAO cdb = new CategoryDAO();
        String id = request.getParameter("id");
        Category category = cdb.findById(id);
        request.setAttribute("categorybyid", category);
        List<Category> categories = cdb.listAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("views/admin/categoryPage.jsp").forward(request, response);

    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        CategoryDAO cdb = new CategoryDAO();
        String id = request.getParameter("id");
        String categoryname = request.getParameter("categoryname");
        Category c = new Category();
        c.setId(Integer.parseInt(id));
        c.setName(categoryname);
        cdb.update(c);
    }
}
