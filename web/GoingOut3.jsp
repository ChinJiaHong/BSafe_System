<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

<head>
    <title>Going Out Campus Application Status</title>
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


<!-- Going Out Application Status -->
<div>
    <div style="border: 1px solid #263E7B; border-radius: 10px; height: 180px; background-color: #FFFFFF; position:relative; margin:100px auto; width:1300px">
        <div style="font-family: 'Poppins', sans-serif;">
            <div style="position: absolute; right: 1210px; top: 20px;">
                <img src="logo4.png" height="40px" width="40px"/>
            </div>
            <div style="font-weight: 600; font-size: 20px; position: relative; right: -100px; top: 20px; color: #222020; padding: 8px;">
                STATUS
            </div>
            <div style="font-weight: 500; font-size: 14px; position: relative; right: -40px; top: 18px; color: #818181; padding: 15px;">
                <r>Success.</r> Please practice social distancing and wearing mask to keep yourself safe when you are at the outside of the campus premises. Stay safe.
            </div>
        </div>
    </div>
</div>
<!-- End of Going Out Application Status -->


<!-- First Date of Going Out -->
<div class="line1"></div>

<div style="width: 1300px; margin: 50px auto;">
    <table>
        <tr style="border: 1px solid #263E7B;">
            <th>Date</th>
            <th>Student ID</th>
            <th>Name</th>
            <th>Nationality</th>
            <th style="color: #FFD260; font-weight: 600">Going Out</th>
            <th style="color: #FFD260; font-weight: 600">Going In</th>
        </tr>
        <%
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
                        "\t\tgoing_out_application.First_Date as gofd,\n" +
                        "\t\tgoing_out_application.User_ID as goid,\n" +
                        "\t\tgoing_out_application.Name as gon,\n" +
                        "\t\tgoing_out_application.Nationality as gont\n" +
                        "from going_out_application\n" +
                        "ORDER BY Out_ID DESC LIMIT 0, 1 ";
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next())
            {
        %>
            <tr style="border: 1px solid #263E7B;">
            <td><%=rs.getString("gofd")%></td>
            <td><%=rs.getString("goid")%></td>
            <td><%=rs.getString("gon")%></td>
            <td><%=rs.getString("gont")%></td>
            <td>
                <button class="button button3" style="position: relative; right: -5px; bottom: 0px">
                    <a href="FirstGoingOutServlet?goid=<%=rs.getString("goid")%>">
                    CONFIRM
                    </a>
                </button>
            </td>
            <td>
                <button class="button button3" style="position: relative; right: -10px; bottom: 0px">
                    <a href="FirstGoingInServlet?goid=<%=rs.getString("goid")%>">
                    CONFIRM
                    </a>
                </button>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<!-- End of First Date of Going Out -->


<!-- Second Date of Going Out -->
<div style="width: 1300px; margin: 50px auto;">
    <table>
        <tr style="border: 1px solid #263E7B;">
            <th>Date</th>
            <th>Student ID</th>
            <th>Name</th>
            <th>Nationality</th>
            <th style="color: #FFD260; font-weight: 600">Going Out</th>
            <th style="color: #FFD260; font-weight: 600">Going In</th>
        </tr>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn_second =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/bsafe",
                            "root",
                            "123456"
                    );
            Statement stm_second =
                    conn_second.createStatement();
            String sql_second =
                    "select\n" +
                            "\t\tgoing_out_application.Second_Date as gosd,\n" +
                            "\t\tgoing_out_application.User_ID as goid,\n" +
                            "\t\tgoing_out_application.Name as gon,\n" +
                            "\t\tgoing_out_application.Nationality as gont\n" +
                            "from going_out_application\n" +
                            "ORDER BY Out_ID DESC LIMIT 0, 1 ";
            ResultSet rs_second = stm_second.executeQuery(sql_second);
            while(rs_second.next())
            {
        %>
        <tr style="border: 1px solid #263E7B;">
            <td><%=rs_second.getString("gosd")%></td>
            <td><%=rs_second.getString("goid")%></td>
            <td><%=rs_second.getString("gon")%></td>
            <td><%=rs_second.getString("gont")%></td>
            <td>
                <button class="button button3" style="position: relative; right: -5px; bottom: 0px">
                    <a href="SecondGoingOutServlet?goid=<%=rs_second.getString("goid")%>">
                    CONFIRM
                    </a>
                </button>

            </td>
            <td>
                <button class="button button3" style="position: relative; right: -10px; bottom: 0px">
                    <a href="SecondGoingInServlet?goid=<%=rs_second.getString("goid")%>">
                    CONFIRM
                    </a>
                </button>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<!-- End of Second Date of Going Out -->


<!-- Actual Time of First Going Out -->
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
                            "select\n" +
                                "\t\tgoing_out_application.First_Going_Out_Date as gofgod,\n" +
                                "\t\tgoing_out_application.First_Going_In_Date as gofgid,\n" +
                                "\t\tgoing_out_application.Second_Going_Out_Date as gosgod,\n" +
                                "\t\tgoing_out_application.Second_Going_In_Date as gosgid\n" +
                                "from going_out_application\n" +
                                "ORDER BY Out_ID DESC LIMIT 0, 1 ";
              ResultSet rs_status = stm.executeQuery(sql_status);
              while(rs_status.next())
              {
                 %>
    <td>
        <i class="material-icons black" style=" display: inline-block; transform: translate(650px,-35px)">call_split</i>
        <tl style="font-size: 20px; font-weight: 500; position: relative; right: -628px">Going Out from XMUM: </tl> <br>
        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">You have left campus premises</tl> <br>
        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">at <r style="font-size: 18px; font-weight: 400"><%=rs_status.getString("gofgod")%></r></tl>
    </td>
</div>

<div style="border-bottom: 1px solid #8E8E8E; width: 450px;  transform: translate(590px,30px)"></div>

<div style="margin-top: 100px">
    <td>
        <i class="material-icons black" style=" display: inline-block; transform: translate(650px,-35px)">add_location_</i>
        <tl style="font-size: 20px; font-weight: 500; position: relative; right: -605px;">Going In to XMUM: </tl> <br>
        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">You have entered campus premises</tl> <br>
        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">at <r style="font-size: 18px; font-weight: 400"><%=rs_status.getString("gofgid")%></r></tl>
    </td>
</div>
<!-- End of Actual Time of First Going Out -->


<!-- Actual Time of Second Going Out -->
<div class="line1" style="position: relative; margin-top: 50px"></div>

<div style="margin-top: 100px">
    <td>
        <i class="material-icons black" style=" display: inline-block; transform: translate(650px,-35px)">call_split</i>
        <tl style="font-size: 20px; font-weight: 500; position: relative; right: -629px">Going Out from XMUM: </tl> <br>
        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">You have left campus premises</tl> <br>
        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">at <r style="font-size: 18px; font-weight: 400"><%=rs_status.getString("gosgod")%></r></tl>
    </td>
</div>

<div style="border-bottom: 1px solid #8E8E8E; width: 450px;  transform: translate(590px,30px)"></div>

<div style="margin-top: 100px">
    <td>
        <i class="material-icons black" style=" display: inline-block; transform: translate(650px,-35px)">add_location_</i>
        <tl style="font-size: 20px; font-weight: 500; position: relative; right: -604px";>Going In to XMUM: </tl> <br>
        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">You have entered campus premises</tl> <br>
        <tl style="font-size: 18px; font-weight: 400; position: relative; right: -658px;">at <r style="font-size: 18px; font-weight: 400"><%=rs_status.getString("gosgid")%></r></tl>
    </td>
    <%
        }
    %>
    </form>
</div>
    <button class="button button1" style="position: relative; margin: 50px 0px 0px 0px; left: 86.3%;">
        <a href="GoingOut1.jsp">Back</a>
    </button>
<!-- Actual Time of Second Going Out -->


<!--Footer-->
<div class="Footer" style="position: relative; margin-top: 80px;">
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
