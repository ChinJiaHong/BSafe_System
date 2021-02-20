<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="Style.css">
        <Title>Create Post</Title>
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

    <!--Add Post Body-->
        <div style="margin:50px 0px 0px 190px; font-size:48px; color:#263E7B; font-weight: 500;">
            Add Post
        </div>

        <div style="color: #222020; margin:50px auto; padding:40px 0px 0px 70px; width:70%; border: 1px solid #263E7B; border-radius: 3px;">
            <form method="post" action="PostAddServlet" enctype="multipart/form-data" >
                <input type="hidden" name="pid" value="<%=request.getParameter("pid")%>"/>
                <table width="100%;" style="text-align: center;">
                    <tr>
                        <div style="padding: 10px 0px 10px 0px;">
                            User_ID</br>
                        </div>
                    </tr>
                    <tr>
                        <div class ="sInput" style="padding: 10px 0px 10px 0px; color:#263E7B">
                            <input type="text" name= "User_ID" value="<%=session.getAttribute("User_ID")%>" placeholder="User ID"/>
                            </br>
                        </div>
                    </tr>
                    <tr>
                        <div style="padding: 10px 0px 10px 0px;">
                            Title</br>
                        </div>
                    </tr>
                    <tr> 
                        <div class ="sInput" style="padding: 10px 0px 10px 0px; color:#263E7B">
                            <input type="text" name= "title" placeholder="Title"/>
                        </br>
                    </div>
                    </tr>
                    <tr> 
                        <div style="vertical-align: top; padding: 10px 0px 10px 0px; color:#263E7B">
                            Body</br>
                        </div>
                    </tr>
                    <tr> 
                        <div style="vertical-align: top; padding: 10px 0px 10px 0px;" >
                            <textarea type="text" name="content" class="bigbox" placeholder="Details"></textarea>
                        </div>
                    </tr>
                    <tr> 
                        <div style="vertical-align: top; padding: 10px 0px 10px 0px;">
                            Image</br>
                        </div>
                    </tr>
                    <tr>

                        <div style="vertical-align: top; padding: 10px 0px 10px 0px; color:#263E7B">
                                <input type="file" name="image" />
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
    <!--End Add Post Body-->

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