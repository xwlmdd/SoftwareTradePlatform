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
	href="<%=request.getContextPath()%>/css/web.css" media="all">
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
				<div class="col-lg-12" style="position: relative">
					<c:if test="${type==0}">
						<h3>
							${project.title}<span class="day"> 竞标中</span>
						</h3>
					</c:if>
					<c:if test="${type==1}">
						<h3>
							${project.title}<span class="day"> 正在开发</span>
						</h3>
					</c:if>
					<c:if test="${type==2}">
						<h3>
							${project.title}<span class="day"> 已完成</span>
						</h3>
					</c:if>

					<div style="padding-top: 10px; overflow: hidden;">
						<div class="left">
							<div class="content">项目名：${project.title}</div>

							<div class="content">发布人：${project.sendName}</div>

							<div class="content">项目类型：${project.type}</div>
							<div class="content">email：${project.email}</div>
							<div class="content">手机号码：${project.mobile}</div>
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
							<div id="message"></div>
							<c:if test="${type==0}">
								<div id="operater">
									<div>
										<p>请输入您竞标的竞价：</p>
										<input type="text" id="jiage" name="jingjia" />
									</div>
									<br>
									<div id="jingjia" title="我要竞标"
										style="width: 900px; height: 40px; background: #2EB135; padding-left: 420px; padding-top: 13px;">
										<h4>
											<font color="white">我要竞标</font>
										</h4>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	$(document).ready(function() {
		$("#jingjia").click(function() {
			var jiage = $("#jiage").val();
			alert(jiage);
			var url = "<%=request.getContextPath()%>/stp/jingbiao";
				$.ajax({
					url : url,
					dataType : "json",
					cache : false,
					type : "POST",
					data : {
						"projectId" : "${project.id}",
						"acceptId" : "${u.id}",
						"jingjia" : jiage
					},
					success : function(json) {
						$("#message").html("参加竞标成功!");
						$("#operater").remove();
						alert("操作成功!");
					}
				});
			});
		});
	</script>

	<footer></footer>

</body>
</html>