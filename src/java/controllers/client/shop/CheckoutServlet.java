/*
 * Created: 03-23-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client.shop;

import dal.shop.OrderDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Student;
import model.shop.Cart;

public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/404");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart;
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        Student student;
        Object s = session.getAttribute("studentlogged");
        if (s != null) {
            student = (Student) s;
            OrderDAO orderdao = new OrderDAO();
            orderdao.addOrder(student, cart);
            session.removeAttribute("cart");
            session.setAttribute("quantityitem", 0);
            response.sendRedirect("/payment");
        } else {
            response.sendRedirect("/login");
        }
    }

}
