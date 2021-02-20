import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
    name = "AddtoBlacklistServlet"
)
public class AddtoBlacklistServlet extends HttpServlet {
    public AddtoBlacklistServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uuid = request.getParameter("uuid");
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String cur_time = sdf.format(d);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
            Statement stm = conn.createStatement();
            String sql = "update user set status = '0', Blacklist_Date = '" + cur_time + "', Blacklist_END_Date = DATE_ADD('" + cur_time + "', INTERVAL 30 DAY) where User_ID = '" + uuid + "'";
            stm.execute(sql);
            response.sendRedirect("Blacklist1.jsp");
        } catch (SQLException | ClassNotFoundException var10) {
            var10.printStackTrace();
        }

    }
}
