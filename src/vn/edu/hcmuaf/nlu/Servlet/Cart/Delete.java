package vn.edu.hcmuaf.nlu.Servlet.Cart;

import vn.edu.hcmuaf.nlu.Model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            Cart c = (Cart) session.getAttribute("Cart");

            if (c == null) {
                c = new Cart();
            }
            c.remove(id);
            session.setAttribute("Cart", c);

            response.sendRedirect("shopping_cart.jsp");
        } catch (Exception e) {

        }
    }
}
