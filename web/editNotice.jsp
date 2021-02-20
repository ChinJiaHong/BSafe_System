<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="Style.css">
        <Title>Edit Notice</Title>
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

        <!--Edit Notice Body-->
        <div style="margin:50px 0px 0px 240px; font-size:48px; color:#263E7B;">
            <b>Edit Notice</b>
        </div>

        <div style="color: #222020; margin:50px auto; padding:40px 0px 0px 70px; width:70%; border: 1px solid #263E7B; border-radius: 3px;">
            <form method="post" action="NoticeAddServlet">
                <table width="100%;" style="text-align: center;">
                    <tr>
                        <div style="vertical-align: top; padding: 10px 0px 10px 0px;">
                            Body</br>
                        </div>
                    </tr>
                    <tr> 
                        <div style="vertical-align: top; padding: 10px 0px 10px 0px;" >
                            <textarea type="text" name="content" class="bigbox" placeholder="Details"></textarea>
                        </div>
                    </tr>

                    <tr>       
                        <td>
                            <div style="text-align: center; margin: 10px">
                                <button class="btnx" type= "submit" >
                                    Submit
                                </button>
                                <button class="btnx" type="reset" >
                                    Reset
                                </button>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <!--End of Edit Notice Body-->

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