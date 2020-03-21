<%--
  Created by IntelliJ IDEA.
  User: owner
  Date: 2020/2/23
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
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
        body{
            background-image: url("${pageContext.request.contextPath}/img/p_big3.jpg");
        }
        h3{
            font-size: 36px;
        }
        .row{
            width: 422px;
            height: 333px;
            background-color: white;
            text-align: center;
            margin: 20% auto;
        }
        .row .forminput{
            width: 90%;
            height: 70px;
        }
        .row .forminput input{
            width: 90%;
            height: 40px;
            margin-left: 10%;
        }
        .row .forminput span{
            color: red;
        }
        .row input[type="submit"]{
            width: 70%;
            height: 50px;
            background-color: #49afcd;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <form action="${pageContext.request.contextPath}/yunshop/login" method="post" onsubmit="return checkSub()">
                <h3>登录账号</h3><br>
                <div class="forminput">
                    <input type="text" placeholder="输入手机号" name="uphone" id="phone" onblur="checkPhone()" class="loginform">
                    <span id="phoneSpan"></span><br>
                </div>

                <div class="forminput">
                    <input type="password" placeholder="输入密码" name="password" id="password" class="loginform"><br>
                </div>

                <input type="submit" value="登录">
                <br><br>
                <a href="${pageContext.request.contextPath}/yunshop/reg">注册账号</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#">忘记密码</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
