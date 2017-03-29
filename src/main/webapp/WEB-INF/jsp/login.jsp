<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>会员登录 </title>
<link rel="archives" title="软件项目交易网" href="http://www.sxsoft.com/">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css"
	media="all">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.css"
	media="all">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/web.css" media="all">
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
							<a class="green" href="<%=request.getContextPath()%>/stp/toRegister"><b>注册</b></a>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<style>
.register .col-sm-1 {
	width: 12%;
}

.no-row {
	padding-top: 100px;
	padding-bottom: 250px;
}

.slide-left {
	border-right: 1px dotted #000;
}

.slide-left h4, .register h4 {
	font-size: 20px;
	margin-bottom: 30px;
	color: #a7abaa;
}

.slide-left ul {
	list-style-type: none
}

.slide-left li {
	font-size: 14px;
	line-height: 32px;
}

.slide-left .fa-circle {
	margin-right: 10px;
	font-size: 10px;
	color: #62b861;
	line-height: 18px;
}
</style>
	<div class="row no-row">
		<div class="col-md-12">
			<div class="col-md-6">
				<div class="row slide-left">
					<h4 class="col-md-offset-6">关注微信&nbsp;&nbsp;有惊喜</h4>
					<div class="col-md-offset-3 col-md-9 col-sm-9">
						<div class="row">
							<div class="col-md-6 col-xs-6">
								<div class="form-group">
									<label class="col-sm-2 col-md-2 control-label">&nbsp;</label>
									<div class="col-sm-10 col-md-10">
										<span style="width: 200px;height:200px;"><img src="<%=request.getContextPath()%>/images/weixin.png" style="width:100%;height:100%"></span>
										<p class="green" style="text-align: center">欢迎关注微信公众账号</p>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-xs-6">
								<ul style="margin-left: -19px;padding-left: 16px;">
									<li><i class="fa fa-circle"></i>实时关注项目动态</li>
									<li><i class="fa fa-circle"></i>随时阅读技术文章</li>
									<li><i class="fa fa-circle"></i>收藏感兴趣的项目</li>
									<li><i class="fa fa-circle"></i>优质项目推送</li>
									<li><i class="fa fa-circle"></i>行业动态分享</li>
									<li><i class="fa fa-circle"></i>惊喜奖品等你拿</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row register register-write">
					<h4 style="padding-left: 25%;">会员登录</h4>
					<h4 style="padding-left: 25%;"><font color="red">${message}</font></h4>
					<form id="formID" class="form-horizontal" name="form" method="post"
						action="<%=request.getContextPath()%>/stp/login">
						<div class="form-group">
							<label class="col-sm-1 col-md-1 col-lg-1control-label">&nbsp;</label>
							<div class="col-sm-5 col-md-5 col-lg-5">
								<div class="input-group">
									<span class="input-group-addon"><i
										></i></span> <input
										class="form-control input_public input_error" id="name"
										name="name" placeholder="用户名"
										style="color: rgb(153, 153, 153);" value="${u.name }" type="text">
								</div>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-1 col-md-1 col-lg-1 control-label">&nbsp;</label>
							<div class="col-sm-5 col-md-5 col-lg-5">
								<div class="input-group">
									<span class="input-group-addon"><i
										></i></span> <input id="mima"
										class="form-control" name="pwd"
										placeholder="密码" value="${u.pwd}"
										
										type="password">
								</div>
							</div>
						</div>
						<br>
						<div class="form-group">
									<label class="col-sm-1 control-label">&nbsp;</label>
									<div class="col-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i></i></span> <select
												name="type" style="width: 221px; height: 34px" class="form-control input_public">
												<option value="0">接包方</option>
												<option value="1">需求方</option>
											</select>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
								<br>
						<div class="form-group">
							<label class="col-sm-1 col-md-1 col-lg-1 control-label">&nbsp;</label>
							<div class="col-sm-5 col-md-5 col-lg-5">
								<span><input class="box" name="keepPsd" type="checkbox">&nbsp;记住密码</span>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-1 col-md-1 col-lg-1 control-label">&nbsp;</label>
							<div class="col-sm-5 col-md-5 col-lg-5">
								<input id="Subtn" value="登&nbsp;录" class="btn btn-success"
									type="submit"> <span class="bottom_align"
									style="padding-left: 40%;"><a tabindex="-1"
									href="http://www.sxsoft.com/user/pass">忘记密码？</a></span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<script>
		document.form.username.focus();
		document.onkeydown = function(e) {
			if (!e)
				e = window.event;
			if ((e.keyCode || e.which) == 13) {
				$('#denglu').click();
			}
		}

		$(function() {
			var left = $('#usernameTip').css('left');
			$('#authcodeTip').css('left', left);
		});
	</script>

	<div class="clear"></div>
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
		style="position: absolute; left: 998.233px; top: 240px; height: 20px; width: 280px; margin: 5px 0px 0px 5px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: block; vertical-align: middle;"
		id="usernameTip" class="onError">
	</div>
	<div
		style="position: absolute; left: 998.233px; top: 306.15px; height: 20px; width: 280px; margin: 5px 0px 0px 5px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: none; vertical-align: middle;"
		id="mimaTip"></div>
</body>
</html>
</html>