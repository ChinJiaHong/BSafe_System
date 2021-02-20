<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Campus Access Application Status</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CampusAccess&GoingOut.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
</head>

<STYLE>A {text-decoration: none; color: inherit} </STYLE>
<body>
<!--Header-->
<div style="margin-left: 50px; margin-top: 10px;">
    <img src ="Logo.png" height="50px;">

</div>
<div class="nav_bar" style="position: sticky;top: 0;z-index: 100;">
    <div style="padding: 12px 0px 0px 30px; display:inline-block">
        <a href="index.jsp">
            <li>MAIN</li></a>
        <a href="CampusAccess1.jsp">
            <li>ACCESS</li></a>
        <a href="GoingOut1.jsp">
            <li>GOING OUT</li></a>
        <a href="parcel_main.jsp">
            <li>PARCEL</li></a>
        </ul>
    </div>

    <div class="nav_btn" style="float:right; padding: 12px; cursor: hand;">
        <li>[<%=session.getAttribute("User_ID")%>]</li>
        <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
    </div>
</div>
<!--End of Header-->


<!-- Campus Access Date -->
<div style="width: 1200px; margin: 50px auto; overflow: auto">
    <form>
        <table>
            <tr>
                <th>Name</th>
                <th>Student ID</th>
                <th>Mobile Number</th>
                <th>Nationality</th>
                <th>Date</th>
                <th style="color: #FFD260; font-weight: 600">Check-In</th>
                <th style="color: #FFD260; font-weight: 600">Check-Out</th>
            </tr>
            <%
                String uid = (String) session.getAttribute("uid");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn =
                        DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/bsafe",
                                "root",
                                "123456"
                        );
                Statement stm =
                        conn.createStatement();
                String sql =
                        "select\n" +
                                "\tcampus_access_application.Name as can,\n" +
                                "    campus_access_application.User_ID as cauid,\n" +
                                "    campus_access_application.Mobile_Number as camn,\n" +
                                "    campus_access_application.Nationality as cant,\n" +
                                "    campus_access_application.Date_to_Enter_Campus as cad\n" +
                                "from campus_access_application   \n" +
                                "ORDER BY Access_ID DESC LIMIT 0, 1 ;\n" +
                                "\t\n";
                ResultSet rs = stm.executeQuery(sql);
                while(rs.next())
                {
            %>
            <tr>
                <td><%=rs.getString("can")%></td>
                <td><%=rs.getString("cauid")%></td>
                <td><%=rs.getString("camn")%></td>
                <td><%=rs.getString("cant")%></td>
                <td><%=rs.getString("cad")%></td>
                <td>
                    <button class="button button3" style="position: relative; right: -5px; bottom: 0px">
                        <a href="CheckInServlet?cauid=<%=rs.getString("cauid")%>">
                            CONFIRM
                        </a>
                    </button>
                </td>
                <td>
                    <button class="button button3" style="position: relative; right: -10px; bottom: 0px">
                        <a href="CheckOutServlet?cauid=<%=rs.getString("cauid")%>">
                            CONFIRM
                        </a>
                    </button>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </form>
</div>
<!-- End of Campus Access Date -->


<!-- Check In Time and Check Out Time -->
<div style="margin-top: 200px">
    <form>
            <%
               Class.forName("com.mysql.jdbc.Driver");
               Connection conn_status =
                      DriverManager.getConnection(
                              "jdbc:mysql://localhost:3306/bsafe",
                              "root",
                              "123456"
                      );
               Statement stm_status =
                      conn_status.createStatement();
               String sql_status =
                      "SELECT \n" +
                      "\tcampus_access_application.Check_In_Date as caacid,\n" +
                      "    campus_access_application.Check_Out_Date as caacod\n" +
                      "FROM campus_access_application   \n" +
                      "ORDER BY Access_ID DESC LIMIT 0,1";
               ResultSet rs_status = stm.executeQuery(sql_status);
               while(rs_status.next())
               {
                 %>
                <div>
                    <td>
                        <i class="material-icons black" style=" display: inline-block; transform: translate(650px,-35px)">add_location_</i>
                        <tl style="font-size: 20px; font-weight: 500; position: relative; right: -605px;">Entered XMUM: </tl> <br>
                        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">You have entered campus premises</tl> <br>
                        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">at <r style="font-size: 18px; font-weight: 400"><%=rs_status.getString("caacid")%></r></tl>
                    </td>
                </div>

                <div style="border-bottom: 1px solid #8E8E8E; width: 450px;  transform: translate(590px,30px)"></div>

                <div style="margin-top: 100px">
                    <td>
                    <i class="material-icons black" style=" display: inline-block; transform: translate(650px,-35px)">call_split</i>
                    <tl style="font-size: 20px; font-weight: 500; position: relative; right: -630px";>Left XMUM: </tl> <br>
                    <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">You have left campus premises</tl> <br>
                    <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">at <r style="font-size: 18px; font-weight: 400"><%=rs_status.getString("caacod")%></r></tl>
                </td>
                <%
                }
                %>
    </form>
</div>
<!-- Check In Time and Check Out Time -->



<div>
    <td>
        <button class="button button1" style="position: relative; right: -1100px; margin-top: 10%">
            <a href="CampusAccess1.jsp">Back</a>
        </button>
    </td>
    <td>
        <button class="button button1" style="position: relative; right: -1120px; margin-top: 10%">
            <a href="CampusAccess2.jsp">Apply</a>
        </button>
    </td>
</div>


<!--Footer-->
    <div class="Footer" style="position: relative; margin-top: 80px">
        <div style="margin: 20px; font-size: 1.2em; font-weight: 600;">
            XIAMEN UNIVERSITY MALAYSIA
        </div>

        <div style="margin: 20px;">
            <ul>
                <li>Main</li>
                <li>Access</li>
                <li>Going Out</li>
                <li>Parcel</li>
            </ul>
        </div>
    </div>
<!--End of Footer-->
</body>
</html>
