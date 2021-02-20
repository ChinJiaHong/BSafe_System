<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="StyleParcel.css">
        <Title>Slot Details</Title>
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

        <!--Results-->
        <div class="SectionBox">
            <div class="Title" style="margin: 10px">
                Details for Slot S0<%=request.getParameter("sid")%>
            </div>

            <div style="margin: 10px; width: 80%; border: 1px solid navy">
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Availability</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("select * from collection_slot where slot_id = " + request.getParameter("sid"));
                        if (rs.next())
                        {
                    %>
                    <tr>
                        <td><%=rs.getString("Date")%></td>
                        <td><%=rs.getString("Time")%></td>
                        <td><%=rs.getInt("Availability")%></td>
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
                        <th>Booking ID</th>
                        <th>User ID</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                    <%
                        Statement stm1 = conn.createStatement();
                        String sql = "SELECT * FROM collection_slot, bookings WHERE bookings.Slot_ID = collection_slot.slot_id and collection_slot.slot_id = " + request.getParameter("sid");
                        ResultSet rs1 = stm1.executeQuery(sql);
                        int count = 1;
                        while (rs1.next())
                        {
                    %>
                    <tr>
                        <td><%=count%></td>
                        <td>B0<%=rs1.getString("Booking_ID")%></td>
                        <td><%=rs1.getString("User_ID")%></td>
                        <td>
                            <%
                                if (rs1.getInt("Collected") == 0)
                                {
                            %>
                                <a href="MarkCollectedServlet?bid=<%=rs1.getString("Booking_ID")%>&sid=<%=request.getParameter("sid")%>">[Not Collected]</a>
                            <%
                                }
                                else if (rs1.getInt("Collected") == 1)
                                    out.print("Collected");
                                else
                                    out.print("Contact 109");
                            %>
                        </td>
                        <td>
                            <a href="Booking.jsp?bid=<%=rs1.getString("Booking_ID")%>&uid=<%=rs1.getString("User_ID")%>">[View]</a>
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
