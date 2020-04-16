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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<article> <!--lbox begin-->
	<div class="lbox">
		<div class="whitebg lanmu">
			<img src="http://jxhx2.yangqq.com/skin/jxhx/images/lm01.jpg">
			<h1>个人博客日记</h1>
			<p>个人博客日记，记录一些优秀个人站长是如何制作个人博客，建个人博客、以及经营个人网站的，本站还会推荐一些优秀的个人博客站长网站。</p>
		</div>
		<div class="whitebg bloglist">
			<h2 class="htitle">最新博文</h2>
			<ul id="articleList_0">

			</ul>
			<!--pagelist-->
			<div class="pagelist"></div>
			<!--pagelist end-->
		</div>
		<!--bloglist end-->
	</div>
	<div class="rbox">
		<div class="whitebg paihang">
			<h2 class="htitle">点击排行</h2>
			<section class="topnews imgscale">
			<a href="/blog/7.html"><img src="http://jxhx2.yangqq.com/skin/jxhx/images/b02.jpg"><span>安静地做一个爱设计的女子</span></a></section>
			<ul>
				<li><i></i><a href="/blog/4.html"
					title="个人网站做好了，百度不收录怎么办？来，看看他们怎么做的" target="_blank">个人网站做好了，百度不收录怎么办？来，看看他们怎么做的</a></li>
				<li><i></i><a href="/blog/3.html" title="个人博客，属于我的小世界！"
					target="_blank">个人博客，属于我的小世界！</a></li>
				<li><i></i><a href="/blog/6.html" title="电话以外的宁静"
					target="_blank">电话以外的宁静</a></li>
				<li><i></i><a href="/blog/35.html"
					title="这里是标题，标题下面有特殊属性，属性有推荐和头条" target="_blank">这里是标题，标题下面有特殊属性，属性有推荐和头条</a></li>
			</ul>
		</div>
<!-- 		<div class="whitebg tuijian">
			<h2 class="htitle">本栏推荐</h2>
			<section class="topnews imgscale">
			<a href="/blog/35.html"><img
				src="/d/file/p/2019/06-30/183dd185c6fbdb927f8000c0281ae32a.png"><span>这里是标题，标题下面有特殊属性，属性有推荐和头条</span></a></section>
			<ul>

				<li><a href="/blog/6.html" title="电话以外的宁静" target="_blank"><i><img
							src="http://www.yangqq.com/d/file/news/s/2013-07-09/0ea789bf08db903aaa6cc81d38615472.jpg"></i>
						<p>电话以外的宁静</p> </a></li>



				<li><a href="/blog/4.html" title="个人网站做好了，百度不收录怎么办？来，看看他们怎么做的"
					target="_blank"><i><img src="/skin/jxhx/images/4.jpg"></i>
						<p>个人网站做好了，百度不收录怎么办？来，看看他们怎么做的</p> </a></li>



				<li><a href="/blog/3.html" title="个人博客，属于我的小世界！"
					target="_blank"><i><img src="/skin/jxhx/images/2.jpg"></i>
						<p>个人博客，属于我的小世界！</p> </a></li>
			</ul>
		</div> -->
	 
	<!-- 	<div class="whitebg cloud">
			<h2 class="htitle">标签云</h2>
			<ul>
				<a href="/e/tags/?tagname=%E4%B8%AA%E4%BA%BA&tempid=8"
					target="_blank">个人</a>
				<a href="/e/tags/?tagname=%E5%8D%9A%E5%AE%A2&tempid=8"
					target="_blank">博客</a>
				<a href="/e/tags/?tagname=%E7%BD%91%E7%AB%99&tempid=8"
					target="_blank">网站</a>
 
			</ul>
		</div> -->

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
	//alert(pathName);
	var surl = localhostPath + "/mytools/queryBlogList";
	$(function() {
		$
				.ajax({
					url : surl,
					type : 'GET',
					dataType : 'json',
					success : function(data) {
						var result = eval(data.data.data);
						$
								.each(
										result,
										function(key, value) {
											var op = new Option(
													value.articleTitle);
											//alert(value.articleTitle);
											var str = '<li><h3 class="blogtitle"><a href="/mytools/blogs/'+value.articleId+'.html" target="_blank">'
													+ value.articleTitle
													+ '</a></h3>';
											str = str
													+ '<span class="blogpic imgscale"><i><a href="blogs/" target="_blank">个人博客日记</a></i><a href="/mytools/blogs/'+value.articleId+'.html" title="'+value.articleTitle+'"><img src="https://www.yangqq.com/d/file/news/s/2019-06-17/110523f83c0a068ea9ee3a112339d8e9.png" alt="'+value.articleTitle+'"></a></span>';
											str = str + '<p class="blogtext">'
													+ value.articleDescription
													+ ' </p>';
											str = str
													+ '<p class="bloginfo"><i class="avatar"></i><span></span><span>'
													+ changeDateFormat(value.articleCreatedate)
													+ '</span><span>【<a href="/mytools/blogs" target="_blank">个人博客日记</a>】</span></p>';
											str = str
													+ '<a href="/mytools/blogs/'+value.articleId+'.html" class="viewmore">阅读更多</a> </li>';

											$('#articleList_0').append(str);
										})
					}
				});
	});

	function changeDateFormat(cellval) {
		if (cellval != null) {
			var d = new Date(cellval);
			var times = d.getFullYear() + '-' + (d.getMonth() + 1) + '-'
					+ d.getDate();
			return times;
		} else {
			return cellval;
		}
	}
</script>
</html>