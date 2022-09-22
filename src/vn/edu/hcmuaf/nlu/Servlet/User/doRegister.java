package vn.edu.hcmuaf.nlu.Servlet.User;

import vn.edu.hcmuaf.nlu.DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/doRegister")
public class doRegister extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        UserDAO userDAO = new UserDAO();

        if (!userDAO.isEmailExists(email)) {
            if (!userDAO.isPhoneExists(phone)) {
                if (password.equals(re_password)) {
                    vn.edu.hcmuaf.nlu.Model.Users u = new vn.edu.hcmuaf.nlu.Model.Users();
                    u.setEmail(email);
                    u.setFullName(fullName);
                    u.setAddress(address);
                    u.setPhone(phone);
                    u.setPassWord(password);
                    u.setLevel(1);
                    new UserDAO().dangKy(u);
                    response.sendRedirect("login.jsp");
                } else {
                    request.setAttribute("err_pass", "Mật khẩu không khớp!");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("err_phone", "Điện thoại đã đăng ký. Vui lòng nhập số khác!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);

            }
        } else {
            request.setAttribute("err_email", "Email được sử dụng. Vui lòng nhập email khác!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doPost(request, response);
    }
}
