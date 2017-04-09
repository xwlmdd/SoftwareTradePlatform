<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
</head>
<html lang="zh-CN">
<head>
<title>项目详细</title>
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
</head>
<body class="global-main">
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
								<li class="project_nav"><a class="active"
									href="<%=request.getContextPath()%>/stp/loadIndexProject">首页</a></li>
								<li class="user_nav"><a
									href="<%=request.getContextPath()%>/stp/loadIndexProject">精致文章</a></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<script type="text/javascript">
		$(function() {
			$('ul.dropdown-menu-search li a').click(function() {
				var value = $(this).attr('data');
				var data = $(this).html();
				$('#sousuoleixing').val(value);
				$('#datashowarea').html(data);
				$('.dropdown-menu-search').hide();
			});
			$('.dropdown-toggle-search').click(function() {
				$('.dropdown-menu-search').show();
			});
			var viewWidth = $(window).innerWidth();
			if (viewWidth < 1200) {
				$('.navbar-meun li').css('padding', '0 10px');
			}
		});
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/collection.js"></script>
	<div class="container det_banner">
		<a href="http://www.sxsoft.com/project/show/78080#" target="_blank"><img
			src="<%=request.getContextPath()%>/images/banner1.jpg" width="1140"
			alt="软件项目交易网项目流程"></a>
	</div>
	<div class="container det">
		<div class="row">
			<div class="col-lg-12" style="position: relative">
				<div style="padding-top: 10px; overflow: hidden;">
					<div class="left">
						<h2><font color="red">${message}</font></h2>
						<br>
						<div class="content">项目名：${project.title}</div>

						<div class="content">发布人：${project.sendName}</div>

						<div class="content">项目类型：${project.type}</div>
						<div class="content">email：${project.email}</div>
						<div class="content">手机号码：${project.mobile}</div>
						<div class="content">项目周期：${project.zhouqi}</div>
						<div class="content">

							发布时间：
							<fmt:formatDate value="${project.createTime}"
								pattern="yyyy/MM/dd" />
						</div>
						<div class="content">
							<div class="layer"
								style="line-height: 24px; border-bottom: 1px solid transparent;">
								${project.desc}</div>
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

</body>
</html>