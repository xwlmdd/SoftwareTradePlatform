<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
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
<script type="text/javascript">
$(function() {
	$('#changePic').click(function() {
		$("#myform").submit();
	});
});
</script>
	
</head>
<body>
	<jsp:include page="acceptHead.jsp" />
	<div
		class="col-xs-9 col-sm-9 col-md-9 main-user-content nopadding-right">
		<div class="main-content">

			<div class="row role-intro">
				<div class="col-sm-2 col-md-2 role-intro-slider">
					<div class="defaultimg" style="width: 140px;height: 180px">
						<img src="<%=request.getContextPath()%>/images/${u.pic}"
							class="img-rounded">
					</div>
						<form action="${pageContext.request.contextPath }/stp/changePic"
							method="post" id="myform" enctype="multipart/form-data">
							<input name="pic" type="file"> 
							<input type="hidden" name="id" value="${u.id}" /> 
							<input type="hidden" name="type" value="${u.type}" />
						</form>
						<div class="settingimg" >
							<a id="changePic" class="btn btn-success"
							href="javascript:void(0);">更换头像</a>
						</div>
					<div class="material_txt">
						<a class="btn btn-success"
							href="<%=request.getContextPath()%>/stp/toUpdateUserInfo?id=${u.id}&type=0">修改资料</a>
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
					<form action="http://www.sxsoft.com/my/user/upload" method="post"
						id="formID" enctype="multipart/form-data">
						<div class="upload_window">
							<input type="file" name="filename" id="fileToUpload" class=""
								value="" style="width: 225px;"> <input type="submit"
								class="btn" name="ok_new" value="上传头像">
							<p>仅限上传JPG、GIF、PNG文件，100KB以下</p>
						</div>
					</form>
				</div>
			</div>

			<div class="main-content">
				<div class="col-md-12 nopadding">
					<div class="col-sm-8 col-md-8 col-lg-8 nopadding">
						<div class="refound-account fund-account board">
							<form class="form-horizontal" id="formID"
								action="<%=request.getContextPath()%>/stp/updateUserInfo">

								<div class="form-group">
									<span class="red">*E-mail：${u.email}</span>
								</div>

								<div class="form-group">
									<span class="red">*联系人：${u.realName}</span>
								</div>

								<div class="form-group">
									<span class="red">*联系手机：${u.mobile}</span>
								</div>

								<div class="form-group">
									<span class="red">*擅长：${u.skill}</span>
								</div>
								<div class="form-group">
									<span class="red">*技能：${u.jishu}</span>
								</div>
								<div class="form-group">
									<span class="red">*简介：${u.introduce}</span>
								</div>
							</form>
						</div>
					</div>
				</div>
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