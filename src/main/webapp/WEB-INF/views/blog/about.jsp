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
	<article>
	<div class="whitebg about">
		<div class="ab_box">
			<i class="avatar_pic"><img src="http://jxhx2.yangqq.com/skin/jxhx/images/avatar.jpg"></i>
			<h3><span id="articleName"></span></h3>
			<span id="articleDescription"></span>
		</div>
		<h2 class="gd_title">内心独白</h2>
		<p class="ab_dubai"> 
		</p>
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
</script>
</html>