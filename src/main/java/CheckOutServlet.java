import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

@WebServlet(name = "CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cauid = request.getParameter("cauid");
        java.util.Date d = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String cur_time = sdf.format(d);

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/bsafe",
                            "root","123456"
                    );
            Statement stm =
                    conn.createStatement();

            String sql = "update campus_access_application set Check_Out = '1', Check_Out_Date = '" + cur_time + "' where User_ID = '" + cauid + "'";
            stm.execute(sql);

            response.sendRedirect("CampusAccess3.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    }

