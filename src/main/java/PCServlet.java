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

@WebServlet(name = "PCServlet")
public class PCServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uui = request.getParameter("uui");

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

            String sql = "update user set status = '1', Blacklist_Date = null, Blacklist_End_Date = null where User_ID = '" + uui + "'";
            stm.execute(sql);

            response.sendRedirect("Blacklist4.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        }
    }

