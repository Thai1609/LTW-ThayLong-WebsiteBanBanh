package vn.edu.hcmuaf.nlu.ConnecDatabase;

import vn.edu.hcmuaf.nlu.Model.Products;
import vn.edu.hcmuaf.nlu.Model.Slide;

import java.sql.*;
import java.util.ArrayList;

public class DatabaseConnection {
    static Connection con;

    public static Connection connect()
            throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_banbanh?serverTimezone=UTC", "root", "");
        return con;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
       DatabaseConnection show = new DatabaseConnection();
       String sql = "SELECT * FROM `products` WHERE id =2";
        Connection connection = DatabaseConnection.connect();
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            System.out.println(rs.getString("name"));
        }

    }
}


