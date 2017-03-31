<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>后台管理</title>
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
							<a class="logo" href="javascript:void(0);"><img
								src="<%=request.getContextPath()%>/images/logo.png"
								alt="软件项目交易网"></a>
						</div>
						<div class="navbar-meun">
							<ul class="list-unstyled">
								<li><a href="javascript:void(0);">后台管理平台</a></li>
								<li><span>${admin.name}</span></li>
								<li><a
									href="<%=request.getContextPath()%>/stp/adminLogout">退出</a></li>
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
						<a href="http://www.sxsoft.com/my/user">后台管理平台</a>
					</div>
					<ul class="list-unstyled onelevel">
						<li><span>项目管理</span>
							<ul class="list-unstyled twolevel">
								<li><a href="<%=request.getContextPath()%>/stp/checkProject?checkCode=0">待审批项目</a>
								</li>
								<li><a href="<%=request.getContextPath()%>/stp/checkProject?checkCode=-1">已审批项目</a>
								</li>
							</ul></li>
						
					</ul>
				</div>
	<div
		class="col-xs-9 col-sm-9 col-md-9 main-user-content nopadding-right">
		<div class="main-content">
			<div class="row role-content">
				<h2>审批项目</h2>
				<table class="table table-recommend">
					<thead>
						<tr>
							<th scope="col">项目</th>
							<th scope="col">项目类型</th>
							<th scope="col">项目状态</th>
							<th scope="col">发布日期</th>
							<th scope="col">查看项目详情</th>
							<th scope="col">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${projectList==null}">
							<tr>
								<td colspan="5">没有最新的项目动态</td>
							</tr>
						</c:if>
						<c:if test="${projectList!=null}">
							<c:forEach items="${projectList}" var="project">
								<tr>
									<td>${project.title }</td>
									<td>${project.type }</td>
									<td>未审批</td>
									<td><fmt:formatDate value="${project.createTime}"
											pattern="yyyy/MM/dd" /></td>
												<td>
											<a target="_blank"
											href="<%=request.getContextPath()%>/stp/lookProjectDetail?projectId=${project.id}">查看项目详情</a>
										</td>
										<td><a
											href="<%=request.getContextPath()%>/stp/check?projectId=${project.id}&flag=1">通过</a>
											||<a
											href="<%=request.getContextPath()%>/stp/check?projectId=${project.id}&flag=0">不通过</a>
										</td>
									
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<footer></footer>
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
	left: -57px;
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

			$.ajax({
				type : 'post',
				url : '/page/help/getUserLogo',
				dataType : 'text',
				data : '',
				complete : function(response) {
					$('#userALogo').html(response.responseText);
				}
			});
		});
		function cgpwd() {
			$("#yzm").attr('src', '/authpic/getcode/' + new Date().getTime());
			$("#authcode").val('');
		}
	</script>



</body>
</html>