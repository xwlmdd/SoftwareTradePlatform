<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>快速发布项目</title>
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
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"
	type="text/javascript"></script>

<!--[if lt IE 8]>
	<link href="/css/bootstrap-ie7.css" rel="stylesheet">
	<![endif]-->
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
								<li class="user_nav"><a
									href="<%=request.getContextPath()%>/stp/loadIndexProject">精致文章</a></li>
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
.services {
	margin-top: 20px;
}

.yusuan_tip {
	font-size: 12px;
	background-color: #F7FCFE;
	border: 1px solid #CCCCCC;
	float: left;
	padding: 6px;
	margin-top: 6px;
	width: 500px;
}

ul.classify li {
	float: left;
	background: #fafafa;
	border: 1px solid #ddd;
	font-size: 12px;
	color: #666;
	padding: 3px;
	border-radius: 5px;
	margin: 3px 2px;
}

#fast_pub a.fastcurrent li {
	background: #2d89ef;
	color: #fff;
	border-radus: 5px;
}

ul.classify  a {
	cursor: pointer;
}

#fast_pub ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.form-group {
	margin-bottom: 20px;
}

#xiangmuyusuanTip, #lianxirenTip, #regemailTip {
	margin-top: 0 !important;
}
</style>
	<div class="container-fluid n_banner">
		<a href="http://www.sxsoft.com/project/fastPub"
			style="background: url(<%=request.getContextPath()%>/images/banner1.jpg) no-repeat center center;"></a>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<div class="col-sm-9 col-md-9" id="fast_pub">
					<h2>
						<font color="red">${message}</font>
					</h2>
					<form class="form-horizontal" id="formID"
						action="<%=request.getContextPath()%>/stp/publicProject">
						<input type="hidden" value="${u.id }" name="sendId" />
						<div class="clear"></div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span class="red">*</span>项目标题</label>
							<div class="col-sm-6">
								<input type="text" class="form-control input_public" id="biaoti"
									name="title">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span class="red">*</span>项目类型</label>
							<div class="col-sm-6">
								<select name="type" style="width: 342px; height: 34px"
									class="form-control input_public">
									<option value="互联网应用">互联网应用</option>
									<option value="桌面应用">桌面应用</option>
									<option value="移动应用">移动应用</option>
									<option value="设计与数字媒体">设计与数字媒体</option>
									<option value="数据分析与大数据">数据分析与大数据</option>
									<option value="智能硬件">智能硬件</option>
									<option value="其它分类项目">其它分类项目</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
								class="red">*</span>项目预算</label>
							<div class="col-sm-9 col-md-9 col-lg-9">
								<select name="yusuan" class="form-control input_public">
									<option value="1千以下">1千以下</option>
									<option value="1千~5千">1千~5千</option>
									<option value="5千~1万">5千~1万</option>
									<option value="1万~5万">1万~5万</option>
									<option value="5万~10万">5万~10万</option>
									<option value="10万以上">10万以上</option>
									<option value="待商议">待商议</option>
								</select> <span id="xiangmuyusuanTip" class="onShow"
									style="margin: -5px 0px 0px; padding: 0px; background: transparent; display: inline-block; vertical-align: middle; left: 944.75px; top: 369px;"></span>
								<input id="xiangmuyusuan" type="hidden" name="xiangmuyusuan"
									value=""> <span class="orange yusuan_tip">温馨提示：为了保证您的项目成功开发完工，我们建议您将预算控制在1千到1万元之间，大的项目建议您在合理拆分成若干小项目后再发布，这样将提高成功率。</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
								class="red">*</span>项目描述</label>
							<div class="col-sm-8 col-md-8 col-lg-8">
								<textarea name="desc" class="form-control" id="miaoshu"
									cols="40" rows="6"></textarea>
								<div style="margin-top: 5px;">
									<span id="miaoshuTip" class="onShow"
										style="margin: -5px 0px 0px; padding: 0px; background: transparent; display: inline-block; vertical-align: middle;"></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
								class="red">*</span>联系方式</label>
							<div class="col-sm-4 col-md-4 col-lg-4"
								style="padding-right: 5px;">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input
										class="form-control input_public" id="lianxiren"
										name="sendName" type="text" placeholder="联系人姓名">
								</div>
								<div class="input-group">
									<span id="lianxirenTip" class="onShow"
										style="margin: -5px 0px 0px; padding: 0px; background: transparent; display: inline-block; vertical-align: middle;"></span>
								</div>
							</div>
							<div class="col-sm-4 col-md-4 col-lg-4 form-col-sm-padding">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input
										class="form-control input_public" id="regemail" name="email"
										type="text" placeholder="常用邮箱" value="">
								</div>
								<div class="input-group"
									style="padding-left: 0; padding-right: 0">
									<span id="regemailTip" class="onShow"
										style="margin: -5px 0px 0px; padding: 0px; background: transparent; display: inline-block; vertical-align: middle;"></span>
								</div>
							</div>
						</div>
						<div class="form-group clearfix">
							<label class="col-sm-3 col-md-3 col-lg-3 control-label">其他方式</label>
							<div class="col-sm-4 col-md-4 col-lg-4"
								style="padding-right: 5px;">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-phone"></i></span> <input
										class="form-control input_public" name="mobile" type="text"
										placeholder="手机号" id="mobile">
								</div>
								<div class="input-group" style="margin-top: 5px;">
									<span id="mobilckTip" class="onShow"
										style="margin: -5px 0px 0px; padding: 0px; background: transparent; display: inline-block; vertical-align: middle;"></span>
								</div>
							</div>
							<div class="col-sm-4 col-md-4 col-lg-4 form-col-sm-padding">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="icon_contactqq"></i></span> <input class="form-control"
										id="prependedInput" name="qq" type="text" placeholder="QQ">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 col-md-3 col-lg-3 control-label"></label>
							<div class="col-sm-6 col-md-6 col-lg-6">
								<input class="col-sm-4 col-md-4 col-lg-4 btn btn-primary"
									type="submit" id="Subtn" value="提交">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


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





	<div
		style="position: absolute; left: 715.75px; top: 311px; height: 20px; width: 280px; margin: 5px 0px 0px 5px; padding: 0px; background: transparent; display: inline-block; vertical-align: middle;"
		id="biaotiTip" class="onShow"></div>
</body>
</html>