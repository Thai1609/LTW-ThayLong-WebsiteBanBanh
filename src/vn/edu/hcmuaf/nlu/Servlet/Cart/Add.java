package vn.edu.hcmuaf.nlu.Servlet.Cart;

import vn.edu.hcmuaf.nlu.ConnecDatabase.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Cart;
import vn.edu.hcmuaf.nlu.Model.Products;
import vn.edu.hcmuaf.nlu.Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/AddCart")
public class Add extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Lấy cái id sản phẩm từ các trang
            int id = Integer.parseInt(request.getParameter("id").trim());
            String sql = "SELECT `id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `in_stock`,`hot`, `created_at`, `updated_at` FROM `products` WHERE id=?";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Products products = new Products();
                products.setId(rs.getInt("id"));
                products.setName(rs.getString("name"));
                products.setId_type(rs.getInt("id_type"));
                products.setDescription(rs.getString("description"));
                products.setUnit_price(rs.getInt("unit_price"));
                products.setPromotion_price(rs.getInt("promotion_price"));
                products.setImage(rs.getString("image"));
                products.setStock(rs.getInt("in_stock"));
                products.setHot(rs.getInt("hot"));

                //Tạo session
                HttpSession session = request.getSession();
                Cart c = (Cart) session.getAttribute("Cart");

                if (c == null) {
                    c = new Cart();
                }
                if (products != null) {
                    c.put(products);
                }
                session.setAttribute("Cart", c);
                response.sendRedirect(Util.fullPath(""));
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

    }
}
