<%@ page import="java.sql.*" %>
<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="StyleParcel.css">
        <Title>Tracking Results</Title>
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
                Tracking Results
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
                        PreparedStatement stm = conn.prepareStatement("select * from parcel where Tracking_Number = ?");
                        stm.setString(1, request.getParameter("tn"));
                        ResultSet rs = stm.executeQuery();
                        int count = 1;
                        while (rs.next())
                        {
                    %>
                    <tr>
                        <td><%=count%></td>
                        <td><%=rs.getString("Tracking_Number")%></td>
                        <td><%=rs.getString("Courier")%></td>
                        <td>
                            <%
                                if (rs.getInt("Status") == 1)
                                    out.print("Arrived");
                                else if (rs.getInt("Status") == 2)
                                    out.print("Collected");
                                else
                                    out.print("Unknown");
                            %>
                        </td>
                    </tr>
                    <%
                            count++; }
                    %>
                </table>
            </div>

            <form method="post" action="ClaimParcelServlet" id="claim_parcel">
                <input name="tn" type="hidden" value="<%=request.getParameter("tn")%>"/>
                <div style="margin: 15px auto; text-align: center;">
                    <button type="submit" form="claim_parcel" class="button" style="padding: 15px 50px; border-radius: 10px;">
                        Claim As My Parcel
                    </button>
                </div>
            </form>
        </div>

        <!--Tracking-->
        <div class="SectionBox">
            <div class="Title" style="margin: 10px;">
                TRACK AGAIN
            </div>

            <form action="Parcel_Tracking1.jsp" method="GET" id ="tracking_form">
                <div style="padding: 10px;">
                    <div style="width: 85%; display: inline-block;">
                        <input type="text" name = "tn" class="textbar"/>
                    </div>
                    <div style="width: 15%; text-align: center; float: right;">
                        <button type = "submit" form = "tracking_form" value = "Submit"
                                class="button" style="padding: 6.5px; margin: 0px; width: 100%;">
                            Track
                        </button>
                    </div>
                </div>
            </form>
        </div> <!--End of Tracking-->

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
