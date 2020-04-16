<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<script
	src="<%=request.getAttribute("basePath")%>static/js/view/blog/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
	var curWwwPath = window.document.location.href;
	//获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//获取主机地址，如： http://localhost:8080
	var localhostPath = curWwwPath.substring(0, pos);
	//alert(pathName);
	$(function() {
		$.ajax({
			url : localhostPath + "/mytools/blogmenu",
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				var result = eval(data);
				var $menuList = $('#starlist');
				$.each(result, function(key, value) {
					var op = new Option(value.menuName);
					//alert(surl);
					var newPathName='/mytools/'+value.menuUrl;
					var classActive;
					alert(pathName+"================="+newPathName)
					if(pathName.indexOf(value.menuUrl)!=-1){
						classActive="selected";
					}
					if(pathName==newPathName){
						classActive="selected";
					}
					
					$menuList.append('<li><a href="'+localhostPath + newPathName+'" id="'+classActive+'" > <i></i>'+value.menuName+'</a></li>');
				})
			}
		});
	});
</script> --%>

<header id="header">
	<div class="navbox">
		<h2 id="mnavh">
			<span class="navicon"></span>
		</h2>
		<div class="logo">
			<a href="/">Mr.Jiang个人博客</a>
		</div>
		<nav>
			<ul id="starlist">
				 <li><a href="<%=request.getAttribute("basePath")%>index" title="首页">网站首页</a></li>
				<li><a href="<%=request.getAttribute("basePath")%>blogs">博客日记</a></li>
				<!-- <li class="menu"><a href="/web/">网站制作</a>
					<ul class="sub">

						<li><a href="/web/html/">CSS3|Html5</a></li>
						<li><a href="/web/wzjs/">网站建设</a></li>
						<li><a href="/web/gj/">推荐工具</a></li>
					</ul> <span></span></li>
				<li><a href="/xd/">设计心得</a></li> -->
				<li><a href="<%=request.getAttribute("basePath")%>about">关于我</a></li>
				<li><a href="<%=request.getAttribute("basePath")%>time">时间轴</a></li>
				<!-- <li><a href="/links/">博客导航</a></li> -->
				<li><a href="/e/tool/gbook/?bid=1">留言</a></li> 
			</ul>
		</nav>
		<div class="searchico"></div>
	</div>
</header>

<!-- <div class="searchbox">
  <div class="search">
    <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
      <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字词" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字词'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字词'}" type="text">
      <input name="show" value="title" type="hidden">
      <input name="tempid" value="1" type="hidden">
      <input name="tbname" value="news" type="hidden">
      <input name="Submit" class="input_submit" value="搜索" type="submit">
    </form>
  </div>
  <div class="searchclose"></div>
</div> -->