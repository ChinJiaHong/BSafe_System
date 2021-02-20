<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <title>Going Out Blacklist_Add [Admin]</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CampusAccess&GoingOut.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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


<!-- Search -->
    <div style="width: 1000px; margin: auto; margin-top: 5%; position: relative;">
            <i class="material-icons grey" style=" left: 100px; position: relative; display: inline-block;">remove_red_eye</i>
            <div style="display: inline-block;  font-size: 24px; font-family: 'Poppins', sans-serif; font-weight: 500; color:#656565; top: -5px; left: 40px; position: relative"><a href= "Blacklist1.jsp">View</a></div>
            <i class="material-icons blue" style=" display: inline-block; left: 400px; position: relative">person_add</i>
            <div style=" display: inline-block; text-shadow: 2px 2px 2px rgba(0,0,0, 0.25); font-size: 24px; font-family: 'Poppins', sans-serif; font-weight: 500; color:#263E7B; left: 315px; top: -3px; position: relative">Add</div>
            <i class="material-icons grey" style=" display: inline-block; left: 690px; position: relative">person_add_disabled</i>
        <div style=" display: inline-block; font-size: 24px; font-family: 'Poppins', sans-serif; font-weight: 500; color:#656565; left: 585px; top: -3px; position: relative"><a href= "Blacklist4.jsp">Remove</a></div>
    </div>

<form method="post" action="SearchServlet">
    <div style="position: relative; left: 37%; margin-top: 5%; display: inline-block"><input name="search" type="text" style="width:300px; height: 3.2em; border: 1px solid #263E7B; border-radius: 3px;"/></div>
        <button class="button button2" style="position: relative; left: 38%;  margin: auto; margin-top: 5%;">
        Check
        </button>
</form>
<!-- End of Search -->


<!-- Student's Information -->
<div class="line1"></div>

            <table style="margin: 80px auto; width: 1000px">
                <tr>
                    <th>Name</th>
                    <th>Student ID</th>
                    <th>Nationality</th>
                    <th>DOB</th>
                    <th>Phone Number</th>
                </tr>

                <c:forEach items="${key_list}" var="usr" varStatus="idx">
                    <tr>
                        <td>${usr.un}</td>
                        <td>${usr.uuid}</td>
                        <td>${usr.unt}</td>
                        <td>${usr.udob}</td>
                        <td>${usr.umn}</td>
                    </tr>


            <div>
                <a href="AddtoBlacklistServlet?uuid=${usr.uuid}">
                    <button class="button button1" style="transform: translate(800px, 250px)">
                        Add
                    </button>
                </a>
            </div>

            <div>
                    <button class="button button1" style="transform: translate(650px, 250px)">
                        <a href="GoingOut_Admin.jsp">Back</a>
                    </button>
            </div>
                </c:forEach>
            </table>
<!-- End of Student's Information -->


<!--Footer-->
<div class="Footer" style="position: relative; margin-top: 200px;">
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
