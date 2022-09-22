package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.Model.Products;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IProduct {
    //Lấy tất cả các danh sách sản phẩm
    ArrayList<Products> getAll() throws SQLException, ClassNotFoundException;

    //Lấy danh sách sản phẩm tìm kiếm
    ArrayList<Products> getSearch(String key) throws SQLException, ClassNotFoundException;

    //Lấy tất cả các danh sách sản phẩm bán chạy
    ArrayList<Products> getDSHot() throws SQLException, ClassNotFoundException;

    //Lấy tất cả các danh sách sản phẩm đang giảm giá
    ArrayList<Products> getProductSale() throws SQLException, ClassNotFoundException;

    //Phân trang sản phẩm
    ArrayList<Products> getListSPByPage(ArrayList<Products> arr, int start, int end);

    public boolean addProduct(Products products);

}
