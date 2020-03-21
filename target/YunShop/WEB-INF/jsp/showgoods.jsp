<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: owner
  Date: 2020/3/21
  Time: 0:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品详细信息显示</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link href="css/jquery.exzoom.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css" rel="stylesheet">
        /* reset */
        html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,dl,dt,dd,ol,nav ul,nav li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
        article, aside, details, figcaption, figure,footer, header, hgroup, menu, nav, section {display: block;}
        ol,ul{list-style:none;margin:0;padding:0;}
        blockquote,q{quotes:none;}
        blockquote:before,blockquote:after,q:before,q:after{content:'';content:none;}
        table{border-collapse:collapse;border-spacing:0;}
        /* start editing from here */
        a{text-decoration:none;}
        *{
            margin: 0px;
            padding: 0px;
        }
        body{
            width: 100%;
            height: 100%;
            background-color: #fff;
        }
        .content .row{
            position: relative;
            width: 100%;
            height: 604px;
        }

        /*左边图片显示功能*/
        .content .row .leftshow{
            position: relative;
            height: 100%;
        }
        #exzoom {
            width: 400px;
            margin: 20px auto;
        }
        .content .row .leftshow .bigimg{
            float: left;
            width: 100%;
            height: 70%;
            background-color: #4cae4c;
        }
        .content .row .leftshow .smallimg{
            float: left;
            width: 100%;
            height: 30%;
            background-color: #c1e2b3;
        }

        /*右边显示详细信息以及购买商品*/
        .content .row .rightshow{
            position: relative;
            height: 100%;
        }
        .content .row .rightshow .goodsname{
            width: 100%;
            height: 10%;
            color: black;
            text-align: left;
            text-align: left;
        }
        .content .row .rightshow .goodsname span{
            font: 35px "Arial Black" ;
        }
        .content .row .rightshow .goodsprice{
            position: relative;
            width: 100%;
            height: 20%;
            color: black;
        }
        .content .row .rightshow .goodsprice .price{
            color: red;
        }
        .content .row .rightshow .goodsprice  td{
            height: 50%;
            font: 22px inherit;
            vertical-align:middle;
        }
        .content .row .rightshow .goodsprice td span{
            font: inherit;
            font-size: 1.3em;
        }

        .content .row .rightshow .goodsdesc{
            width: 100%;
            height: 30%;
            font: inherit;
        }
        .content .row .rightshow .goodsdesc textarea{
            width: 90%;
            height: 100%;
        }
        .content .row .rightshow .button1{
            position: relative;
            width: 100%;
            height: 20%;
            text-align: center;
        }
        .content .row .rightshow .button1 button{
            position: relative;
            /*float: left;*/
            width: 180px;
            height: 60px;
            color: #fff;
            font: inherit;
            font-size: 1.6em;
            margin: 0px;
            text-align: center;
            background-color: #999999;/*a4cbe2*/
            top: 25%;
            border-radius: 10px;
        }
        .content .row .rightshow .button1 button:hover{
            background-color: #a4cbe2;
            color: #999999;
        }
        .content .row .rightshow .button1 .addshoppingcart{
            right: 10%;
        }
        .content .row .rightshow .button1 .buygoods{
            left: 10%;
        }
    </style>
</head>
<body>
<script type=“text javascript”>

   var cpro_id = “u2557752”;

</script>

<script src=“http://cpro.baidustatic.com/cpro/ui/cm.js?id='i9898'” type=“text/javascript”></script>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div id="content" class="content">
        <div class="row">
            <!--显示图片-->
            <div class="col-sm-6 col-md-6 leftshow">
                <div class="exzoom" id="exzoom">
                    <!--大图区域-->
                    <div class="exzoom_img_box">
                        <ul class='exzoom_img_ul'>
                            <li><img src="img/phone/phone_01.jpg"/></li>
                            <%--<li><img src="img/photos/a2.png"/></li>
                            <li><img src="img/photos/a3.png"/></li>
                            <li><img src="img/photos/a4.png"/></li>
                            <li><img src="img/photos/a5.png"/></li>
                            <li><img src="img/photos/a1.png"/></li>
                            <li><img src="img/photos/a2.png"/></li>
                            <li><img src="img/photos/a3.png"/></li>--%>
                        </ul>
                    </div>
                    <!--缩略图导航-->
                    <div class="exzoom_nav"></div>
                    <!--控制按钮-->
                    <p class="exzoom_btn"> <a href="javascript:void(0);" class="exzoom_prev_btn"> &lt; </a> <a href="javascript:void(0);" class="exzoom_next_btn"> &gt; </a> </p>
                </div>
                <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
                <script src="js/jquery.exzoom.js"></script>
                <script type="text/javascript">
                    $("#exzoom").exzoom({
                        autoPlay: false,
                    });//方法调用，务必在加载完后执行
                </script>
            </div>
            <!--显示价格购买商品-->
            <div class="col-sm-6 col-md-6 rightshow">

                <c:forEach items="${goodsDetailList}" var="gdl">
                    <div class="goodsname">
                        <span>${gdl.gsname}</span>
                    </div>
                    <div class="goodsdesc">
                        <p>${gdl.gdes}</p>
                    </div>
                    <div class="goodsprice">
                        <table width="100%" height="100%">
                            <tr>
                                <td><span>商品价格: </span><span class="price" id="price">￥${gdl.price}</span></td>
                                <td>
                                    <span>数量:</span>
                                    <input type="text" value="1" style="width: 35px" id="count">
                                    <input type="button" value="<" id="reducecount">
                                    <input type="button" value=">" id="addcount">&emsp;&emsp;
                                    <span>库存: ${gdl.stock}</span>
                                </td>
                            </tr>
                            <%--<tr>
                                <td><span>月销量: </span><span>1582</span></td>
                                <td><span>累计评价: </span><span>1520</span></td>
                            </tr>--%>
                        </table>
                    </div>
                    <div class="button1" id="button1">
                        <button class="addshoppingcart"
                                onclick="
                                        var count = document.getElementById('count').value;
                                        var url='${pageContext.request.contextPath}/yunshop/${login_user.id}/addGoodsToCar'
                                        +'?count='+count+'&gid='+${gdl.id};
                                location.href=url">加入购物车</button>
                        <button class="buygoods">购买商品</button>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    // <!-- 单机按钮总数加减 -->
    $("#addcount").click(function () {
        var a = $("#count").val();
        a++;
        if (a < 1){
            a = 1;
        }
        $("#count").val(a);
    });
    $("#reducecount").click(function () {
        var b = $("#count").val();
        b--;
        if (b < 1){
            b = 1;
        }
        $("#count").val(b);
    });
</script>
</body>
</html>
