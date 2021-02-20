  <html>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <head>
        <link rel="stylesheet" href="Style.css">
        <Title>Register</Title>
    </head>

    <body>
    <!--Header-->
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
                <li><a style="text-decoration: none" href="login.jsp">LOGIN</a></li>
                <li><a style="text-decoration: none" href="#">REGISTER</a></li>
            </div>
        </div>
    <!--End of Header-->

    <!--Register Body-->
        <div class="register">
            <div style="padding:10px;text-align:center;font-weight:500; font-size:1.2em; border:0px; background-color:#263E7B; color:white;">
                Register
            </div>

            <form id="login" method="post" action="RegisterServlet">
                <div style="margin-top:20px; padding:10px; font-size:1.1em;">Student/Staff ID/Username: </div>
                    <input type="text" name="User_ID" style="font-size:1.1em; width:95%; margin:0px 10px 10px 10px;" /> <br/>
                <div style="padding:10px; font-size:1.1em;">Name: </div>
                    <input type="text" name="Name" style="font-size:1.1em; width:95%; margin:0px 10px 10px 10px;" /> <br/>
                <div style="padding:10px; font-size:1.2em;">Password: </div>
                    <input type="password" name="password" style="font-size:1.2em; width:95%; margin:0px 10px 10px 10px;" /> <br/>
                <div style="padding:10px; font-size:1.2em;">Mobile Number: </div>
                    <input type="text" name="Mobile_Number" style="font-size:1.2em; width:95%; margin:0px 10px 10px 10px;"  placeholder="011-1234567"/> <br/>
                <div style="padding:10px; font-size:1.2em;">Nationality: </div>
                    <input type="text" name="Nationality" style="font-size:1.2em; width:95%; margin:0px 10px 10px 10px;" placeholder="eg.Malaysian"/> <br/>
                <div style="padding:10px; font-size:1.2em;">Date of Birth: </div>
                    <input type="text" name="Date_of_Birth" style="font-size:1.2em; width:95%; margin:0px 10px 10px 10px;" placeholder="yyyy-mm-dd" /> <br/>

                <div style="text-align: center; margin: 10px">
                    <button class="btnx" type= "submit" >
                        Submit
                    </button>
                </div>
            </form>
          </div>
    <!--End of Register-->

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
