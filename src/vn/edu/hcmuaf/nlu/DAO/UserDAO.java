package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.ConnecDatabase.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO implements IUser {
    public ArrayList getAllUser(){
        ArrayList<Users> listU = new ArrayList<>();
        String sql = "Select * from users";
        try {
            Connection connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Users users = new Users();
                users.setId(rs.getInt(1));
                users.setFullName(rs.getString(2));
                users.setEmail(rs.getString(3));
                users.setPhone(rs.getString(5));
                users.setAddress(rs.getString(6));
                users.setLevel(rs.getInt(7));
                users.setCREATED_TIME(rs.getTimestamp(8));
                listU.add(users);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return listU;
    }
    @Override
    public boolean dangKy(Users u) {
        try {
            String sql = "insert into users(full_name,email,password,phone,address,level_user) values('" + u.getFullName() + "','" + u.getEmail() + "', '" + u.getPassWord() + "','" + u.getPhone() + "','" + u.getAddress() + "','" + u.getLevel() + "')";
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
            String sql = "select id from users where email = ?";
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

    @Override
    public boolean isPhoneExists(String phone) {
        try {
            String sql = "select id from users where phone = ?";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    return true;
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
        return false;
    }

    public static Users selectUserById(int id) {
        Users users = new Users();
        try {
            String sql = "select full_name,email,password,phone,address,level_user from  users where id=?";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    users = new Users();
                    users.setFullName(rs.getString(1));
                    users.setEmail(rs.getString(2));
                    users.setPassWord(rs.getString(3));
                    users.setPhone(rs.getString(4));
                    users.setAddress(rs.getString(5));
                    users.setLevel(rs.getInt(6));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
}