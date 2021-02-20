import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet(name = "DeleteParcelServlet")
public class DeleteParcelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int parcel_id = Integer.parseInt(request.getParameter("pid"));

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
            Statement stm = conn.createStatement();
            String sql = "delete from parcel where parcel_id = " + parcel_id;
            stm.execute(sql);

            response.sendRedirect("Admin_addParcel.jsp");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
