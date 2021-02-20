<!DOCTYPE html>
<html>

<head>
    <title>Going Out Application Form</title>
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


    <!-- Going Out Application Form -->
    <div style="border-bottom: 1px solid #0A6EB4; width: 800px; color: #222020; font-size: 14px; font-weight: 400; padding: 6px; background-color: white; height: 125px; margin: 70px auto; padding: 5px">
        Dear XMUM hostel residents, Following the recent announcement by the Malaysian Government on the conditional movement
        control order (CMCO) from 10 June 2020 to 14 January 2021, the XMUM Student Affairs Office would like to
        allow our residents to apply going out from campus on daily basis for a maximum of two times per
        week (each time for a maximum of 2 hours between 9am to 7pm). Do note that your comfort and safety is our upmost priority.
    </div>

    <div style="color: #222020; font-size: 18px; font-weight: 300; margin:50px auto; width:700px">
        <form method="post" action="GoingOutServlet">
            <table width="100%" style="text-align: center;">
                <tr> <div class="f">Student ID<br></div></tr>
                <tr> <div class="f"><input name="ID" type="text" style="width:700px; height: 2em; border: 1px solid #263E7B; border-radius: 3px;"/><br></div></tr>
                <tr> <div class="f">Name<br></div></tr>
                <tr> <div class="f"><input name="name" type="text" style="height: 2em; width:700px; border: 1px solid #263E7B; border-radius: 3px;"></div></tr>
                <tr> <div class="f">Nationality<br></div></tr>
                <tr> <div class="custom select" style="vertical-align: top; padding: 10px 0px 10px 0px; width:700px;"><select name="nationality"><option value="0">Select Nationality</option><option value="Malaysia">Malaysian<option value="PRC">PRC</option><option value="Non-PRC">Non-PRC</option> </select></div></tr>
                <tr> <div class="f">Mobile Number<br></div></tr>
                <tr> <div class="f"><input name="mobile" type="text" style="height: 2em; width:700px; border: 1px solid #263E7B; border-radius: 3px;"></div></tr>
                <tr> <div class="f">First Date<br></div></tr>
                <tr> <div class="f"><input name="first" type="date" style="height: 2em; width:700px; border: 1px solid #263E7B; border-radius: 3px;"></div></tr>
                <tr> <div class="f">Second Date<br></div></tr>
                <tr> <div class="f"><input name="second" type="date" style="height: 2em; width:700px; border: 1px solid #263E7B; border-radius: 3px;"></div></tr>
                <tr>
                    <td>
                        <button class="button button1" style="position: relative; right: -330px; bottom: -30px">
                            <a href="GoingOut1.jsp">Cancel</a>
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
    <!-- End of Going Out Application Form -->


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
