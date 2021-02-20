<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="javax.xml.transform.Result" %>
<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="StyleParcel.css">
        <Title>Admin Check Slot</Title>
    </head>

    <body>
    <!--Header-->
    <div style="margin-left: 50px; margin-top: 10px;">
        <img src ="Logo.png" height="50px;">
    </div>

    <div class="nav_bar" style="margin-top: 10px;">
        <div style="padding: 12px 0px 0px 30px; display:inline-block">
            <ul>
                <a href="AdminActionSelect.jsp">
                    <li>MAIN</li>
                </a>
                <a href="AdminPostMain.jsp">
                    <li>Manage Post</li>
                </a>
                <a href="AdminAccess.jsp">
                    <li>Manage Application</li>
                </a>
                <a href="AdminParcel.jsp">
                    <li>Manage Parcel</li>
                </a>
            </ul>
        </div>

        <div class="nav_btn" style="float:right; padding: 12px; cursor: hand;">
            <li><a style="text-decoration: none" href="#">[<%=session.getAttribute("User_ID")%>]</a></li>
            <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
        </div>
    </div> <!--End of Header-->

        <div class="SectionBox">
            <div class="Title" style="margin: 10px">
                Create New Time Slots
            </div>

            <form method="post" action="AddSlotServlet">
                <div class="parcelInput" style="padding: 10px;">
                    <input type="Date" name="date" placeholder="Date"/> </br>
                    <input type="text" name="time" placeholder="Time"/> </br>
                </div>

                <div style="text-align: center; margin: 10px">
                    <button type="submit" class="button" style="padding: 6.5px; margin: 0px; width: 30%;">
                        Create
                    </button>
                </div>
            </form>
        </div>

        <div class="SectionBox">
            <div class="Title" style="margin: 10px">
                All Slots
            </div>

            <div style="margin: 10px;">
                <table style="width: 100%">
                    <tr>
                        <th>Slot ID</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Availability</th>
                        <th>Actions</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("select * from collection_slot");
                        while (rs.next())
                        {
                    %>
                    <tr>
                        <td>S0<%=rs.getInt("Slot_ID")%></td>
                        <td><%=rs.getString("Date")%></td>
                        <td><%=rs.getString("Time")%></td>
                        <td><%=rs.getInt("Availability")%></td>
                        <td>
                            <a href="AdminSlotDetails.jsp?sid=<%=rs.getString("Slot_ID")%>">
                                [View]
                            </a>
                            <a href="DeleteSlotServlet?sid=<%=rs.getInt("Slot_ID")%>">
                                [Delete]
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>


        <!--Footer-->
        <div class="Footer" style="position: absolute; bottom: 0px;">
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
    </body>
</html>