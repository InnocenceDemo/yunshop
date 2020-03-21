<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: owner,购物车
  Date: 2020/3/19
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js" type="text/javascript"></script>
    <style type="text/css">
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
        .content .row{
            position: relative;
            width: 100%;
            height: 300px;
            /*background-color: #49afcd;*/
        }

        .content .row .h_msg{
            position: relative;
            width: 100%;
            height: 80px;
            /*background-color: #999999;*/
            text-align: center;
            padding: 0;
        }
        .content .row .h_msg h2{
            font-size: 1.8em;
            margin: 0;
            padding-top: 20px;
        }
        .content .row .h_msg span{
            color: #ff5956;
        }
        .content .row .all_msg .msg{

            min-height: 150px;
            top:0;bottom:0;padding-top:50px;/*上下居中*/
            left:0;right:0;padding-left:37%;/*左右居中*/
        }
        .content .row .all_msg .msg span{
            font-size: 1.8em;
            color: red;
        }

        .content .row .all_msg .table{
            min-height: 300px;
            text-align: center;
            border: 1px #999999 solid;
        }
        .content .row .all_msg .table td{
            vertical-align: middle;
        }
        .content .row .all_msg .table .checkbox{
            margin: 0 auto;
        }
        .content .row .all_msg .table img{
            float: left;
            height: 120px;
        }
        .content .row .all_msg .table span{
            bottom: 60px;
            line-height: 120px;
            font-size: 1.8em;
        }
        .content .row .all_msg .table .unitprice{
            font-size: 16px;
        }
        .content .row .all_msg .table .allprice{
            font-size: 16px;
        }
        .content .row .foot_msg{
            position: relative;
            width: 100%;
            height: 150px;
        }
        .content .row .foot_msg a,p,button{
            position: inherit;
            float: left;
            font-size: 1.2em;
            top: 35%;
            color: black;
        }
        .content .row .foot_msg a:hover{
            margin: 0;
            padding: 0;
            color: red;
        }
        .content .row .foot_msg p{
            margin:0px 10%;
            top: 28%
        }
        .content .row .foot_msg span{
            color: red;
            font-size: 1.5em;
        }
        .content .row .foot_msg button{
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
        .content .row .foot_msg button:hover{
            background-color: #a4cbe2;
            color: #999999;
        }
        .content .row .foot_msg .buygoods{
            left: 14%;
        }
        .container span{
            float: none;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div class="content">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <div class="h_msg">
                    <h2>全部商品 &nbsp;<span>(${count})</span></h2>
                </div>
                <div class="all_msg">
                    <c:if test="${list==null}">
                        <div class="msg"><span>购物车中没有添加商品</span></div>
                    </c:if>
                    <c:if test="${list!=null}">
                    <table class="table table-hover">
                        <tr>
                            <td><input type="checkbox" name="userImportAll" id="userImportAll">全选</td>
                            <td>商品信息</td>
                            <td>单价</td>
                            <td>数量</td>
                            <td>金额</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${list}" var="a">
                            <tr>
                                <td><input type="checkbox" name="userImportAll"  class="checkbox"></td>
                                <td><img src="img/phone/phone_02.jpg" alt="#"><span>${a.gsname}</span></td>
                                <td><span class="unitprice">${a.price}</span></td>
                                <td><input type="text" value="${a.buycount}" style="width: 35px" class="count">
                                    <input type="button" value="<" class="reducecount">
                                    <input type="button" value=">" class="addcount">
                                </td>
                                <td><span class="allprice">${a.price * a.buycount}</span></td>
                                <td><a href="${pageContext.request.contextPath}/yunshop/${a.bid}">移除</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    </c:if>
                </div>
                <div class="foot_msg">
                    <a href="#">删除选中</a>
                    <p>已选商品 <span id="choosecount">0</span> 件</p>
                    <p>合计: <span id="totalprice">0.00</span> 元</p>
                    <button class="buygoods">购买商品</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    // <!-- 单机按钮总数加减 -->
    $(".addcount").click(function(){
        var num = 0;
        var a=$('.addcount').index(this);
        var oUnitPrice = document.getElementsByClassName("unitprice")[a];
        var oAllPrice = document.getElementsByClassName("allprice")[a];
        var oCount = document.getElementsByClassName("count")[a];
        if (oCount.value < 1){
            oCount.value = 1;
            num = parseFloat(oUnitPrice.innerText) * 1.0;
            oAllPrice.innerText = num.toFixed(2);
        }
        oCount.value++;
        num = parseFloat(oUnitPrice.innerText) * oCount.value;
        oAllPrice.innerText = num.toFixed(2);
    });

    $(".reducecount").click(function(){
        var num = 0;
        var a=$('.reducecount').index(this);
        var oUnitPrice = document.getElementsByClassName("unitprice")[a];
        var oAllPrice = document.getElementsByClassName("allprice")[a];
        var oCount = document.getElementsByClassName("count")[a];
        if (oCount.value < 2){
            oCount.value = 1;
            num = parseFloat(oUnitPrice.innerText) * 1.0;
            oAllPrice.innerText = num.toFixed(2);
        }
        oCount.value--;
        num = parseFloat(oUnitPrice.innerText) * oCount.value;
        oAllPrice.innerText = num.toFixed(2);
    });
    //    单击全选实现功能
    $("#userImportAll").click(function () {
        if($('#userImportAll').is(':checked')) {
            //    选中状态
            // 设置复选框微勾选状态
            $('.checkbox').prop('checked', true);
        }else{
            $('.checkbox').prop('checked', false);
        }
    });
    window.setInterval(function(){
        //    统计复选框选中个数
        var count = 0;
        var inputs = document.getElementsByClassName("checkbox");
        var oAllPrice = document.getElementsByClassName("allprice");
        var checked_counts = 0;
        for(var i=0;i<inputs.length;i++){
            if(inputs[i].checked){
                checked_counts++;
                count = count + oAllPrice[i].innerHTML * 1;
            }
        }
        document.getElementById("totalprice").innerHTML = count.toFixed(2);
        document.getElementById("choosecount").innerHTML = checked_counts;
    }, 100);

</script>
</body>
</html>