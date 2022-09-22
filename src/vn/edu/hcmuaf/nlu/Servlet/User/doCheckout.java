package vn.edu.hcmuaf.nlu.Servlet.User;

import vn.edu.hcmuaf.nlu.DAO.BillDAO;
import vn.edu.hcmuaf.nlu.DAO.CustomerDAO;
import vn.edu.hcmuaf.nlu.Model.Bill_detail;
import vn.edu.hcmuaf.nlu.Model.Bills;
import vn.edu.hcmuaf.nlu.Model.Customers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/doCheckout")
public class doCheckout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("hoten");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String note = request.getParameter("note");
        String payment_method = request.getParameter("payment_method");
        String total = request.getParameter("total");
        if (gender.equals("1")) {
            gender = "nam";
        } else {
            gender = "nữ";
        }

        CustomerDAO customerDAO = new CustomerDAO();
        Customers customer = new Customers();
        customer.setName(name);
        customer.setPhoneNumber(phoneNumber);
        customer.setGender(gender);
        customer.setNote(note);
        customer.setEmail(email);
        customer.setAddress(address);
        new CustomerDAO().saveCustomer(customer);

        Bills bill = new Bills();
        bill.setToltal(total);
        bill.setPayment(payment_method);
        new BillDAO().saveBill(bill);

        Bill_detail bill_detail = new Bill_detail();

        response.getWriter().println("Dat hang thanh cong!" + customer.getId());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
