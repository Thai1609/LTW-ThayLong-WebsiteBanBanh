package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.Model.Users;

import java.sql.SQLException;
import java.text.ParseException;

public interface IUser {
    public boolean dangKy(Users users) throws ParseException, SQLException, ClassNotFoundException;

    public  boolean isEmailExists(String email);
    public  boolean isPhoneExists(String phone);
}
