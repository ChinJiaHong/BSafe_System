<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Campus Access Main Page [Admin]</title>
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

    <!-- Administration Tasks (Blacklist Student) -->
    <div style="position: relative; float: right; margin: 10px 40px 5px 5px; font-size: 14px; font-weight: 300; color:#000000;" > Admin View </div>

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

    <button class="button button1" style="border-radius: 5px; position: relative; float: right; margin: 5px 15px 10px 10px">
        <a href="GoingOut_Edit.jsp">Edit Page</a>
    </button>

    <button class="button button1" style="position: relative; float: right; margin: 5px 10px 10px 10px">
        <a href="Blacklist1.jsp">Blacklist</a>
    </button>
    <!-- End of Administration Tasks (Blacklist Student) -->


    <!-- Check Going Out Application -->
    <span style="position: relative; float: left; padding: 10px 10px 10px 50px; margin: 120px 0px 10px 0px; font-size: 22px; font-weight: 400; color:#000000;"> Going Out Application

        <div class="line">
            <form method="post" action="Datepicker1">
                <div><input type="date" name="date" style=" position: relative; top: -8px; text-align: center; height: 2em; width:200px; border: 1px solid #0A6EB4; border-radius: 50px;"></div>
                <div><input type="submit" style="width:200px; height:2em; border: 1px solid #0A6EB4; border-radius: 50px; color: white; background-color: #0A6EB4"/></div>
            </form>
        </div>
    </span>


    <div style="width: 1200px; margin: 25% auto;  position: relative;">
        <table>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Nationality</th>
                <th>Mobile Number</th>
            </tr>
            <c:forEach items="${key_list}" var="usr" varStatus="idx">
                <tr>
                    <td>${usr.gon}</td>
                    <td>${usr.gouid}</td>
                    <td>${usr.gont}</td>
                    <td>${usr.gomn}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <!-- End of Check Going Out Application -->


    <!-- Check Going Out, In Time and Duration  -->
    <div style="position: relative; float: left; padding: 10px 10px 10px 50px; margin: 50px 0px 10px 0px; font-size: 22px; font-weight: 400; color:#000000;"> Going Out, Going In Time and Duration
        <div class="line2">
            <form method="post" action="Datepicker2">
                <div><input type="date" name="date1" style=" position: relative; top: -8px; text-align: center; height: 2em; width:200px; border: 1px solid #0A6EB4; border-radius: 50px;"></div>
                <div><input type="submit" style="width:200px; height:2em; border: 1px solid #0A6EB4; border-radius: 50px; color: white; background-color: #0A6EB4"/></div>
            </form>
        </div>
    </div>

    <div style="width: 1500px; margin: 45% auto 0px;  position: relative;">
        <table>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Nationality</th>
                <th>Mobile Number</th>
                <th style="color: #FFD260; font-weight: 400">Going Out</th>
                <th style="color: #FFD260; font-weight: 400">Going In</th>
                <th style="color: #FFD260; font-weight: 400">Duration</th>
                <th style="color: #FF0000; font-weight: 400">BLACKLIST</th>

            </tr>
            <c:forEach items="${key_list1}" var="usr" varStatus="idx">
                <tr>
                    <td>${usr.gon}</td>
                    <td>${usr.gouid}</td>
                    <td>${usr.gont}</td>
                    <td>${usr.gomn}</td>
                    <td>${usr.gofgod}</td>
                    <td>${usr.gofgid}</td>
                    <td>${usr.gofd}</td>
                    <td>
                        <a href="AddtoBlacklistServlet?uuid=${usr.gouid}">
                        <i class="material-icons red">add_circle_outline</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <!-- End of Check Going Out, In Time and Duration  -->


    <!--Footer-->
    <div class="Footer" style="position: relative; margin-top: 180px;">
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
