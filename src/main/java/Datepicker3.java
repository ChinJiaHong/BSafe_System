import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Datepicker3")
public class Datepicker3 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map> list = new ArrayList<Map>();


        String date = request.getParameter("date");
        System.out.println(date);


        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/bsafe", "root", "123456"
                    );
            Statement stm =
                    conn.createStatement();
            String sql = "select going_out_application.Name as gon, going_out_application.User_ID as gouid, going_out_application.Nationality as gont, going_out_application.Mobile_Number as gomn, going_out_application.First_Date as gofd from going_out_application WHERE First_Date = '" + date + "'";

            ResultSet rs = stm.executeQuery(sql);

            System.out.println("Fetch Data");
            while (rs.next())
            {
                String gon = rs.getString("gon");
                String gouid = rs.getString("gouid");
                String gont = rs.getString("gont");
                String gomn = rs.getString("gomn");
                String gofd = rs.getString("gofd");


                Map map = new HashMap();
                map.put("gon", gon);
                map.put("gouid", gouid);
                map.put("gont", gont);
                map.put("gomn", gomn);
                map.put("gofd", gofd);


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
        request.setAttribute("key_list2", list);
        request.getRequestDispatcher("GoingOut_Check.jsp").forward(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
