<%@ page import="java.sql.*" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileOutputStream" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/12/2020
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if(session.getAttribute("User_ID") == null)
        response.sendRedirect("login.jsp");
%>
<html>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="Style.css"/>
<head>
    <link rel="stylesheet" type="text/css" href="Style.css"/>
    <Title>Main Page</Title>
</head>

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

<!--User Notice Body-->
    <div style="margin:50px auto; width:1228px;">
        <div style="width:1228px; height:55px; background:#263E7b; border-radius: 25px;">
            <div style="padding:17px; color:white;">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn_notice =
                            DriverManager.getConnection(
                                    "jdbc:mysql://localhost:3306/bsafe", "root", "123456");
                    Statement stm_notice =
                            conn_notice.createStatement();

                    String sql_notice =
                            "select * from notice\n" +
                                    "order by id\n" +
                                    "DESC Limit 1";


                    ResultSet rs_notice = stm_notice.executeQuery(sql_notice);
                    rs_notice.next();

                %>
                <p><%=rs_notice.getString("content")%></p>
            </div>
        </div>
    </div>
    <!--End of User Notice Body-->


<!--User Information Body-->
<div style="margin:10px auto; padding:20px; width:1228px;">
    <!--New dbms-->

    <div style="margin:11.7px;padding:20px;border: 2px solid #263E7B;width:383px;height:250px;background: #FFFFFF;box-sizing: border-box;border-radius:25px;display:inline-block;">
        <div style="color:#263E7B; font-size:24px">
            Campus Access Application
        </div>
        <div style="margin-top:20px;width: 340px;height: 43px;left: 38px;top: 186px;background: #263E7B;border-radius: 5px;">
            <div style="padding:9px 20px; color:white; font-size:18px;">
                Rules and Regulation
            </div>
        </div>

        <a href="CampusAccess1.jsp"><button style="background-color: #FFFFFF;border: 1px solid #263E7B;color: #263E7B;text-align: center;display: inline-block;margin-top:30px;cursor: pointer;font-weight: 300;font-size: 16px;border-radius: 5px;width:160px;height:50px;float: right;">Read More</button></a>
    </div>


    <div style="margin:11.7px;padding:20px;border: 2px solid #263E7B;width:383px;height:250px;background: #FFFFFF;box-sizing: border-box;border-radius:25px;display:inline-block;">
        <div style="color:#263E7B; font-size:24px">
            Going Out Application
        </div>
        <div style="margin-top:20px;width: 340px;height: 43px;left: 38px;top: 186px;background: #263E7B;border-radius: 5px;">
            <div style="padding:9px 20px;color:white; font-size:18px;">
                Rules and Regulation
            </div>
        </div>

        <a href="GoingOut1.jsp"><button style="background-color: #FFFFFF;border: 1px solid #263E7B;color: #263E7B;text-align: center;display: inline-block;margin-top:30px;cursor: pointer;font-weight: 300;font-size: 16px;border-radius: 5px;width:160px;height:50px;float: right;">Read More</button></a>
    </div>

    <div style="margin:11.7px;padding:20px;border: 2px solid #263E7B;width:383px;height:250px;background: #FFFFFF;box-sizing: border-box;border-radius:25px;display:inline-block;">
        <div style="color:#263E7B; font-size:24px">
            Parcel Collection Time
        </div>
        <div style="margin-top:20px;width: 340px;height: 43px;left: 38px;top: 186px;background: #263E7B;border-radius: 5px;">
            <div style="padding:9px 20px;color:white; font-size:18px;">
                Rules and Regulation
            </div>
        </div>

        <a href="parcel_main.jsp"><button style="background-color: #FFFFFF;border: 1px solid #263E7B;color: #263E7B;text-align: center;display: inline-block;margin-top:30px;cursor: pointer;font-weight: 300;font-size: 16px;border-radius: 5px;width:160px;height:50px;float: right;">Read More</button></a>
    </div>
</div>
<!--End of User Information Body-->

<!--User Post Body-->
    <div style="margin-bottom:50px; padding-bottom: 50px; background: #F4F4F4;">
        <div style="margin:30px auto; padding-top:40px; width:1228px;">
            <div style="margin-bottom: 30px; padding:20px; font-size:48px; font-weight: 500; color:#263E7B;">
                News and Information
            </div>

            <!--youtube-->
            <iframe style="display: block; margin: auto;" width="560" height="315" src="https://www.youtube.com/embed/_dcU-NLZKiM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



            <!--Post ?-->
            <div style="margin-top: 30px;">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn_post =
                            DriverManager.getConnection(
                                    "jdbc:mysql://localhost:3306/bsafe", "root", "123456");
                    Statement stm_post =
                            conn_post.createStatement();

                    String sql_post =
                            "select\n" +
                                    "\tpost.id\t\t\tas pid,\n" +
                                    "    post.title\t\t\t\tas title,\n" +
                                    "    post.content\t\t\tas pcontent,\n" +
                                    "    post.date_of_creation\tas cd,\n" +
                                    "    post.User_ID\t\t\tas uid,\n" +
                                    "    post.image\t\t\t\tas image\n" +
                                    "from \n" +
                                    "\tpost, user\n" +
                                    "where \n" +
                                    "\tpost.User_ID = user.User_ID\n" +
                                    "group by \n" +
                                    "\tpid";


                    ResultSet rs_post = stm_post.executeQuery(sql_post);

                    while(rs_post.next())
                    {

                %>


                <a href="post.jsp?pid=<%=rs_post.getString("pid")%>">
                <div style="margin-top: 50px; width: 250px;height: 250px;background: #C4C4C4;border-radius: 25px;display:inline-block;" >
                    <div class= "bx1">
                        <div class="bx2">
                            <div class="bx3"></div>
                            <div class="bx4"><img src="./DisplayImageServlet?pid=<%=rs_post.getString("pid")%>" style="width: 324px;height: 100%;"  /></div>
                        </div>
                    </div>
                </div>
                </a>


                <div style="margin-top:50px; width: 950px; height:250px; background: #FFFFFF;border: 1px solid #8E8E8E;box-sizing: border-box;border-radius: 25px;float: right;padding: 20px;">
                    <a style="text-decoration: none" href="post.jsp?pid=<%=rs_post.getString("pid")%>"><div style="margin:30px 0px 0px 30px;font-size: 32px; font-weight: 500;  "><%=rs_post.getString("title")%></div></a>
                    <div style="margin:10px 0px 30px 30px;font-size: 18px; color: #646464; padding-bottom: 15px;">Date created: <%=rs_post.getString("cd")%></div>

                </div>
                <%
                    }
                %>
            </div>
            <!--End of Post ?-->
        </div>
    </div>
<!--User Post Body-->



<!--Footer-->
<div class="Footer">
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
</div> <!--End of Footer-->

</body>
</html>








