<%--
  Created by IntelliJ IDEA.
  User: owner
  Date: 2020/2/23
  Time: 19:08
  To change this template use File | Settings | File Templates.
  注册界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
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
            height: 533px;
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
        .row input[type="submit"],input[type="reset"]{
            width: 130px;
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
            <h3>注册账号</h3><br>
            <form action="${pageContext.request.contextPath}/yunshop/reg" method="post" onsubmit="return checkSub()">
                <div class="forminput">
                    <input type="text" placeholder="输入用户名" name="nickname" class="regform" id="name"
                           onblur="checkUserName()">
                    <span id="nameSpan"></span><br>
                </div>

                <div class="forminput">
                    <input type="text" placeholder="输入手机号" name="uphone" class="regform" id="phone"
                           onblur="checkPhone()">
                    <span id="phoneSpan"></span><br>
                </div>

                <div class="forminput">
                    <input type="password" placeholder="输入6位以上密码" name="password" class="regform" id="password"
                           onblur="isRegisterPassword()" alt="密码">
                    <span id="passwordSpan"></span><br>
                </div>

                <div class="forminput">
                    <input type="password" placeholder="确认密码" class="regform" id="password2"
                           onblur="againRegisterPassword()">
                    <span id="password2Span"></span><br>
                </div>

                <div class="forminput">
                    <input type="text" placeholder="输入身份证号" name="idcard" class="regform" id="idcard"
                           onblur="isCardNo()">
                    <span id="idcardSpan"></span>
                </div>

                <input type="submit" value="注册" class="regform"  id="submit"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" value="重置" class="regform"><br><br>
                <div><span>已有账号？</span><a href="${pageContext.request.contextPath}/yunshop/login">登录</a></div>
            </form>

        </div>
    </div>
</div>
<script type="text/javascript">
    //验证用户名
    function checkUserName() {
        var name = document.getElementById("name").value;
        var span = document.getElementById("nameSpan");
        if(name==null||name==""){
            span.innerText = "用户名不能为空";
            return false
        }else{
            span.innerText = "";
            return true
        }
    }

    //验证手机号
    function checkPhone() {
        var phone = document.getElementById('phone').value;
        var span = document.getElementById('phoneSpan');
        if (!(/^1[3456789]\d{9}$/.test(phone))) {
            span.innerText = "手机号码有误，请重填";
            // alert("手机号码有误，请重填");
            return false;
        } else {
            span.innerText = "";
            return true;
        }

    }

    //校验登录名：只能输入5-20个以字母开头、可带数字、“_”、“.”的字串
    function isRegisterPassword() {
        var pwd = document.getElementById("password").value;
        var span = document.getElementById("passwordSpan");
        //校验密码：只能输入6-20个字母、数字、下划线
        var patrn = /^(\w){6,20}$/;
        if (!patrn.exec(pwd)) {
            span.innerText = "请输入6~20位密码";
            return false
        }else{
            span.innerText = "";
            return true
        }
    }
    //确认密码
    function againRegisterPassword(){
        var pwd = document.getElementById("password").value;
        var pwd2 = document.getElementById("password2").value;
        var span = document.getElementById("password2Span");
        if(pwd != pwd2){
            span.innerText = "两次密码不匹配";
            return false
        }else{
            span.innerText = "";
            return true
        }
    }

    //验证身份证号是否规范
    function isCardNo() {
        var card = document.getElementById('idcard').value;
        var span = document.getElementById('idcardSpan');
        // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
        var reg = /(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (reg.test(card) === false) {
            span.innerText = "身份证输入不合法";
            return false;
        } else {
            span.innerText = "";
            return true;
        }

    }

    //提交判断是否有未填选项
    function checkSub() {
        checkUserName();
        checkPhone();
        isRegisterPassword();
        againRegisterPassword();
        isCardNo();
        return checkUserName()&&checkPhone()&&isRegisterPassword()&&againRegisterPassword()&&isCardNo();
    }
</script>
</body>
</html>
