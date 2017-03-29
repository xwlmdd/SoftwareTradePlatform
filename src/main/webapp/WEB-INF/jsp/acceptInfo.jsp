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
	href="<%=request.getContextPath()%>/css/jquery.ui.customer.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/application.css" media="all">
<script src="<%=request.getContextPath()%>/css/hm.js"></script>
<script type="text/javascript">
		var _hmt = _hmt || [];
                    _hmt.push(['_setCustomVar', 1, 'login', 1, 2]);
                                        _hmt.push(['_setCustomVar', 2, 'customer', 'jbf', 2]);
                    		(function() {
			var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?d1e85a4de65b9e6f5c4aa9a756351e27";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui-1.10.4.custom.js."
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/formValidator-4.1.3.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
	<header class="navbar">
		<div class="container top">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar" role="navigation">
						<div class="navbar-header">
							<a class="logo" href="http://www.sxsoft.com/"><img
								src="<%=request.getContextPath()%>/images/logo.png" alt="软件项目交易网"></a>
						</div>
						<div class="navbar-meun">
							<ul class="list-unstyled">
								<li><a href="http://www.sxsoft.com/page/project">项目资讯</a></li>
								<li><a href="http://www.sxsoft.com/page/user">接包达人</a></li>
								<li><a href="http://www.sxsoft.com/page/article">精选文章</a></li>
								<li><a href="http://www.sxsoft.com/page/recruitmenthome">在线求职</a></li>
							</ul>
						</div>
						<div class="nav navbar-nav navbar-user">
							<span>${u.name}</span>|<span><a href="<%=request.getContextPath()%>/stp/acceptLogout">退出</a></span>
						</div>

					</nav>
				</div>
			</div>
		</div>
	</header>
	<div class="row main-user">
		<div class="container main-user-container">
			<div class="row main-user-container-row">
				<div
					class="col-xs-3 col-sm-3 col-md-3 nopadding-left main-user-slider">

					<div class="role">
						<a href="http://www.sxsoft.com/my/user">接包方个人中心</a>
					</div>
					<ul class="list-unstyled onelevel">
						<li><span>项目管理</span>
							<ul class="list-unstyled twolevel">

								<li><a href="http://www.sxsoft.com/my/project/myproject">我的项目</a>
								</li>
								<li><a href="http://www.sxsoft.com/my/bid/histroybids">竞标一览</a>
								</li>
							</ul></li>
						<li>
							<p class="hide">
								<i class="money_management"></i>资金管理
							</p> <span>资金管理</span>
							<ul class="list-unstyled twolevel">
								<li><a href="http://www.sxsoft.com/my/pay">充值/提款 </a></li>
								<li><a href="http://www.sxsoft.com/my/pay/manage">资金记录</a>
								</li>
								<li><a href="http://www.sxsoft.com/my/pay/score">积分记录</a></li>
							</ul>
						</li>
						<li><span>增值服务</span>
							<ul class="twolevel">
								<li><a href="http://www.sxsoft.com/my/bid/showcard">竞标卡
								</a></li>
								<li><a href="http://www.sxsoft.com/my/fapiao">开具发票 </a></li>
								<li><a href="http://www.sxsoft.com/my/user/realidentity"
									onclick="">实名认证</a>
								</li>
								<li><a href="http://www.sxsoft.com/my/user/refundagreement">不满意退款</a>
								</li>
							</ul></li>
						<li><span>资讯管理</span>
							<ul class="twolevel">
								<li><a href="http://www.sxsoft.com/my/employ/">企业招聘</a></li>
								<li><a href="http://www.sxsoft.com/my/employee/">个人求职</a></li>
							</ul></li>
						<li><span>我的收藏</span>
							<ul class="twolevel">
								<li><a href="http://www.sxsoft.com/my/collection/project">项目收藏</a>
								</li>
								<li><a href="http://www.sxsoft.com/my/collection/article">文章收藏</a>
								</li>
							</ul></li>
					</ul>
				</div>
				<div
					class="col-xs-9 col-sm-9 col-md-9 main-user-content nopadding-right">
					<div class="main-content">

						<div class="row role-intro">
							<div class="col-sm-2 col-md-2 role-intro-slider">
								<div class="defaultimg">
									<div class="settingimg">
										<a href="http://www.sxsoft.com/upload_img">更换头像</a>
									</div>
									<img src="<%=request.getContextPath()%>/images/defaultimg_108.png" title="xwlmdd"
										alt="xwlmdd" class="img-rounded">
								</div>
								<div class="material_txt">
									<a class="btn btn-success"
										href="http://www.sxsoft.com/my/user/modifydetail">修改资料</a> <a
										class="btn btn-pink"
										href="http://www.sxsoft.com/my/user/modifydetail">设置小时报价</a>
								</div>
							</div>

							<div class="col-sm-10 col-md-10 role-introl-content account">
								<div class="row role-user-info">
									<h3 class="col-sm-4 col-md-4 nopadding">
										<a href="http://www.sxsoft.com/user/history/285177"
											class="nowrap col-sm-12 text-left">xwlmdd</a>
									</h3>
									<div class="col-sm-8 col-md-8 nopadding">

										<a href="http://www.sxsoft.com/my/user/realidentity"
											title="点击申请实名认证"><i class="u_icon_4"></i></a> <a
											href="http://www.sxsoft.com/my/user/modifydetail"
											title="点击设置小时报价"><i class="u_icon_5"></i></a> <a
											href="http://www.sxsoft.com/my/user/refundagreement"
											title="点击申请不满意退款认证"><i class="u_icon_6"></i></a> <i
											class="icons_stars0" title="新会员"></i>
									</div>
								</div>
								<div class="row role-user-account">
									<div class="row col-sm-4 col-md-4 nopadding">
										<span class="col-xs-5 col-sm-6 col-md-5">账户总额</span> <strong
											class="col-sm-6 col-xs-7 col-md-7"> 0.00 </strong>
									</div>
									<div class="row col-sm-5 col-md-5 role-account-link">
										<a class="btn btn-success col-md-5"
											href="http://www.sxsoft.com/my/pay/charge">充值</a> <a
											class="btn btn-grey col-md-5 col-md-offset-1"
											href="http://www.sxsoft.com/my/pay/refund">提款</a>
									</div>
									<div class="col-md-3 nopadding">
										<a href="http://www.sxsoft.com/my/pay">充值查询</a>| <a
											href="http://www.sxsoft.com/my/pay">提款查询</a>
									</div>
								</div>

								<div class="hide"></div>

								<ul class="row user-role-message">
									<li class="col-sm-2 col-md-2 label-mark"><a
										href="http://www.sxsoft.com/my/project/myproject"
										target="_blank">0</a> <span>承接项目</span></li>
									<li class="col-sm-2 col-md-2"><a
										href="http://www.sxsoft.com/my/project/myproject"
										target="_blank">0</a> <span>完工项目</span></li>
									<li class="col-sm-2 col-md-2"><a
										href="http://www.sxsoft.com/my/project/myproject"
										target="_blank">0</a> <span>竞标数</span></li>
									<li class="col-sm-2 col-md-2"><a
										href="javascript:void(0);">0.00</a> <span>总收入</span></li>
									<li class="col-sm-2 col-md-2 label-mark"><a
										href="http://www.sxsoft.com/my/project/myproject"
										target="_blank">0</a> <span>开发中项目</span></li>
									<li class="col-sm-2 col-md-2"><a
										href="javascript:void(0);">0</a> <span>信誉积分</span></li>
								</ul>

								<div class="row my-label">
									<label for="nav">擅长领域</label>
									<ul class="nav nav-bar nav-pills">
										<li role="presentation"></li>
									</ul>
								</div>
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

							<h2>待处理的项目动态</h2>
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

						<div class="row role-content-advance">
							<h2>相关项目推荐</h2>
							<table class="table table-recommend">
								<tbody>
									<tr>
										<td class="recommend-title"><a
											href="http://www.sxsoft.com/project/show/78061"
											title="航空安全系统开发" target="_blank">航空安全系统开发</a></td>
										<td>2017-03-28发布</td>
										<td>预算待商议</td>
										<td>已有2竞标</td>
										<td>9天后截止竞标</td>
										<td><a href="http://www.sxsoft.com/project/show/78061"
											class="btn btn-success btn-sm">&nbsp;&nbsp;我要竞标&nbsp;&nbsp;</a></td>
									</tr>
									<tr>
										<td class="recommend-title"><a
											href="http://www.sxsoft.com/project/show/78060"
											title="换衣服的APP" target="_blank">换衣服的APP</a></td>
										<td>2017-03-28发布</td>
										<td>预算待商议</td>
										<td>已有4竞标</td>
										<td>9天后截止竞标</td>
										<td><a href="http://www.sxsoft.com/project/show/78060"
											class="btn btn-success btn-sm">&nbsp;&nbsp;我要竞标&nbsp;&nbsp;</a></td>
									</tr>
									<tr>
										<td class="recommend-title"><a
											href="http://www.sxsoft.com/project/show/78059"
											title="道岔视频缺口监测" target="_blank">道岔视频缺口监测</a></td>
										<td>2017-03-28发布</td>
										<td>预算10万以上</td>
										<td>已有1竞标</td>
										<td>9天后截止竞标</td>
										<td><a href="http://www.sxsoft.com/project/show/78059"
											class="btn btn-success btn-sm">&nbsp;&nbsp;我要竞标&nbsp;&nbsp;</a></td>
									</tr>
									<tr>
										<td class="recommend-title"><a
											href="http://www.sxsoft.com/project/show/78058" title="网站建设"
											target="_blank">网站建设</a></td>
										<td>2017-03-28发布</td>
										<td>预算1千~5千</td>
										<td>暂无竞标</td>
										<td>9天后截止竞标</td>
										<td><a href="http://www.sxsoft.com/project/show/78058"
											class="btn btn-success btn-sm">&nbsp;&nbsp;我要竞标&nbsp;&nbsp;</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<script type="text/javascript">
    $(function(){
                        });
</script>
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
$(function(){
    $('#myCarousel1').carousel({
        interval: 4000
    });
     $("div.accordion-heading-running").mousemove(function(){
         $("div.accordion-body-running").removeClass("in");
          $(this).next().addClass("in");
          $(this).mouseout(function(){
              $(this).removeClass("in");
              });
     });
     $("div.accordion-heading-finish").mousemove(function(){
         $("div.accordion-body-finish").removeClass("in");
          $(this).next().addClass("in");
          $(this).mouseout(function(){
              $(this).removeClass("in");
              });
     });
    $('.jbf_search_input').click(function(){
        $('.jbf_search_input').val('');
    });

    if ($("#yzm").length > 0) {
        cgpwd();
        $("#yzm").click(function(){
            cgpwd();
        });
    }

    
            $.ajax({
            type : 'post',
            url : '/page/help/getUserLogo' ,
            dataType : 'text',
            data : '',
            complete : function(response) {
                $('#userALogo').html(response.responseText);
            }
        });
    });
    function cgpwd(){
        $("#yzm").attr('src', '/authpic/getcode/' + new Date().getTime());
        $("#authcode").val('');
    }
</script>



</body>
</html>