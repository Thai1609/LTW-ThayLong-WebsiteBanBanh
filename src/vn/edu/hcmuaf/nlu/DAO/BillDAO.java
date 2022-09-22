package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.ConnecDatabase.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Bill_detail;
import vn.edu.hcmuaf.nlu.Model.Bills;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BillDAO implements IBills {
    @Override
    public boolean saveBill(Bills bills) {
        try {
            String sql = "insert into bills(id_customer,total,payment) values('" + bills.getId_customer() + "','" + bills.getToltal() + "', '" + bills.getPayment() + "')";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList getAllBill() {
        ArrayList<Bills> listBill = new ArrayList<>();
        String sql = "Select * from bills";
        try {
            Connection connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Bills bills = new Bills();
                bills.setId(rs.getInt(1));
                bills.setId_customer(rs.getInt(2));
                bills.setDate_oder(rs.getString(3));
                bills.setToltal(rs.getString(4));
                bills.setPayment(rs.getString(5));
                bills.setNote(rs.getString(6));
                listBill.add(bills);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return listBill;
    }

    public ArrayList getAllBillDetail() {
        ArrayList<Bill_detail> listBillDetail = new ArrayList<>();
        String sql = "Select * from bill_detail";
        try {
            Connection connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Bill_detail bill_detail = new Bill_detail();
                bill_detail.setId(rs.getInt(1));
                bill_detail.setId_bill(rs.getInt(2));
                bill_detail.setId_product(rs.getInt(3));
                bill_detail.setQuantity(rs.getInt(4));
                bill_detail.setUnit_price(rs.getInt(5));
                listBillDetail.add(bill_detail);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return listBillDetail;
    }
}
