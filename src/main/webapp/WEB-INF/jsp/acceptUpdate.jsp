<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>需求方修改资料</title>
<link rel="archives" title="软件项目交易网" href="http://www.sxsoft.com/">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css"
	media="all">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.css"
	media="all">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/application.css"
	media="all">
<script src="<%=request.getContextPath()%>/js/hm.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui-1.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/formValidator-4.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js" type="text/javascript"></script>
</head>
<body>
	<header class="navbar">
		<div class="container top">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar" role="navigation">
						<div class="navbar-header">
							<a class="logo" href="http://www.sxsoft.com/"><img
								src="personal/logo.png" alt="软件项目交易网"></a>
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
							<li class="dropdown hidden-sm hidden-md"><a id="userALogo"
								href="#" role="button" class="user_btn dropdown-toggle"
								data-toggle="dropdown"><img
									src="<%=request.getContextPath()%>/images/defaultimg_108.png" title="xwlmdd" alt="xwlmdd"
									width="40" height="40"><span title="xwlmdd"
									style="margin-right: 5px;">${u.name}</span><b class="caret"></b></a>
								</li>
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
								<li><a href="http://www.sxsoft.com/my/project/myproject">竞标一览</a>
								</li>
								<li><a href="http://www.sxsoft.com/my/bid/histroybids">正在开发项目</a>
								</li>
								<li><a href="http://www.sxsoft.com/my/bid/histroybids">已完成项目</a>
								</li>
							</ul></li>
						<li><span>推荐项目</span>
							<ul class="twolevel">
								<li><a href="http://www.sxsoft.com/my/collection/project">推荐项目</a>
								</li>
							</ul></li>
					</ul>
				</div>
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/area.js"></script>
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/multiple-select.js"></script>
				<link rel="stylesheet" type="text/css"
					href="<%=request.getContextPath()%>/css/multiple-select.css" media="all"/>
				<div
					class="col-sm-9 col-md-9 col-lg-9 main-user-content nopadding-right">
					<div class="main-content">
						<div class="col-md-12 nopadding">
							<div class="col-sm-8 col-md-8 col-lg-8 nopadding">
								<div class="refound-account fund-account board">
									<h1 class="lead">
										修改资料 <span class="pull-right"> <a
											href="http://www.sxsoft.com/my/user/editloginpwd"
											class="btn btn-primary btn-primary-white btn-sm">修改密码</a> </span>

									</h1>

									<form class="form-horizontal" id="formID"
										action="/my/user/savedetail">

										<div class="form-group">
											<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
												class="red">*</span>E-mail：</label>
											<div class="col-sm-5 col-md-5 col-lg-5"
												style="padding-right: 0">
												<div class="input-group">
													<span class="input-group-addon"><i
														></i></span> <input
														value="1072552712@qq.com" class="form-control"
														disabled="disabled" type="text">
												</div>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
												class="red">*</span>联系人：</label>
											<div class="col-sm-5 col-md-5 col-lg-5"
												style="padding-right: 0">
												<div class="input-group">
													<span class="input-group-addon"><></i></span> <input
														class="form-control input_public input_error"
														id="lianxiren" name="lianxirenxingming" placeholder="联系人"
														style="color: rgb(153, 153, 153);" type="text">
												</div>
											</div>
											<div class="col-sm-4 col-md-4 col-lg-4"
												style="padding-left: 0; padding-top: 7px;">
												<span id="lianxirenTip"
													style="margin: -5px 0px 0px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: inline-block; vertical-align: middle;"
													class="onError"><span><span
														class="onError_top">联系人不能为空，请填写</span><span
														class="onError_bot"></span></span></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
												class="red">*</span>联系手机：</label>
											<div class="col-sm-5 col-md-5 col-lg-5"
												style="padding-right: 0">
												<div class="input-group">
													<span class="input-group-addon"><i
														></i></span> <input
														class="form-control input_public input_focus" id="mobilck"
														name="mobile" value="18166036620" placeholder="手机"
														type="text">
												</div>
											</div>
											<div class="col-sm-4 col-md-4 col-lg-4"
												style="padding-left: 0; padding-top: 7px;">
												<span id="mobilckTip"
													style="margin: -5px 0px 0px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: none; vertical-align: middle;"
													class="onFocus"><span><span
														class="onFocus_top">手机号码必须填写</span><span
														class="onFocus_bot"></span></span></span>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 col-md-3 col-lg-3 control-label">联系QQ：</label>
											<div class="col-sm-5 col-md-5 col-lg-5"
												style="padding-right: 0">
												<div class="input-group">
													<span class="input-group-addon"><i ></i></span>
													<input class="form-control" name="qq" placeholder="QQ"
														type="text">
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
													<script>
														new PCAS("province",
																"thearea",
																"thecounty",
																"", "", "");
													</script>
												</div>
												<span id="diquTip"
													style="margin: -5px 0px 0px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: inline-block; vertical-align: middle;"
													class="onShow"></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-md-3 col-lg-3 control-label"><span
												class="red">*</span>擅长项目：</label>
											<div class="col-sm-9 col-md-9 col-lg-9" >
												<select multiple="multiple" id="ms" style="display: none;">
													<option value="1">互联网应用</option>
													<option value="2">桌面应用</option>
													<option value="3">移动应用</option>
													<option value="4">设计与数字媒体</option>
													<option value="5">数据分析与大数据</option>
													<option value="6">智能硬件</option>
													<option value="7">其它分类项目</option>
												</select>
											</div>
											<span id="xiangmufenleiTip"
												style="margin: -5px 0px 0px; padding: 0px; background: transparent none repeat scroll 0% 0%; display: inline-block; vertical-align: middle;"
												class="onShow"></span>
										</div>

										<div class="form-group">
											<label class="col-sm-3 col-md-3 control-label">技术标签：</label>
											<div class="col-sm-9 col-md-9" style="padding-right: 0">
												<link rel="stylesheet" type="text/css"
													href="<%=request.getContextPath()%>/css/tabsCss.css" media="all">
												<div id="myTags" class="plus-tag tagbtn clearfix"
													style="display: none;"></div>
												<a class="btn_add_tech">+</a> <span class="help-inline"
													style="font-size: 12px;"> 最多<span class="orange">5</span>个标签
												</span>
												<div id="mycard-plus" class="form-group">
													<div class="col-sm-8 pull-right" id="add-on_btn">
														<div class="input-group">
															<input id="skill_tab" class="form-control"
																placeholder="新标签" type="text"> <a
																class="input-group-addon add-on_btn">贴上</a>
														</div>
														<a style="color: #3366cc; float: right;" id="change-tips"
															href="javascript:void(0);">换一换</a>
													</div>
													<div class="default-tag tagbtn" style="padding-left: 10px;">
														<div class="clearfix nowtips">
															<a value="-1" title="Android" href="javascript:void(0);"><span>Android</span><em></em></a>
															<a value="-1" title="iPhone" href="javascript:void(0);"><span>iPhone</span><em></em></a>
															<a value="-1" title="iPad" href="javascript:void(0);"><span>iPad</span><em></em></a>
															<a value="-1" title="Symbian" href="javascript:void(0);"><span>Symbian</span><em></em></a>
															<a value="-1" title="Bluetooth"
																href="javascript:void(0);"><span>Bluetooth</span><em></em></a>
															<a value="-1" title="Windows Mobile"
																href="javascript:void(0);"><span>Windows
																	Mobile</span><em></em></a> <a value="-1" title="Windows Phone7"
																href="javascript:void(0);"><span>Windows
																	Phone7</span><em></em></a> <a value="-1" title="Wap"
																href="javascript:void(0);"><span>Wap</span><em></em></a>
															<a value="-1" title="Blackberry"
																href="javascript:void(0);"><span>Blackberry</span><em></em></a>
															<a value="-1" title="Bada" href="javascript:void(0);"><span>Bada</span><em></em></a>
															<a value="-1" title="MeeGo" href="javascript:void(0);"><span>MeeGo</span><em></em></a>
															<a value="-1" title="Mtk" href="javascript:void(0);"><span>Mtk</span><em></em></a>
															<a value="-1" title="Brew" href="javascript:void(0);"><span>Brew</span><em></em></a>
															<a value="-1" title="Palm" href="javascript:void(0);"><span>Palm</span><em></em></a>
															<a value="-1" title="C/C++" href="javascript:void(0);"><span>C/C++</span><em></em></a>
															<a value="-1" title="Visual C++"
																href="javascript:void(0);"><span>Visual C++</span><em></em></a>
															<a value="-1" title="Visual Basic"
																href="javascript:void(0);"><span>Visual Basic</span><em></em></a>
															<a value="-1" title=".NET" href="javascript:void(0);"><span>.NET</span><em></em></a>
															<a value="-1" title="C#" href="javascript:void(0);"><span>C#</span><em></em></a>
															<a value="-1" title="ASP" href="javascript:void(0);"><span>ASP</span><em></em></a>
														</div>
														<div class="clearfix" style="display: none;">
															<a value="-1" title="ASP.NET" href="javascript:void(0);"><span>ASP.NET</span><em></em></a>
															<a value="-1" title="Java" href="javascript:void(0);"><span>Java</span><em></em></a>
															<a value="-1" title="J2EE" href="javascript:void(0);"><span>J2EE</span><em></em></a>
															<a value="-1" title="PHP" href="javascript:void(0);"><span>PHP</span><em></em></a>
															<a value="-1" title="JSP" href="javascript:void(0);"><span>JSP</span><em></em></a>
															<a value="-1" title="HTML" href="javascript:void(0);"><span>HTML</span><em></em></a>
															<a value="-1" title="DHTML" href="javascript:void(0);"><span>DHTML</span><em></em></a>
															<a value="-1" title="JavaScript"
																href="javascript:void(0);"><span>JavaScript</span><em></em></a>
															<a value="-1" title="CSS/DIV" href="javascript:void(0);"><span>CSS/DIV</span><em></em></a>
															<a value="-1" title="XML/XSLT" href="javascript:void(0);"><span>XML/XSLT</span><em></em></a>
															<a value="-1" title="CGI" href="javascript:void(0);"><span>CGI</span><em></em></a>
															<a value="-1" title="Cold Fusion"
																href="javascript:void(0);"><span>Cold Fusion</span><em></em></a>
															<a value="-1" title="ActiveX" href="javascript:void(0);"><span>ActiveX</span><em></em></a>
															<a value="-1" title="EJB" href="javascript:void(0);"><span>EJB</span><em></em></a>
															<a value="-1" title="Web Servers"
																href="javascript:void(0);"><span>Web Servers</span><em></em></a>
															<a value="-1" title="PERL" href="javascript:void(0);"><span>PERL</span><em></em></a>
															<a value="-1" title="Securitsy"
																href="javascript:void(0);"><span>Securitsy</span><em></em></a>
															<a value="-1" title="VRML" href="javascript:void(0);"><span>VRML</span><em></em></a>
															<a value="-1" title="Web Developer"
																href="javascript:void(0);"><span>Web
																	Developer</span><em></em></a> <a value="-1" title="Broad Vision"
																href="javascript:void(0);"><span>Broad Vision</span><em></em></a>
														</div>
														<div class="clearfix" style="display: none;">
															<a value="-1" title="Oracle" href="javascript:void(0);"><span>Oracle</span><em></em></a>
															<a value="-1" title="SQL Server"
																href="javascript:void(0);"><span>SQL Server</span><em></em></a>
															<a value="-1" title="Access" href="javascript:void(0);"><span>Access</span><em></em></a>
															<a value="-1" title="DB2" href="javascript:void(0);"><span>DB2</span><em></em></a>
															<a value="-1" title="Sybase" href="javascript:void(0);"><span>Sybase</span><em></em></a>
															<a value="-1" title="MySQL" href="javascript:void(0);"><span>MySQL</span><em></em></a>
															<a value="-1" title="H2" href="javascript:void(0);"><span>H2</span><em></em></a>
															<a value="-1" title="BerkeleyDB"
																href="javascript:void(0);"><span>BerkeleyDB</span><em></em></a>
															<a value="-1" title="CouchDB" href="javascript:void(0);"><span>CouchDB</span><em></em></a>
															<a value="-1" title="SAPDB" href="javascript:void(0);"><span>SAPDB</span><em></em></a>
															<a value="-1" title="FoWindows XPro"
																href="javascript:void(0);"><span>FoWindows
																	XPro</span><em></em></a> <a value="-1" title="Informix"
																href="javascript:void(0);"><span>Informix</span><em></em></a>
															<a value="-1" title="Jasmine" href="javascript:void(0);"><span>Jasmine</span><em></em></a>
															<a value="-1" title="CMMS" href="javascript:void(0);"><span>CMMS</span><em></em></a>
															<a value="-1" title="Interbase"
																href="javascript:void(0);"><span>Interbase</span><em></em></a>
															<a value="-1" title="Flash" href="javascript:void(0);"><span>Flash</span><em></em></a>
															<a value="-1" title="Photoshop"
																href="javascript:void(0);"><span>Photoshop</span><em></em></a>
															<a value="-1" title="3dStudio MAX"
																href="javascript:void(0);"><span>3dStudio MAX</span><em></em></a>
															<a value="-1" title="UI Design"
																href="javascript:void(0);"><span>UI Design</span><em></em></a>
															<a value="-1" title="Animation"
																href="javascript:void(0);"><span>Animation</span><em></em></a>
														</div>
														<div class="clearfix" style="display: none;">
															<a value="-1" title="PageMaker"
																href="javascript:void(0);"><span>PageMaker</span><em></em></a>
															<a value="-1" title="PowerPoint"
																href="javascript:void(0);"><span>PowerPoint</span><em></em></a>
															<a value="-1" title="Dreamweaver"
																href="javascript:void(0);"><span>Dreamweaver</span><em></em></a>
															<a value="-1" title="Fireworks/Frontpage"
																href="javascript:void(0);"><span>Fireworks/Frontpage</span><em></em></a>
															<a value="-1" title="Corel Draw"
																href="javascript:void(0);"><span>Corel Draw</span><em></em></a>
															<a value="-1" title="Mac" href="javascript:void(0);"><span>Mac</span><em></em></a>
															<a value="-1" title="Graphics" href="javascript:void(0);"><span>Graphics</span><em></em></a>
															<a value="-1" title="Maya" href="javascript:void(0);"><span>Maya</span><em></em></a>
															<a value="-1" title="Softimage"
																href="javascript:void(0);"><span>Softimage</span><em></em></a>
															<a value="-1" title="Autocad" href="javascript:void(0);"><span>Autocad</span><em></em></a>
															<a value="-1" title="Freehand VI"
																href="javascript:void(0);"><span>Freehand VI</span><em></em></a>
															<a value="-1" title="IIS" href="javascript:void(0);"><span>IIS</span><em></em></a>
															<a value="-1" title="Qt" href="javascript:void(0);"><span>Qt</span><em></em></a>
															<a value="-1" title="Python" href="javascript:void(0);"><span>Python</span><em></em></a>
															<a value="-1" title="Delphi" href="javascript:void(0);"><span>Delphi</span><em></em></a>
															<a value="-1" title="Fortran" href="javascript:void(0);"><span>Fortran</span><em></em></a>
															<a value="-1" title="UML" href="javascript:void(0);"><span>UML</span><em></em></a>
															<a value="-1" title="GUI" href="javascript:void(0);"><span>GUI</span><em></em></a>
															<a value="-1" title="MFC/ATL" href="javascript:void(0);"><span>MFC/ATL</span><em></em></a>
															<a value="-1" title="Fox Pro" href="javascript:void(0);"><span>Fox
																	Pro</span><em></em></a>
														</div>
														<div class="clearfix" style="display: none;">
															<a value="-1" title="Visual FoxPro"
																href="javascript:void(0);"><span>Visual
																	FoxPro</span><em></em></a> <a value="-1" title="PowerBuilder"
																href="javascript:void(0);"><span>PowerBuilder</span><em></em></a>
															<a value="-1" title="Visual InterDev"
																href="javascript:void(0);"><span>Visual
																	InterDev</span><em></em></a> <a value="-1" title="Crystal Reports"
																href="javascript:void(0);"><span>Crystal
																	Reports</span><em></em></a> <a value="-1" title="MCSD"
																href="javascript:void(0);"><span>MCSD</span><em></em></a>
															<a value="-1" title="OLAP" href="javascript:void(0);"><span>OLAP</span><em></em></a>
															<a value="-1" title="BCB" href="javascript:void(0);"><span>BCB</span><em></em></a>
															<a value="-1" title="Pro*C" href="javascript:void(0);"><span>Pro*C</span><em></em></a>
															<a value="-1" title="Smalltalk"
																href="javascript:void(0);"><span>Smalltalk</span><em></em></a>
															<a value="-1" title="MapInfo" href="javascript:void(0);"><span>MapInfo</span><em></em></a>
															<a value="-1" title="winCVS" href="javascript:void(0);"><span>winCVS</span><em></em></a>
															<a value="-1" title="CORBA" href="javascript:void(0);"><span>CORBA</span><em></em></a>
															<a value="-1" title="Linux" href="javascript:void(0);"><span>Linux</span><em></em></a>
															<a value="-1" title="Perl" href="javascript:void(0);"><span>Perl</span><em></em></a>
															<a value="-1" title="AIX" href="javascript:void(0);"><span>AIX</span><em></em></a>
															<a value="-1" title="Kernels" href="javascript:void(0);"><span>Kernels</span><em></em></a>
															<a value="-1" title="CORBA" href="javascript:void(0);"><span>CORBA</span><em></em></a>
															<a value="-1" title="Embedded" href="javascript:void(0);"><span>Embedded</span><em></em></a>
															<a value="-1" title="HP-UX" href="javascript:void(0);"><span>HP-UX</span><em></em></a>
															<a value="-1" title="OpenView" href="javascript:void(0);"><span>OpenView</span><em></em></a>
														</div>
													</div>
												</div>
												<input name="jinengbiaoqian" id="tabstrings" type="hidden">
												<script src="personal/tab.js"></script>
												<script>
													$(function() {
														var a = $(".plus-tag");

														var tabstr = '';
														var tabs = tabstr
																.split(',');
														var tabsCount = tabs.length;

														for (i = 0; i < tabsCount; i++) {
															if (tabs[i] != '') {
																var aItem = '<a href="javascript:void(0);" title="'
																		+ tabs[i]
																		+ '" value="-1"><span>'
																		+ tabs[i]
																		+ '</span><em></em></a>';
																$(aItem)
																		.appendTo(
																				"#myTags");
															}
														}

														$("#myTags").show();

														setSelectTips();
														$("a em", a)
																.on(
																		"click",
																		function() {
																			var e = $(
																					this)
																					.parents(
																							"a"), f = e
																					.attr("title"), g = e
																					.attr("value");
																			delTips(
																					f,
																					g);
																		});
													});
												</script>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 col-md-3 col-lg-3 control-label">我的简介：</label>
											<div class="col-sm-9 col-md-9 col-lg-9">
												<textarea class="form-control" name="jianjie" cols=""
													rows="5"></textarea>
											</div>
										</div>

										<div class="form-group">
											<br> <label class="col-sm-3 col-md-3 control-label"></label>
											<div class="col-sm-5 col-md-5">
												<input class="col-md-6 btn btn-primary" id="Subtn"
													onclick="makeTabs();" value="保存" type="button">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

				<script type="text/javascript">
					$('#userTypeNew .modify')
							.click(
									function() {
										$('#userTypeNew .cancle').show();
										$('#userTypeNew .cancle')
												.after(
														"<br /><label class='radio-inline'><input value='jzsbz' name='huiyuanleixing' type='radio' checked='checked'  /> 兼职程序员 </label>&nbsp;&nbsp;<label class='radio-inline'><input value='soho' name='huiyuanleixing' type='radio'  /> 全职程序员 </label>");
										$('#userTypeNew .modify').hide();
									});
					$('#userTypeNew .cancle').click(function() {
						$('#userTypeNew .modify').show();
						$('#userTypeNew .cancle').nextAll().remove();
						$('#userTypeNew .cancle').hide();
					});

					$('#ms').change(function() {
						var selectVal = $('#ms').multipleSelect('getSelects');
						console.log(selectVal);

						if (selectVal) {
							$("#xiangmufenlei").val(selectVal);
						}

					}).multipleSelect({
						width : '100%',
						placeholder : "请选择擅长项目",
						selectAll : false
					});
				</script>
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
			$("#yzm").attr('src', '/authpic/getcode/' + new Date().getTime());
			$("#authcode").val('');
		}
	</script>



</body>
</html>