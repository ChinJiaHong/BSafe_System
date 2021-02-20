<!DOCTYPE html>
<html>

<head>
    <title>Going Out Campus Main Page</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CampusAccess&GoingOut.css"/>
</head>

<STYLE>A {text-decoration: none; color: inherit} </STYLE>
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
<!--End of Header-->


    <!-- Check Going Out List -->
    <div class="campus-pic">
        <img src="XMUM.jpg">
        <div class="overlay2" style="top: 0%">
            <div style="text-align: center; color: white; font-size: 24px; font-weight: 500; padding: 6px; margin-top: 50px;">
                On-campus Students Going Out Campus
            </div>
            <div style="color: white; font-size: 18px; font-weight: 300; text-align: center; padding-top: 6px;">
                Prior application is required starting from 01.11.2020 until further notice
            </div>
        </div>
    </div>

    <div class="section1" style="height: 530px;">
        <div class="circle">
        </div>

        <div style="position: absolute; right: 48.5%; top: 55px;">
            <img src="logo2.png" height="45px" width="45px"/>
        </div>

        <div style="position: relative; top: 120px; color: #006EA5; font-weight: 500; font-size: 22px; text-align: center;">
            Approved Going Out List
        </div>

        <form method="post" action="Datepicker3">
            <div style="position: relative; left: 37%; margin-top: 17%; display: inline-block"><input name="date" type="date" style="width:300px; height: 3.2em; border: 1px solid #263E7B; border-radius: 3px;"/></div>
        <button class="button button2" style="position: relative; left: 38%;  margin: 17% auto 0px auto;">
            Check
        </button>
        </form>
    </div>
    <!-- End of Check Going Out List -->


    <!-- Apply Going Out -->
    <div class="section1">
        <div class="circle">
        </div>

        <div style="position: absolute; right: 48.5%; top: 58px;">
            <img src="logo3.png" height="45px" width="45px"/>
        </div>

        <div style="position: relative; top: 120px; color: #006EA5; font-weight: 500; font-size: 22px; text-align: center;">
            Application
        </div>

        <div style="height: 200px; background-color: #FFFFFF; position:relative; top: 120px; margin:100px auto; width:1300px">
            <div>
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

            <button class="button button2" style="position: relative; margin: 0px 20px 0px 10px; left: 37%; margin-top: 10%; display: inline-block">
                <a href="GoingOut2.jsp">Apply Now</a>
            </button>

            <button class="button button2" style="position: relative; left: 42%; margin-top: 10%">
                <a href="GoingOut3.jsp">My Application</a>
            </button>
    </div>
    <!-- End of Apply Going Out -->


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
