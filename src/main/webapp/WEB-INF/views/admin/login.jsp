<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="basePath.jsp"></jsp:include>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>登录页</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="<%=request.getAttribute("basePath")%>static/darkadmin/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="<%=request.getAttribute("basePath")%>static/darkadmin/vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom Font Icons CSS-->
<link rel="stylesheet"
	href="<%=request.getAttribute("basePath")%>static/darkadmin/css/font.css">
<!-- Google fonts - Muli-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="<%=request.getAttribute("basePath")%>static/darkadmin/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet"
	href="<%=request.getAttribute("basePath")%>static/darkadmin/css/custom.css">
</head>
<body>
	<div class="login-page">
		<div class="container d-flex align-items-center">
			<div class="form-holder has-shadow">
				<div class="row">
					<!-- Logo & Information Panel-->
					<div class="col-lg-6">
						<div class="info d-flex align-items-center">
							<div class="content">
								<div class="logo">
									<h1>Dashboard</h1>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							</div>
						</div>
					</div>
					<!-- Form Panel    -->
					<div class="col-lg-6">
						<div class="form d-flex align-items-center">
							<div class="content">
								<form id="loginForm" class="form-validate mb-4">
									<div class="form-group">
										<input id="login-username" type="text" name="userName"
											required data-msg="请输入用户名" class="input-material"> <label
											for="login-username" class="label-material">用户名</label>
									</div>
									<div class="form-group">
										<input id="login-password" type="password" name="userPassword"
											required data-msg="请输入密码" class="input-material"> <label
											for="login-password" class="label-material">密码</label>
									</div>
									<button type="button" onclick="loginBtn()"
										class="btn btn-primary">登录</button>
								</form>
								<a href="#" class="forgot-pass">忘记密码?</a><br> <small>没有帐号?
								</small><a href="register.html" class="signup">注册</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyrights text-center">
			<p>
				Design by <a
					href="https://bootstrapious.com/p/bootstrap-4-dark-admin"
					class="external">Bootstrapious</a>
			</p>
			<!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
		</div>
	</div>
	<!-- JavaScript files-->

		<jsp:include page="baseJs.jsp"></jsp:include>
</body>

<script type="text/javascript">
	function loginBtn() {
		 
		var jsonInfo = $('#loginForm').serializeObject();
		var jsonString = JSON.stringify(jsonInfo);
		//alert(jsonString);
		// var count = $('#table_dictdef_list').bootstrapTable('getData').length;
		// newFlag == 1的数据为新规的数据
		//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
		var curWwwPath = window.document.location.href;
		// 获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		// 获取主机地址，如： http://localhost:8080
		var localhostPath = curWwwPath.substring(0, pos);
		var surl = localhostPath + "/mytools/admin/submitLogin";
		$.ajax({
			url : surl,
			type : 'POST',
			mask : true,
			data : jsonString,
			contentType : "application/json",
			success : function(result) {
				if (result.ok) {
					//alert(JSON.parse(JSON.stringify(result.data)));
					window.location.href = localhostPath + "/mytools/admin/index";
				}else{
					layer.msg('用户名或密码有误！');
				}
				 
			},complete: function (data) {
				 
            },error: function (XMLHttpRequest, textStatus, thrownError) {
            	layer.msg(thrownError);
            }
		});
	}
</script>
</html>