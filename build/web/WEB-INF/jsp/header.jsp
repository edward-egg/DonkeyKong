<%-- 
    Document   : header
    Created on : 2018-6-2, 19:48:41
    Author     : hasee
--%>

<%@page import="pojo.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <style>
            .user-info{
                
                width: 200px;
                height: auto;
                padding: 5px;
                position: relative;
                bottom: 30px;
                float: left;
                text-align: center;
            }
            .user-info .user-avatar{
                width: 80px;
                height: 80px;
                border-radius: 80px;
                border: 1px solid #cccccc;
                display: block;
                float: left;
                overflow: hidden;
            }
            .user-info .user-home{
                border: none;
                outline: 0;
                background-color: #EEB422;
                color: white;
                font-size: 18px;
                font-weight: bold;
                height: 30px;
                width: 100px;
                border-radius: 4px;
                float: left;
                margin-top: 10px;
            }
            .user-info .user-home:hover{
                background-color: #ffb01e;
                cursor: pointer;
                font-weight: bold;
                transition-duration: 0.2s;
            }
            .user-info span{
                font-size: 18px;
                font-weight: bold;
                float: left;
                margin-left:10%;
                display: block;
            }
            .user-name{
                margin-top: 2%;
                position: relative;
                left: 8px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="title">
                <img src="resource/imags/logo.png" width="80px" height="80px" alt="">
                <span>DonkeyKong</span>
                <span>${user.userId}</span>
            </div>
            <div class="nav">
                <ul>
                    <li>
                        <a href="redirect/main">Main</a>
                    </li>
                    <li>
                        <a href="redirect/scenicPage">Scenic</a>
                    </li>
                    <li>
                        <a href="redirect/foodPage">Food</a>
                    </li>
                    <li>
                        <a href="redirect/notePage">Note</a>
                    </li>
                    <li>
                        <a href="redirect/hotelPage">Hotel</a>
                    </li>
                    <li>
                        <a href="redirect/travelPage">Tour</a>
                    </li>
                </ul>

                <div class="to-login">
                    <%
                        if (session.getAttribute("CURRENT_USER") != null && session.getAttribute("CURRENT_USER") != "") {
                            Users user=(Users)session.getAttribute("CURRENT_USER");
                            if(user.getUserImg() == null){
                                user.setUserImg("logo.png");
                            }
                    %>  
                    <div class="user-info">
                        <div class="user-avatar">
                            <img src="resource/imags/user/<%=user.getUserImg()%>" width="80px" height="80px" id="avatar" />
                        </div>
                        <div class="user-name">
                            <span><%=user.getUserId()%></span>
                            <button type="button" class="user-home">Profile</button>
                        </div>         
                    </div>                   
                    <%
                    } else {%>
                    <button type="button" class="btn login">Login</button>
                    <button type="button" class="btn register">Register</button>
                    <%
                        }
                    %>

                    

                </div>
                    <div style="float: right;margin-right: 20%;">
                        <iframe src="http://tianqi.5ikfc.com:90/plugin-code/?style=1&dy=3&city=qingdao" allowTransparency="true" frameborder="0" scrolling="no" width="680" height="50" id="weather_frame"></iframe>
                    </div>
            </div>
        </div>
    </body>
    <script src="resource/js/jquery-2.1.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.login').click(function () {
                window.location.href = 'redirect/login';
            });
            $('.register').click(function () {
                window.location.href = 'redirect/register';
            });
            $('.user-home').click(function(){
                window.location.href='toUserDetail';
            });
           
        });
    </script>
</html>