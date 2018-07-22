<%-- 
    Document   : noteManage
    Created on : 2018-5-23, 23:10:20
    Author     : hasee
游记管理
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <base href="${pageContext.request.contextPath}/"/>
        <link rel="stylesheet" type="text/css" href="resource/css/css/manage.css"/>
        <link rel="stylesheet" href="resource/css/edbox.css"/>
        <title>Report Manage</title>
    </head>
    <body>
        <%@include file="adminTemplate.jsp" %>
        <div class="contentManage">
            <div class="t-title">Report Manage</div>
            <div class="table-head">

            </div>
            <div class="table-content">
                <table border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        
                        <th>User Name</th>
                        <th>Report Object</th>
                        <th>Report Content</th>
                        <th>Report Time</th>
                        <th>Operate</th>
                    </tr>
                    <c:forEach items="${reportList}" var="r">
                        <tr id="">
                        <td>${r.user.userId}</td>
                        <td name="food" style="display: ${r.foodStore == null ? 'none':'table-cell'}">Food Store: ${r.foodStore.foodStoreName}</td>
                        <td name="hotel" style="display: ${r.hotel == null ? 'none':'table-cell'}">Hotel: ${r.hotel.hotelName}</td>
                        <td name="note" style="display: ${r.note == null ? 'none':'table-cell'}">Note: ${r.note.noteTitle}</td>
                        <td name="foodStoreComment" style="display: ${r.foodStoreComment == null ? 'none':'table-cell'}">Store Comment: ${r.foodStoreComment.storeCommentId}</td>
                        <td name="hotelComment" style="display: ${r.hotelComment == null ? 'none':'table-cell'}">Hotel Comment: ${r.hotelComment.hotelCommentId}</td>
                        <td name="noteComment" style="display: ${r.noteComment == null ? 'none':'table-cell'}">Note Comment: ${r.noteComment.noteCommentId}</td>
                        <td name="scenicComment" style="display: ${r.scenicComment == null ? 'none':'table-cell'}">Scenic Comment: ${r.scenicComment.scenicCommentId}</td>
                        <td>${r.reportContent}</td>
                        <td>${r.reportTime}</td>
                        
                        <td>
                            <button type="button" class="delete" onclick="ignoreReport('${r.reportId}')">Ignore</button>
                        
                            <button type="button" class="delete" onclick="deleteObject('${r.reportId}')">Delete</button>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="resource/js/jquery-2.1.0.js" ></script>
    <script src="resource/js/jquery.edbox.js"></script>
    <script>
        function ignoreReport(rid){
            $.ajax({
                url: 'report/delete',
                type: 'POST',
                data: {
                    "rid": rid,
                },
                success: function () {
                    $.edbox({success:'success ignore!'});
                    console.log('success delete!');
                    window.location.reload();
                },
                error: function () {
                    console.log('error! delete error!!!!!');
                } 
            });
        }
        function deleteObject(rid){
            $.ajax({
                url: 'report/erase',
                type: 'POST',
                data: {
                    "rid": rid,
                },
                success: function () {
                    $.edbox({success:'success delete!'});
                    console.log('success delete!');
                    window.location.reload();
                },
                error: function () {
                    console.log('error! delete error!!!!!');
                } 
            });
        }
    </script>
</html>
