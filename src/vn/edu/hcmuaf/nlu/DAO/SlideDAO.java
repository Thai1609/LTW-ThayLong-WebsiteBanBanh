package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.ConnecDatabase.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Slide;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SlideDAO {
    static ArrayList<Slide> listSL = new ArrayList<>();

    public ArrayList<Slide> getSlide() throws SQLException, ClassNotFoundException {
        String sql = "Select * from slide ";
        Connection connection;
        try {
            connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
          while(rs.next()){
                Slide sl = new Slide();
                sl.setId(rs.getInt("id"));
                sl.setLink(rs.getString("link"));
                sl.setImage(rs.getString("image"));

                listSL.add(sl);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSL;
    }

}
