import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String User_ID= request.getParameter("User_ID");
        String password = request.getParameter("password");



        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn
                    = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bsafe", "root", "123456");
            Statement stm
                    = conn.createStatement();
            String sql
                    = "select * from user where User_ID = '" + User_ID + "' and password = '" + password + "'";


            ResultSet rs = stm.executeQuery(sql);
            if (rs.next())
            {
                HttpSession session = request.getSession();
                session.setAttribute("User_ID", User_ID);
                session.setAttribute("uid", rs.getString("ID"));
                //session.setAttribute("Role", rs.getString("Role"));


                String role =rs.getString("Role");
                String status = rs.getString ("Status");
                if("0".equals(role)){
                    response.sendRedirect("AdminActionSelect.jsp");
                }
                else if("1".equals(role) && "1".equals(status)) {
                    response.sendRedirect("index.jsp");
                }
                else if ("1".equals(role) && "0".equals(status)) {
                    response.sendRedirect("BLIndex.jsp");
                }//https://coderanch.com/t/584786/java/login-page-user

                //response.getWriter().println("<h1>Failed</h1>");
            } else
            {
                //response.sendRedirect("index.jsp");
                response.getWriter().println("<h1>wrong password or username</h1>");
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
