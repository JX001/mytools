<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="basePath.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<jsp:include page="baseCss.jsp"></jsp:include>


</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="d-flex align-items-stretch">
		<!-- Sidebar 菜单 start-->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- Sidebar 菜单 end-->
		<div class="page-content">
			<!-- Page Header-->
			<div class="page-header no-margin-bottom">
				<div class="container-fluid">
					<h2 class="h5 no-margin-bottom">字典管理</h2>
				</div>
			</div>
			<!-- Breadcrumb-->
			<div class="container-fluid">
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">字典管理</li>
				</ul>
			</div>

			<section class="no-padding-top">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-3">
						<div class="block">
							<div class="title"><strong>字典定义</strong></div>
							<form class="form-horizontal" role="form" id="dictForm">
								<div class="table-responsive">
									<div class="form-group">
										<div class="col-sm-11">
											<input id="dictId" name="dictId" type="text"
												placeholder="字典编号" class="form-control form-control-success">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-11">
											<input id="dictName" name="dictName" type="text"
												placeholder="字典名称" class="form-control form-control-success">
										</div>
									</div>

									<div class="form-group">
										&nbsp;&nbsp;&nbsp;
										<button onclick="saveDictdefBtn()" type="button" class="btn btn-primary">保存</button>
									</div>

									<table class="table" id="table_dictdef_list">
									</table>
								</div>
							</form>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="block margin-bottom-sm">
							<div class="title">
								<strong id="dictinfo_title">字典内容定义</strong>
							</div>
							<form class="form-horizontal" role="form" id="dictinfoForm">
								<div class="table-responsive">
									<div class="form-group row col-sm-12">
											<input id="dictId2" name="dictId" type="hidden" >
										<div class="col-sm-4">
											<input id="dictCode" name="dictCode" type="text"
												placeholder="编码" class="form-control form-control-success">
										</div>
										<div class="col-sm-4">
											<input id="dictinfoName" name="dictName" type="text"
												placeholder="名称" class="form-control form-control-success">
										</div>
										<div class="col-sm-4">
											<input id="dictRemark" name="dictRemark" type="text"
												placeholder="备注" class="form-control form-control-success">
										</div>
									</div>

									<div class="form-group">
										&nbsp;&nbsp;&nbsp;
										<button onclick="saveDictinfoBtn()" type="button" class="btn btn-primary">保存</button>
									</div>

									<table class="table" id="table_dictdef_list">
									</table>
								</div>
							</form>
							<div class="table-responsive">
								<table class="table table-striped" id ="table_dictinfo_list">
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
			</section>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="baseJs.jsp"></jsp:include>

	<style>
.changeColor {
	background-color: #343a40 !important;
	color: white;
}
</style>
</body>
<script
	src="<%=request.getAttribute("basePath")%>static/js/view/admin/dictdef.js"></script>
</html>