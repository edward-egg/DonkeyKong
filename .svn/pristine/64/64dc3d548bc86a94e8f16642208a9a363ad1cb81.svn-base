<%-- 
    Document   : foodManage
    Created on : 2018-5-23, 23:01:33
    Author     : hasee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Food Manage</title>
        <base href="${pageContext.request.contextPath}/"/>
        <link rel="stylesheet" href="resource/css/css/manage.css">
        <link rel="stylesheet" type="text/css" href="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.css"/>
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
        <div class="contentManage">
            <div class="t-title">Food Store Manage</div>
            <div class="table-head">
                <div class="operate">                   
                    <button type="button" class="add">Add</button>
                    <div class="dialog" id="dialog" title="New Store">
                        <p class="validateTips">All input should be valid.</p>
                        <form action="food/add">
                            <table>

                                <tr>
                                    <td><label for="fname">Store Name:&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td><input name="foodStoreName" type="text" id="fname" class="ui-widget-content ui-corner-all name"/></td>
                                </tr>
                                <tr>
                                    <td><label for="farea">Area:&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td><input name="areas" type="text" id="farea" class="ui-widget-content ui-corner-all area"/></td>
                                </tr>
                                <tr>
                                    <td><label for="faddress">Store Address:&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td><input name="storeAddress" type="text" id="faddress" class="ui-widget-content ui-corner-all address"/></td>
                                </tr>
                                <tr>
                                    <td><label for="fcontent">Store Content:&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td><textarea cols="50"
                                                  rows="7" name="storeContent" id="fcontent" class="ui-widget-content ui-corner-all content"></textarea></td>
                                </tr>
                            </table>
                        </form>
                    </div>           
                </div>
            </div>
            <div class="table-content">
                <div>
                    <table id="foodTable" border="1"></table>
                </div>
                <div class="dialog" id="edit-dialog" title="Edit Scenic">
                    <p class="validateTips">All input should be valid.</p>
                    <from action="food/editUser" method="POST">
                        <table>
                            <tr>
                                <td><label for="e-fname">Store Name:&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td><input name="foodStoreName" value="${food.foodStoreName}" type="text" id="e-fname" class="ui-widget-content ui-corner-all name" required="required"/></td>
                            </tr>
                            <tr>
                                <td><label for="e-farea">Area:&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td><input name="areas" type="text" id="e-farea" value="${food.area.areas}" class="ui-widget-content ui-corner-all area" required="required"/></td>
                            </tr>
                            <tr>
                                <td><label for="e-faddress">Store Address:&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td><input name="storeAddress" type="text" id="e-faddress" value="${food.storeAddress}" class="ui-widget-content ui-corner-all address" required="required"/></td>
                            </tr>
                            <tr>
                                <td><label for="e-fcontent">Store Content:&nbsp;</label></td>
                            </tr>
                            <tr>
                                <td><textarea cols="50"
                                              rows="7" name="storeContent" value="${food.storeContent}" id="e-fcontent" class="ui-widget-content ui-corner-all content" required="required"></textarea></td>
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
        var foodStoreId;
        var foodStoreName;
        var areaName;
        var storeAddress;
        var storeContent;
        var storeImg;
        $(document).ready(function () {
            var name = $('.name'),
                    area = $('.area'),
                    address = $('.address'),
                    content = $('.content'),
                    all = $([]).add(name).add(area).add(address).add(content),
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
                        var bValid = true;
                        all.removeClass("ui-state-error");
                        bValid = bValid && checkLength(name, "FoodStore Name", 4, 16);
                        bValid = bValid && checkLength(area, "Area", 4, 20);
                        bValid = bValid && checkRegexp(content, /^.+?$/, "Invalid Content");
                        bValid = bValid && checkRegexp(address, /^.+?$/, "Invalid Address");
                        if (bValid) {
                            console.log("create");
                            $.ajax({
                                url: 'food/add',
                                type: 'POST',
                                data: {
                                    "foodStoreId": $('#fid').val(),
                                    "foodStoreName": $('#fname').val(),
                                    "areaName": $('#farea').val(),
                                    "storeAddress": $('#faddress').val(),
                                    "storeContent": $('#fcontent').val()
                                },
                                success: function () {
                                    $.edbox({success: 'success add!'});
                                    console.log('success add!!!!!');
                                    window.location.reload();
                                },
                                error: function () {
                                    $.edbox({danger: 'error add!'});
                                    console.log('error! add error!!!!!');
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
                            url: 'food/changePic',
                            type: 'POST',
                            data: {
                                "source": $('#dialog-img').attr("src"),
                                "storeId": foodStoreId
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
                        bValid = bValid && checkLength(area, "Area", 0, 20);
                        if (content.val() != "")
                            bValid = bValid && checkRegexp(content, /^.+?$/, "Invalid Content");
                        if (address.val() != "")
                            bValid = bValid && checkRegexp(address, /^.+?$/, "Invalid Address");
                        if (bValid) {
                            console.log('edit');
                            $.ajax({
                                url: 'food/edit',
                                type: 'POST',
                                data: {
                                    "foodStoreId": foodStoreId,
                                    "areaName": $('#e-farea').val() == '' ? areaName : $('#e-farea').val(),
                                    "foodStoreName": $('#e-fname').val() == '' ? foodStoreName : $('#e-fname').val(),
                                    "storeAddress": $('#e-faddress').val() == '' ? storeAddress : $('#e-faddress').val(),
                                    "storeContent": $('#e-fcontent').val() == '' ? storeContent : $('#e-fcontent').val(),
                                    "storeImg": storeImg
                                },
                                success: function () {
                                    $.edbox({success: 'success edit!'});
                                    window.location.href = 'toFoodManage';
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
        function delFood(fid) {
            $.ajax({
                url: 'food/delete',
                type: 'POST',
                data: {"fid": fid},
                success: function () {
                    $.edbox({success: 'success delete!'});
                    console.log("delete success!");
                    $('#' + fid).fadeOut();
                },
                error: function () {
                    console.log('error!!!!!!');
                }
            });
        }
        var foodTable;
        $(document).ready(function () {
            $.ajax({
                url: 'food/showAll',
                type: 'GET',
                success: function (list) {
                    $('#foodTable').empty();
                    $('#foodTable').append("<thead class='t-head'><tr><th>FoodStore Pic</th><th>Food Store Name</th><th>Areas</th><th>Food Store Address</th><th>Food Store Content</th><th>Operate</th></tr></thead><tbody>");
                    $.each(list, function (index, food) {
                        if (food.storeImg == null) {
                            food.storeImg = 'Akz00I_GGjU.jpg';
                        }
                        var str = "<tr id=" + food.foodStoreId + "><td>"
                                + "<img name='opener' src='resource/imags/food/" + food.storeImg + "' width='80px' height='80px' onclick=\"sendId('" + food.foodStoreId + "','" + food.storeImg + "')\">" + "</td><td>"
                                + food.foodStoreName + "</td><td>"
                                + food.areas.areaName + "</td><td>"
                                + food.storeAddress + "</td><td>"
                                + food.storeContent + "</td><td>"
                                + "<button type='button' class='edit' onclick=\"editFood('" + food.foodStoreId + "','" + food.foodStoreName + "','" + food.areas.areaName + "','" + food.storeAddress + "','" + food.storeContent + "','" + food.storeImg + "')\">Edit</button>"
                                + "<button type='button' class='delete' onclick=\"delFood('" + food.foodStoreId + "')\">Delete</button></td></tr>";
                        $('#foodTable').append(str);
                    });
                    $('#foodTable').append("</tbody>");
                    foodTable = $('#foodTable').DataTable();
                },
                error: function (error) {
                    alert("Ajax Error!!!" + error);
                    console.log("Ajax++++" + error);
                }
            });
        });
        function editFood(fid, fname, aname, fadd, fcontent, fimg) {
            foodStoreId = fid;
            foodStoreName = fname;
            areaName = aname;
            storeAddress = fadd;
            storeContent = fcontent;
            storeImg = fimg;
            $('#edit-dialog').dialog('open');
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
        function sendId(fid, fimg) {
            console.log("in0" + fid);
            foodStoreId = fid;
            storeImg = fimg;
            console.log(storeImg);
            $('#dialog-img').attr("src", "resource/imags/food/" + (storeImg == "" ? "Akz00I_GGjU.jpg" : storeImg));
            $('#pic-dialog').dialog("open");
        }
    </script>

</html>
