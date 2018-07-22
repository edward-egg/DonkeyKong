<%-- 
    Document   : login
    Created on : 2018-5-17, 22:15:00
    Author     : hasee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <base href="${pageContext.request.contextPath}/"/>
        <link rel="stylesheet" href="resource/css/css/login.css" />
        <link rel="stylesheet" type="text/css" href="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.css"/>
        <link rel="stylesheet" href="resource/css/edbox.css"/>

        <style type="text/css">
            table {
                padding: 10px;
            }

            .pass tr {
                margin-top: 10px;
            }

            .pass th label {
                text-align: right;
            }

            .pass td {
                height: 60px;
                text-align: center;
            }

            .pass td input {
                outline: 0;
                border-radius: 5px;
                line-height: 28px;
                border: 1px solid #d8d8d8;
                color: #666;
                box-shadow: 0 0 5px #fff;
                height: 25px;
                width: 100%;
                padding-left: 5px;
            }
            .pass td input:focus{
                transition-duration: 0.5s;
                border: 1px solid #ffa200;
                box-shadow: 0 0 5px #ffa200;
                outline: 0;
            }
            .btn-pass{
                float: left;
                width: 100%;
                text-align: center;
            }
            .chang-pass{
                margin-top: 10px;
                outline: 0;
                color: #fff;
                background-color: #ffa800;
                border-radius: 3px;
                height: 40px;
                border: none;
                width: 120px;
            }
            .chang-pass:hover{
                background-color: #ff7200;
            }
            .getCode{
                outline: 0;
                color: #fff;
                background-color: #ffa800;
                border-radius: 3px;
                height: 35px;
                border: none;
                width: 120px;
                font-size: 14px;
            }
            .getCode:hover{
                background-color: #ff7200;
            }
        </style>
    </head>

    <body>
        <div class="title">

            <div id="to-main" style="cursor: pointer;">
                <img src="resource/imags/logo.png" width="80px" height="80px" alt="">
                <span>DonkeyKong</span> 
            </div>
        </div>
        <div class="login">
            <span class="welcome-login">Login</span>
            <div id="radios" class="radios">
                <input class="user-radio" type="radio" value="user" id="user" name="status" checked onclick="radioShow()"/>
                <label for="user">User</label>
                <input class="manager-radio" type="radio" value="manager" id="manager" name="status" onclick="radioShow()"/>
                <label for="manager">Manager</label>
            </div>
            <br>
            <!--用户登录-->
            <div id="c">
                <div id="c1" class="user-form">
                    <form action="users/login" method="POST"  onsubmit="return validate()">
                        <input  class="id-input uid" onblur="checkid(this)"  name="uid" type="text"  placeholder="Enter your User ID" required="true"/>
                        <br>
                        <span class="id-error error"></span>
                        <br/>
                        <input  class="pass-input ipass" onblur="checkpass(this)" name="upass" type="password"  placeholder="Enter your User Password" required="true"/>
                        <br>
                        <span class="pass-error error"></span>
                        <br/>
                        <button type="submit" class="btn-login user-login">Login</button>
                    </form>
                </div>
                <!--管理员登录-->
                <div id="c2" class="manager-form" style="display:none">
                    <form action="admin/login" method="POST">
                        <input  class="id-input mid" onblur="checkid(this)" name="mid" type="text" placeholder="Enter your Manager ID" required="true"/>
                        <br>
                        <span class="id-error error"></span>
                        <br/>
                        <input  class="pass-input mpass" onblur="checkpass(this)" name="mpass" type="password" placeholder="Enter your Manager Password" required="true"/>
                        <br>
                        <span class="pass-error error"></span>
                        <br/>
                        <button type="submit" class="btn-login admin-login">Login</button>
                    </form>
                </div>
            </div>
            <br>
            <span class="to-regist">No Account?
                <a href="users/register">Come and Regist!</a>
            </span>
            <span id="forget">
                <span>Forget the password?</span>
            </span>
            <div id="c-pass" title="Find your password">
                <div id="" class="pass-in">
                    <table class="pass" border="0" cellspacing="" cellpadding="">
                        <tr>
                            <th>
                                <label for="tel">UserId</label>
                            </th>
                            <td>
                                <input type="text" name="" id="uid" /><br/>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="tel">Email</label>
                            </th>
                            <td>
                                <input type="text" name="" id="email" /><br/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="btn-pass">
                    <button type="button" class="chang-pass"  onclick="findPass()">Change</button>						
                </div>
            </div>
            <!--</form>-->
        </div>
    </body>
    <script src="resource/js/jquery-2.1.0.js"></script> 
    <script type="text/javascript" src="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.js" ></script>
    <script src="resource/js/jquery.edbox.js"></script>
    <script>
                        //validate
                        var unameRegex = /^\w{3,15}$/;
                        var upassRegex = /^\w{4,12}$/;
                        $('.error').hide();
                        $(function (node) {
                            checkid(node);
                            checkpass(node);
                        });
                        $('.user-login').click(function (check) {
                            var idval = $('.uid').val();
                            var pval = $('.upass').val();
                            var idErr = $('.id-error');
                            var passErr = $('.pass-error');
                            if (idval == "") {
                                $.edbox({warning:"input should not be blank!"});
                                $('.uid').focus();
                                check.preventDefault();
                            }
                            if (pval == "") {
                                $.edbox({warning:"input should not be blank!"});
                                $('.upass').focus();
                                check.preventDefault();
                            }
                            
                            if (!unameRegex.test(idval)) {
                                idErr.show();
                                idErr.html('Invalid ID');
                                $('.uid').focus();
                                check.preventDefault();
                            } else {
                                idErr.hide();
                            }
                            if (!upassRegex.test(pval)) {
                                passErr.show();
                                passErr.html('Invalid Password');
                                $('.upass').focus();
                                check.preventDefault();
                            } else {
                                passErr.hide();
                            }
                        });
                        $('.admin-login').click(function (check) {
                            var idval = $('.mid').val();
                            var pval = $('.mpass').val();
                            var idErr = $('.id-error');
                            var passErr = $('.pass-error');
                            if (idval == "") {
                                $.edbox({warning:"input should not be blank!"});
                                $('.mid').focus();
                                check.preventDefault();
                            }
                            if (pval == "") {
                                $.edbox({warning:"input should not be blank!"});
                                $('.mpass').focus();
                                check.preventDefault();
                            }
                            
                            if (!unameRegex.test(idval)) {
                                idErr.show();
                                idErr.html('Invalid ID');
                                $('.mid').focus();
                                check.preventDefault();
                            } else {
                                idErr.hide();
                            }
                            if (!upassRegex.test(pval)) {
                                passErr.show();
                                passErr.html('Invalid Password');
                                $('.mpass').focus();
                                check.preventDefault();
                            } else {
                                passErr.hide();
                            }
                        });
                        $(function () {
                            if ($('.error').show()) {
                                $('.btn-login').attr("disable", "true");
                            }
                        });
                        function checkid(node) {
                            var uname = node.value;
                            var idErr = $('.id-error');
                            if (!unameRegex.test(uname)) {
                                idErr.show();
                                idErr.html('Invalid ID');
                            } else {
                                idErr.hide();
                            }
                        }

                        function checkpass(node) {
                            var upass = node.value;
                            var passErr = $('.pass-error');
                            if (!upassRegex.test(upass)) {
                                passErr.show();
                                passErr.html('Invalid Password');
                            } else {
                                passErr.hide();
                            }
                        }

                        //model dialog
                        $(function () {
                            $('#forget').click(function () {
                                $('#c-pass').dialog("open");
                            });
                            $('#c-pass').dialog({
                                height: 300,
                                width: 400,
                                autoOpen: false,
                                modal: true
                            });
                            $('#to-main').click(function () {
                                window.location.href = 'redirect/main';
                            });
                        });
                        //radio choose
                        function radioShow() {
                            var myRadio = document.getElementsByName('status');
                            var div = document.getElementById('c').getElementsByTagName('div');
                            for (i = 0; i < div.length; i++) {
                                if (myRadio[i].checked) {
                                    div[i].style.display = 'block';
                                } else {
                                    div[i].style.display = 'none';
                                }

                            }
                        }
                        function findPass() {
                            $.ajax({
                                url: 'users/findPass',
                                type: 'POST',
                                data: {
                                    "uid": $('#uid').val(),
                                    "email": $('#email').val()
                                },
                                dataType: "json",
                                success: function () {
                                    alert("success");
                                    window.location.href = "redirect/login";
                                },
                                error: function () {
                                    alert("success");
                                    window.location.href = "redirect/login";
                                }
                            });
                        }
    </script>
</html>
