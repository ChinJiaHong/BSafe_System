<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="StyleParcel.css">
        <Title>Parcel</Title>
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

        <!--Picture Banner-->
        <div class="PicBanner">
            <img src="ParcelBanner.jpg">
            <div class = "PicBanner_text">
                <div>
                    PARCEL COLLECTION
                </div>
                <div style="font-size: 18px; font-weight: 300;">
                    Prior Application is Required Until Further Notice
                </div>
            </div>
        </div> <!--End of Picture Banner-->

        <!--NEWS OR ANNOUNCEMENT-->
        <div class="SectionBox"> 
            <div class="Title" style="text-align: center;">
                NEWS OR ANNOUNCEMENT
            </div>
            <div style="background-color: #FFFFFF; margin: 10px; padding: 20px; text-align: center;">
                1. Application is compulsory before collecting parcels. </br>
                2. Please follow S.O.P when collecting parcels. </br>
                3. Please contact 012-2378239 if you have any problems.
            </div>
        </div> <!--End of NEWS OR ANN-->

        <!--View own parcel. View previous bookings-->
        <div class="SectionBox">
            <div class="Title" style="margin: 10px;">
                Select Actions
            </div>
            <div style="width: 50%; text-align: center; display:inline-block;">
                <button onclick="document.location='Parcel_Tracking.jsp'" class="button" style="padding: 6.5px; margin: 10px; width: 90%;">
                    View My Parcels
                </button>
            </div>
            <div style="width: 50%; text-align: center; float: right;">
                <button onclick="document.location='BookingHistory.jsp'" class="button" style="padding: 6.5px; margin: 10px; width: 90%;">
                    View My Bookings
                </button>
            </div>
        </div> <!--End of Tracking Box-->

        <!--Tracking Box-->
        <div class="SectionBox">
            <div class="Title" style="margin: 10px;">
                Track By Tracking Number
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
        </div> <!--End of Tracking Box-->

        <div class="SectionBox"> <!--Slot Table-->
            <div class="Title" style="margin: 10px;">
                AVAILABLE SLOTS
            </div> 

            <div style="margin: 10px">
                <table>
                    <tr>
                        <th>No.</th>
                        <th>Slots</th>
                        <th>Time</th>
                        <th>Availability</th>
                    </tr>
                    <%
                        java.util.Date d = new java.util.Date();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String curr_date = sdf.format(d);

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn =
                                DriverManager.getConnection(
                                        "jdbc:mysql://localhost:3306/bsafe",
                                        "root",
                                        "123456"
                                );
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("select * from collection_slot where Date >= '" +curr_date +"' AND Availability > 0");
                        while (rs.next())
                        {
                    %>
                    <tr>
                        <td><%=rs.getString("Slot_ID")%></td>
                        <td><%=rs.getString("Date")%></td>
                        <td><%=rs.getString("Time")%></td>
                        <td><%=rs.getString("Availability")%>/30</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div> <!--End of Slot Table-->

        <!--Footer-->
        <div class="Footer" style="bottom: 0px;">
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
