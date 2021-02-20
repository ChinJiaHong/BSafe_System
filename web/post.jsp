<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    if(session.getAttribute("User_ID") == null)
        response.sendRedirect("login.jsp");
%>
<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" type="text/css" href="Style.css">
        <Title>Information and News</Title>
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
            <div class="notice">
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

    <!--Post Information Body-->
        <div style="margin-bottom:50px; padding-bottom: 50px; background: #F4F4F4;">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn_post =
                        DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/bsafe", "root", "123456");
                Statement stm_post =
                        conn_post.createStatement();

                String sql_post =
                        "select pid, title, pcontent, uid, cd, user.Name as uname\n" +
                                "from\n" +
                                "(\n" +
                                "\tselect \n" +
                                "\t\tpost.id\t\t\tas pid,\n" +
                                "\t\tpost.title\t\t\t\tas title,\n" +
                                "\t\tpost.content\t\t\tas pcontent,\n" +
                                "\t\tpost.date_of_creation\tas cd,\n" +
                                "\t\tpost.User_ID\t\t\tas uid,\n" +
                                "\t\tpost.image\t\t\t\tas image\n" +
                                "\tfrom\n" +
                                "\t\tpost\n" +
                                ")\n" +
                                "as P, user\n" +
                                "where pid= " + request.getParameter("pid") + " and user.User_ID = uid";



                ResultSet rs_post = stm_post.executeQuery(sql_post);
                rs_post.next();
            %>
            <div style="margin:30px auto; padding-top:40px; width:1228px;">
                <div style="padding:20px; font-size:48px; font-weight: 500; color:#263E7B;">
                    <%=rs_post.getString("title")%>
                </div>
                <div style="font-size: 18px; color: #646464;padding-left:20px; padding-bottom: 20px;">Date Created: <%=rs_post.getString("cd")%></div>
                
                <!--Post-->
                <div style="margin: auto; padding-bottom: 50px; width: 1228px;background: #FFFFFF;border: 1px solid #8E8E8E;box-sizing: border-box; border-radius: 25px; ">
                    <div style="margin:auto; padding: 50px; border-radius: 25px;">
                        <div style="margin: auto;  width: 350px;height: 350px;background: #C4C4C4;border-radius: 25px;">
                            <div style="overflow:hidden; opacity:1;width:350px;height:350px;position:absolute;">
                                <div style="overflow:hidden;width: 350px;height: 350px;position:absolute;border-radius: 25px;">
                                    <div style="opacity:1;width:350px;height:350px;position:absolute;border-radius: 25px;"></div>
                                        <div style="width:350px;height:100%;position:absolute;background-repeat:no-repeat;background-size:cover;">
                                            <img src="./DisplayImageServlet?pid=<%=rs_post.getString("pid")%>" style="width: 350px;height: 100%;"  />
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div style="margin: auto; padding:20px;width: 1000px;background: #FFFFFF; padding: 20px; ">
                        <div style="text-align: justify"><%=rs_post.getString("pcontent")%></div>
                    </div>

                </div><!--End of Post Body-->
            </div>
        </div>
    
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