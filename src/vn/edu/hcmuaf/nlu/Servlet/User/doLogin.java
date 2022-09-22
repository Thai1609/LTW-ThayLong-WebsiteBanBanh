package vn.edu.hcmuaf.nlu.Servlet.User;

import vn.edu.hcmuaf.nlu.ConnecDatabase.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/doLogin")
public class doLogin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String inEmail = request.getParameter("email").trim();
            String inPassword = request.getParameter("pass").trim();
            String sql = "Select * from users where email= ? and password = ?";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, inEmail);
            ps.setString(2, inPassword);
            ResultSet rs = ps.executeQuery();
            rs.last();
            if (rs.getRow() == 1) {
                rs.first();
                if (inEmail.equals(rs.getString("email")) && inPassword.equals(rs.getString("password"))) {
                    Users u = new Users();
                    u.setId(rs.getInt("id"));
                    u.setFullName(rs.getString("full_name"));
                    u.setEmail(rs.getString("email"));
                    u.setPhone(rs.getString("phone"));
                    u.setAddress(rs.getString("address"));
                    u.setLevel(rs.getInt(7));
                    //
                    System.out.println(inEmail + "\t" + inPassword + "\t" + "đã đăng nhập");

                    HttpSession session = request.getSession();
                    session.setAttribute("Auth", u);

                    response.sendRedirect("index.jsp");

                } else {
                    System.out.println(inEmail + "\t" + inPassword + "\t" + "không đăng nhập được!");

                    request.setAttribute("err", "Sai Email hoặc Password");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

            } else {
                System.out.println(inEmail + "\t" + inPassword + "\t" + "không đăng nhập được!");

                request.setAttribute("err", "Sai Email hoặc Password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            response.getWriter().println("Đăng nhập không thành công!");
        }
    }
}
