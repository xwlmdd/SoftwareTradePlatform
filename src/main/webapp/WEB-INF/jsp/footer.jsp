<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<div class="body_w">
	<div class="header">
		<div class="logo">
			<a href="http://www.189mv.cn/">电影比价平台</a>
		</div>
		<div class="turn_city fl">
			<span class="t_c_box">深圳<em><i></i></em></span>

			<div id="select_city_sub_menu" class="city popres t_c_list"
				style="display: none;">
				<div class="loading_city" style="display: none" id="loadingCity">
					<img src="<%=request.getContextPath()%>/images/loading26.gif">
				</div>
			</div>

		</div>
		<!--城市选择-->
		<div class="t_nav" id="userstatediv">
			<a href="<%=request.getContextPath()%>/mt/loadUserInfo?id=${u.id}">${u.userName}</a>
			| <a href="<%=request.getContextPath()%>/mt/loadUserInfo?id=${u.id}"
				class="blue">我的个人中心</a> | <a
				href="<%=request.getContextPath()%>/mt/logout">退出</a> | <a
				href="javascript:void(0);">帮助</a>
		</div>
	</div>
</div>

<div class="b_blue">
	<div class="main_nav">
		<ul class="m_nav_list fix">
			<li class="home"><a
				href="<%=request.getContextPath()%>/mt/loadIndex">首页</a></li>
			<li><a
				href="<%=request.getContextPath()%>/mt/loadMovieList?isShow=1">正在热映电影</a></li>
			<li><a
				href="<%=request.getContextPath()%>/mt/loadMovieList?isShow=0">即将上映电影</a></li>
			<li><a
				href="<%=request.getContextPath()%>/mt/loadAreaByCity?city=深圳">影院</a></li>
			<li><a href="<%=request.getContextPath()%>/mt/loadLastThreeNews">电影资讯</a></li>
			<li><a
				href="<%=request.getContextPath()%>/mt/loadLastWeekDisCount">优惠信息</a></li>
			<li><a href="<%=request.getContextPath()%>/mt/special"
				style="padding: 0px 20px;">个性化推荐</a></li>
			<%-- <li><a href="<%=request.getContextPath()%>/mt/notice"
				style="padding: 0px 20px;">公告</a></li> --%>
		</ul>
	</div>
</div>