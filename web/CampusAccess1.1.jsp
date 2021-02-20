<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>


    <head>
        <title>Campus Access Main Page</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="CampusAccess&GoingOut.css"/>
    </head>


    <STYLE>A {text-decoration: none; color: inherit} </STYLE>
    <body>
    <!-- Header -->
    <div style="margin-left: 50px; margin-top: 10px;">
        <img src ="Logo.png" height="50px;">
    </div>

    <div class="nav_bar" style="position: sticky;top: 0;z-index: 100;">
        <div style="padding: 12px 0px 0px 30px; display:inline-block">
            <ul>
                <a href="BLIndex.jsp">
                    <li>MAIN</li></a>
                <a href="CampusAccess1.1.jsp">
                    <li>ACCESS</li></a>
                <a href="GoingOut1.1.jsp">
                    <li>GOING OUT</li></a>
                <a href="parcel_main1.jsp">
                    <li>PARCEL</li></a>
            </ul>
        </div>

        <div class="nav_btn" style="float:right; padding: 12px; cursor: hand;">
            <li><a style="text-decoration: none" href="#">[<%=session.getAttribute("User_ID")%>]</a></li>
            <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
        </div>
    </div>
    <!-- End of Header -->
    <!-- Countdown Remaining Time In The Blacklist -->
    <div>
        <%

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn1
                    = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bsafe", "root", "123456");
            Statement stm1
                    = conn1.createStatement();
            String sql1
                    = "select\n" +
                    "\tuser.id \t\t\t\tas id,\n" +
                    "\tuser.Name \t\t\t\tas name,\n" +
                    "\tuser.user_id \t\t\tas uid,\n" +
                    "\tuser.Blacklist_END_Date as bd\n" +
                    "from\n" +
                    "\tuser\n" +
                    "where id=" + session.getAttribute("uid");


            ResultSet rs1 = stm1.executeQuery(sql1);
            rs1.next();
        %>
        <p style = "text-align: right; font-size: 16px; margin-top: 0px; border-width: 100%; background-color: #373F52; color: red; padding: 10px 30px 10px 10px; font-weight: 700;"  id="demo" ></p>
        <script>
            // Set the date we're counting down to
            var countDownDate = new Date("<%=rs1.getString("bd")%>").getTime();

            // Update the count down every 1 second
            var x = setInterval(function() {

                // Get today's date and time
                var now = new Date().getTime();

                // Find the distance between now and the count down date
                var distance = countDownDate - now;

                // Time calculations for days, hours, minutes and seconds
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Output the result in an element with id="demo"
                document.getElementById("demo").innerHTML = days + "d " + hours + "h "
                    + minutes + "m " + seconds + "s ";

                // If the count down is over, write some text
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("demo").innerHTML = "EXPIRED";
                }
            }, 1000);
        </script>
        <div style="position: relative; top: -35px; left: 30px; color: white; font-weight: 500">Remaining Time In The Blacklist:</div>
    </div>
    <!-- End of Countdown Remaining Time In The Blacklist -->



    <!-- Cover Picture -->
    <div class="building-pic">
        <img src="Building.jpg">
        <div class="overlay" style="top: 0%">
            <div style="text-align: center; color: white; font-size: 24px; font-weight: 500; padding: 6px; margin-top: 50px;">
                Off-campus Students Access Campus
            </div>
            <div style="color: white; font-size: 18px; font-weight: 300; text-align: center; padding-top: 6px;">
                Prior application is required starting from 01.11.2020 until further notice
            </div>
        </div>
    </div>
    <!-- End of Cover Picture -->


    <!-- Campus Access Body -->
    <div class="section1">
        <div class="circle">
        </div>

        <div style="position: absolute; right: 48.5%; top: 55px;">
            <img src="logo1.png" height="45px" width="45px"/>
        </div>

        <div style="position: relative; top: 120px; color: #006EA5; font-weight: 500; font-size: 22px; text-align: center;">
            Campus Access
        </div>

        <div style="border-radius: 5px; height: 200px; background-color: #FFFFFF; margin: auto; margin-top: 15%; width:85%">
            <div>
                <div style="font-weight: 300; font-size: 18px; text-align: center; color: #006EA5; padding: 8px;">
                    Rules and Regulation
                </div>
                <div style="font-weight: 500; font-size: 14px; text-align: left; color: #222020; padding: 15px;">
                    1. You are allowed to go out of campus TWICE A WEEK for maximum 2 hours each time.<br>

                    2. You are allowed to go back hometown TWICE A MONTH. <br>

                    3. If that week you plan to go back hometown, which mean you are not allowed to go out twice for 2 hours each times for that week. <br>

                    4. You are required to return campus by 7pm. <br>
                </div>
            </div>

            <button class="button button1" style="position: relative; left: 87.6%; top: -20px">
                Read More
            </button>
        </div>

        <button class="button button2" style="position: relative; margin: 0px 20px 0px 10px; left: 37%; margin-top: 10%; display: inline-block">
            <a href="CampusAccess2.jsp">Apply Now</a>
        </button>

        <button class="button button2" style="position: relative; left: 42%; margin-top: 10%">
            <a href="CampusAccess3.jsp">My Application</a>
        </button>
    </div>
    <!-- End of Campus Access Body -->


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
