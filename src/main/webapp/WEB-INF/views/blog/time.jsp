<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link
	href="<%=request.getAttribute("basePath")%>static/css/blog/base.css"
	rel="stylesheet">
<link href="<%=request.getAttribute("basePath")%>static/css/blog/m.css"
	rel="stylesheet">
<script
	src="<%=request.getAttribute("basePath")%>static/js/view/blog/jquery-1.8.3.min.js"></script>
<script
	src="<%=request.getAttribute("basePath")%>static/js/view/blog/comm.js"></script>
<script
	src="<%=request.getAttribute("basePath")%>static/js/view/blog/page.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<article>
	<div class="whitebg timebox">
		<h2 class="htitle">往期文章</h2>
		<ul id="list" style="display: none;">
			<li><span>2018-11-08</span><i><a href="/xd/34.html"
					target="_blank">遇见一个未知的你</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/30.html"
					target="_blank">【个人博客空间申请】金牛云服，免费领空间啦</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/29.html"
					target="_blank">双十一，阿里云特惠活动，快来领券啦</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/28.html"
					target="_blank">第二届 优秀个人博客模板比赛参选活动</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/27.html"
					target="_blank">为什么说10月24日是程序员的节日？</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/26.html"
					target="_blank">个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</a></i></li>
			<li><span>2018-11-08</span><i><a href="/xd/25.html"
					target="_blank">即便是坑，我也想要拉你入伙！</a></i></li>
			<li><span>2018-11-08</span><i><a href="/xd/24.html"
					target="_blank">我是怎么评价自己的？</a></i></li>
			<li><span>2018-11-08</span><i><a href="/xd/23.html"
					target="_blank">作为一个设计师,如果遭到质疑你是否能恪守自己的原则?</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/22.html"
					target="_blank">【个人博客网站制作】自己不会个人博客网站制作，你会选择用什么博客程序源码？</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/21.html"
					target="_blank">如何快速建立自己的个人博客网站</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/20.html"
					target="_blank">个人博客用帝国cms 自定义页面 灵动标签调用网站所有信息</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/19.html"
					target="_blank">我的个人博客之——阿里云空间选择</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/18.html"
					target="_blank">建站流程篇——教你如何快速学会做网站</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/17.html"
					target="_blank">【分享】css3侧边栏导航不同方向划出效果</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/16.html"
					target="_blank">使用CSS3制作文字、图片倒影</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/15.html"
					target="_blank">三步实现滚动条触动css动画效果</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/14.html"
					target="_blank">十条设计原则教你学会如何设计网页布局!</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/13.html"
					target="_blank">别让这些闹心的套路，毁了你的网页设计</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/gj/12.html"
					target="_blank">Color Scheme Designer 取色</a></i></li>
			<li><span>2018-11-08</span><i><a
					href="http://css-tricks.com/examples/ButtonMaker/" target="_blank">按钮在线生成工具Button
						Maker</a></i></li>
			<li><span>2018-11-08</span><i><a
					href="http://www.css3maker.com/" target="_blank">CSS3 Maker
						在线生成代码</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/gj/9.html"
					target="_blank">Ui Parade免费的UI在线设计工具</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/gj/8.html"
					target="_blank">分享一个在线用css3生成气泡的工具CSS ARROW PLEASE!</a></i></li>
			<li><span>2018-11-08</span><i><a href="/blog/7.html"
					target="_blank">安静地做一个爱设计的女子</a></i></li>
			<li><span>2018-11-08</span><i><a href="/blog/6.html"
					target="_blank">电话以外的宁静</a></i></li>
			<li><span>2018-11-08</span><i><a href="/blog/5.html"
					target="_blank">遇见一个未知的你</a></i></li>
			<li><span>2018-11-08</span><i><a href="/blog/4.html"
					target="_blank">个人网站做好了，百度不收录怎么办？来，看看他们怎么做的</a></i></li>
			<li><span>2018-11-08</span><i><a href="/blog/3.html"
					target="_blank">个人博客，属于我的小世界！</a></i></li>
			<li><span>2018-11-08</span><i><a href="/xd/2.html"
					target="_blank">网易博客关闭，何不从此开始潇洒行走江湖！</a></i></li>
			<li><span>2018-11-07</span><i><a href="/xd/1.html"
					target="_blank">Come on,行动起来吧!我们和时间来一场赛跑!</a></i></li>
		</ul>
		<ul id="list2">
			<li><span>2018-11-08</span><i><a href="/xd/34.html"
					target="_blank">遇见一个未知的你</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/30.html"
					target="_blank">【个人博客空间申请】金牛云服，免费领空间啦</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/29.html"
					target="_blank">双十一，阿里云特惠活动，快来领券啦</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/28.html"
					target="_blank">第二届 优秀个人博客模板比赛参选活动</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/27.html"
					target="_blank">为什么说10月24日是程序员的节日？</a></i></li>
			<li><span>2018-11-08</span><i><a href="/notice/26.html"
					target="_blank">个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</a></i></li>
			<li><span>2018-11-08</span><i><a href="/xd/25.html"
					target="_blank">即便是坑，我也想要拉你入伙！</a></i></li>
			<li><span>2018-11-08</span><i><a href="/xd/24.html"
					target="_blank">我是怎么评价自己的？</a></i></li>
			<li><span>2018-11-08</span><i><a href="/xd/23.html"
					target="_blank">作为一个设计师,如果遭到质疑你是否能恪守自己的原则?</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/22.html"
					target="_blank">【个人博客网站制作】自己不会个人博客网站制作，你会选择用什么博客程序源码？</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/21.html"
					target="_blank">如何快速建立自己的个人博客网站</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/20.html"
					target="_blank">个人博客用帝国cms 自定义页面 灵动标签调用网站所有信息</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/19.html"
					target="_blank">我的个人博客之——阿里云空间选择</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/wzjs/18.html"
					target="_blank">建站流程篇——教你如何快速学会做网站</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/17.html"
					target="_blank">【分享】css3侧边栏导航不同方向划出效果</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/16.html"
					target="_blank">使用CSS3制作文字、图片倒影</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/15.html"
					target="_blank">三步实现滚动条触动css动画效果</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/14.html"
					target="_blank">十条设计原则教你学会如何设计网页布局!</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/html/13.html"
					target="_blank">别让这些闹心的套路，毁了你的网页设计</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/gj/12.html"
					target="_blank">Color Scheme Designer 取色</a></i></li>
			<li><span>2018-11-08</span><i><a
					href="http://css-tricks.com/examples/ButtonMaker/" target="_blank">按钮在线生成工具Button
						Maker</a></i></li>
			<li><span>2018-11-08</span><i><a
					href="http://www.css3maker.com/" target="_blank">CSS3 Maker
						在线生成代码</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/gj/9.html"
					target="_blank">Ui Parade免费的UI在线设计工具</a></i></li>
			<li><span>2018-11-08</span><i><a href="/web/gj/8.html"
					target="_blank">分享一个在线用css3生成气泡的工具CSS ARROW PLEASE!</a></i></li>
			<li><span>2018-11-08</span><i><a href="/blog/7.html"
					target="_blank">安静地做一个爱设计的女子</a></i></li>
			<div class="pagelist mt20">
				<a class="allpage"><b>31</b></a>&nbsp;&nbsp;<a href="#topnew"
					class="curPage">1</a>&nbsp;&nbsp;<a href="#topnew"
					onclick="page(2)">2</a>&nbsp;&nbsp;<a href="#topnew"
					onclick="page(2)">下一页</a>
			</div>
		</ul>
		<div class="clear"></div>
	</div>
	</article>

	<jsp:include page="footer.jsp"></jsp:include>

</body>

<script type="text/javascript">
	//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
	var curWwwPath = window.document.location.href;
	//获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//获取主机地址，如： http://localhost:8080
	var localhostPath = curWwwPath.substring(0, pos);
	$(function() {
		$.ajax({
			url : localhostPath + "/mytools/queryAbout",
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data.data.data));
				var result = eval(data.data.data);
				$.each(result, function(key, value) {
					//alert(value.articleContent);
					$('.ab_dubai').html(value.articleContent);
					$('#articleName').html(value.articleName);
					$('#articleDescription').html(value.articleDescription);
					//$('#articleId').val(value.articleId);
					//alert(value.articleContent);
				})

			}
		});
	});

	var pager = new ETNGpager('list', 'list2', 25, 5);//25筝堺�馹究�丞ず�≧�違��10筝阪����丞ず������
	var curP = 1;
	page()
	function page(i) {
		curP = (curP > pager.cntP) ? 1 : curP;
		if (i) {
			curP = n = i;
		} else {
			n = curP++;
		}
		pager.curP = (n > pager.cntP) ? pager.cntP : n;
		pager.create();
	}
</script>
</html>