<%-- 
    Document   : changePass
    Created on : 2018-5-23, 22:55:15
    Author     : hasee
    管理员修改密码
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <base href="${pageContext.request.contextPath}/"/>
        <link rel="stylesheet" type="text/css" href="resource/css/css/manager-change-pass.css" />
        <title>Change Password</title>
    </head>

    <body>
        <%@include file="adminTemplate.jsp" %>
        <div class="pass-content">
            <div class="thead">
                <span>change Password</span>
            </div>
            <div class="c-pass">
                <form action="admin/changePass" method="POST">
                    <table border="0" cellspacing="" cellpadding="">
                        <tr>
                            <th><label for="f-pass">New Password:</label></th>
                            <td><input type="password" name="password" onblur="validate()" id="f-pass" /></td>
                        </tr>
                        <tr>
                            <th><label for="s-pass">Again:</label></th>
                            <td><input type="password" name="secondPassword" onblur="validate()" id="s-pass"  /></td>
                        </tr>
                    </table>	
                    <div id="tishi"></div>
                    <button type="submit" id="submit">Finish</button>
                </form>
            </div>
        </div>

    </body>
    <script src="resource/js/jquery-2.1.0.js"></script>
    <script>
        $('#submit').click(function () {
            alert("fffff");
            $.ajax({
                url: 'admin/changePass',
                type: 'POST',
                data: {"password": $('#f-pass').val()},
                success: function () {
                    console.log("Success change!!!");
                    $('#f-pass').val("");
                    $('#s-pass').val("");
                },
                error: function () {
                    console.log("error!!");
                }
            });
        });
        function validate() {
            var pwd1 = $('#f-pass').val();
            var pwd2 = $('#s-pass').val();
            if (pwd1 === "" || pwd2 === "") {
                $("#tishi").html("<font color='red'>required</font>");
                document.getElementById("submit").disabled = true;
            } else {
                if (pwd1 === pwd2) {
                    $("#tishi").html("<font color='green'>password is same</font>");
                    document.getElementById("submit").disabled = false;
                } else {
                    $("#tishi").html("<font color='red'>password is not same</font>");
                    document.getElementById("submit").disabled = true;
                }
            }

        }

    </script>
</html>
