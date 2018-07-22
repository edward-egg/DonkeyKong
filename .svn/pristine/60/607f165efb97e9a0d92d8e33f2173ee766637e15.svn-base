<%-- 
    Document   : foodDetail
    Created on : 2018-5-23, 23:00:37
    Author     : hasee
美食详情
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
        <title>Food Detail</title>
        <base href="${pageContext.request.contextPath}/"/>
        <link rel="stylesheet" type="text/css" href="resource/css/css/foodDetail.css" />     
        <link rel="stylesheet" type="text/css" href="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.css"/>
        <link rel="stylesheet" href="resource/css/edbox.css"/>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="food-detail">
            <input hidden="true" id="storeId" value="${food.foodStoreId}"/>
            <div class="head-img">
                <img id="h-img" src="resource/imags/food/${food.storeImg == null ? 'Akz00I_GGjU.jpg' : food.storeImg}" />
                <h3>${food.foodStoreName}</h3>
                <div class="daohang">
                    <span class="like-div">
                        <img id="like" src="resource/imags/icon/heart.png" width="30px" height="30px"/>
                        &nbsp;<span id="like-num" style="color: red;">${food.liked}</span>

                    </span>
                    <span class="report-div">
                        <img src="resource/imags/icon/report.png" width="30px" height="30px"/>&nbsp;<button type="button" class="btn-report" onclick="report('${food.foodStoreId}')">Report!</button>
                    </span>

                </div>
            </div>
            <div id="report-dialog" title="Report">
                <form>
                    <textarea name="ncomment" cols="50" rows="7" id="reports" style="width: 100%;resize: none"></textarea>
                </form>
            </div>
            <div class="article">
                <input hidden="true" id="foodStoreId" value="${food.foodStoreId}"/>
                <div class="content">
                    <p>
                        ${food.storeContent}
                    </p>
                </div>
            </div>
            <div class="food-comment">
                <span id="comment-title">Comments</span>
                <div class="write">
                    <img src="resource/imags/icon/edit.png"/>
                    <button type="button" class="w-btn">Write Recommend</button>
                </div>
                <div id="dialog" title="Comment">
                    <form>
                        <textarea cols="50" rows="7" id="comment" style="width: 100%;resize: none"></textarea>
                    </form>
                </div>
                <br/><br/>
                <hr/>
                <div class="comment-list">
                    <c:forEach items="${commentList}" var="c">
                        <div class="comment-item">
                            <div class="avatar">
                                <img src="resource/imags/icon/account.png" />
                            </div>
                            <div class="comment-detail">
                                <div class="info">
                                    <span>${c.users.userId}</span>&nbsp;&nbsp;
                                    <span>Lv.${c.users.level}</span>
                                    <span id="report">
                                        <img src="resource/imags/icon/report.png"/>&nbsp;<button id="btn-report" type="button" onclick="reportComment('${c.storeCommentId}')">Report!</button>
                                    </span>
                                </div>
                                <div class="msg">
                                    <p>
                                        ${c.commentContent}
                                    </p>
                                    <span id="">
                                        ${c.commentTime}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div id="report-dialog-comment" title="Report">
                <form>
                    <textarea name="ncomment" cols="50" rows="7" id="c-report" style="width: 100%;resize: none"></textarea>
                </form>
            </div>         
        </div>
    </body>
    <script src="resource/js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.js" ></script>
    <script src="resource/js/jquery.edbox.js"></script>
    <script>
                                            $(function () {
                                                $('.w-btn').click(function () {
                                                    $('#dialog').dialog('open');
                                                });
                                                $('#dialog').dialog({
                                                    height: 300,
                                                    width: 400,
                                                    autoOpen: false,
                                                    modal: true,
                                                    buttons: {
                                                        "Comment": function () {
                                                            console.log("comment");
                                                            $.ajax({
                                                                url: 'food/commentedit',
                                                                type: 'POST',

                                                                data: {
                                                                    "comment": $('#comment').val(),
                                                                    "storeId": $('#storeId').val()
                                                                },
                                                                success: function () {
                                                                    console.log('success');
                                                                    location.reload();

                                                                },
                                                                error: function () {
                                                                    console.log('error!');
                                                                    $.edbox({warning: '<b>Warning!</b>You should <a href="redirect/login">login</a>!'});
                                                                    $('#dialog').dialog('close');
                                                                }
                                                            });
                                                        },
                                                        "Cancel": function () {
                                                            $(this).dialog("close");
                                                        }
                                                    }
                                                });
                                                $('#like').click(function () {
                                                    var num = parseInt($('#like-num').text());
                                                    num += 1;
                                                    $.ajax({
                                                        url: 'food/like',
                                                        type: 'POST',
                                                        data: {
                                                            "like": $('#like-num').text(),
                                                            "foodStoreId": $('#foodStoreId').val()
                                                        },
                                                        success: function () {
                                                            console.log('success');
                                                        },
                                                        error: function () {
                                                            console.log('error!');
                                                            $.edbox({warning: '<b>Warning!</b>You should <a href="redirect/login">login</a>!'});
                                                        }
                                                    });
                                                    $('#like-num').text(num);
                                                });
                                                $('#report-dialog').dialog({
                                                    height: 300,
                                                    width: 400,
                                                    autoOpen: false,
                                                    modal: true,
                                                    buttons: {
                                                        "Comment": function () {
                                                            console.log($('#reports').val());
                                                            $.ajax({
                                                                url: 'food/foodReport',
                                                                type: 'POST',
                                                                data: {
                                                                    "content": $('#reports').val(),
                                                                    "foodStoreId": foodStoreId
                                                                },
                                                                success: function () {
                                                                    console.log('success');
                                                                    location.reload();
                                                                },
                                                                error: function () {
                                                                    $.edbox({warning: "<b>You should Login!Go to<a href='redirect/login'>Log in</a></b>"});
                                                                    console.log('error!');
                                                                }
                                                            });
                                                        },
                                                        "Cancel": function () {
                                                            $(this).dialog("close");
                                                        }
                                                    }
                                                });
                                            });
                                            var foodStoreId;
                                            function report(id) {
                                                foodStoreId = id;
                                                $('#report-dialog').dialog('open');
                                            }
                                            var foodStoreCommentId;
                                            function reportComment(id) {
                                                foodStoreCommentId = id;
                                                $("#report-dialog-comment").dialog('open');
                                            }
                                            $('#report-dialog-comment').dialog({
                                                height: 300,
                                                width: 400,
                                                autoOpen: false,
                                                modal: true,
                                                buttons: {
                                                    "Comment": function () {
                                                        console.log($('#c-report').val());
                                                        $.ajax({
                                                            url: 'food/commentReport',
                                                            type: 'POST',
                                                            data: {
                                                                "content": $('#c-report').val(),
                                                                "commentId": foodStoreCommentId
                                                            },
                                                            success: function () {
                                                                $.edbox({success: 'success report!'});
                                                                console.log('success');
                                                                location.reload();
                                                            },
                                                            error: function () {
                                                                $.edbox({warning: '<b>Warning!</b>You should <a href="redirect/login">login</a>!'});
                                                                console.log('error!');
                                                            }
                                                        });
                                                    },
                                                    "Cancel": function () {
                                                        $(this).dialog("close");
                                                    }
                                                }
                                            });
    </script>


</html>
