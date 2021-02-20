<!DOCTYPE html>
<html>

<head>
    <title>Campus Access Application Form</title>
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


    <!-- Application Form -->
    <div style="border-bottom: 1px solid #0A6EB4; width: 800px; color: #222020; font-size: 14px; font-weight: 400; height: 125px; margin: 70px auto;">
        As announced in the news yesterday, the Malaysian government has extended the conditional movement control order (CMCO) until 14 January 2021 to curb the spread of Covid-19 in Selangor, KL and Putrajaya. All teaching and learning activities within this period will be continued to conduct online according to the schedule that has been released to you unless otherwise informed by your lecturers. During this period, if you wish to enter the campus premises, a prior campus access application is required.
    </div>

    <div style="color: #222020; font-size: 18px; font-weight: 300; margin:50px auto; width:700px">
        <form method="post" action="CampusAccessServlet">
            <table width="100%" style="text-align: center;">
                <tr> <div class="f">Student ID<br></div></tr>
                <tr> <div class="f"><input name="ID" type=text" class="input"/><br></div></tr>
                <tr> <div class="f">Name<br></div></tr>
                <tr> <div class="f"><input name="name" type="" class="input"></div></tr>
                <tr> <div class="f">Nationality<br></div></tr>
                <tr> <div class="custom select" style="width:700px; padding: 10px 0px 10px 0px"><select name="nationality"><option value="0">Select Nationality</option><option value="Malaysia">Malaysian<option value="PRC">PRC</option><option value="Non-PRC">Non-PRC</option> </select></div></tr>
                <tr> <div class="f">Mobile Number<br></div></tr>
                <tr> <div class="f"><input name="mobile" type="text" class="input"></div></tr>
                <tr> <div class="f">Date to Enter Campus<br></div></tr>
                <tr> <div class="f"><input name="date" type="date" class="input"></div></tr>
                <tr>
                    <td>
                        <button class="button button1" style="position: relative; right: -330px; bottom: -30px">
                            <a href="CampusAccess1.jsp">Cancel</a>
                        </button>

                    </td>
                    <td>
                        <button class="button button1" style="position: relative; right: -120px; bottom: -30px">
                            Submit
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- End of Application Form -->


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
