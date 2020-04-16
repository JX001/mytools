<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="basePath.jsp"></jsp:include>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<jsp:include page="baseCss.jsp"></jsp:include>
</head>
<body>
	 <jsp:include page="header.jsp"></jsp:include>
	<div class="d-flex align-items-stretch">
		 	<!-- Sidebar 菜单 start-->
		<%@include file="menu.jsp"%>
		<!-- Sidebar 菜单 end-->
		<div class="page-content">
			<div class="page-header">
				<div class="container-fluid">
					<h2 class="h5 no-margin-bottom">Dashboard</h2>
				</div>
			</div>
			<section class="no-padding-top no-padding-bottom">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-sm-6">
						<div class="statistic-block block">
							<div
								class="progress-details d-flex align-items-end justify-content-between">
								<div class="title">
									<div class="icon">
										<i class="icon-user-1"></i>
									</div>
									<strong>New Clients</strong>
								</div>
								<div class="number dashtext-1">27</div>
							</div>
							<div class="progress progress-template">
								<div role="progressbar" style="width: 30%" aria-valuenow="30"
									aria-valuemin="0" aria-valuemax="100"
									class="progress-bar progress-bar-template dashbg-1"></div>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="statistic-block block">
							<div
								class="progress-details d-flex align-items-end justify-content-between">
								<div class="title">
									<div class="icon">
										<i class="icon-contract"></i>
									</div>
									<strong>New Projects</strong>
								</div>
								<div class="number dashtext-2">375</div>
							</div>
							<div class="progress progress-template">
								<div role="progressbar" style="width: 70%" aria-valuenow="70"
									aria-valuemin="0" aria-valuemax="100"
									class="progress-bar progress-bar-template dashbg-2"></div>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="statistic-block block">
							<div
								class="progress-details d-flex align-items-end justify-content-between">
								<div class="title">
									<div class="icon">
										<i class="icon-paper-and-pencil"></i>
									</div>
									<strong>New Invoices</strong>
								</div>
								<div class="number dashtext-3">140</div>
							</div>
							<div class="progress progress-template">
								<div role="progressbar" style="width: 55%" aria-valuenow="55"
									aria-valuemin="0" aria-valuemax="100"
									class="progress-bar progress-bar-template dashbg-3"></div>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="statistic-block block">
							<div
								class="progress-details d-flex align-items-end justify-content-between">
								<div class="title">
									<div class="icon">
										<i class="icon-writing-whiteboard"></i>
									</div>
									<strong>All Projects</strong>
								</div>
								<div class="number dashtext-4">41</div>
							</div>
							<div class="progress progress-template">
								<div role="progressbar" style="width: 35%" aria-valuenow="35"
									aria-valuemin="0" aria-valuemax="100"
									class="progress-bar progress-bar-template dashbg-4"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			 </section>
			 

			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<!-- JavaScript files-->
	<jsp:include page="baseJs.jsp"></jsp:include>
</body>
</html>