package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.ConnecDatabase.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO implements IProduct {
    public ProductDAO() {

    }

    @Override
    public ArrayList getAll() {
        ArrayList<Products> listP = new ArrayList<>();
        String sql = "Select * from products";
        return getProducts(sql, listP);
    }

    @Override
    public ArrayList<Products> getSearch(String name) throws SQLException, ClassNotFoundException {
        ArrayList<Products> listProductByKey = new ArrayList<>();
        try {
            String sql = "Select * from products where name like '%" + name + "%'";
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
//                products.setHot(rs.getInt("hot"));
                listProductByKey.add(products);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listProductByKey;
    }

    @Override
    public ArrayList<Products> getDSHot() {
        String sql = "Select * from products where hot = 1 ";
        return getArrayListHot(sql);
    }

    @Override
    public ArrayList<Products> getProductSale() throws SQLException, ClassNotFoundException {
        String sql = "Select * from products where promotion_price is not null ";
        ArrayList<Products> listPS = new ArrayList<>();
        return getProducts(sql, listPS);
    }

    private ArrayList<Products> getArrayListHot(String sql) {
        Connection connection;
        ArrayList<Products> listPH = new ArrayList<>();
        try {
            connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Products products = new Products();
                Products.getProduct(products, rs);
                listPH.add(products);
            }
            connection.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return listPH;
    }

    private ArrayList<Products> getProducts(String sql, ArrayList<Products> listP) {
        try {
            Connection connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Products products = new Products();
                Products.getProduct(products, rs);
                listP.add(products);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return listP;
    }

    @Override
    public ArrayList<Products> getListSPByPage(ArrayList<Products> arr, int start, int end) {
        ArrayList<Products> listSP = new ArrayList<>();
        for (int i = start; i < end; i++) {
            listSP.add(arr.get(i));
        }
        return listSP;
    }

    @Override
    public boolean addProduct(Products products) {
        try {
            String sql = "insert into products(name,id_type,description,unit_price,image,in_stock) values('" + products.getName() + "','" + products.getId_type() + "', '" + products.getDescription() + "','" + products.getUnit_price() + "','" + products.getImage() + "','" + products.getStock() + "')";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateProduct(int id, String name, int id_type, String description, int unit_price, String image, int in_stock) {
        try {
            String sql = "update products set name=?,id_type=?,description=?,unit_price=?,image=?,in_stock=?  where id = ?";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, name);
            ps.setInt(2, id_type);
            ps.setString(3, description);
            ps.setInt(4, unit_price);
            ps.setString(5, image);
            ps.setInt(6, in_stock);
            ps.setInt(7, id);

            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
    }

    public void deleteProduct(int id_product) {
        try {
            String sql = "delete from products where id = ?";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id_product);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
    }
}