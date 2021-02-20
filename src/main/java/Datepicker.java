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

@WebServlet(name = "Datepicker")
public class Datepicker extends HttpServlet {
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
            String sql = "select campus_access_application.Name as can, campus_access_application.User_ID as cauid, campus_access_application.Mobile_Number as camn, campus_access_application.Nationality as cant, campus_access_application.Date_to_Enter_Campus as cad,  campus_access_application.Check_In_Date as cacid, campus_access_application.Check_Out_Date as cacod from campus_access_application  WHERE Date_to_Enter_Campus = '" + date + "'";

            ResultSet rs = stm.executeQuery(sql);

            System.out.println("Fetch Data");
            while (rs.next())
            {
                String can = rs.getString("can");
                String cauid = rs.getString("cauid");
                String camn = rs.getString("camn");
                String cant = rs.getString("cant");
                String cad = rs.getString("cad");
                String cacid = rs.getString("cacid");
                String cacod = rs.getString("cacod");


                Map map = new HashMap();
                map.put("can", can);
                map.put("cauid", cauid);
                map.put("camn", camn);
                map.put("cant", cant);
                map.put("cad", cad);
                map.put("cacid", cacid);
                map.put("cacod", cacod);

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
        request.getRequestDispatcher("/CampusAccess_Admin.jsp").forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }

}

