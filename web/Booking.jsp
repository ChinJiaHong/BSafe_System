<%@ page import="java.sql.*" %>
<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="StyleParcel.css">
        <Title>Parcel Receipt</Title>
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
    <!--End of Header-->

        <!--Results-->
        <div class="SectionBox">
            <div class="Title" style="margin: 10px">
                Booking ID B0<%=request.getParameter("bid")%>
            </div>

            <div style="margin: 10px; width: 80%; border: 1px solid navy">
                <table>
                    <tr>
                        <th>Slot ID</th>
                        <th>Day</th>
                        <th>Time</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
                        PreparedStatement stm = conn.prepareStatement("SELECT * FROM collection_slot, bookings WHERE bookings.Slot_ID = collection_slot.Slot_ID AND Booking_ID = ?;");
                        stm.setString(1, request.getParameter("bid"));
                        ResultSet rs = stm.executeQuery();
                        if (rs.next())
                        {
                    %>
                    <tr>
                        <td>S0<%=rs.getString("Slot_ID")%></td>
                        <td><%=rs.getString("Date")%></td>
                        <td><%=rs.getString("Time")%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>

            <div style="margin: 30px 10px">
                <table>
                    <tr>
                        <th>No.</th>
                        <th>Tracking Number</th>
                        <th>Courier</th>
                        <th>Status</th>
                    </tr>
                    <%
                        PreparedStatement stm1 = conn.prepareStatement("SELECT * FROM parcel WHERE booking_id = ? AND User_ID = ?");
                        stm1.setString(1, request.getParameter("bid"));
                        stm1.setString(2, request.getParameter("uid"));
                        ResultSet rs1 = stm1.executeQuery();
                        int count = 1;
                        while (rs1.next())
                        {
                    %>
                    <tr>
                        <td><%=count%></td>
                        <td><%=rs1.getString("tracking_number")%></td>
                        <td><%=rs1.getString("courier")%></td>
                        <td>
                            <%
                                if (rs1.getInt("Status") == 1)
                                    out.print("Arrived");
                                else if (rs1.getInt("Status") == 2)
                                    out.print("Collected");
                                else
                                    out.print("Contact 109");
                            %>
                        </td>
                    </tr>
                    <%
                        count++; }
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
