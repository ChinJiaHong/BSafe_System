import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map> list = new ArrayList<Map>();


        String search = request.getParameter("search");
        System.out.println(search);


        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/bsafe", "root", "123456"
                    );
            Statement stm =
                    conn.createStatement();
            String sql = "select\n" +
                    "\t\tuser.name as un,\n" +
                    "\t\tuser.User_ID as uuid,\n" +
                    "\t\tuser.Nationality as unt,\n" +
                    "\t\tuser.Date_of_Birth as udob,\n" +
                    "        user.Mobile_Number as umn\n" +
                    "from user\n" +
                    "where User_ID = '" + search + "'";

            ResultSet rs = stm.executeQuery(sql);

            System.out.println("Fetch Data");
            while (rs.next())
            {
                String un = rs.getString("un");
                String uuid = rs.getString("uuid");
                String unt = rs.getString("unt");
                String udob = rs.getString("udob");
                String umn = rs.getString("umn");

                Map map = new HashMap();
                map.put("un", un);
                map.put("uuid", uuid);
                map.put("unt", unt);
                map.put("udob", udob);
                map.put("umn", umn);

                System.out.println(map);
                list.add(map);
                System.out.println("Put Into List");
                for (Map map_1 :list) {
                            System.out.println(map_1);
                        }

            }

        } catch (Exception ex)
        {
            ex.printStackTrace();
        }
        System.out.println("Redirect");
        request.setAttribute("key_list", list);
        request.getRequestDispatcher("/Blacklist3.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
