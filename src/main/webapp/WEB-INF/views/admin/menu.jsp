<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="<%=request.getAttribute("basePath")%>static/darkadmin/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
	//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
	var curWwwPath = window.document.location.href;
	//获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//获取主机地址，如： http://localhost:8080
	var localhostPath = curWwwPath.substring(0, pos);
	//alert(pathName);
	var surl = localhostPath + "/mytools/admin/menu";
	$(function() {
		$.ajax({
			url : surl,
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				var result = eval(data);
				var $menuList = $('#menuList');
				$.each(result, function(key, value) {
					var op = new Option(value.menuName);
					//alert(value.menuName);
					var newPathName='/mytools/admin/'+value.menuUrl;
					var classActive;
					if(pathName==newPathName){
						classActive="active";
					}
					$menuList.append('<li class="'+classActive+'"><a href="'+localhostPath + newPathName+'"> <i class='+value.menuIcon+'></i>'+value.menuName+'</a></li>');
				})
			}
		});
	});
</script>
<nav id="sidebar">
	<!-- Sidebar Header-->
	<div class="sidebar-header d-flex align-items-center">
		<div class="avatar">
			<img
				src="<%=request.getAttribute("basePath")%>static/darkadmin/img/avatar-6.jpg"
				alt="..." class="img-fluid rounded-circle">
		</div>
		<div class="title">
			<h1 class="h5">Mark Stephen</h1>
			<p>Web Designer</p>
		</div>
	</div>
	<!-- Sidebar Navidation Menus-->
	<span class="heading">Main</span>
	<ul class="list-unstyled" id="menuList">
		<%-- <li class="active"><a
			href="<%=request.getAttribute("basePath")%>index"> <i
				class="icon-home"></i>Home
		</a></li>
		<li><a href="<%=request.getAttribute("basePath")%>tables"> <i
				class="icon-grid"></i>Tables
		</a></li>
		<li><a href="charts.html"> <i class="fa fa-bar-chart"></i>Charts
		</a></li>
		<li><a href="forms.html"> <i class="icon-padnote"></i>Forms
		</a></li>
		<li><a href="#"> <i class="icon-logout"></i>Login page
		</a></li> --%>
	</ul>
	<!-- <span class="heading">Extras</span>
	<ul class="list-unstyled">
		<li><a href="#"> <i class="icon-settings"></i>Demo
		</a></li>
		<li><a href="#"> <i class="icon-writing-whiteboard"></i>Demo
		</a></li>
		<li><a href="#"> <i class="icon-chart"></i>Demo
		</a></li>
	</ul> -->
</nav>


