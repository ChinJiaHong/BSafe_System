<!DOCTYPE html>
<html>

<head>
    <title>Campus Access Edit Page [Admin]</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CampusAccess&GoingOut.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<STYLE>A {text-decoration: none; color: inherit} </STYLE>
<body>
<!-- Header -->
<div style="margin-left: 50px; margin-top: 10px;">
    <img src ="Logo.png" height="50px;">
</div>
<div class="nav_bar" style="margin-top: 10px;">
    <div style="padding: 12px 0px 0px 30px; display:inline-block">
        <ul>
            <li>MAIN</li>
            <li><a href="CampusAccess_Admin.jsp">ACCESS</a></li>
            <li><a href="GoingOut_Admin.jsp">GOING OUT</a></li>
            <li>PARCEL</li>
        </ul>
    </div>

    <div class="nav_btn" style="float:right; padding: 12px; cursor: hand;">
        <li><a style="text-decoration: none" href="#">[<%=session.getAttribute("User_ID")%>]</a></li>
        <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
    </div>
</div>
<!-- End of Header -->




<!-- Page Maintenance Countdown -->
<div>
    <p style = "text-align: right; font-size: 16px; margin-top: 0px; border-width: 100%; background-color: #373F52; color: red; padding: 10px 30px 10px 10px; font-weight: 700;"  id="demo" ></p>
    <script>
        // Set the date we're counting down to
        var countDownDate = new Date("Jan 20, 2021 15:37:25").getTime();

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
        <div style="position: relative; top: -35px; left: 30px; color: white; font-weight: 500">Page Maintenance Starts In:</div>
</div>
<!-- End of Page Maintenance Countdown -->


<!-- Edit -->
<div width="1500px" style="text-align: center; margin: auto; margin-top: 50px">
    <table width="100%">
        <div class="section2">
            <div class="edit">Cover Picture</div>
            <div style="width: 40%; margin: auto; margin-top: 30px; position: relative; left: 0%; background-color: white; padding: 80px 0px 80px 200px"><input type="file" style="position: relative; left: -5%"/></div>
        </div>
        <div style="margin-top: 80px; font-weight: 800; font-size: 28px; color: #263E7B">Rules and Regulations</div>
        <div style="margin: 30px 0px 100px 0px;"><textarea style="width:800px; height:200px;"></textarea></div>
        <div class="section2">
            <div class="edit" style="margin-top: 80px">Read More</div>
            <div style="margin-top: 30px;"><textarea style="border: 1px solid white; width:800px; height:200px;"></textarea></div>
        </div>

        <tr>
            <td>
                <button class="button button1" style="position: relative; left: 40%; margin-top: 50px">
                    <a href="CampusAccess_Admin.jsp">Cancel</a>
                </button>

            </td>
            <td>
                <button class="button button1" style="position: relative; left: -40%; margin-top: 50px">
                    Submit
                </button>
            </td>
        </tr>
    </table>
</div>
<!-- End of Edit -->


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
