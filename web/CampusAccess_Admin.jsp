<%@ page import="static javax.swing.text.html.CSS.getAttribute" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Campus Access Main Page [Admin]</title>
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

    <div class="nav_bar" style="margin-top: 10px;">
        <div style="padding: 12px 0px 0px 30px; display:inline-block">
            <ul>
                <a href="AdminActionSelect.jsp">
                    <li>MAIN</li>
                </a>
                <a href="AdminPostMain.jsp">
                    <li>Manage Post</li>
                </a>
                <a href="AdminAccess.jsp">
                    <li>Manage Application</li>
                </a>
                <a href="AdminParcel.jsp">
                    <li>Manage Parcel</li>
                </a>
            </ul>
        </div>

        <div class="nav_btn" style="float:right; padding: 12px; cursor: hand;">
            <li><a style="text-decoration: none" href="#">[<%=session.getAttribute("User_ID")%>]</a></li>
            <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
        </div>
    </div> <!--End of Header-->


    <!-- Campus Access Application Checking -->
    <div style="position: relative; right: 35px; bottom: -10px; font-size: 14px; font-weight: 300; color:#000000; float:right"> Admin View </div>

    </div>
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
    <button class="button button1" style="border-radius: 5px; position: relative; float: right; margin: 5px 15px 10px 10px">
        <a href="CampusAccess_Edit.jsp">Edit Page</a>
    </button>


    <span style="position: relative; float: left; padding: 10px 10px 10px 50px; margin: 120px 0px 10px 0px; font-size: 22px; font-weight: 400; color:#000000;">
        Campus Access Application
        <div class="line3">
            <form method="post" action="Datepicker">
                <div><input type="date" name="date" id="date"  style=" position: relative; top: -5px; text-align: center; height: 2em; width:200px; border: 1px solid #0A6EB4; border-radius: 50px;"></div>
                 <div><input type="submit" style="width:200px; height:2em; border: 1px solid #0A6EB4; border-radius: 50px; color: white; background-color: #0A6EB4"/></div>
            </form>
        </div>
    </span>

    <div style="width: 1200px; margin: 400px auto; position: relative;">
        <table>
            <tr>
                <th>Name</th>
                <th>Student ID</th>
                <th>Number</th>
                <th>Nationality</th>
                <th>Date</th>
                <th style="color: #FFD260; font-weight: 600">CheckIn</th>
                <th style="color: #FFD260; font-weight: 600">CheckOut</th>
            </tr>

            <c:forEach items="${key_list}" var="usr" varStatus="idx">
            <tr>
                <td>${usr.can}</td>
                <td>${usr.cauid}</td>
                <td>${usr.camn}</td>
                <td>${usr.cant}</td>
                <td>${usr.cad}</td>
                <td>${usr.cacid}</td>
                <td>${usr.cacod}</td>
            </tr>
            </c:forEach>

        </table>
    </div>
    <!-- End of Campus Access Application Checking -->


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
