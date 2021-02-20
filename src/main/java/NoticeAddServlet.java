import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;

@WebServlet(name = "NoticeAddServlet")
public class NoticeAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("content");
        String User_ID = request.getParameter("User_ID");
        java.util.Date d = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String cur_time = sdf.format(d);

        HttpSession session = request.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn
                    = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bsafe", "root", "123456");


            Statement stm_notice =
                    conn.createStatement();
            String sql_notice =
                    "insert into notice(content, date_of_creation, User_ID)"
                            + "values('" + content + "', '" + cur_time +"','" + User_ID + "')";

            stm_notice.execute(sql_notice);

            response.sendRedirect("adminIndex.jsp");
        }

        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
