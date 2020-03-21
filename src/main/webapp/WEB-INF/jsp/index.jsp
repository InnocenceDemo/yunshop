<%--
  主页
  Created by IntelliJ IDEA.
  User: owner
  Date: 2020/2/23
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!--商城主页-->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>基于个性化推荐的自贸区网上商城</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper.min.css">
    <script src="${pageContext.request.contextPath}/js/template-web.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        /* reset */
        html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,dl,dt,dd,ol,nav ul,nav li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
        article, aside, details, figcaption, figure,footer, header, hgroup, menu, nav, section {display: block;}
        ol,ul{list-style:none;margin:0;padding:0;}
        blockquote,q{quotes:none;}
        blockquote:before,blockquote:after,q:before,q:after{content:'';content:none;}
        table{border-collapse:collapse;border-spacing:0;}
        /* start editing from here */
        a{text-decoration:none;cursor: pointer;}
        *{
            margin: 0px;
            padding: 0px;
        }
        body{
            width: 100%;
            height: auto;
            background-color: #fff;
        }
        .content{
            width: 100%;
        }
        .header{
            width: 100%;
            height: 110px;
        }
        .logo{
            float:left;
            position: relative;
            width: 20%;
            height: 43px;
            top: 30%;
            left: 10%;

        }
        .header .logo a img{
            cursor: pointer;
        }
        /*search*/
        .h_search{
            float: left;
            position: relative;
            border: 1px solid rgb(216, 216, 216);
            width: 50%;
            margin: 0 15%;
            border-radius: 2px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            -o-border-radius: 2px;
            top: 30%;
            /*right: 10%;*/
        }
        .h_search input[type="text"]{
            -webkit-appearance: none;
            padding: 6px 16px;
            outline: none;
            color: #312c3c;
            background: #FFFFFF;
            border: none;
            width: 84.33333%;
            line-height: 1.5em;
            position: relative;
            font-size: 0.8725em;
            text-transform: capitalize;
        }
        .h_search input[type="submit"]{
            -webkit-appearance: none;
            background: url('${pageContext.request.contextPath}/img/search.png') no-repeat 10px 5px;
            padding: 6px 0px;
            border: none;
            cursor: pointer;
            width: 8.33%;
            line-height: 1.5em;
            outline: none;
            position: absolute;
            right: 0px;
        }
        .row{
            width: 100%;
            height: 480px;
        }
        .sidebar{
            position: relative;
            float: left;
            height: 100%;
            background-color: #eeeeee;
        }
        .picture_player{
            position: relative;
            float: left;
            height: 100%;
        }
        /*一级分类样式设计*/
        .mainnav .outertype{
            position: relative;
            float: left;
            border: 0px;
            width: 90%;
            height: 80%;
            left: 5%;
            top: 5%;
        }
        .outertype ul li{
            position: relative;
            font: 16px "宋体";
            color: #000;
            line-height: 30px;
            border: 1px solid white;
            border-radius: 4px;
            cursor: pointer;
        }
        .outertypeul ul li{
            background-color: #d5d5d5;
            height: 32px;
        }
        .outertype ul li .textarea{
            cursor: pointer;
        }
        .outertype ul li .caret{
            position: absolute;
            float: right;
            right: 10px;
            top: 35%;
            cursor: pointer;
        }
        /*二级分类样式*/
        .innertype{
            display: none;/*none/block*/
            z-index: 10;
            position: absolute;
            float: left;
            width: 750px;
            height: 520px;
            background-color: #a4cbe2;
            /*border: 1px white solid;*/
            border-radius: 4px;
            top: 20px;
            left: 105%;
            text-align: center;
        }
        .innertype a{
            color: #000000;
            cursor: pointer;
        }
        .innertype a{
            color: red;
        }
        .innertype li:hover{
            background: #eeeeee;
        }
        /*轮播图图片样式*/
        .bannerBox{
            width: 100%;
            height: 100%;
            position: relative;
            margin: 0px auto 0px;
            cursor: pointer;
        }
        #swiper1{
            width: 100%;
            height: 100%;
        }
        #swiper1{
            filter:alpha(opacity=95);
            -moz-opacity:0.95;
            opacity: 0.95;
        }
        #swiper1 .swiper-slide,#swiper1 img{
            width: 100%;
            height: 100%;
            font-size: 100px;
            line-height: 280px;
            text-align: center;
            object-fit: cover;
        }
        /*三级分类*/
        .threedir{
            /*display: none;!*none/block*!*/
            z-index: 8;
            position: absolute;
            float: left;
            width: 250px;
            height: 520px;
            background-color: #a4cbe2;
            /*border: 1px white solid;*/
            border-radius: 4px;
            top: 20px;
            left: 230%;
        }
        /*轮播图左右按钮*/
        .left{
            position: absolute;
            top: 40%;
            left: 20px;
            width: 30px;
            height: 65px;
            background-color: rgba(64,64,64,0.6);
            text-align: center;
            line-height: 65px;
            border-bottom-right-radius: 4px;
            border-top-right-radius: 4px;
            z-index: 2;
            display: none;
        }
        .left img{
            width: 100%;
            height: 100%;

        }
        .right{
            position: absolute;
            top: 40%;
            right: 20px;
            width: 30px;
            height: 65px;
            background-color: rgba(64,64,64,0.6);
            border-bottom-left-radius: 4px;
            border-top-left-radius: 4px;
            z-index: 2;
            display: none;
        }
        .right img{
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
        }
        .main .row{
            width: 100%;
            height: auto;
            margin-left: 0px;
        }
        .main .row .goods {
            float: left;
            position: relative;
            width: 30%;
            height: 380px;
            border: 1px #ccc solid;
            margin: 24px 1%;
        }
        .main .row .goods  h3,button{
            color: #999999;
            font: inherit;
            font-size: 1.8em;
            margin: 0px;
            text-align: center;
        }
        .main .row .goods .topshow{
            position: relative;
            width: 90%;
            height: 80%;
            margin: 0 auto;
            margin-top: 20px;
            /*border: 1px #ccc solid;*/
        }
        .main .row .goods .topshow .showimg{
            position: relative;
            float: left;
            width: 100%;
            height: 90%;
        }
        .main .row .goods .topshow .showimg img{
            position: absolute;
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
            top:0;bottom:0;margin-top:auto;margin-bottom:auto;/*上下居中*/
            left:0;right:0;margin-left:auto;margin-right:auto;/*左右居中*/
        }
        .main .row .goods .topshow .goodsname{
            float: left;
            width: 100%;
            height: 10%;
        }
        .main .row .goods .bottomshow .goodsprice h3{
            margin-top: 10px;
            margin-left: 0px;
            width: 18%;
        }
        .main .row .goods .bottomshow .goodsprice,.goodsbuy{
            float: left;
            width: 20%;
            height: 100%;
        }
        .main .row .goods .bottomshow .goodsbuy{
            width: 80%;
            margin-top: 10px;
            padding-left: 30px;
        }
        .main .row .goods .bottomshow .goodsbuy button{
            float: left;
            color: #fff;
            background-color: #a4cbe2;
            width: 96px;
            height: 34px;
            font-size: 1.2em;
            border-radius: 20px;
        }
        .main .row .goods .bottomshow .goodsbuy button:hover{
            color: #9c9c9c;
        }
    </style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div class="content" id="content">
        <!--搜索区域-->
        <div class="header">
            <div class="logo">
                <a href="index.html"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
            </div>
            <!--搜索区域-->
            <div class="h_search" id="h_search">
                <form action="#" method="post">
                    <input type="text" value="" placeholder="请输入关键字搜索">
                    <input type="submit" value="">
                </form>
            </div>
        </div>
        <!--轮播区域-->
        <div class="container-fluid">
            <div class="row ">
                <!--商品分类-->
                <div class="col-md-3 col-xs-4 sidebar mainnav">
                    <!--商品一级分类-->
                    <div class="outertype" id="outertype">
                        <div id="outertypeul" class="outertypeul">
                            <ul>
                                <c:forEach items="${firstDirs}" var="firstDir">
                                    <li>
                                        <span class="textarea" onmouseover="findSecondDir(this)">
                                                ${firstDir.first_itemize}<p style="display: none">${firstDir.id}</p>
                                        </span>
                                        <span class="caret"></span>
                                    </li>
                                </c:forEach>
                            </ul>

                        </div>
                        <!--商品二级分类-->
                        <div class="innertype" id="innertype">
                            <div class="row">
                                <div class="col-md-6 col-xs-6 topdir">
                                    <script type="text/html" id="template1">
                                        <ul>
                                            {{ each secondDirList as value i }}
                                            <li>
                                                <p onmouseover="findThreeDir(this)">
                                                    {{value.second_itemize}}<span style="display: none">{{value.id}}</span>
                                                </p>
                                            </li>
                                            {{ /each}}
                                        </ul>
                                    </script>
                                </div>
                                <div class="col-md-6 col-xs-6 bottomdir">
                                        <script type="text/html" id="template2">
                                            <ul>
                                                {{ each threeDirList as value i }}
                                                <li>
                                                    <a href="#" style="cursor: pointer;">
                                                        {{value.three_itemize}}<span style="display: none">{{value.id}}</span>
                                                    </a>
                                                </li>
                                                {{ /each}}
                                            </ul>
                                        </script>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!--轮播图片区域-->
                <div class="col-md-9 col-xs-8 picture_player">
                    <div class="bannerBox">
                        <div class="swiper-container" id="swiper1">
                            <div class="swiper-wrapper swiper-no-swiping">
                                <div class="swiper-slide color-red" id="swiper-slide1">
                                    <img src="${pageContext.request.contextPath}/img/picture_player1.jpg"/>
                                </div>
                                <div class="swiper-slide color-blue" id="swiper-slide2">
                                    <img src="${pageContext.request.contextPath}/img/picture_player2.jpg">
                                </div>
                                <div class="swiper-slide color-yellow" id="swiper-slide3">
                                    <img src="${pageContext.request.contextPath}/img/picture_player3.jpg">
                                </div>
                                <div class="swiper-slide color-green" id="swiper-slide4">
                                    <img src="${pageContext.request.contextPath}/img/picture_player4.jpg">
                                </div>
                                <div class="swiper-slide color-pink" id="swiper-slide5">
                                    <img src="${pageContext.request.contextPath}/img/picture_player5.jpg">
                                </div>
                                <div class="swiper-slide color-pink" id="swiper-slide6">
                                    <img src="${pageContext.request.contextPath}/img/picture_player6.jpg">
                                </div>
                            </div>
                            <div class="left"><img src="${pageContext.request.contextPath}/img/bannerL.png"></div>
                            <div class="right"><img src="${pageContext.request.contextPath}/img/bannerR.png"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--商品显示区域-->
        <div class="main" id="main">
            <div class="row">
                <c:if test="${goods != null}">
                    <c:forEach items="${goods}" var="g">
                        <div class="col-sm-6 col-md-4 goods">
                            <div class="topshow">
                                <div class="showimg">
                                    <img src="${pageContext.request.contextPath}/img/phone/phone_01.jpg" alt="${g.img}" onclick="window.location.href='${pageContext.request.contextPath}/showGoodsDetail?gid=${g.id}'">
                                </div>
                                <div class="goodsname">
                                    <h3>${g.gsname}</h3>
                                </div>
                            </div>
                            <div class="bottomshow">
                                <div class="goodsprice">
                                    <h3>$${g.price}</h3>
                                </div>
                                <div class="goodsbuy">
                                    <button onclick="window.location.href='${pageContext.request.contextPath}/addCar?goodsid=${g.id}&uid=${login_user.id}'"> <span>加购物车</span></button>
                                    <button onclick="window.location.href='${pageContext.request.contextPath}/buyGoods?goodsid=${g.id}&uid=${login_user.id}'"> <span>直接购买</span></button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <table border="0" cellspacing="0" cellpadding="0"  width="900px" align="center">
            <tr>
                <td align="right">
                    <span>第${pageBean.currPage}/${pageBean.totalPage}页</span>&nbsp;&nbsp;
                    <span>总记录数 ：${pageBean.totalCount}条&nbsp;&nbsp;每页显示：${pageBean.pageSize}条</span>
                    <span>
                <c:if test="${pageBean.currPage != 1}">
                    <a href="${pageContext.request.contextPath}/index?page=1">[首页]</a>&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/index?page=${pageBean.currPage-1}">[上一页]</a>&nbsp;&nbsp;
                </c:if>
                <c:if test="${pageBean.currPage != pageBean.totalPage}">
                    <a href="${pageContext.request.contextPath}/index?page=${pageBean.currPage+1}">[下一页]</a>&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/index?page=${pageBean.totalPage}">[尾页]</a>&nbsp;&nbsp;
                </c:if>
            </span>
                </td>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">

    var oUl = document.getElementById('outertypeul');
    var aLi = oUl.getElementsByTagName('li');
    var oDiv1 = document.getElementById('innertype');
    var timer = null;
    for (var i=0; aLi.length; i++){
        // aLi[i].index = i;
        oDiv1.onmouseover = aLi[i].onmouseover = function () {
            clearTimeout(timer);
            oDiv1.style.display='block';
            this.style.backgroundColor = "#fff";
            oDiv1.style.backgroundColor = "#a4cbe2";
        };
        oDiv1.onmouseout = aLi[i].onmouseout=function () {
            this.style.backgroundColor = "#ccc";
            oDiv1.style.backgroundColor = "#a4cbe2";
            timer=setTimeout(function(){oDiv1.style.display='none'}, 100);
        };
    }


</script>
<script type="text/javascript">

    //最里层轮播
    var mySwiper1 = new Swiper('#swiper1',{
        loop: true,
        autoplay : 2500,
        speed : 600,
        autoplayDisableOnInteraction : false
    });
    //前进后退按钮
    $(".left").click(function(){
        mySwiper1.slidePrev();
    });
    $(".right").click(function(){
        mySwiper1.slideNext();
    });

    $(".bannerBox").mouseover(function () {
        $(".left,.right").css("display","block");
    });
    $(".bannerBox").mouseout(function () {
        $(".left,.right").css("display","none");
    });

    $("#outertypeul ul li").mouseover(function () {
        this.addClass("chooseLi");
    });

    /*刷新二级目录*/
    function findSecondDir(elem) {
        var firstDirId = elem.getElementsByTagName("p")[0].innerHTML;
        $.ajax({
            url: '${pageContext.request.contextPath}/yunshop/findSecondDir',
            type: 'post',
            data: {firstDirId: firstDirId},
            dataType: 'json',
            success: function(data){
                // 此处data为js对象
                var html = template('template1', data);
                $('.topdir').html(html);
            },
            error: function(error){
                alert(123);
                console.log(error);
            },
            async: true
        })
    }
    /*刷新三级目录*/
    function findThreeDir(elem) {
        var twoDirId = elem.getElementsByTagName("span")[0].innerHTML;
        $.ajax({
            url: '${pageContext.request.contextPath}/yunshop/findThreeDir',
            type: 'post',
            data: {twoDirId: twoDirId},
            dataType: 'json',
            success: function(data){
                // 此处data为js对象
                var html = template('template2', data);
                $('.bottomdir').html(html);
            },
            error: function(error){
                console.log(error);
            },
            async: true
        })
    }
</script>
</body>
</html>


