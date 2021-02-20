import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet(name = "DelPostServlet")
public class DelPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/bsafe",
                            "root", "123456"
                    );
            Statement stm =
                    conn.createStatement();
            String sql = "delete from post where id = " + pid;
            stm.execute(sql);

            response.sendRedirect("managePost.jsp");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    }

