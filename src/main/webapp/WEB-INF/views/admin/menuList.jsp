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
					<h2 class="h5 no-margin-bottom">菜单管理</h2>
				</div>
			</div>
			<!-- Breadcrumb-->
			<div class="container-fluid">
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">菜单管理</li>
				</ul>
			</div>
			<!-- 添加菜单 Form-->
			<div class="modal fade" id="addMenuPane" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">添加菜单</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>

						</div>
						<form class="form-horizontal" role="form" id="menuForm">
							<label class="col-sm-9 form-control-label"></label>
							<div class="col-sm-9">
								<div class="form-group-material">
									<input id="menuId" type="text" name="menuId" required
										class="input-material"> <label for="menuId"
										class="label-material">菜单编号</label>
								</div>
								<div class="form-group-material">
									<input id="menuPid" type="text" name="menuPid" required
										class="input-material"> <label for="menuPid"
										class="label-material">菜单PID</label>
								</div>
								<div class="form-group-material">
									<input id="menuName" type="text" name="menuName" required
										class="input-material"> <label for="menuName"
										class="label-material">菜单名 </label>
								</div>
								<div class="form-group-material">
									<input id="menuUrl" type="text" name="menuUrl" required
										class="input-material"> <label for="menuUrl"
										class="label-material">菜单地址 </label>
								</div>
								<div class="form-group-material">
									<input id="menuSort" type="text" name="menuSort" required
										class="input-material"> <label for="menuSort"
										class="label-material">菜单排序 </label>
								</div>
								<div class="form-group-material">
									<input id="menuIcon" type="text" name="menuIcon" required
										class="input-material"> <label for="menuIcon"
										class="label-material">菜单图标 </label>
								</div>
								<div class="form-group-material">
									<input id="menuType" type="text" name="menuType" required
										class="input-material"> <label for="menuType"
										class="label-material">菜单类型 </label>
								</div>
							</div>
						</form>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary"
								onclick="menuOfsave()">保存</button>
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
								<button onclick="addMenuBtn()" class="btn btn-primary">新增</button>
							</div>
							<div class="table-responsive">
								<table class="table" id="table_menu_list">
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
			field : 'menuId',
			title : '菜单编号',
		}, {
			field : 'menuPid',
			title : '菜单PID'
		}, {
			field : 'menuName',
			title : '菜单名'
		}, {
			field : 'menuUrl',
			title : '菜单地址'
		}, {
			field : 'menuSort',
			title : '菜单排序'
		}, {
			field : 'menuCreatedate',
			title : '创建时间',
			formatter : function(value, row, index) {
				return changeDateFormat(value)
			}

		}, {
			field : 'menuIcon',
			title : '菜单图标'
		}, {
			field : 'menuType',
			title : '菜单类型'
		}, {
			field : 'operate',
			title : '操作',
			align : 'center',
			events : 'operateEvents',
			formatter : 'operateFormatter'
		} ];

		//bootstrap table初始化数据
		$('#table_menu_list').bootstrapTable({
			columns : columns,
			idField : 'menuId',
			//classes: "table table-bordered table-striped table-sm ", //设置表格样式
			// height:400,
			//******服务器端分页设置****
			url : localhostPath + "/mytools/admin/queryMenuList",//服务器返回数据的网址
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
				$('#table_menu_list').bootstrapTable('load', data.data);
			}
		});

		function addMenuBtn() {

			$('#addMenuPane').modal('show');

		}
		
		// 格式化按钮
		function operateFormatter(value, row, index) {
			return [
					'<button type="button" class="MenuOfedit btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>修改</button>',
					'<button type="button" class="MenuOfdelete btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>删除</button>' ]
					.join('');

		}
		//初始化操作按钮的方法
		window.operateEvents = {
			'click .MenuOfdelete' : function(e, value, row, index) {
				del(row.menuId);
			},
			'click .MenuOfedit' : function(e, value, row, index) {
				update(row);
			}
		};
		function update(row) {
			$('#addMenuPane').modal('show');
			$('#menuId').val(row.menuId);
			$('#menuPid').val(row.menuPid);
			$('#menuName').val(row.menuName);
			$('#menuUrl').val(row.menuUrl);
			$('#menuSort').val(row.menuSort);
			$('#menuIcon').val(row.menuIcon);
			$('#menuType').val(row.menuType);
			$('#menuSort').val(row.menuSort);
			
		}
		function del(menuId) {
			$('#table_menu_list').bootstrapTable('remove', {
				field : "menuId", //此处的 “id”对应的是字段名
				values : [ parseInt(menuId) ]
			});
		}

		function menuOfsave() {
			var jsonInfo = $('#menuForm').serializeObject();
			var jsonString = JSON.stringify(jsonInfo);
			var count = $('#table_menu_list').bootstrapTable('getData').length;
			// newFlag == 1的数据为新规的数据
			var surl = localhostPath + "/mytools/admin/addMenu";
			$.ajax({
				url : surl,
				type : 'POST',
				mask : true,
				data : jsonString,
				contentType : "application/json",
				success : function(result) {
					if (result == "success")
						$('#table_menu_list').bootstrapTable('refresh');
				}
			});
			$('#addMenuPane').modal('hide');
		}
	</script>
</body>
</html>