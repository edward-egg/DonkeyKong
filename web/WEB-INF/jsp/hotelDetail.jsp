<%-- 
    Document   : hotelDetail
    Created on : 2018-5-30, 19:45:31
    Author     : hasee
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <base href="${pageContext.request.contextPath}/"/>
        <link rel="stylesheet" href="resource/css/css/hotelDetail.css">
        <link rel="stylesheet" href="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.css" />
        <link rel="stylesheet" href="resource/css/edbox.css"/>

        <title>Hotel Detail</title>
        <style>
            .book-time input{
                width: 95%;
                height: 20px;
                border-radius: 4px;

            }
            .book-time input:focus{
                outline: 0;
                border: 1px solid #ffa200;
                box-shadow: 0 0 5px #ffa200;
                transition-duration: 0.5s;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="detail-content">
            <input hidden="true" id="hotelId" value="${hotel.hotelId}"/><!--测试用，暂时静态值-->
            <div class="h-head">
                <div class="h-info">

                    <span id="h-name">
                        ${hotel.hotelName}
                    </span>
                    <div class="h-address">
                        <span>Address:&nbsp;</span>
                        <span>${hotel.hotelAddress}</span>
                    </div>
                </div>
                <div class="h-img">
                    <img src="resource/imags/hotel/${hotel.hotelImg == null ? 'DpPutJwgyW8.jpg' : hotel.hotelImg}"/>
                </div>
                <div class="daohang">
                    <div class="like">
                        <span>
                            <img id="like" src="resource/imags/icon/heart.png" width="30px" height="30px"/>
                            &nbsp;<span id="like-num" style="color: red;">${hotel.hotelLike}</span>
                        </span>
                        <span>
                            <img src="resource/imags/icon/report.png" width="30px" height="30px"/>&nbsp;
                            <button type="button" class="btn-report" onclick="report('${hotel.hotelId}')">Report!</button>
                        </span>
                    </div>
                    <div class="write">
                        <img src="resource/imags/icon/edit.png"/>
                        <button type="button" class="w-btn">Write Recommend</button>
                    </div>
                </div>
                <div id="dialog" title="Comment">
                    <form>
                        <textarea cols="50" rows="7" id="comment" style="width: 100%;resize: none"></textarea>
                    </form>
                </div>
            </div>		
            <div class="h-body" id="booking">
                <table cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <th>Room Type</th>
                            <th>Cost</th>
                            <th>Book</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${hotel.hotelRooms}" var="room">
                            <tr id="${room.roomId}">
                                <td>${room.roomType}</td>
                                <td>${room.roomPrice}</td>
                                <td><button type="button" class="btn-book" onclick="getRoomType('${room.roomId}')">Book</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <div class="book-time" title="Choose Book Time">
                    From&nbsp;<input type="text" name="tourBeginTime" id="from" class="t-from" required="true"/><br/>
                    To&nbsp;<input type="text" name="tourEndTime" id="to" class="t-to" required="true"/>
                </div>
            </div>
            <div class="h-recommend" id="recommend">
                <span id="comment-title">Comments</span>
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
                                    <span>Lv.${c.users.level}</span>
                                    <span id="report">
                                        <img src="resource/imags/icon/report.png"/>&nbsp;<button  class="btn-report" type="button" onclick="reportComment('${c.hotelCommentId}')">Report!</button>
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
        <div id="report-dialog" title="Report">
            <form>
                <textarea name="ncomment" cols="50" rows="7" id="reports" style="width: 100%;resize: none"></textarea>
            </form>
        </div>
        <div id="report-dialog-comment" title="Report">
            <form>
                <textarea name="ncomment" cols="50" rows="7" id="c-report" style="width: 100%;resize: none"></textarea>
            </form>
        </div>       
    </body>
    <script type="text/javascript" src="resource/js/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="resource/js/jquery-ui-1.12.1.custom/jquery-ui.min.js" ></script>
    <script src="resource/js/jquery.edbox.js"></script>
    <script type="text/javascript">
                                            $(function () {
                                                $('.btn-book').click(function () {
                                                    var index = $(this).index();
                                                    $('.book-time').eq(index).dialog('open');
                                                });
                                                $('.book-time').dialog({
                                                    height: 350,
                                                    width: 300,
                                                    autoOpen: false,
                                                    modal: true,
                                                    buttons: {
                                                        "Submit": function (check) {
                                                            if ($('#from').val() == "" || $('#to').val() == "") {
                                                                $.edbox({warning: "input should not be blank!"});
                                                                check.preventDefault();
                                                            } else {
                                                                $.ajax({
                                                                    url: 'hotel/book',
                                                                    type: 'POST',
                                                                    data: {
                                                                        "ftime": $('#from').val(),
                                                                        "ttime": $('#to').val()
                                                                    },
                                                                    success: function () {
                                                                        $('.book-time').dialog('close');
                                                                        $('.btn-book').removeClass('.btn-book');
                                                                        $('.btn-book').addClass('btn-disabled');
                                                                    },
                                                                    error: function () {
                                                                        
                                                                        $('.book-time').dialog('close');
                                                                        $('.btn-book').removeClass('.btn-book');
                                                                        $('.btn-book').addClass('btn-disabled');
                                                                    }
                                                                });
                                                            }
                                                        },
                                                        "Cancel": function () {
                                                            $(this).dialog('close');
                                                        }
                                                    }
                                                });
                                                $('#from').datepicker({
                                                    defaultDate: '+1w',
                                                    changeMonth: true,
                                                    dateFormat: "yy-mm-dd",
                                                    numberOfMonth: 1,
                                                    onClose: function (selectDate) {
                                                        $('#to').datepicker('option', 'minDate', selectDate);
                                                        $('.t-final-time').datepicker('option', 'maxDate', selectDate);
                                                    }
                                                });
                                                $('#to').datepicker({
                                                    defaultDate: '+1w',
                                                    changeMonth: true,
                                                    dateFormat: "yy-mm-dd",
                                                    numberOfMonth: 1,
                                                    onClose: function (selectDate) {
                                                        $('#from').datepicker('option', 'maxDate', selectDate);
                                                    }
                                                });
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
                                                            console.log($('#hotelId').val());
                                                            $.ajax({
                                                                url: 'hotel/commentedit',
                                                                type: 'POST',

                                                                data: {
                                                                    "comment": $('#comment').val(),
                                                                    "hotelId": $('#hotelId').val()
                                                                },
                                                                success: function () {
                                                                    console.log('success');
                                                                    $.edbox({success:'success comment!'});
                                                                    location.reload();

                                                                },
                                                                error: function () {
                                                                    console.log('error!');
                                                                    $.edbox({warning: '<b>Warning!</b>You should <a href="redirect/login">login</a>!'});
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
                                                        url: 'hotel/like',
                                                        type: 'POST',
                                                        data: {
                                                            "like": $('#like-num').text(),
                                                            "hotelId": $('#hotelId').val()
                                                        },
                                                        success: function () {
                                                            $.edbox({success:'success like!'});
                                                            console.log('success');
                                                        },
                                                        error: function () {
                                                            console.log('error!');
                                                            $.edbox({warning: '<b>Warning!</b>You should <a href="redirect/login">login</a>!'});
                                                        }
                                                    });
                                                    $('#like-num').text(num);
                                                });
                                            });
                                            function getRoomType(rid) {
                                                $.ajax({
                                                    url: 'hotel/setRoomId',
                                                    type: 'POST',
                                                    data: {
                                                        "rid": rid
                                                    },
                                                    dataType: "json",
                                                    success: function () {
                                                    },
                                                    error: function () {
                                                    }
                                                });
                                            }

                                            var hotelId;
                                            function report(id) {
                                                hotelId = id;
                                                $('#report-dialog').dialog('open');
                                            }
                                            $('#report-dialog').dialog({
                                                height: 300,
                                                width: 400,
                                                autoOpen: false,
                                                modal: true,
                                                buttons: {
                                                    "Comment": function () {
                                                        console.log($('#reports').val());
                                                        $.ajax({
                                                            url: 'hotel/hotelReport',
                                                            type: 'POST',

                                                            data: {
                                                                "content": $('#reports').val(),
                                                                "hotelId": hotelId
                                                            },
                                                            success: function () {
                                                                console.log('success');
                                                                $.edbox({success:'success report!'});
                                                                location.reload();

                                                            },
                                                            error: function () {
                                                                console.log('error!');
                                                                $.edbox({warning: '<b>Warning!</b>You should <a href="redirect/login">login</a>!'});
                                                            }
                                                        });

                                                    },
                                                    "Cancel": function () {
                                                        $(this).dialog("close");
                                                    }
                                                }
                                            });
                                            var hotelCommentId;
                                            function reportComment(id) {
                                                hotelCommentId = id;
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
                                                            url: 'hotel/commentReport',
                                                            type: 'POST',
                                                            data: {
                                                                "content": $('#c-report').val(),
                                                                "commentId": hotelCommentId
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
