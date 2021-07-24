/*
 * Created: 03-22-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package controllers.client.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import seo.Seo;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //SEO Friendly
        Seo seo = new Seo();
        seo.setTitle("Your Cart - CoraDev");
        seo.setDescription("Buy course from coradev !");
        request.setAttribute("seo", seo);
        request.getRequestDispatcher("views/client/cartPage.jsp").forward(request, response);
    }
}
