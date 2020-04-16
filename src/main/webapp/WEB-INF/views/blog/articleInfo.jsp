<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<script type="text/javascript">
		
	</script>
	<article> <!--lbox begin-->
	<div class="lbox">
		<div class="content_box whitebg">
			<h2 class="htitle">
				<span class="con_nav">您现在的位置是：<a href="/">首页</a>&nbsp;>&nbsp;<a
					href="/blog/">个人博客</a></span>个人博客
			</h2>
			<h1 class="con_tilte">${articleData.articleTitle}</h1>
			<p class="bloginfo">
				 <span><fmt:formatDate value="${articleData.articleCreatedate}" pattern="yyyy年MM月dd日" /> </span><span>【个人博客】</span><span><script
						src="<%=request.getAttribute("basePath")%>articleclick/${articleData.articleId}/1"></script>人已围观</span>
			</p>
			<p class="con_info">
				<b>简介</b>${articleData.articleDescription}</p>
			<div class="con_text">
				${articleData.articleContent}
				 
				<!-- <p>
					<span class="diggit"><a
						href="JavaScript:makeRequest('/e/public/digg/?classid=1&id=7&dotop=1&doajax=1&ajaxarea=diggnum','EchoReturnedText','GET','');">
							很赞哦！ </a>(<b id="diggnum"><script type="text/javascript"
								src="/e/public/ViewClick/?classid=1&id=7&down=5"></script></b>)</span>
				</p> -->
				<div class="nextinfo">
					<p>
						上一篇：<a href='/blog/6.html'>电话以外的宁静</a>
					</p>
					<p>
						下一篇：<a href='/blog/'>返回列表</a>
					</p>
				</div>
			</div>
		</div>
		<div class="whitebg">
			<h2 class="htitle">相关文章</h2>
			<ul class="otherlink">

				<li><a href="/xd/23.html" title="作为一个设计师,如果遭到质疑你是否能恪守自己的原则?">作为一个设计师,如果遭到质疑你是否能恪守自己的原则?</a></li>
				<li><a href="/web/html/14.html" title="十条设计原则教你学会如何设计网页布局!">十条设计原则教你学会如何设计网页布局!</a></li>
				<li><a href="/web/html/13.html" title="别让这些闹心的套路，毁了你的网页设计">别让这些闹心的套路，毁了你的网页设计</a></li>
				<li><a href="/web/gj/9.html" title="Ui Parade免费的UI在线设计工具">Ui
						Parade免费的UI在线设计工具</a></li>

			</ul>
		</div>
		<!--  <div class="whitebg">
      <h2 class="htitle">随机图文</h2>
      <ul class="xiangsi">
        <li><a href="/blog/7.html" target="_blank"><i><img src="http://jxhx2.yangqq.com/skin/jxhx/images/b02.jpg"></i>
          <p>安静地做一个爱设计的女子</p>
          <span>自从入了这行，很多人跟我说可以做网络教程，我也有考虑，但最终没有实现，因为我觉得在这个教程泛滥的时代，直接做一套免费的原创个人博客模板更为实在。每当看到自己喜欢的配色图片</span></a></li>
        <li><a href="/blog/3.html" target="_blank"><i><img src="/skin/jxhx/images/2.jpg"></i>
          <p>个人博客，属于我的小世界！</p>
          <span>个人博客，用来做什么？我刚开始就把它当做一个我吐槽心情的地方，也就相当于一个网络记事本，写上一些关于自己生活工作中的小情小事，也会放上一些照片，音乐。每天工作回家后就能访问自己的网站，一边听着音乐，一边写写文章。</span></a></li>
        <li><a href="/blog/6.html" target="_blank"><i><img src="http://www.yangqq.com/d/file/news/s/2013-07-09/0ea789bf08db903aaa6cc81d38615472.jpg"></i>
          <p>电话以外的宁静</p>
          <span>电话很久没有响过了，我的QQ也很久没有在线了，消失了很多天，刚刚结识的朋友因为我身上又起了红疹，每天都发来消息询问我的情况，我做到了这么多天来的沉默，我相信，没有网络，我还是可以继续我自己的生活</span></a></li>
        <li><a href="/blog/4.html" target="_blank"><i><img src="/skin/jxhx/images/4.jpg"></i>
          <p>个人网站做好了，百度不收录怎么办？来，看看他们怎么做的</p>
          <span>不管你是学前端的还是后端的，作为一个程序员，做一个自己的博客，那是必然的。咱们的圈子就这么大，想让更多的人了解你，看看你的技术多牛逼，扔一个博客地址就行了</span></a></li>
 
     </ul>
    </div> -->

	</div>
	<!--lbox end-->
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
			</ul>
		</div>
	<!-- 	<div class="whitebg tuijian">
			<h2 class="htitle">本站推荐</h2>
			<section class="topnews imgscale">
			<a href="/blog/6.html"><img
				src="http://www.yangqq.com/d/file/news/s/2013-07-09/0ea789bf08db903aaa6cc81d38615472.jpg"><span>电话以外的宁静</span></a></section>
			<ul>

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
				<a
					href="/e/tags/?tagname=%E4%BB%8A%E5%A4%95%E4%BD%95%E5%A4%95&tempid=8"
					target="_blank">今夕何夕</a>
				<a
					href="/e/tags/?tagname=%E9%87%91%E7%89%9B%E4%BA%91%E6%9C%8D&tempid=8"
					target="_blank">金牛云服</a>
				<a href="/e/tags/?tagname=%E6%AF%94%E8%B5%9B&tempid=8"
					target="_blank">比赛</a>
 
			</ul>
		</div>
 -->
	</div>
	</article>



	<jsp:include page="footer.jsp"></jsp:include>
</body>

 
</html>