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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/area.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/multiple-select.js"></script>
</head>
<body>
<jsp:include page="sendHead.jsp" />
	<div
		class="col-xs-9 col-sm-9 col-md-9 main-user-content nopadding-right">
		<div class="main-content">
			<div class="col-sm-9 col-md-9" id="fast_pub">
				<div class="main-content">
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
					$("#yzm").attr('src',
							'/authpic/getcode/' + new Date().getTime());
					$("#authcode").val('');
				}
			</script>
</body>
</html>