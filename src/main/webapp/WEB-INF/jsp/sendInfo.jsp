<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
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

						<div class="row role-intro">
							<div class="col-sm-2 col-md-2 role-intro-slider">
								<div class="defaultimg">
									<div class="settingimg">
										<a href="http://www.sxsoft.com/upload_img">更换头像</a>
									</div>
									<img
										src="<%=request.getContextPath()%>/images/defaultimg_108.png"
										title="xwlmdd" alt="xwlmdd" class="img-rounded">
								</div>
								<div class="material_txt">
									<a class="btn btn-success"
										href="<%=request.getContextPath()%>/stp/loadUserInfo?id=${u.id}&type=1">修改资料</a>
								</div>
							</div>

							<div class="col-sm-10 col-md-10 role-introl-content account">
								<div class="row role-user-info">
									<h3 class="col-sm-4 col-md-4 nopadding">
										<a href="http://www.sxsoft.com/user/history/285177"
											class="nowrap col-sm-12 text-left">${u.name}</a>
									</h3>
								</div>
								<div class="hide"></div>

							</div>
						</div>

						<div id="dialog-upload" class="hide">
							<a><input type="hidden" id="formid"></a>
							<div class="warnbox">
								<form action="http://www.sxsoft.com/my/user/upload"
									method="post" id="formID" enctype="multipart/form-data">
									<div class="upload_window">
										<input type="file" name="filename" id="fileToUpload" class=""
											value="" style="width: 225px;"> <input type="submit"
											class="btn" name="ok_new" value="上传头像">
										<p>仅限上传JPG、GIF、PNG文件，100KB以下</p>
									</div>
								</form>
							</div>
						</div>

						<div class="row role-content">

							<h2>正在审批项目状态</h2>
							<table class="table table-recommend">
								<thead>
									<tr>
										<th scope="col">项目</th>
										<th scope="col">项目状态</th>
										<th scope="col">发布日期</th>
										<th scope="col">项目详情</th>
										<th scope="col">操作</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td colspan="5">没有最新的项目动态</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
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