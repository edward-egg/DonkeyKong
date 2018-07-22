<%-- 
    Document   : scenicManage
    Created on : 2018-5-23, 23:12:57
    Author     : hasee
景点管理
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Scenic Manage</title>
        <base href="${pageContext.request.contextPath}/"/>
        <link rel="stylesheet" type="text/css" href="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.css"/>
        <link rel="stylesheet" href="resource/css/css/manage.css">
        <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="resource/css/edbox.css"/>
        <style type="text/css">
            .dialog table label,.dialog table input{
                display: block;    		
            }
            .dialog table input{
                margin-bottom: 12px;
                width: 100%;
                padding: .4em;
            }
            .dialog table textarea{
                resize: none;
            }
            .dialog table input:focus{
                outline: 0;
                border: 1px solid #ffa200;
                box-shadow: 0 0 5px #ffa200;
                transition-duration: 0.5s;
            }
            .dialog table textarea:focus{
                outline: 0;
                border: 1px solid #ffa200;
                box-shadow: 0 0 5px #ffa200;
                transition-duration: 0.5s;
            }
        </style>
    </head>

    <body>
        <%@include file="adminTemplate.jsp" %>
        <%String img = "";%>
        <div class="contentManage">
            <div class="t-title">Scenic Manage</div>
            <div class="table-head">
                <div class="operate">
                    <button type="button" class="add">Add</button>
                    <div class="dialog" id="dialog" title="New Scenic">
                        <p class="validateTips">All input should be valid.</p>
                        <form action="scenic/add">
                            <table>
                                <tr>
                                    <td><label for="sname">Scenic Name:&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td><input name="scenicName" type="text" id="sname" class="ui-widget-content ui-corner-all name"/></td>
                                </tr>
                                <tr>
                                    <td><label for="sarea">Area:&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td><input name="areas" type="text" id="sarea" class="ui-widget-content ui-corner-all area"/></td>
                                </tr>
                                <tr>
                                    <td><label for="saddress">Scenic Address:&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td><input name="scenicAddress" type="text" id="saddress" class="ui-widget-content ui-corner-all address"/></td>
                                </tr>
                                <tr>
                                    <td><label for="slike">Like:&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td><input name="scenicLike" type="text" id="slike" class="ui-widget-content ui-corner-all like"/></td>
                                </tr>
                                <tr>
                                    <td><label for="scontent">Scenic Content:&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td><textarea name="scenicContent" cols="50"
                                                  rows="7" id="scontent" class="ui-widget-content ui-corner-all content"></textarea></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <div class="table-content">
                <div>
                    <table id="scenicTable" border="1" cellpadding="0" cellspacing="0">
                    </table>
                </div>
                <div class="dialog" id="edit-dialog" title="Edit Scenic">
                    <p class="validateTips">All input should be valid.</p>
                    <from action="users/editUser" method="POST">
                        <table>
                            <tr>
                                <td><label for="e-sname">Scenic Name:&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td><input name="scenicName" type="text" id="e-sname" class="ui-widget-content ui-corner-all name"/></td>
                            </tr>
                            <tr>
                                <td><label for="e-sarea">Area:&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td><input name="areas" type="text" id="e-sarea" class="ui-widget-content ui-corner-all area"/></td>
                            </tr>
                            <tr>
                                <td><label for="e-saddress">Scenic Address:&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td><input name="scenicAddress" type="text" id="e-saddress" class="ui-widget-content ui-corner-all address"/></td>
                            </tr>
                            <tr>
                                <td><label for="e-slike">Like:&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td><input name="scenicLike" type="text" id="e-slike" class="ui-widget-content ui-corner-all like"/></td>
                            </tr>
                            <tr>
                                <td><label for="e-scontent">Scenic Content:&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td><textarea name="scenicContent" cols="50"
                                              rows="7" id="e-scontent" class="ui-widget-content ui-corner-all content"></textarea></td>
                            </tr>   
                        </table>
                    </from>
                </div>
            </div>
        </div>
        <div id="pic-dialog" title="Choose Avatar">
            <form action="">
                <div class="choose">
                    <img id="dialog-img" style="width: 130px;height: 130px;display: block;margin: 0 auto;" title="choose the image" src="resource/imags/scenic/${scenicImg == null ? 'Akz00I_GGjU.jpg' :scenicImg}"  alt=""/>
                    <input type="file" id="select-avatar" style="margin-top: 20px;display: block;" />
                </div>
            </form>
        </div>
    </body>
    <script type="text/javascript" src="resource/js/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.js" ></script>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 
    <script src="resource/js/jquery.edbox.js"></script>
    <script>
        var scenicId;
        var scenicName;
        var areaName;
        var scenicAddress;
        var scenicLike;
        var scenicContent;
        var scenicImg;
        var scenicTable;

        $(document).ready(function () {

            $.ajax({
                url: 'scenic/showAll',
                type: 'GET',
                success: function (list) {
                    $('#scenicTable').empty();
                    $('#scenicTable').append("<thead class='t-head'><tr><th>Scenic Pic</th><th>Scenic Name</th><th>Areas</th><th>Scenic Like</th><th>Scenic Address</th><th>Scenic Content</th><th>Operate</th></tr></thead><tbody>");
                    $.each(list, function (index, scenic) {
                        if (scenic.scenicImg == null) {
                            scenic.scenicImg = 'Akz00I_GGjU.jpg';
                        }
                        var str = "<tr id=" + scenic.scenicId + "><td>"
                                + "<img name='opener' src='resource/imags/scenic/" + scenic.scenicImg + "' width='80px' height='80px' onclick=\"sendId('" + scenic.scenicId + "','" + scenic.scenicImg + "')\">" + "</td><td>"
                                + scenic.scenicName + "</td><td>"
                                + scenic.areas.areaName + "</td><td>"
                                + scenic.scenicLike + "</td><td>"
                                + scenic.scenicAddress + "</td><td>"
                                + scenic.scenicContent + "</td><td>"
                                + "<button type='button' class='edit' onclick=\"editScenic('" + scenic.scenicId + "','" + scenic.scenicName + "','" + scenic.areas.areaName + "','" + scenic.scenicAddress + "','" + scenic.scenicLike + "','" + scenic.scenicContent + "','" + scenic.scenicImg + "')\">Edit</button>"
                                + "<button type='button' class='delete' onclick=\"delScenic('" + scenic.scenicId + "')\">Delete</button></td></tr>";
                        $('#scenicTable').append(str);
                    });
                    $('#scenicTable').append("</tbody>");
                    scenicTable = $('#scenicTable').DataTable();
                },
                error: function (error) {
                    alert("Ajax Error!!!" + error);
                    console.log("Ajax++++" + error);
                }
            });
        });
        $(document).ready(function () {
            var name = $('.name'),
                    area = $('.area'),
                    address = $('.address'),
                    like = $('.like'),
                    content = $('.content'),
                    all = $([]).add(name).add(area).add(address).add(like).add(content),
                    tips = $('.validateTips');
            function updateTips(t) {
                tips.text(t).addClass("ui-state-highlight");
                setTimeout(function () {
                    tips.removeClass("ui-state-highlight", 1500);
                }, 500);
            }
            function checkLength(o, n, min, max) {
                if (o.val().length > max || o.val().length < min) {
                    o.addClass("ui-state-error");
                    updateTips("The length of " + n + " should between " + min + " and " + max + ".");
                    return false;
                } else {
                    return true;
                }
            }

            function checkRegexp(o, regexp, n) {
                if (!(regexp.test(o.val()))) {
                    o.addClass("ui-state-error");
                    updateTips(n);
                    return false;
                } else {
                    return true;
                }
            }
            $('.add').click(function () {
                $('#dialog').dialog('open');
            });
            $('#dialog').dialog({
                height: 500,
                width: 500,
                autoOpen: false,
                modal: true,
                buttons: {
                    "Create": function () {
                        address = $('.address');
                        content = $('.content');
                        all = $([]).add(address).add(content);
                        var bValid = true;
                        all.removeClass("ui-state-error");
                        bValid = bValid && checkLength(name, "Scenic Name", 4, 16);
                        bValid = bValid && checkLength(like, "Scenic Like", 0, 3);
                        bValid = bValid && checkLength(area, "Area", 4, 20);
                        if (content.val() != "")
                            bValid = bValid && checkRegexp(content, /^.+?$/, "Invalid Content");
                        if (address.val() != "")
                            bValid = bValid && checkRegexp(address, /^.+?$/, "Invalid Address");
                        if (bValid) {
                            console.log("create");
                            $.ajax({
                                url: 'scenic/add',
                                type: 'POST',
                                data: {
                                    "scenicName": $('#sname').val(),
                                    "areaName": $('#sarea').val(),
                                    "scenicAddress": $('#saddress').val(),
                                    "scenicLike": $('#slike').val(),
                                    "scenicContent": $('#scontent').val()
                                },
                                success: function () {
                                    $.edbox({success: 'success add!'});
                                    console.log('success');
                                    location.reload();
                                },
                                error: function () {
                                    console.log('error!');
                                }
                            });
                        }
                    },
                    "Cancel": function () {
                        $(this).dialog("close");
                    }
                }
            });

            $('#pic-dialog').dialog({
                height: 330,
                width: 400,
                autoOpen: false,
                modal: true,
                buttons: {
                    Finish: function () {
                        console.log("finish");
                        console.log($('#dialog-img').attr("src"));
                        $.ajax({
                            url: 'scenic/changePic',
                            type: 'POST',
                            data: {
                                "source": $('#dialog-img').attr("src"),
                                "scenicId": scenicId
                            },
                            success: function () {
                                $.edbox({success: 'success change'});
                                console.log('success');
                                setTimeout(function () {
                                    location.reload();
                                }, 1500);
                            },
                            error: function () {
                                console.log('error!');
                            }
                        });
                    },
                    Cancel: function () {
                        $(this).dialog("close");
                    }

                }
            });
            bindAvatar();
            $('#edit-dialog').dialog({
                height: 500,
                width: 600,
                autoOpen: false,
                modal: true,
                buttons: {
                    "Edit": function () {
                        address = $('.address');
                        content = $('.content');
                        all = $([]).add(address).add(content);
                        var bValid = true;
                        all.removeClass("ui-state-error");
                        bValid = bValid && checkLength(name, "Scenic Name", 0, 16);
                        bValid = bValid && checkLength(like, "Scenic Like", 0, 3);
                        bValid = bValid && checkLength(area, "Area", 0, 20);
                        if (content.val() != "")
                            bValid = bValid && checkRegexp(content, /^.+?$/, "Invalid Content");
                        if (address.val() != "")
                            bValid = bValid && checkRegexp(address, /^.+?$/, "Invalid Address");
                        if (bValid) {
                            console.log('edit');
                            $.ajax({
                                url: 'scenic/edit',
                                type: 'POST',
                                data: {
                                    "scenicId": scenicId,
                                    "areaName": $('#e-sarea').val() == '' ? areaName : $('#e-sarea').val(),
                                    "scenicName": $('#e-sname').val() == '' ? scenicName : $('#e-sname').val(),
                                    "scenicAddress": $('#e-saddress').val() == '' ? scenicAddress : $('#e-saddress').val(),
                                    "scenicLike": $('#e-slike').val() == '' ? scenicLike : $('#e-slike').val(),
                                    "scenicContent": $('#e-scontent').val() == '' ? scenicContent : $('#e-scontent').val(),
                                    "scenicImg": scenicImg
                                },
                                success: function () {
                                    $.edbox({success: 'success edit!'});
                                    window.location.href = 'toScenicManage';
                                },
                                error: function () {
                                    console.log("error！");
                                }
                            });
                        }
                    }
                }
            });


        });
        function delScenic(sid) {
            confirm("Are You Sure?");
            $.ajax({
                url: 'scenic/delete',
                type: 'POST',
                data: {"sid": sid},
                success: function () {
                    $.edbox({success: 'success delete!'});
                    console.log("delete success!");
                    $('#' + sid).remove();
                },
                error: function () {
                    console.log('error!!!!!!');
                }
            });
        }
        function bindAvatar() {
            $('#select-avatar').change(function () {
                var obj = $('#select-avatar')[0].files[0];
                var fr = new FileReader();
                fr.onload = function () {
                    $('#dialog-img').attr('src', this.result);
                };
                fr.readAsDataURL(obj);
            });
        }
        function editScenic(sid, sname, aname, sadd, slike, scontent, simg) {
            scenicId = sid;
            scenicName = sname;
            areaName = aname;
            scenicAddress = sadd;
            scenicLike = slike;
            scenicContent = scontent;
            scenicImg = simg;
            $('#edit-dialog').dialog('open');
        }


        function sendId(sid, simg) {
            console.log("in");
            scenicId = sid;
            scenicImg = simg;
            console.log(scenicImg);
            $('#dialog-img').attr("src", "resource/imags/scenic/" + (scenicImg == "" ? "Akz00I_GGjU.jpg" : scenicImg));
            $('#pic-dialog').dialog("open");
        }
    </script>

</html>
