<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="StyleParcel.css">
        <Title>Select Slot</Title>
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
                <li>[<%=session.getAttribute("User_ID")%>]</li>
                <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
            </div>
        </div>

        <!--Results-->
        <div class="SectionBox">
            <div class="Title" style="margin: 10px">
                Confirm Selection
            </div>
            
            <div style="margin: 10px;">
                <table>
                    <tr>
                        <th>No.</th>
                        <th>Tracking Number</th>
                        <th>Courier</th>
                        <th>Status</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsafe", "root", "123456");
                        String sql = "select * from parcel where user_id = ? and status = 1";
                        PreparedStatement stm = conn.prepareStatement(sql);
                        stm.setString(1, (String)session.getAttribute("User_ID"));
                        ResultSet rs = stm.executeQuery();
                        int count = 1;
                        while (rs.next())
                        {
                    %>
                    <tr>
                        <td><%=count%></td>
                        <td><%=rs.getString("tracking_number")%></td>
                        <td><%=rs.getString("courier")%></td>
                        <td>
                            <%
                                if (rs.getInt("status") == 1)
                                    out.print("Arrived");
                                else
                                    out.print("Contact Office");
                            %>
                        </td>
                    </tr>
                    <%
                        count ++; }
                    %>

                </table>
            </div>
        </div>

        <div class="SectionBox">
            <div class="Title" style="margin: 10px">
                Select Slot
            </div>

            <div style="margin: 10px">
                <table>
                    <tr>
                        <th>No.</th>
                        <th>Slot ID</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Availability</th>
                        <th>Select</th>
                    </tr>
                    <%
                        java.util.Date d = new java.util.Date();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String curr_date = sdf.format(d);

                        Statement stm_slot = conn.createStatement();
                        ResultSet rs_slot = stm_slot.executeQuery("select * from collection_slot where Date >= '" +curr_date +"' AND Availability > 0");
                        int c_slot = 1;
                        while (rs_slot.next())
                        {
                    %>
                        <tr>
                            <form id="make_booking<%=c_slot%>" method="post" action="CreateBookingServlet">
                                <td><%=c_slot%></td>
                                <td>S0<%=rs_slot.getInt("Slot_ID")%></td>
                                <td><%=rs_slot.getString("Date")%></td>
                                <td><%=rs_slot.getString("Time")%></td>
                                <td><%=rs_slot.getInt("Availability")%>/30</td>
                                <td>
                                    <input name="sid" type="hidden" value="<%=rs_slot.getInt("Slot_ID")%>"/>
                                    <button type="submit" form ="make_booking<%=c_slot%>" class="button">
                                        Select
                                    </button>
                                </td>
                            </form>
                        </tr>
                    <%
                        c_slot++; }
                    %>
                </table>
            </div>


        </div>


        <!--Footer-->
        <div class="Footer">
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
