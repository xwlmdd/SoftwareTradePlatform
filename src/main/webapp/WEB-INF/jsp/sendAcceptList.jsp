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
	<jsp:include page="sendHead.jsp" />
	<div
		class="col-xs-9 col-sm-9 col-md-9 main-user-content nopadding-right">
		<div class="main-content">
			<div class="row role-content">
				<h2>我的项目:${project.title};预算${project.yusuan}</h2>
				<table class="table table-recommend">
					<thead>
						<tr>
							<th scope="col">竞标人名称</th>
							<th scope="col">擅长领域</th>
							<th scope="col">报价</th>
							<th scope="col">邮箱</th>
							<th scope="col">电话</th>
							<th scope="col">日期</th>
							<th scope="col">查看详细情况</th>
							<th scope="col">选择该接包人</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${jingBiaoList==null}">
							<tr>
								<td colspan="5">没有最新的项目动态</td>
							</tr>
						</c:if>
						<c:if test="${jingBiaoList!=null}">
							<c:forEach items="${jingBiaoList}" var="jingBiao">
								<tr>
									<td>${jingBiao.name}</td>
									<td>${jingBiao.skill}</td>
									<td>${jingBiao.jingjia}</td>
									<td>${jingBiao.email}</td>
									<td>${jingBiao.mobile}</td>
									<td><fmt:formatDate value="${jingBiao.createTime}"
											pattern="yyyy/MM/dd" /></td>
									<td><a
										href="<%=request.getContextPath()%>/stp/acceptDetail?projectId=${jingBiao.projectId}&acceptId=${jingBiao.acceptId}">查看竞标人详细情况</a>
									</td>
									<td><a
										href="<%=request.getContextPath()%>/stp/choose?id=${u.id}&projectId=${jingBiao.projectId}&acceptId=${jingBiao.acceptId}">确定</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<!-- /container -->
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