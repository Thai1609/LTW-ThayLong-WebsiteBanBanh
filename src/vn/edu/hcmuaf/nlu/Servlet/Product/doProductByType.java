package vn.edu.hcmuaf.nlu.Servlet.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doProductByType")
public class doProductByType extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_type = Integer.parseInt(request.getParameter("id_type").trim());
        //Tạo session

        HttpSession session = request.getSession();
        session.setAttribute("id", id_type);

        response.sendRedirect("product_type.jsp");
    }
}
