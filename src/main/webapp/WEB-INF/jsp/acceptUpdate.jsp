<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>需求方修改资料</title>
<link rel="archives" title="软件项目交易网" href="http://www.sxsoft.com/">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/application.css" media="all">
<script src="<%=request.getContextPath()%>/js/hm.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui-1.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/formValidator-4.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"
	type="text/javascript"></script>
</head>
<body>
	<jsp:include page="acceptHead.jsp" />
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/area.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/multiple-select.js"></script>
	<div
		class="col-sm-9 col-md-9 col-lg-9 main-user-content nopadding-right">
		<div class="main-content">
			<div class="col-md-12 nopadding">
				<div class="col-sm-8 col-md-8 col-lg-8 nopadding">
					<div class="refound-account fund-account board">
						<h1 class="lead">
							修改资料 <span>${message}</span><span class="pull-right"> <a
								href="http://www.sxsoft.com/my/user/editloginpwd"
								class="btn btn-primary btn-primary-white btn-sm">修改密码</a>
							</span>
						</h1>

						<form class="form-horizontal" id="formID"
							action="<%=request.getContextPath()%>/stp/updateUserInfo">
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
									class="red">*</span>E-mail：</label>
								<div class="col-sm-5 col-md-5 col-lg-5" style="padding-right: 0">
									<div class="input-group">
										<span class="input-group-addon"><i></i></span> <input
											value="${u.email}" name="email" class="form-control"
											type="text">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
									class="red">*</span>联系人：</label>
								<div class="col-sm-5 col-md-5 col-lg-5">
									<div class="input-group">
										<span class="input-group-addon"></span> <input
											value="${u.realName}" id="lianxiren" name=realName
											placeholder="联系人" style="color: rgb(153, 153, 153);"
											type="text">
									</div>
								</div>
								<div class="col-sm-4 col-md-4 col-lg-4"
									style="padding-left: 0; padding-top: 7px;">
									<span id="lianxirenTip"
										style="margin: -5px 0px 0px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: inline-block; vertical-align: middle;"
										class="onError"><span><span class="onError_top">联系人不能为空，请填写</span><span
											class="onError_bot"></span></span></span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
									class="red">*</span>联系手机：</label>
								<div class="col-sm-5 col-md-5 col-lg-5" style="padding-right: 0">
									<div class="input-group">
										<span class="input-group-addon"><i></i></span> <input
											id="mobilck" name="mobile" value="${u.mobile }"
											placeholder="手机" type="text">
									</div>
								</div>
								<div class="col-sm-4 col-md-4 col-lg-4"
									style="padding-left: 0; padding-top: 7px;">
									<span id="mobilckTip"
										style="margin: -5px 0px 0px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: none; vertical-align: middle;"
										class="onFocus"><span><span class="onFocus_top">手机号码必须填写</span><span
											class="onFocus_bot"></span></span></span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-3 control-label">联系QQ：</label>
								<div class="col-sm-5 col-md-5 col-lg-5" style="padding-right: 0">
									<div class="input-group">
										<span class="input-group-addon"><i></i></span> <input
											class="form-control" value="${u.qq }" name="qq"
											placeholder="QQ" type="text">
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 col-md-3 control-label"><span
									class="red">*</span>所在地：</label>
								<div class="col-sm-9 col-md-9">
									<div
										class="input-append col-sm-12 col-md-12 col-lg-12 nopadding">
										<select name="province" id="diqu"
											class="form-control form-control-inline col-sm-3 col-md-3 col-lg-3 nopadding-left"><option
												value="" selected="selected">--请选择省份--</option>
											<option value="北京市">北京市</option>
											<option value="天津市">天津市</option>
											<option value="河北省">河北省</option>
											<option value="山西省">山西省</option>
											<option value="内蒙古自治区">内蒙古自治区</option>
											<option value="辽宁省">辽宁省</option>
											<option value="吉林省">吉林省</option>
											<option value="黑龙江省">黑龙江省</option>
											<option value="上海市">上海市</option>
											<option value="江苏省">江苏省</option>
											<option value="浙江省">浙江省</option>
											<option value="安徽省">安徽省</option>
											<option value="福建省">福建省</option>
											<option value="江西省">江西省</option>
											<option value="山东省">山东省</option>
											<option value="河南省">河南省</option>
											<option value="湖北省">湖北省</option>
											<option value="湖南省">湖南省</option>
											<option value="广东省">广东省</option>
											<option value="广西壮族自治区">广西壮族自治区</option>
											<option value="海南省">海南省</option>
											<option value="重庆市">重庆市</option>
											<option value="四川省">四川省</option>
											<option value="贵州省">贵州省</option>
											<option value="云南省">云南省</option>
											<option value="西藏自治区">西藏自治区</option>
											<option value="陕西省">陕西省</option>
											<option value="甘肃省">甘肃省</option>
											<option value="青海省">青海省</option>
											<option value="宁夏回族自治区">宁夏回族自治区</option>
											<option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
											<option value="香港特别行政区">香港特别行政区</option>
											<option value="澳门特别行政区">澳门特别行政区</option>
											<option value="台湾省">台湾省</option>
											<option value="其它">其它</option></select> <select name="thearea"
											class="form-control form-control-inline col-sm-3 col-md-3 col-lg-3 nopadding-left"><option
												value="" selected="selected">--请选择城市--</option></select> <select
											name="thecounty"
											class="form-control form-control-inline col-sm-3 col-md-3 col-lg-3 nopadding-right"><option
												value="" selected="selected">--请选择地区--</option></select>
									</div>
									<span id="diquTip"
										style="margin: -5px 0px 0px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: inline-block; vertical-align: middle;"
										class="onShow"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-3 control-label">我的擅长：</label>
								<div class="col-sm-9 col-md-9 col-lg-9">
									<select name="skill">
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
								<label class="col-sm-3 col-md-3 col-lg-3 control-label">我的技术：</label>
								<div class="col-sm-9 col-md-9 col-lg-9">
									<select name="jishu">
										<option value="java">java</option>
										<option value="c">c</option>
										<option value="c++">c++</option>
										<option value="linux">linux</option>
										<option value="python">python</option>
										<option value="node.js">node.js</option>
										<option value="css">css</option>
										<option value="mysql">mysql</option>
									</select>
								</div>
							</div>


							<div class="form-group">
								<label class="col-sm-3 col-md-3 col-lg-3 control-label">我的简介：</label>
								<div class="col-sm-9 col-md-9 col-lg-9">
									<textarea class="form-control" name="introduce" cols=""
										rows="5">${u.introduce}</textarea>
								</div>
							</div>

							<div class="form-group">
								<br> <label class="col-sm-3 col-md-3 control-label"></label>
								<div class="col-sm-5 col-md-5">
									<input class="col-md-6 btn btn-primary" id="Subtn" value="保存"
										type="submit">
								</div>
							</div>
							<input type="hidden" name="id" value="${u.id}" /> <input
								type="hidden" name="type" value="0" />
						</form>
					</div>
				</div>
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