import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "ClaimParcelServlet")
public class ClaimParcelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tracking_number = request.getParameter("tn");
        HttpSession session = request.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
            Statement stm = conn.createStatement();
            String sql = "select * from parcel where tracking_number = '" + tracking_number +"' and user_id=''";
            String update = "update parcel set user_id = '" + session.getAttribute("User_ID") + "' where tracking_number ='" + tracking_number +"'";
            ResultSet rs = stm.executeQuery(sql);

            if (rs.next()) {
                stm.execute(update);
                response.sendRedirect("Parcel_Tracking.jsp");
            }
            else
                response.getWriter().println("This parcel cannot be claimed, please contact 109 for assistant");

        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
