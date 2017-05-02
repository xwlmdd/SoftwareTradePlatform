<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>发包方注册页 </title>
<link rel="archives" title="软件项目交易网" href="http://www.sxsoft.com/">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/web.css" media="all">
<style>
.navbar-login a {
	font-size: 16px;
	line-height: 44px;
}

.navbar-login {
	margin-right: 10%;
}

header.navbar {
	border-bottom: 1px solid #ccc;
}
</style>
<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</head>
<body>
	<header class="navbar">
		<div class="container top">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar" role="navigation">
						<div class="navbar-header">
							<a class="logo" href="http://www.sxsoft.com/"><img
								src="<%=request.getContextPath()%>/images/logo.png"></a>
						</div>
						<div class="navbar-login">
							<a class="green" href="<%=request.getContextPath()%>/stp/loadIndexProject"><b>首页</b></a>
						</div>
						<div class="navbar-login">
							<a class="green" href="<%=request.getContextPath()%>/stp/toLogin"><b>登录</b></a>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/autoMail.js"></script>
	<style>
.register .col-sm-1 {
	width: 12%;
}
</style>
	<div class="row no-row">
		<div class="container">
			<div class="col-lg-12">
				<div class="row register register-write">
					<div class="row">
						<h3 style="padding-left: 19%;">用户注册</h3>
						<div class="col-lg-12 flow-path-onestep"></div>
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="row">

						<div class="col-lg-12">
							<form id="formID" class="form-horizontal"
								action="<%=request.getContextPath()%>/stp/register"
								method="post">
								<div class="form-group">
									<label class="col-sm-1 control-label">&nbsp;</label>
									<div class="col-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i></i></span> <input
												maxlength="15" class="form-control input_public"
												placeholder="用户名" id="huiyuanming" name="name" type="text">
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
								<br>
								<div class="form-group">
									<label class="col-sm-1 control-label">&nbsp;</label>
									<div class="col-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i></i></span> <input
												id="regemail" class="form-control input_public"
												placeholder="常用邮箱" name="email" type="text">
										</div>
									</div>
								</div>
								<div class="clear"></div>
								<br>
								<div class="form-group">
									<label class="col-sm-1 control-label">&nbsp;</label>
									<div class="col-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i></i></span> <input
												id="mobilck" class="form-control input_public"
												placeholder="手机号码" name="mobile" type="text">
										</div>
									</div>
								</div>
								<div class="clear"></div>
								<br>
								<div class="form-group">
									<label class="col-sm-1 control-label">&nbsp;</label>
									<div class="col-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i></i></span> <input
												id="pwd" class="form-control input_public" maxlength="20"
												placeholder="密码" name="pwd" type="password">
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
								<br>
								<div class="form-group">
									<label class="col-sm-1 control-label">&nbsp;</label>
									<div class="col-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i></i></span> <select
												name="type" style="width: 342px; height: 34px" class="form-control input_public">
												<option value="0">接包方</option>
												<option value="1">发包方</option>
											</select>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
								<br>
								<div class="clearfix"></div>
								<br>
								<div class="form-group">
									<label class="col-sm-1 control-label">&nbsp;</label>
									<div class="col-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i></i></span> 
											<textarea class="form-control input_public" placeholder="简介"  rows="6" cols="54" name="introduce"></textarea>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
								<br>
								<div class="form-group">
									<label class="col-sm-1 control-label"></label>
									<div class="col-sm-4">
										<input class="btn btn-success" id="Subtn" value="同意协议并注册"
											type="submit"> <span class="bottom_align"></span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
	<div class="clear"></div>
	<footer>
	</footer>
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



	<div
		style="position: absolute; left: 774.1px; top: 443.35px; height: 20px; width: 280px; margin: 5px 0px 0px 5px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: inline-block; vertical-align: middle;"
		id="pwdTip" class="onShow"></div>
	<div
		style="position: absolute; left: 774.1px; top: 244.9px; height: 20px; width: 280px; margin: 5px 0px 0px 5px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: inline-block; vertical-align: middle;"
		id="huiyuanmingTip" class="onShow"></div>
	<div
		style="position: absolute; left: 774.1px; top: 311.05px; height: 20px; width: 280px; margin: 5px 0px 0px 5px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: inline-block; vertical-align: middle;"
		id="regemailTip" class="onShow"></div>
	<div
		style="position: absolute; left: 774.1px; top: 377.2px; height: 20px; width: 280px; margin: 5px 0px 0px 5px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: inline-block; vertical-align: middle;"
		id="mobilckTip" class="onShow"></div>
	<div id="mailBox"
		style="top: 341.04998779296875px; left: 451.1000061035156px; width: 313px"></div>
</body>
</html>