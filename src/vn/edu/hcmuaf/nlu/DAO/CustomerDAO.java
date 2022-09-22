package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.ConnecDatabase.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Customers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO implements ICustomer {

    @Override
    public boolean saveCustomer(Customers customers) {
        try {
            String sql = "insert into customer(name,gender,email,address,phone_number,note) values('" + customers.getName() + "','" + customers.getGender() + "', '" + customers.getEmail() + "','" + customers.getAddress() + "','" + customers.getPhoneNumber() + "','" + customers.getNote() + "')";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean isEmailExists(String email) {
        try {
            String sql = "select id from customer where email = ?";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    return true;
                }
            }
            connection.close();
            ps.close();
            rs.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
        return false;
    }

    public static Customers selectUserByEmail(String email){
        Customers customer = new Customers();

        return customer;
    }
}
