package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.ConnecDatabase.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Products;
import vn.edu.hcmuaf.nlu.Model.Type_Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Type_ProductDAO {

    public ArrayList getListProductType() {
        ArrayList<Type_Product> listType = new ArrayList<>();
        try {
            String sql = "Select * from type_products";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Type_Product type = new Type_Product();
                type.setId(rs.getInt("id"));
                type.setName(rs.getString("name"));
                type.setDescription(rs.getString("description"));
                listType.add(type);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listType;
    }

    public ArrayList<Products> getProductByType(int id_type) {
        ArrayList<Products> listProductByType = new ArrayList<>();
        try {
            String sql = "Select * from products where id_type= '" + id_type + "'";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
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
                listProductByType.add(products);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listProductByType;
    }
}
