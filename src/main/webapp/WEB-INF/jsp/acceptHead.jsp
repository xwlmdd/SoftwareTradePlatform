<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>接包方个人中心</title>
<link rel="archives" title="软件项目交易网" href="http://www.sxsoft.com/">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.ui.customer.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/application.css" media="all">
<script src="<%=request.getContextPath()%>/css/hm.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery-ui-1.10.4.custom.js."
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/formValidator-4.1.3.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body>
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
								<li><a href="<%=request.getContextPath()%>/stp/loadIndexProject">寻找项目</a></li>
								<li><a href="http://www.sxsoft.com/page/user">精选文章</a></li>
								<li class="user_nav"><a
									href="<%=request.getContextPath()%>/stp/loadUserInfo?id=${u.id}&type=${u.type}">${u.name}个人中心</a></li>
									<li class="user_nav"><a
									href="<%=request.getContextPath()%>/stp/logout">退出</a></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<div class="row main-user">
		<div class="container main-user-container">
			<div class="row main-user-container-row">
				<div
					class="col-xs-3 col-sm-3 col-md-3 nopadding-left main-user-slider">
					<div class="role">
						<a href="http://www.sxsoft.com/my/user">接包方个人中心</a>
					</div>
					<ul class="list-unstyled onelevel">
						<li><span>个人中心</span>
							<ul class="list-unstyled twolevel">
								<li><a
									href="<%=request.getContextPath()%>/stp/loadUserInfo?id=${u.id}&type=0">我的资料</a>
								</li>
								<li><a
									href="<%=request.getContextPath()%>/stp/toUpdateUserInfo?id=${u.id}&type=0">更新信息</a>
								</li>
							</ul></li>
						<li><span>项目管理</span>
							<ul class="list-unstyled twolevel">
								<li><a
									href="<%=request.getContextPath()%>/stp/loadProject?acceptId=${u.id}&ischeck=0">正在竞标项目</a>
								</li>
								<li><a
									href="<%=request.getContextPath()%>/stp/loadProject?acceptId=${u.id}&ischeck=1">正在开发项目</a>
								</li>
								<li><a
									href="<%=request.getContextPath()%>/stp/loadProject?acceptId=${u.id}&ischeck=2">已完成项目</a>
								</li>
							</ul></li>

						<li><span>推荐项目</span>
							<ul class="twolevel">
								<li><a
									href="<%=request.getContextPath()%>/stp/loadProject?skill={u.skill}">推荐项目</a>
								</li>
							</ul></li>
						<li><span>我要竞标</span>
							<ul class="twolevel">
								<li><a href="<%=request.getContextPath()%>/stp/loadIndexProject">我要竞标</a>
								</li>
							</ul></li>
					</ul>
				</div>