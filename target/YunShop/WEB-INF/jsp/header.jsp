<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="header" class="wrap">
    <div id="banner">
        <a id="a1" href="${pageContext.request.contextPath}/yunshop/index"><b>首页</b></a>
        <a class="a2" href="${pageContext.request.contextPath}/yunshop/changecity">切换城市</a>
        <span><c:if test="${county == null}">北京市</c:if><c:if test="${county != null}">${county}</c:if></span>
    </div>

    <div id="navbar">
        <c:if test="${login_user==null}">
            <a id="a3" href="${pageContext.request.contextPath}/yunshop/login" style="font-size: 18px;float: right;margin-top: 18px;margin-right: 15%">登录</a>
        </c:if>
        <c:if test="${login_user != null}">
            <div class="userMenu">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/yunshop/logout">注销</a></li>
                    <li><a href="${pageContext.request.contextPath}/yunshop/${login_user.id}/cartShow">购物车</a></li>
                    <li><a href="orderlist.jsp">我的订单</a></li>
                    <li>
                        <img src="${pageContext.request.contextPath}/img/p_big3.jpg" alt="" style="cursor: pointer;width: 40px;height: 40px;margin-top: -8px;margin-left: -10px;border-radius: 50%;">
                    </li>
                    <li class="current" style="width: 150px;">
                        <font color="BLACK">欢迎您，<strong>${login_user.nickname}</strong></font>
                    </li>
                </ul>
            </div>
        </c:if>
    </div>
</div>