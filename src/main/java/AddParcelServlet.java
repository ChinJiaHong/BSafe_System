import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "AddParcelServlet")
public class AddParcelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("uid");
        String tracking_number = request.getParameter("tn");
        String courier = request.getParameter("courier");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
            String sql = "INSERT INTO Parcel (Tracking_Number, User_ID, Courier, Status) VALUES (?, ?, ?, 1);";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, tracking_number);
            stm.setString(2, uid);
            stm.setString(3, courier);
            stm.execute();

            response.sendRedirect("Admin_addParcel.jsp");
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
