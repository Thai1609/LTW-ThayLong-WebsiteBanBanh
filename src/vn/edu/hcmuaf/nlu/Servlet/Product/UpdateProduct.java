package vn.edu.hcmuaf.nlu.Servlet.Product;

import vn.edu.hcmuaf.nlu.DAO.ProductDAO;
import vn.edu.hcmuaf.nlu.Model.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int id = (Integer) request.getSession().getAttribute("id_product");
        String nameProduct = request.getParameter("product_name");
        int id_type = Integer.parseInt(request.getParameter("product_type"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int price_product = Integer.parseInt(request.getParameter("price_product"));
        String description = request.getParameter("description");
        String image = request.getParameter("img");
        Products products = new Products();
        products.setName(nameProduct);
        switch (id_type) {
            case 1:
                products.setId_type(1);
                break;
            case 2:
                products.setId_type(2);
                break;
            case 3:
                products.setId_type(3);
                break;
            case 4:
                products.setId_type(4);
                break;
            case 5:
                products.setId_type(5);
                break;
            case 6:
                products.setId_type(6);
                break;
            case 7:
                products.setId_type(7);
                break;
            default:
        }
        products.setUnit_price(price_product);
        products.setStock(quantity);
        products.setDescription(description);

        new ProductDAO().updateProduct(id,nameProduct, id_type, description, price_product, image, quantity);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
