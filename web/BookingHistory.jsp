<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="StyleParcel.css">
        <Title>Booking History</Title>
    </head>

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
                <li><%--<a href="profile.jsp?uid=<%=session.getAttribute("uid")%>">--%>[<%=session.getAttribute("User_ID")%>]<%--</a>--%></li>
                <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
            </div>
        </div>

        <!--Results-->
        <div class="SectionBox">
            <div class="Title" style="margin: 10px">
                Booking History for <%=session.getAttribute("User_ID")%>
            </div>

            <div style="margin: 10px;">
                <table>
                    <tr>
                        <th>No.</th>
                        <th>Booking ID</th>
                        <th>Date</th>
                        <th>Slot</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
                        String sql = "select * from collection_slot, bookings where collection_slot.slot_id = bookings.slot_id AND user_id = ? order by booking_id desc";
                        PreparedStatement stm = con.prepareStatement(sql);
                        stm.setString(1, (String)session.getAttribute("User_ID"));
                        ResultSet rs = stm.executeQuery();
                        int count = 1;
                        while (rs.next())
                        {
                    %>
                    <tr>
                        <td><%=count%></td>
                        <td>B00<%=rs.getString("Booking_ID")%></td>
                        <td><%=rs.getString("Date")%></td>
                        <td><%=rs.getString("Time")%></td>
                        <td>
                            <%
                                if (rs.getInt("Collected") == 1)
                                    out.print("Collected");
                                else
                                    out.print("Not Collected");
                            %>
                        </td>
                        <td>
                            <a href="Booking.jsp?bid=<%=rs.getString("Booking_ID")%>&uid=<%=session.getAttribute("User_ID")%>">
                                [View]
                            </a>
                        </td>
                    </tr>
                    <%
                        count++;  }
                    %>
                </table>


            </div>
        </div>

        

        <!--Footer-->
        <div class="Footer" style="position: fixed; bottom: 0px;">
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
        </div> <!--End of Footer-->
    </body>
</html>
