<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<html>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>

        <link rel="stylesheet" href="Style.css">
        <Title>Manage Post</Title>
    </head>

    <body>
    <!--Manage Post Header-->
        <div style="margin-left: 50px; margin-top: 10px;">
            <img src ="Logo.png" height="50px;">
        </div>

        <div class="nav_bar">
            <div style="padding: 12px 0px 0px 30px; display:inline-block">
                <ul>
                    <a href="AdminPostMain.jsp">
                        <li>Actions</li>
                    </a>
                    <a href="adminIndex.jsp">
                        <li>Preview</li></a>
                    <a href="managePost.jsp">
                        <li>Manage Post</li></a>
                    <a href="addPost.jsp">
                        <li>Add Post</li></a>
                    <a href="editNotice.jsp">
                        <li>Edit Notice</li></a>
                </ul>
            </div>

            <div class="nav_btn" style="float:right; padding: 12px; cursor: hand;">
                <li>[<%=session.getAttribute("User_ID")%>]</li>
                <li><a style="text-decoration: none" href="LogoutServlet">LOGOUT</a></li>
            </div>
        </div>
    <!--End of Manage Post Header-->

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

    <!--Manage Post-->
        <div style="margin:50px 0px 0px 75px; font-size:48px; font-weight:500; color:#263E7B;">
            Manage Post
        </div>

        <div style="width: 90%; margin:30px auto;">
            <table class="managePost">
                <tr>
                    <th>No.</th>
                    <th>Title</th>
                    <th colspan="2" >Action</th>
                </tr>
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
        while (rs_post.next())
    {
        %>
                <tr>
                    <td class="count"></td>
                    <td><%=rs_post.getString("title")%></td>
                    <td><button class="editbutton"><a style="text-decoration: none; color: inherit;" href="editPost.jsp?pid=<%=rs_post.getString("pid")%>">edit</a></td>
                    <td><button class="editbutton"><a style="text-decoration: none; color: inherit;" href="DelPostServlet?pid=<%=rs_post.getString("pid")%>">delete</a></td>
                    
                </tr>
            <%
                }
            %>
            </table>
        </div>
    <!--End of Manage Post-->



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