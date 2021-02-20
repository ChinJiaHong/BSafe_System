import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
@MultipartConfig

@WebServlet(name = "PostAddServlet")
public class PostAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String User_ID = request.getParameter("User_ID");
        java.util.Date d = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String cur_time = sdf.format(d);

        InputStream inputStream = request.getPart("image").getInputStream();

        Part filePart = request.getPart("image");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        HttpSession session = request.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn
                    = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bsafe", "root", "123456");

            String sql =
                    "insert into post (title, content, date_of_creation, User_ID, image)"
                            + "values(?, ?, ?, ?, ?)";
            PreparedStatement stm =
                    conn.prepareStatement(sql);
            stm.setString(1, title);
            stm.setString(2, content);
            stm.setString(3, cur_time);
            stm.setString(4, (String)session.getAttribute("User_ID"));
            stm.setBlob(5, inputStream);

            stm.execute();

            response.sendRedirect("adminIndex.jsp");
        }

        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
