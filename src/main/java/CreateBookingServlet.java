import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "CreateBookingServlet")
public class CreateBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int slot_id = Integer.parseInt(request.getParameter("sid"));

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
            String sql = "INSERT INTO Bookings (Slot_ID, User_ID) VALUES (?, ?);";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, slot_id);
            stm.setString(2, (String)session.getAttribute("User_ID"));
            stm.execute();

            String sql1 = "UPDATE parcel SET parcel.booking_id = last_insert_id() WHERE parcel.user_id = ? AND parcel.status = 1;";
            PreparedStatement stm1 = conn.prepareStatement(sql1);
            stm1.setString(1, (String)session.getAttribute("User_ID"));
            stm1.execute();

            String sql2 = "UPDATE collection_slot SET collection_slot.availability = availability - 1 where slot_id = ?;";
            PreparedStatement stm2 = conn.prepareStatement(sql2);
            stm2.setInt(1, slot_id);
            stm2.execute();

            response.sendRedirect("BookingHistory.jsp");
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
