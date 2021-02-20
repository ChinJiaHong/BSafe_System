<html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="Style.css">
        <Title>Login</Title>
    </head>

    <body>
    <!--Login Header-->
        <div style="margin-left: 50px; margin-top: 10px;">
            <img src ="Logo.png" height="50px;">
        </div>

        <div class="nav_bar" style="margin-top: 10px;">
            <div style="padding: 12px 0px 0px 30px; display:inline-block">
                <ul>
                    <li>MAIN</li>
                    <li>ACCESS</li>
                    <li>GOING OUT</li>
                    <li>PARCEL</li>
                </ul>
            </div>

            <div class="nav_btn" style="float:right; padding: 12px; cursor: hand;">
                <li><a style="text-decoration: none" href="#">LOGIN</a></li>
                <li><a style="text-decoration: none" href="register.jsp">REGISTER</a></li>
            </div>
        </div>
        <!--End of Login Header-->

        <!--Login-->
        <div style="margin: 130px auto; width:400px; border:2px solid #263E7B; ">
            <div style="padding:10px;text-align:center;font-weight:500; font-size:1.2em; border:0px; background-color:#263E7B; color:white;">
                LOGIN
            </div>
            <form id="lg" method="post" action="LoginServlet">
            <div>
                <table width="100%"  class= "login">
                    <tr>
                        <td>Username:</td>
                    </tr>
                    <tr>
                        <td><input name="User_ID" type="text" style="border-radius: 5px; width:100%; height: 45px; border: 0.5px solid grey;"/></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                    </tr>
                    <tr>
                        <td><input name="password" type="password" style="border-radius: 5px; width:100%; height: 45px; border: 0.5px solid grey;"/></td>
                    </tr>
                    <tr>       
                        <td>
                            <div style="text-align: center; margin: 10px">
                                <button class="btnx" type= "submit" onclick="document.getElementById('lg').submit();">
                                    Submit
                                </button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            </form>
        </div>
        <!--End of Login-->

        <!--Footer-->
        <div class="Footer" style=" position: relative; margin-top: 150px;">
            <div style="margin: 20px; font-size: 1.2em; font-weight: 600; position: relative;">
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
