import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Name = request.getParameter("Name");
        String password = request.getParameter("password");
        String User_ID = request.getParameter("User_ID");
        String Nationality = request.getParameter("Nationality");
        String Date_of_Birth = request.getParameter("Date_of_Birth");
        String Mobile_Number = request.getParameter("Mobile_Number");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn
                    = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bsafe", "root", "123456");

            String sql =
                    "insert into user (Name, password, User_ID, Nationality, Date_of_Birth, Mobile_Number)"
                            + "values(?, ?, ?, ?, ?, ?)";
            PreparedStatement stm =
                    conn.prepareStatement(sql);
            stm.setString(1, Name);
            stm.setString(2, password);
            stm.setString(3, User_ID);
            stm.setString(4, Nationality);
            stm.setString(5, Date_of_Birth);
            stm.setString(6, Mobile_Number);



            stm.execute();

            /*Statement stm =
                    conn.createStatement();
            String sql =
                    "insert into post(title, content, date_of_creation, User_ID)"
                            + "values('" + title + "', '" + content + "', '" + cur_time +"','" + User_ID + "')";
            stm.execute(sql);*/

            response.sendRedirect("login.jsp");
        }

        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
