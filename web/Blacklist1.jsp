<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

<head>
    <title>Going Out Blacklist Main Page [Admin]</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CampusAccess&GoingOut.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
</head>

<STYLE>A {text-decoration: none; color: inherit} </STYLE>
<body>
<!-- Header -->
<div style="margin-left: 50px; margin-top: 10px;">
    <img src ="Logo.png" height="50px;">
</div>

<div class="nav_bar" style="margin-top: 10px;">
    <div style="padding: 12px 0px 0px 30px; display:inline-block">
        <ul>
            <a href="adminIndex.jsp">
            <li>MAIN</li></a>
            <li><a href="CampusAccess_Admin.jsp">ACCESS</a></li>
            <li><a href="GoingOut_Admin.jsp">GOING OUT</a></li>
            <li>PARCEL</li>
        </ul>
    </div>

    <div class="nav_btn" style="float:right; padding: 12px; cursor: hand;">
        <li><a style="text-decoration: none" href="#">[<%=session.getAttribute("User_ID")%>]</a></li>
        <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
    </div>
</div>
<!-- End of Header -->


<!-- Number of Students In The Blacklist -->
<div style="width: 1000px; margin: auto; margin-top: 5%;  position: relative;">
    <i class="material-icons blue" style=" left: 100px; position: relative; display: inline-block;">remove_red_eye</i>
    <div style="display: inline-block; text-shadow: 2px 2px 2px rgba(0,0,0, 0.25); font-size: 24px; font-weight: 500; color:#263E7B; top: -5px; left: 40px; position: relative">View</div>
    <i class="material-icons grey" style=" display: inline-block; left: 400px; position: relative">person_add</i>
    <div style=" display: inline-block; font-size: 24px; font-weight: 500; color:#656565; left: 315px; top: -3px; position: relative"><a href= "Blacklist2.jsp">Add</a></div>
    <i class="material-icons grey" style=" display: inline-block; left: 690px; position: relative">person_add_disabled</i>
    <div style=" display: inline-block; font-size: 24px; font-weight: 500; color:#656565; left: 585px; top: -3px; position: relative"><a href= "Blacklist4.jsp">Remove</a></div>
</div>

<div style="width: 1300px; margin: auto; margin-top: 5%; position: relative; height: 50px; background-color: #ffffff;  filter: drop-shadow(0px 4px 3px #00000055); border-radius: 5px">
    <div style=" position: relative; top: 3px; left: 5px; display: inline-block; font-size: 24px; font-weight: 400; color:#263E7B;"> Number of Blacklisted Students</div>
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
        String sql = "select \n" +
                "\tsum(cu) as c_user\n" +
                "from\n" +
                "(\n" +
                "\tselect count(User_ID) as cu\n" +
                "\tfrom User\n" +
                "\twhere status = 0\n" +
                ") as T";
        ResultSet rs = stm.executeQuery(sql);
        rs.next();
    %>
    <div style=" position: relative; top: 3px; left: 875px; font-size: 24px;  font-weight: 400; color:#ff0000; display: inline-block; "><%=rs.getString("c_user")%></div>
</div>
<!-- End of Number of Students In The Blacklist -->


<!-- Blacklist -->
<div style="width: 1200px; margin: auto; margin-top: 5%;  position: relative;">
    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Nationality</th>
            <th>Mobile Number</th>
            <th>Blacklist Date</th>
            <th>End Date</th>
        </tr>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn_table =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/bsafe",
                            "root",
                            "123456"
                    );
            Statement stm_table =
                    conn_table.createStatement();
            String sql_table = "select \n" +
                    "\tuser.User_ID as uui,\n" +
                    "\tuser.Name as un,\n" +
                    "\tuser.Nationality as unt,\n" +
                    "\tuser.Mobile_Number as umn,\n" +
                    "\tuser.Blacklist_Date,\n" +
                    "\tuser.Blacklist_END_Date\n" +
                    "from user\n" +
                    "where status = 0\n" +
                    "ORDER BY Blacklist_Date DESC ";
        ResultSet rs_table = stm_table.executeQuery(sql_table);
        while(rs_table.next())
        {
        %>
        <tr>
            <td><%=rs_table.getString("uui")%></td>
            <td><%=rs_table.getString("un")%></td>
            <td><%=rs_table.getString("unt")%></td>
            <td><%=rs_table.getString("umn")%></td>
            <td><%=rs_table.getString("Blacklist_Date")%></td>
            <td style="color: red; font-family: 'Poppins', sans-serif; font-size: 20px; font-weight: 300"><%=rs_table.getString("Blacklist_END_Date")%></td>
        </tr>
        <%
        }
        %>
    </table>
</div>

<button class="button button1" style="position: relative; right: -83%; margin-top: 80px">
    <a href="GoingOut_Admin.jsp">Cancel</a>
</button>
<!-- End of Blacklist -->


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
