<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>接包方详细信息</title>
<link rel="archives" title="软件项目交易网" href="http://www.sxsoft.com/">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.ui.customer.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/web.css" media="all">
<script src="<%=request.getContextPath()%>/js/hm.js"></script>

<style type="text/css">
.state_jingbiaozhong, .state_zhongbiao, .state_luoxuan {
	background: url(/images/state_jingbiaozhong.png) no-repeat;
	width: 45px;
	height: 25px;
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
}

.state_zhongbiao {
	background-position: 0 -50px;
}

.state_luoxuan {
	background-position: 0 -25px;
}
</style>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery-ui-1.10.4.custom.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/formValidator-4.1.3.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"
	type="text/javascript"></script>

<!--[if lt IE 8]>
	<link href="/css/bootstrap-ie7.css" rel="stylesheet">
	<![endif]-->
</head>
<body class="global-main search_user">
	<header class="navbar">
		<div class="container top">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar" role="navigation">
						<div class="navbar-header">
							<a class="logo" href="http://www.sxsoft.com/"><img
								src="<%=request.getContextPath()%>/images/logo.png"
								alt="软件项目交易网"></a>
						</div>
						<div class="navbar-meun">
							<ul class="list-unstyled">
								<li class="project_nav"><a
									href="http://www.sxsoft.com/page/project">项目资讯</a></li>
								<li class="user_nav"><a class="active"
									href="http://www.sxsoft.com/page/user">接包达人</a></li>
							</ul>
						</div>
						<div class="navbar-login">
							<a class="reg_btn" href="javascript:;">${u.name}个人中心</a> <a
								class="login_btn"
								href="<%=request.getContextPath()%>/stp/logout">退出</a>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<div class="container user">
		<div>
			<i class="pic"><img src="" width="120" height="120"></i>
			<p style="padding-left: 100px; font-size: 22">姓名：${accept.name}</p>
			<p style="padding-left: 100px; font-size: 14">邮箱：${accept.email}</p>
			<p style="padding-left: 100px; font-size: 14">电话：${accept.mobile}</p>
			<p style="padding-left: 100px; font-size: 14">擅长领域：${accept.skill}</p>
			<p style="padding-left: 100px; font-size: 14">承接项目数：${num}</p>
			<p style="padding-left: 100px; font-size: 14">简介:${accept.introduce}</p>
		</div>
	</div>
	<div class="container det">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<div class="left">
					<div class="Tabs" id="Tabs" style="margin-top: 34px;">
						<div class="TabTitle">
							<ul id="tabCg" class="nav nav-tabs">
								<li id="Tabs_Title0" class="active"><a
									href="javascript:void(0);">参与的外包项目</a></li>
							</ul>
						</div>
						<div class="TabContent">
							<div id="Tabs_Content0">
								<div id="projectJilu">
									<ul class="list-unstyled">
										<c:forEach items="${proDetailList}" var="proDetail">
											<li>
												<div class="b_right">
													<div class="clearfix"></div>
													<span><a
														href="http://www.sxsoft.com/user/history/276789"> </a>
														给的项目外包评价：${proDetail.projectTitle} <b class="org"> </b></span> <span>质量评分：${proDetail.quality}</span>
													<span>专业评分：${proDetail.zhuanye}</span> <span>服务评分：${proDetail.fuwu}</span>
													<span>速度评分：${proDetail.speed}</span>
												</div>
											</li>
										</c:forEach>
									</ul>
									<br>
								</div>
								<div id="example" class="pagination pagination-right">
									<ul>
										<li class="active"><a title="Current page is 1">1</a></li>
										<li><a class="black" title="Go to next page">&gt;</a></li>
									</ul>
								</div>
								<script type="text/javascript"
									src="<%=request.getContextPath()%>/js/bootstrap-paginator.min.js"></script>

								<span style="font-family: &amp; amp;"><span
									style="white-space: normal;"> </span></span>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer> </footer>
	<style>
.sidebar_code2 {
	display: block;
	text-align: center;
	width: 45px;
	height: 45px;
	cursor: pointer;
}

.sidebar_code2 .code2s {
	text-align: center;
	line-height: 45px;
	font-size: 24px;
	color: #ffffff;
	position: relative;
}

.code2s:before {
	position: relative;
	z-index: 1;
}

.code2b {
	position: absolute;
	width: 102px;
	height: 102px;
	left: -17px;
	top: 233px;
	z-index: 3;
	border-right: none 0;
	background-color: #fff;
}

.code2b img {
	border: none 0;
	width: 100px;
	height: 100px;
}
</style>


	<script type="text/javascript">
		$(function() {
			$('#myCarousel1').carousel({
				interval : 4000
			});
			$("div.accordion-heading-running").mousemove(function() {
				$("div.accordion-body-running").removeClass("in");
				$(this).next().addClass("in");
				$(this).mouseout(function() {
					$(this).removeClass("in");
				});
			});
			$("div.accordion-heading-finish").mousemove(function() {
				$("div.accordion-body-finish").removeClass("in");
				$(this).next().addClass("in");
				$(this).mouseout(function() {
					$(this).removeClass("in");
				});
			});
			$('.jbf_search_input').click(function() {
				$('.jbf_search_input').val('');
			});

			if ($("#yzm").length > 0) {
				cgpwd();
				$("#yzm").click(function() {
					cgpwd();
				});
			}

		});
		function cgpwd() {
			$("#yzm").attr('src', '/authpic/getcode/' + new Date().getTime());
			$("#authcode").val('');
		}
	</script>



</body>
</html>