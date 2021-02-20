import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;

@MultipartConfig

@WebServlet(name = "DisplayImageServlet")
public class DisplayImageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
            try {

                byte[] imgData= null;
                Blob image=null;
                String pid = request.getParameter("pid");

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn
                        = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/bsafe", "root", "123456");


                Statement stm = conn.createStatement();

                ResultSet rs = stm.executeQuery("select image from post where id=" +pid);

                rs.next();

                image= rs.getBlob("image");
                imgData = image.getBytes(1,(int)image.length());

                response.setContentType("image/jpg");
                OutputStream o = response.getOutputStream();
                o.write(imgData);
                o.flush();
                o.close();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
    }
}
