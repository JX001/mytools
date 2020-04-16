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
<meta charset="utf-8">
<title>杨青青个人博客</title>
<meta name="keywords" content="杨青青,个人博客,博客模板,个人网站,博客网站" />
<meta name="description"
	content="杨青个人博客网站,一个站在web前段设计之路的女技术员个人博客网站，提供个人博客，个人网站div+css源码分享" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="<%=request.getAttribute("basePath")%>static/css/blog/base.css"
	rel="stylesheet">
<link href="<%=request.getAttribute("basePath")%>static/css/blog/m.css"
	rel="stylesheet">
<script
	src="<%=request.getAttribute("basePath")%>static/js/view/blog/jquery-1.8.3.min.js"></script>
<script
	src="<%=request.getAttribute("basePath")%>static/js/view/blog/comm.js"></script>
<!--[if lt IE 9]>
<script src="/skin/jxhx/js/modernizr.js"></script>
<![endif]-->
</head>
<body>
	<!--top begin-->
	<jsp:include page="header.jsp"></jsp:include>
	<!--top end-->
	<article> <!--lbox begin-->
	<div class="lbox">

		<div class="whitebg bloglist">
			<h2 class="htitle">最新博文</h2>
			<ul>


				<li>
					<h3 class="blogtitle">
						<a href="/xd/24.html" target="_blank">我是怎么评价自己的？</a>
					</h3> <span class="blogpic imgscale"><i><a href="/xd/"
							target="_blank">设计心得</a></i><a href="/xd/24.html" title="我是怎么评价自己的？"><img
							src="http://www.yangqq.com/d/file/news/s/2018-07-28/95d1b1577a8a7aa4fe3893f2502617e9.jpg"
							alt="我是怎么评价自己的？"></a></span>
					<p class="blogtext">为了挨打轻一些，问我哪里来的，我瞎说了一个说那个谁家的，结果，打得更凶。最后事情还原了真相，我妈说，你要说说奶奶家的，都不会打你了。从此以后，我知道撒谎是会付出更惨痛的代价的，我不再撒谎，也不喜欢爱撒谎的人。
					</p>
					<p class="bloginfo">
						<span>2018-11-08</span><span>【<a
							href="/xd/" target="_blank">设计心得</a>】
						</span>
					</p> <a href="/xd/24.html" class="viewmore">阅读更多</a>
				</li>

				<li>
					<h3 class="blogtitle">
						<a href="/web/wzjs/22.html" target="_blank">【个人博客网站制作】自己不会个人博客网站制作，你会选择用什么博客程序源码？</a>
					</h3>

					<p class="blogtext">这些开源的博客程序源码，都是经过很多次版本测试的，都有固定的使用人群。我所知道的主流的博客程序有，Z-blog，Emlog，WordPress，Typecho等，免费的cms系统有，织梦cms（dedecms），phpcms，帝国cms（EmpireCMS）等。
					</p>
					<p class="bloginfo">
					<span>2018-11-08</span><span>【<a
							href="/web/wzjs/" target="_blank">网站建设</a>】
						</span>
					</p> <a href="/web/wzjs/22.html" class="viewmore">阅读更多</a>
				</li>

				<!--10条 1栏目名称 18最新 5标签id-->
			</ul>
		</div>
		<!--bloglist end-->
	</div>
	<div class="rbox">
		<div class="card">
			<h2>我的名片</h2>
			<p>网名：DanceSmile | 即步非烟</p>
			<p>职业：Web前端设计师、网页设计</p>
			<p>现居：四川省-成都市</p>
			<p>Email：dancesmiling@qq.com</p>
			<ul class="linkmore">
				<li><a href="http://www.yangqq.com" target="_blank"
					class="iconfont icon-zhuye" title="网站地址"></a></li>
				<li><a
					href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=476847113@qq.com"
					target="_blank" class="iconfont icon-youxiang" title="我的邮箱"></a></li>
				<li><a
					href="http://wpa.qq.com/msgrd?v=3&uin=476847113&site=qq&menu=yes"
					target="_blank" class="iconfont icon---" title="QQ联系我"></a></li>
				<li id="weixin"><a href="#" target="_blank"
					class="iconfont icon-weixin" title="关注我的微信"></a><i><img
						src="/skin/jxhx/images/wx.png"></i></li>
			</ul>
		</div>
		<div class="whitebg notice">
			<h2 class="htitle">最近更新</h2>
			<ul>
				<li><a href="/notice/30.html" title="【个人博客空间申请】金牛云服，免费领空间啦"
					target="_blank">【个人博客空间申请】金牛云服，免费领空间啦</a></li>
				<li><a href="/notice/29.html" title="双十一，阿里云特惠活动，快来领券啦"
					target="_blank">双十一，阿里云特惠活动，快来领券啦</a></li>
				<li><a href="/notice/28.html" title="第二届 优秀个人博客模板比赛参选活动"
					target="_blank">第二届 优秀个人博客模板比赛参选活动</a></li>
				<li><a href="/notice/27.html" title="为什么说10月24日是程序员的节日？"
					target="_blank">为什么说10月24日是程序员的节日？</a></li>
			</ul>
		</div>
		<div class="whitebg paihang">
			<h2 class="htitle">点击排行</h2>
			<ul>
				<li><i></i><a href="/web/html/14.html"
					title="十条设计原则教你学会如何设计网页布局!" target="_blank">十条设计原则教你学会如何设计网页布局!</a></li>
				<li><i></i><a href="/xd/23.html"
					title="作为一个设计师,如果遭到质疑你是否能恪守自己的原则?" target="_blank">作为一个设计师,如果遭到质疑你是否能恪守自己的原则?</a></li>
				<li><i></i><a href="/xd/1.html"
					title="Come on,行动起来吧!我们和时间来一场赛跑!" target="_blank">Come
						on,行动起来吧!我们和时间来一场赛跑!</a></li>
			</ul>
		</div>
		<!--   <div class="whitebg tuijian">
      <h2 class="htitle">站长推荐</h2>
          <section class="topnews imgscale"><a href="/xd/23.html"><img src="http://www.yangqq.com/d/file/news/life/2018-06-29/75842f4d1e18d692a66c38eb172a40ab.jpg"><span>作为一个设计师,如果遭到质疑你是否能恪守自己的原则?</span></a></section>
      <ul>

        <li><a href="/web/html/14.html" title="十条设计原则教你学会如何设计网页布局!" target="_blank"><i><img src="http://www.yangqq.com/d/file/jstt/css3/2018-03-20/718b56be9dbf920cc0a6124545216654.jpg"></i>
          <p>十条设计原则教你学会如何设计网页布局!</p>
          </a></li>
        <li><a href="/notice/30.html" title="【个人博客空间申请】金牛云服，免费领空间啦" target="_blank"><i><img src="http://www.yangqq.com/d/file/jstt/web/2018-10-16/56c49531df63eec5ccc3840e68f3ac21.png"></i>
          <p>【个人博客空间申请】金牛云服，免费领空间啦</p>
          </a></li>

      </ul>
    </div> -->

		<!--  <div class="whitebg wenzi">
      <h2 class="htitle">猜你喜欢</h2>
      <ul>
                        <li><a target="_blank"  href="/web/html/14.html">十条设计原则教你学会如何设计网页布局!</a></li>
                        <li><a target="_blank"  href="/xd/23.html">作为一个设计师,如果遭到质疑你是否能恪守自己的原则?</a></li>
                        <li><a target="_blank"  href="/blog/7.html">安静地做一个爱设计的女子</a></li>
                        <li><a target="_blank"  href="/xd/1.html">Come on,行动起来吧!我们和时间来一场赛跑!</a></li>
                        <li><a target="_blank"  href="/web/wzjs/22.html">【个人博客网站制作】自己不会个人博客网站制作，你会选择用什么博客程序源码？</a></li>
                        <li><a target="_blank"  href="http://www.css3maker.com/">CSS3 Maker 在线生成代码</a></li>
                        <li><a target="_blank"  href="/blog/6.html">电话以外的宁静</a></li>
                        <li><a target="_blank"  href="/notice/28.html">第二届 优秀个人博客模板比赛参选活动</a></li>
                        <li><a target="_blank"  href="/xd/25.html">即便是坑，我也想要拉你入伙！</a></li>
                        <li><a target="_blank"  href="/web/html/13.html">别让这些闹心的套路，毁了你的网页设计</a></li>
                   </ul>
    </div>
    <div class="ad whitebg imgscale">
      <ul>
        <a href='http://www.yangqq.com/download/div/917.html' target=_blank><img src='/skin/jxhx/images/ad02.jpg'></a>      </ul>
    </div>
    <div class="whitebg tongji">
      <h2 class="htitle">站点信息</h2>
      <ul>
        <li><b>建站时间</b>：2018-10-24</li>
        <li><b>网站程序</b>：帝国CMS7.5</li>
        <li><b>主题模板</b>：<a href="http://www.yangqq.com" target="_blank">《今夕何夕》</a></li>
        <li><b>文章统计</b>：<a href="/time/" target="_blank">31</a>篇文章</li>
        <li><b>标签管理</b>：<a href="/tags.html" target="_blank">标签云</a></li>
        <li><b>统计数据</b>：<a href="/" target="_blank" >百度统计</a></li>
        <li><b>微信公众号</b>：扫描二维码，关注我们</li>
        <li class="tongji_gzh"><a href='/' target=_blank><img src='/skin/jxhx/images/wxgzh.jpg'></a></li>
      </ul>
    </div>
    <div class="links whitebg">
      <h2 class="htitle">友情链接</h2>
      <ul>
           <li><a href="http://www.yangqq.com" target="_blank">个人博客模板</a></li>
            </ul>
    </div> -->
	</div>
	</article>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>