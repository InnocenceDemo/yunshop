<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>切换城市</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/template-web.js"></script>
	<script type="text/javascript">
        function findCity(elem) {
            var provinceid = elem.getElementsByTagName("span")[0].innerHTML;
            $.ajax({
                url: '${pageContext.request.contextPath}/yunshop/findCity',
                type: 'post',
                data: {provinceid: provinceid},
                dataType: 'json',
                success: function(data){
                    // 此处data为js对象
                    var html = template('template1', data);
                    $('.city').html(html);
                },
                error: function(error){
					console.log(error);
                },
                async: true
            })
        }
        function findCounty(elem) {
            var citycode = elem.getElementsByTagName("span")[0].innerHTML;
            $.ajax({
                url: '${pageContext.request.contextPath}/yunshop/findCounty',
                type: 'post',
                data: {citycode: citycode},
                dataType: 'json',
                success: function(data){
                    // 此处data为js对象
                    var html = template('template2', data);
                    $('.county').html(html);
                },
                error: function(error){
                    console.log(error);
                },
                async: true
            })

        }
	</script>
    <style>
		/* reset */
		html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,dl,dt,dd,ol,nav ul,nav li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
		article, aside, details, figcaption, figure,footer, header, hgroup, menu, nav, section {display: block;}
		ol,ul{list-style:none;margin:0;padding:0;}
		blockquote,q{quotes:none;}
		blockquote:before,blockquote:after,q:before,q:after{content:'';content:none;}
		table{border-collapse:collapse;border-spacing:0;}
		/* start editing from here */
		a{text-decoration:none;cursor: pointer}
		*{
			margin: 0px;
			padding: 0px;
		}
		body{
			width: 100%;
			height: auto;
			background-color: #fff;
		}
		#topmsg{
			width: 100%;
			height: 40px;
			background: #eeeeee;
			font-size: 22px;
			text-align: center;
			color: black;
		}
		#topmsg span{
			margin-left: 45%;
		}
		#main{
			width: 100%;
			height: auto;
			background: #eeeeee;
		}
		ul li{
			text-align: center;
		}
		ul li:hover{
			background-color: white;
		}
    </style>
</head>
<body style="height: 2000px;">
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div id="topmsg"><span>切换城市</span></div>
			<div id="main">

				<div class="row">
					<div class="col-md-4 col-sm-4 col-xs-4 province">
						<c:forEach items="${provinces}" var="province">
							<ul>
								<li style="margin-top: 10px;">
									<a onclick="findCity(this)">
											${province.provincename}<span style="display: none">${province.provinceid}</span>
									</a>
								</li>
							</ul>
						</c:forEach>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4 city">
						<script type="text/html" id="template1">
							<ul>
								{{ each citys as value i }}
								<li>
									<a onclick="findCounty(this)">
										{{value.cityname}}<span style="display: none">{{value.citycode}}</span>
									</a>
								</li><br/>
								{{ /each}}
							</ul>
						</script>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4 county">
						<script type="text/html" id="template2">
							<ul>
								{{ each countys as value i }}
								<li>
									<a href="${pageContext.request.contextPath}/yunshop/index/{{value.countycode}}">
										{{value.county}}<span style="display: none">{{value.countycode}}</span>
									</a>
								</li><br/>
								{{ /each}}
							</ul>
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>

