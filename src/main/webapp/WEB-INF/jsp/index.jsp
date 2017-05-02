<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>软件项目交易网</title>
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
								<c:if test="${u!=null}">
									<li class="project_nav"><a class="active"
										href="<%=request.getContextPath()%>/stp/loadUserInfo?id=${u.id}&type=${u.type}">${u.name}个人中心</a></li>
								</c:if>
								<c:if test="${u==null}">
									<div class="navbar-login">
										<a class="login_btn"
											href="<%=request.getContextPath()%>/stp/toLogin">登录</a> <a
											class="reg_btn"
											href="<%=request.getContextPath()%>/stp/toRegister">注册</a>
									</div>
								</c:if>
							</ul>


						</div>

					</nav>
				</div>
			</div>
		</div>
	</header>

	<style>
.carousel-caption a {
	padding: 1.5% 14.5%;
}

.carousel-caption .col-md-6 {
	margin-bottom: 0%;
}

.item .text-left, .item .text-right {
	padding-top: 0;
	padding-bottom: 0
}

.cursor-pointer {
	cursor: pointer
}
</style>

	<div class="container-fluid">
		<div class="row">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"
						class=""></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div class="col-md-12">
							<img src="<%=request.getContextPath()%>/images/banner1.jpg"
								width="100%" alt="IT需求 找人  软件项目交易网">
							<div class="carousel-caption carousel-active"
								style="padding-bottom: 10px;">
								<div class="col-md-6 text-right">
									<a href="http://www.sxsoft.com/project/fastPub">&nbsp;</a>
								</div>
								<div class="col-md-6 text-left">
									<a href="http://www.sxsoft.com/page/user">&nbsp;</a>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="col-md-12">
							<img src="<%=request.getContextPath()%>/images/banner2.jpg"
								alt="独立程序员 找项目 软件项目交易网 " width="100%">
							<div class="carousel-caption carousel-active"
								style="margin-bottom: 0.3%; padding-top: 12px; padding-bottom: 10px;">
								<div class="col-md-2 carousel-control text-right"
									style="margin-left: 12%;">
									<a style="position: absolute; display: block; width: 100%;"
										href="http://www.sxsoft.com/register">&nbsp;</a>
								</div>
								<div class="col-md-10  carousel-control text-left"
									style="margin-left: 25%; height: 40px;">
									<a
										style="position: absolute; left: -10px; display: block; width: 100%;"
										href="http://www.sxsoft.com/page/user">&nbsp;</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column tab">
				<div class="hd">
					<ul class="list-unstyled">
						<li class="on"><a>最新发布项目</a></li>
						<li style="border: 0;"><a></a></li>
						<li class="on"><a>寻找接包人</a></li>
					</ul>
				</div>
				<div class="bd">
					<ul class="list-unstyled">
						<table width="100%" border="0" style="table-layout: fixed">
							<colgroup>
								<col style="width: 150px">
								<col style="width: 340px">
								<col style="width: 130px;">
								<col style="width: 90px;">
								<col style="width: 120px;">
								<col style="width: 80px;">
								<col style="width: 80px;">
							</colgroup>
							<tbody>
								<tr class="bd-table-title">
									<td>&nbsp;</td>
									<td>标题</td>
									<td>项目预算</td>
									<td>开发周期</td>
									<td>发布日期</td>
									<td>已有竞标</td>
									<td>&nbsp;</td>
								</tr>
								<c:forEach items="${projectList}" var="project">
									<tr class="bd-table-tr">
										<td class="pro"><a href="#" target="_blank"> <span
												class="label label-software"> ${project.type }</span>
										</a></td>
										<td><a class="nowrap"
											style="display: block; width: 300px; float: left;"
											title="${project.title}"
											href="<%=request.getContextPath()%>/stp/lookProject?projectId=${project.id}&type=-999"
											target="_blank"> <b>${project.title}</b>
										</a><span class="label label-new" style="font-size: 12px;">new</span>
										</td>
										<td><span class="red">${project.yusuan}</span></td>
										<!--<td>江苏省 南京市</td>-->
										<td>${project.zhouqi}</td>
										<td><fmt:formatDate value="${project.createTime}"
												pattern="yyyy/MM/dd" /></td>
										<td>1</td>
										<td><span class="label label-red">竞标中</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</ul>
				</div>
			</div>

		</div>
	</div>
	<script src="<%=request.getContextPath()%>/js/jquery.SuperSlide.js"></script>
	<div class="clear"></div>
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