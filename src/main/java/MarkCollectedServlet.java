import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "MarkCollectedServlet")
public class MarkCollectedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int booking_id = Integer.parseInt(request.getParameter("bid"));
        int slot_id = Integer.parseInt(request.getParameter("sid"));

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
            String update_booking = "Update bookings SET collected = 1 where booking_id = ?";
            PreparedStatement stm1 = conn.prepareStatement(update_booking);
            stm1.setInt(1, booking_id);
            stm1.execute();

            String update_parcel = "Update parcel SET status = 2 where booking_id = ?";
            PreparedStatement stm2 = conn.prepareStatement(update_parcel);
            stm2.setInt(1, booking_id);
            stm2.execute();

            response.sendRedirect("AdminSlotDetails.jsp?sid=" + slot_id);
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
