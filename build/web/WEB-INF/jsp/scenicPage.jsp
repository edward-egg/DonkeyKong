<%-- 
    Document   : scenicPag
    Created on : 2018-5-23, 23:13:58
    Author     : hasee
景点主页
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
        <link rel="stylesheet" href="resource/css/css/scenicPage.css">
        <link rel="stylesheet" type="text/css" href="resource/css/swiper-4.1.6.min.css" />
        <title>Scenic Page</title>
        <style>
            a{
                color: black;
                text-decoration: none;
            }
            a:link{
                color: black;
            }
            a:visited{
                color: black;
            }
        </style>
    </head>

    <body>
        <!--导航模块-->
        <%@include file="header.jsp" %>
        <!--
            轮播
        -->
        <div class="swiper-container swiper-header">
            <div class="swiper-wrapper">

                <c:forEach items="${topScenicByQD}" var="s">
                    <div class="swiper-slide hot-img">

                        <a href="scenic/getAScenic?sid=${s.scenicId}" id="${s.scenicId}">
                            <span class="img-info">${s.scenicName}!</span>
                            <img src="resource/imags/scenic/${s.scenicImg == null ? '2JMZXTyFUOg.jpg' : s.scenicImg}" />    
                        </a>

                    </div>
                </c:forEach>

            </div>
            <div class="swiper-pagination swiper-btn"></div>
            <div class="swiper-button-prev swiper-btn"></div>
            <div class="swiper-button-next swiper-btn"></div>

        </div>

        <div class="scenic-remomend">
            <span id="r-title">
                City Recomend
            </span>
            <div class="r-item swiper-container swiper-remomend">
                <div class="swiper-wrapper">
                    <c:forEach items="${topScenicList}" var="s">
                        <div class="swiper-slide r-img" id="${s.scenicId}">
                            <a href="scenic/getAScenic?sid=${s.scenicId}" id="${s.scenicId}">
                                <img src="resource/imags/scenic/${s.scenicImg == null ? '2JMZXTyFUOg.jpg' : s.scenicImg}" />
                                <span class="r-info">${s.scenicName}!</span>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination swiper-btn"></div>
            </div>
        </div>

        <div class="scenic-content">
            <!--            <div class="sousuo">
                            <img src="resource/imags/icon/search.png" class="icon-search" width="20px" height="20px" alt="">
                            <input class="in-find" type="text" placeholder="Search the Scenic" />
                            <button type="button" class="find">Search</button>
                        </div>-->
            <div class="scenic-list">
                <c:forEach items="${scenicList}" var="s">
                    <a href="scenic/getAScenic?sid=${s.scenicId}">
                        <div class="scenic-item" id="${s.scenicId}">
                            <div class="s-img">
                                <img src="resource/imags/scenic/${s.scenicImg == null ? '2JMZXTyFUOg.jpg' : s.scenicImg}" width="300px" height="200px" />
                            </div>
                            <div class="s-info">
                                <span id="s-name">
                                    ${s.scenicName}
                                </span>
                            </div>
                        </div>
                    </a>
                </c:forEach>
                <%--<c:forEach items="${scenicList}" var="n">--%>
                    <!--<a href="scenic/getAScenic?sid=${n.scenicId}" id="note-nav">-->
                <!--<div class="note-item">-->
                <!--<img src="resource/imags/2JMZXTyFUOg.jpg" />-->
                <!--<div class="content">-->
                    <!--<span hidden>${n.scenicId}</span>隐藏id传数据-->
                <!--<dl>-->
                <!--<dt>-->
                <!--${n. scenicName}-->
                <!--</dt>-->
                <!--<dd>-->
                <!--${n. scenicAddress}-->
                <!--</dd>-->
                <!--</dl>-->
                <!--</div>-->
                <!--</div>-->
                <!--</a>--> 
                <%--</c:forEach>--%>
            </div>
        </div>
    </body>
    <script src="resource/js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="resource/js/swiper-4.1.6.min.js"></script>
    <script>
        var mySwiper = new Swiper('.swiper-header', {
            loop: true,
            speed: 500,
            pagination: {
                el: '.swiper-pagination'
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            autoplay: true,
            effect: 'coverflow'
        });

        var rSwiper = new Swiper('.swiper-remomend', {
            loop: true,
            speed: 500,
            autoplay: true,
            pagination: {
                el: '.swiper-pagination'
            }
        });

    </script>


</html>