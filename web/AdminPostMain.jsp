<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="StyleParcel.css">
        <Title>Booking History</Title>
    </head>

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

        <!--Picture Banner-->
        <div class="PicBanner">
            <img src="Building.jpg">
            <div class = "PicBanner_text">
                <div>
                    XMUM BSafe System
                </div>
                <div style="font-size: 18px; font-weight: 300;">
                    Post Management
                </div>
            </div>
        </div> <!--End of Picture Banner-->

        <div class="SectionBox">
            <div class="Title" style="margin: 10px">
                Admin Actions
            </div>

            <div style="width: 100%; text-align: center;">
                <a href="managePost.jsp">
                    <button class="button" style="padding: 10px; margin: 10px; width: 90%;">
                        Manage Post
                    </button>
                </a>
                <a href="addPost.jsp">
                    <button class="button" style="padding: 10px; margin: 10px; width: 90%;">
                        Add Post
                    </button>
                </a>
                <a href="editNotice.jsp">
                    <button class="button" style="padding: 10px; margin: 10px; width: 90%;">
                        Edit Notice
                    </button>
                </a>
                <a href="adminIndex.jsp">
                    <button class="button" style="padding: 10px; margin: 10px; width: 90%;">
                        Preview Page
                    </button>
                </a>
            </div>
        </div>

        

        <!--Footer-->
        <div class="Footer" style="position: relative; bottom: 0px;">
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
