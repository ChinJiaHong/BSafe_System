import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet(name = "GoingOutServlet")
public class GoingOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("ID");
        String name = request.getParameter("name");
        String nationality = request.getParameter("nationality");
        String mobile = request.getParameter("mobile");
        String first = request.getParameter("first");
        String second = request.getParameter("second");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/bsafe",
                            "root","123456"
                    );
            Statement stm=
                    conn.createStatement();
            String sql =
                    "insert into going_out_application(User_ID, Name, Nationality, Mobile_Number, First_Date, Second_Date)"
                            + "values('" + ID + "','"+ name +"','" + nationality + "','" + mobile + "','" + first + "','" + second + "')";

            stm.execute(sql);
            response.sendRedirect("GoingOut3.jsp");
        }

        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
