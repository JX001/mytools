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
<script
	src="http://www.itxst.com/package/bootstrap-table-1.14.1/bootstrap-table-1.14.1/bootstrap-table.js"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/jquery-treegrid/0.2.0/css/jquery.treegrid.min.css" />

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
					<h2 class="h5 no-margin-bottom">用户管理</h2>
				</div>
			</div>
			<!-- Breadcrumb-->
			<div class="container-fluid">
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">用户管理</li>
				</ul>
			</div>
			<!-- 添加菜单 Form-->
			<div class="modal fade" id="addUserPane" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">添加用户</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>

						</div>

						<div class="block">

							<div class="block-body">
								<form class="form-horizontal" role="form" id="userForm">
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">编号</label>
										<div class="col-sm-9">
											<input id="userId" name="userId" type="text" placeholder="编号"
												class="form-control form-control-success">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">姓名</label>
										<div class="col-sm-9">
											<input id="userName" name="userName" type="text"
												placeholder="姓名" class="form-control form-control-success">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">密码</label>
										<div class="col-sm-9">
											<input id="userPassword" name="userPassword" type="password"
												placeholder="密码" class="form-control form-control-success">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">人员类型</label>
										<div class="col-sm-9">
											<input id="userType" name="userType" type="text"
												placeholder="人员类型" class="form-control form-control-success">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">手机</label>
										<div class="col-sm-9">
											<input id="userMobil" name="userMobil" type="text"
												placeholder="手机" class="form-control form-control-success">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">性别</label>
										<div class="col-sm-9">
											<div>
												<input id="userSex1" type="radio" checked="" value="男"
													name="userSex"> <label for="userSex1">男</label> <input
													id="userSex2" type="radio" value="女" name="userSex">
												<label for="userSex2">女</label>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary"
								onclick="userOfsave()">保存</button>
						</div>
					</div>
				</div>
			</div>

			<section class="no-padding-top">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="block margin-bottom-sm">
							<div class="title">
								<button onclick="addUserBtn()" class="btn btn-primary">新增</button>
							</div>
							<div class="table-responsive">
								<table class="table table-striped" id="table_user_list">
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


	<script>
		//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
		var curWwwPath = window.document.location.href;
		//获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		//获取主机地址，如： http://localhost:8080
		var localhostPath = curWwwPath.substring(0, pos);
		var columns = [ {
			field : 'userId',
			title : '编号',
		}, {
			field : 'userName',
			title : '姓名'
		}, {
			field : 'userPassword',
			title : '登录密码',
			visible : false
		}, {
			field : 'userType',
			title : '人员类型'
		}, {
			field : 'userCreatedate',
			title : '创建时间',
			formatter : function(value, row, index) {
				return changeDateFormat(value)
			}
		}, {
			field : 'userUpdatedate',
			title : '修改时间',
			formatter : function(value, row, index) {
				return changeDateFormat(value)
			}
		}, {
			field : 'userMobil',
			title : '手机号'
		}, {
			field : 'userSex',
			title : '性别'
		}, {
			field : 'operate',
			title : '操作',
			align : 'center',
			events : 'operateEvents',
			formatter : 'operateFormatter'
		} ];

		//bootstrap table初始化数据
		$('#table_user_list').bootstrapTable({
			columns : columns,
			idField : 'userId',
			//classes: "table table-bordered table-striped table-sm ", //设置表格样式
			// height:400,
			//******服务器端分页设置****
			url : localhostPath + "/mytools/admin/queryUserList",//服务器返回数据的网址
			method : 'GET', //数据请求方式
			sidePagination : 'server',
			search : false, //******开启搜索框****//
			searchOnEnterKey : false, //******回车后执行搜索****//
			pagination : false,
			pageNumber : 1,
			pageSize : 2,
			pageList : "[10, 20, 50, 200]",
			paginationHAlign : "left",
			paginationDetailHAlign : "right",
			//******服务器端分页设置****
			onLoadSuccess : function(data) {
				//	alert(JSON.stringify(data.data.data));
				$('#table_user_list').bootstrapTable('load', data.data);
			}
		});

		function addUserBtn() {
			$('#userId').val('');
			$('#userName').val('');
			$('#userPassword').val('');
			$('#userType').val('');
			$('#userMobil').val('');
			$('#userSex1').prop('checked', false);
			$('#userSex2').prop('checked', false);
			$('#addUserPane').modal('show');

		}
		// 格式化按钮
		function operateFormatter(value, row, index) {
			return [
					'<button type="button" class="UserOfedit btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>修改</button>',
					'<button type="button" class="UserOfdelete btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>删除</button>' ]
					.join('');

		}
		//初始化操作按钮的方法
		window.operateEvents = {
			'click .UserOfdelete' : function(e, value, row, index) {
				del(row.userId);
			},
			'click .UserOfedit' : function(e, value, row, index) {
				update(row);
			}
		};
		function update(row) {
			$('#userId').val(row.userId);
			$('#userName').val(row.userName);
			$('#userPassword').val(row.userPassword);
			$('#userType').val(row.userType);
			$('#userMobil').val(row.userMobil);
			if (row.userSex == "男") {
				$('#userSex1').prop('checked', true);
			} else {
				$('#userSex2').prop('checked', true);
			}

			$('#addUserPane').modal('show');
		}
		function del(userId) {
			$('#table_user_list').bootstrapTable('remove', {
				field : "userId", //此处的 “id”对应的是字段名
				values : [ parseInt(userId) ]
			});
		}

		function userOfsave() {
			var jsonInfo = $('#userForm').serializeObject();
			var jsonString = JSON.stringify(jsonInfo);
			var count = $('#table_user_list').bootstrapTable('getData').length;
			// newFlag == 1的数据为新规的数据
			var surl = localhostPath + "/mytools/admin/addUser";
			$.ajax({
				url : surl,
				type : 'POST',
				mask : true,
				data : jsonString,
				contentType : "application/json",
				success : function(result) {
					if (result == "success")
						$('#table_user_list').bootstrapTable('refresh');
				}
			});
			$('#addUserPane').modal('hide');
		}
	</script>
</body>
</html>