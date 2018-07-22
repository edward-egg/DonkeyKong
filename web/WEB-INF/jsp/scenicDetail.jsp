<%-- 
    Document   : scenicDetail
    Created on : 2018-5-23, 23:12:12
    Author     : hasee
    景点详情
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
        <title>Scenic Detail</title>
        <base href="${pageContext.request.contextPath}/"/>
        <link rel="stylesheet" type="text/css" href="resource/css/css/scenicDetail.css" />
        <link rel="stylesheet" href="resource/css/edbox.css"/>
        <link rel="stylesheet" type="text/css" href="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.css"/>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="scenic-detail">
            <input hidden="true" id="scenicId" value="${scenic.scenicId}"/>
            <div class="head-img">
                <img class="h-img" src="resource/imags/scenic/${scenic.scenicImg == null ? 'Akz00I_GGjU.jpg':scenic.scenicImg}" />
                <h3>${scenic.scenicName}</h3>
                <span class="like-div">
                    <img id="like" src="resource/imags/icon/heart.png" width="30px" height="30px"/>
                    &nbsp;<span id="like-num" style="color: red;">${scenic.scenicLike}</span>
                </span>
            </div>
            <div class="article">
                <div class="content">
                    <p>
                        ${scenic.scenicContent}
                    </p>
                </div>
            </div>

            <div class="scenic-comment">
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
                                <img src="resource/imags/user/${c.users.userImg==null? 'account.png' : c.users.userImg}" />
                            </div>
                            <div class="comment-detail">
                                <div class="info">
                                    <span>${c.users.userId}</span>&nbsp;&nbsp;
                                    <span>${c.users.level}</span>
                                    <span id="report">
                                        <img src="resource/imags/icon/report.png"/>&nbsp;<button id="btn-report" type="button" onclick="reportComment('${c.scenicCommentId}')">Report!</button>
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
        </div>
        <div id="report-dialog-comment" title="Report">
            <form>
                <textarea name="ncomment" cols="50" rows="7" id="c-report" style="width: 100%;resize: none"></textarea>
            </form>
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
                                                            console.log($('#scenicId').val());
                                                            console.log($('${scenic.scenicId}').val());
                                                            $.ajax({
                                                                url: 'scenic/commentedit',
                                                                type: 'POST',

                                                                data: {
                                                                    "comment": $('#comment').val(),
                                                                    "scenicId": $('#scenicId').val()
                                                                },
                                                                success: function () {
                                                                    console.log('success');
                                                                    $.edbox({success:'success comment!'});
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
                                                $('#like').click(function () {
                                                    var num = parseInt($('#like-num').text());
                                                    num += 1;
                                                    $.ajax({
                                                        url: 'scenic/like',
                                                        type: 'POST',
                                                        data: {
                                                            "like": $('#like-num').text(),
                                                            "scenicId": $('#scenicId').val()
                                                        },
                                                        success: function () {
                                                            $.edbox({success:'success like!'});
                                                            console.log('success');
                                                        },
                                                        error: function () {
                                                            $.edbox({warning: '<b>Warning!</b>You should <a href="redirect/login">login</a>!'});
                                                            console.log('error!');
                                                        }
                                                    });
                                                    $('#like-num').text(num);
                                                });
                                            });
                                            var scenicCommentId;
                                            function reportComment(id) {
                                                scenicCommentId = id;
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
                                                            url: 'scenic/commentReport',
                                                            type: 'POST',
                                                            data: {
                                                                "content": $('#c-report').val(),
                                                                "commentId": scenicCommentId
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
