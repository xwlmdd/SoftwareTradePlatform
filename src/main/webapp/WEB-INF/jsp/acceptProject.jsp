<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>发包方个人中心</title>
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
	<jsp:include page="acceptHead.jsp" />
	<div
		class="col-xs-9 col-sm-9 col-md-9 main-user-content nopadding-right">
		<div class="main-content">
			<div class="row role-content">
				<h2>我的项目(${message})</h2>
				<br>
				<table class="table table-recommend">
					<thead>
						<tr>
							<th scope="col">项目</th>
							<th scope="col">项目类型</th>
							<th scope="col">项目状态</th>
							<th scope="col">发布日期</th>
							<th scope="col">报价</th>
							<th scope="col">发布人邮箱</th>
							<th scope="col">发布人电话</th>
							<th scope="col">发布人qq</th>
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
									<td><c:if test="${project.ischeck==0}">
														正在竞标
													</c:if> <c:if test="${project.ischeck==1}">
														正在开发
													</c:if> <c:if test="${project.ischeck==2}">
														已完成
													</c:if></td>
									<td><fmt:formatDate value="${project.createTime}"
											pattern="yyyy/MM/dd" /></td>
									<td>${project.jingjia }</td>
									<td>${project.email }</td>
									<td>${project.mobile }</td>
									<td>${project.qq }</td>
									<td><a
										href="<%=request.getContextPath()%>/stp/lookProject?projectId=${project.projectId}&type=${project.ischeck}">查看项目</a>
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
	<!-- /container -->
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



</body>
</html>