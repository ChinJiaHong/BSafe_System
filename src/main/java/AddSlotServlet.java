import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

@WebServlet(name = "AddSlotServlet")
public class AddSlotServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
            String sql = "INSERT INTO Collection_slot (Date, Time, Availability) VALUES (?, ?, 30)";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, date);
            stm.setString(2, time);
            stm.execute();

            response.sendRedirect("AdminManageSlot.jsp");
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
