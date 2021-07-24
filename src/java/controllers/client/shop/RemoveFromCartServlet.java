/*
 * Created: 03-23-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client.shop;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.shop.Cart;
import model.shop.Item;

public class RemoveFromCartServlet extends HttpServlet {
    
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
        int courseid = Integer.parseInt(request.getParameter("courseid"));
        cart.removeItem(courseid);
        
        List<Item> items = cart.getItems();
        
        session.setAttribute("cart", cart);
        session.setAttribute("quantityitem", items.size());
        response.sendRedirect("/cart");
    }
}
