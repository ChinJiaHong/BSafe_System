<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

<head>
    <title>Going Out Campus Main Page</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CampusAccess&GoingOut.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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


    <!-- Check Going Out List -->
    <div class="campus-pic" style="margin-top : 50px">
        <img src="XMUM.jpg">
        <div class="overlay2" style="top: 0%">
            <div style="text-align: center; color: white; font-size: 24px; font-family: 'Poppins', sans-serif; font-weight: 500; padding: 6px; margin-top: 50px;">
                On-campus Students Going Out Campus
            </div>
            <div style="color: white; font-size: 18px; font-family: 'Poppins', sans-serif; font-weight: 300; text-align: center; padding-top: 6px;">
                Prior application is required starting from 01.11.2020 until further notice
            </div>
        </div>
    </div>


    <div class="section2">
        <div class="circle">
        </div>

        <div style="position: absolute; right: 48.5%; top: 55px;">
            <img src="logo2.png" height="45px" width="45px"/>
        </div>

        <div style="position: relative; top: 120px; color: #006EA5; font-weight: 500; font-family: 'Poppins', sans-serif; font-size: 22px; text-align: center;">
            Approved Going Out List
        </div>

        <form method="post" action="Datepicker3">
            <div style="position: relative; left: 37%; margin-top: 17%; display: inline-block"><input name="date" type="date" style="width:300px; height: 3.2em; border: 1px solid #263E7B; border-radius: 3px;"/></div>
            <button class="button button2" style="position: relative; left: 38%;  margin: 17% auto 0px auto; ">
                Check
            </button>
        </form>
    </div>
    <!--End of Check Going Out List -->


    <!-- Restricted from Apply Going Out -->
    <div class="section3">
        <div class="circle">
        </div>

        <div style="position: absolute; right: 48.5%; top: 58px;">
            <img src="logo3.png" height="45px" width="45px"/>
        </div>

        <div style="position: relative; top: 120px; color: #006EA5; font-weight: 500; font-family: 'Poppins', sans-serif; font-size: 22px; text-align: center;">
            Application
        </div>

        <div style="height: 200px; background-color: #FFFFFF; position:relative; top: 120px; margin:100px auto; width:1300px">
            <div style="font-family: 'Poppins', sans-serif;">
                <div style="font-weight: 300; font-size: 18px; text-align: center; color: #006EA5; padding: 8px;">
                    Rules and Regulation
                </div>
                <div style="font-weight: 500; font-size: 14px; text-align: left; color: #222020; padding: 15px;">
                    1. You are allowed to enter campus premises ONCE per day after 7 am and before 7 pm.  <br>

                    2. You are allowed to enter campus premises on weekdays ONLY, which mean no campus access is allowed during weekend. <br>

                    3. If you have to OVERSTAY for night class, you are required to show your current timetable to the in-charge security guard.
                </div>
            </div>

            <button class="button button1" style="position: relative; left: 87.8%; top: -1px">
                Read More
            </button>
        </div>

        <div>
            <%

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn
                        = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/bsafe", "root", "123456");
                Statement stm
                        = conn.createStatement();
                String sql
                        = "select\n" +
                        "\tuser.id \t\t\t\tas id,\n" +
                        "\tuser.Name \t\t\t\tas name,\n" +
                        "\tuser.user_id \t\t\tas uid,\n" +
                        "\tuser.Blacklist_END_Date as bd\n" +
                        "from\n" +
                        "\tuser\n" +
                        "where id=" + session.getAttribute("uid");


                ResultSet rs = stm.executeQuery(sql);
                rs.next();
            %>
            <div style="border-radius: 10px; height: 180px; background-color: #FFFFFF; position:relative; top: 120px; margin:100px auto; width:1300px">
                    <div id="div1" class="fa" style="font-size:38px; transform:translate(55px, 60px)">
                    <script>
                        function hourglass() {
                        var a;
                        a = document.getElementById("div1");
                        a.innerHTML = "&#xf251;";
                        setTimeout(function () {
                        a.innerHTML = "&#xf252;";
                        }, 500);
                        setTimeout(function () {
                        a.innerHTML = "&#xf253;";
                        }, 800);
                        }
                        hourglass();
                        setInterval(hourglass, 2000);
                    </script>
                    </div>
                    <div style="font-weight: 600; font-size: 20px; position: relative; right: -100px; top: 20px; color: #222020; padding: 8px;">
                        STATUS
                    </div>
                    <div style="font-weight: 500; font-size: 14px; position: relative; right: -40px; top: 18px; color: #818181; padding: 15px;">
                        You had been blackedlisted and are not allowed to apply for going out campus at this moment. You are allowed to apply for going out at <span style="color: red"><%=rs.getString("bd")%></span>.
                    </div>

            </div>
        </div>
    </div>
    <!-- End of Restricted from Apply Going Out -->


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
