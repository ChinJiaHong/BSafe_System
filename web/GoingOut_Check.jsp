<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <title>Campus Access Application Status</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CampusAccess&GoingOut.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
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
            <li><a href="CampusAccess1.jsp">ACCESS</a></li>
            <li><a href="GoingOut1.jsp">GOING OUT</a></li>
            <li>PARCEL</li>
        </ul>
    </div>

    <div class="nav_btn" style="float:right; padding: 12px; cursor: hand;">
        <li><a style="text-decoration: none" href="#">[<%=session.getAttribute("User_ID")%>]</a></li>
        <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
    </div>
</div>
<!-- End of Header -->


<!-- Going Out Date -->
<div style=" width:250px; text-align: center; border: 1px; margin: 80px auto 0px auto; color: #8E8E8E; font-size: 16px; font-weight: 300"> Students Going Out Campus At </div>
<table>
    <c:forEach items="${key_list2}" var="usr" varStatus="idx">
    <div style=" border-radius: 5px; width:350px; text-align: center; border: 1px solid #8E8E8E; margin: 20px auto; color: #263E7b; font-size: 28px; font-weight: 600"> ${usr.gofd} </div>
    </c:forEach>
</table>
<!-- End of Going Out Date -->


<!-- Student Name List -->
<div style="width: 1200px; margin: 50px auto;">
    <table>
        <tr>
            <th>Name</th>
            <th>Student ID</th>
            <th>Mobile Number</th>
            <th>Nationality</th>
        </tr>
        <c:forEach items="${key_list2}" var="usr" varStatus="idx">
        <tr>
            <td>${usr.gon}</td>
            <td>${usr.gouid}</td>
            <td>${usr.gomn}</td>
            <td>${usr.gont}</td>
        </tr>
        </c:forEach>
    </table>
</div>
<div>
    <td>
        <button class="button button1" style="position: relative; right: -1100px; margin-top: 10%">
            <a href="GoingOut1.jsp">Back</a>
        </button>

    </td>
    <td>
        <button class="button button1" style="position: relative; right: -1120px; margin-top: 10%">
            <a href="CampusAccess2.jsp">Apply</a>
        </button>
    </td>
</div>
<!-- End of Student Name List --> -->


<!--Footer-->
<div class="Footer" style="position: relative; margin-top: 120px;">
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
