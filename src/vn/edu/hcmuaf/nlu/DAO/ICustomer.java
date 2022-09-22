package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.Model.Customers;

public interface ICustomer {
    public boolean saveCustomer(Customers customers);
    public  boolean isEmailExists(String email);
}
