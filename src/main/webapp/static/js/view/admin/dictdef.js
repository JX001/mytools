//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
var curWwwPath = window.document.location.href;
// 获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
// 获取主机地址，如： http://localhost:8080
var localhostPath = curWwwPath.substring(0, pos);
var columns = [ {
	field : 'dictId',
	title : '编号',
}, {
	field : 'dictName',
	title : '名称'
}, {
	field : 'operate',
	title : '操作',
	align : 'center',
	events : 'operateEvents',
	formatter : 'operateFormatter'
} ];

var columns_dictinfo = [ {
	field : 'dictId',
	title : '主编号',
	visible : false
}, {
	field : 'dictCode',
	title : '编码',
	width : '30%'
}, {
	field : 'dictName',
	title : '名称',
	width : '30%'
}, {
	field : 'dictRemark',
	title : '备注',
	width : '30%'
}, {
	field : 'operate',
	title : '操作',
	align : 'center',
	events : 'operateEvents',
	formatter : 'operateFormatter2'
} ];

// bootstrap table初始化数据
$('#table_dictdef_list').bootstrapTable({
	columns : columns,
	idField : 'dictId',
	// classes: "table table-bordered table-striped table-sm ", //设置表格样式
	// height:400,
	// ******服务器端分页设置****
	url : localhostPath + "/mytools/admin/queryDictdefList",// 服务器返回数据的网址
	method : 'GET', // 数据请求方式
	toolbar : '#toolbar',
	sidePagination : 'server',
	search : false, // ******开启搜索框****//
	searchOnEnterKey : false, // ******回车后执行搜索****//
	pagination : false,
	pageNumber : 1,
	pageSize : 2,
	pageList : "[10, 20, 50, 200]",
	paginationHAlign : "left",
	paginationDetailHAlign : "right",
	// ******服务器端分页设置****
	onLoadSuccess : function(data) {
		// alert(JSON.stringify(data.data.data));
		$('#table_dictdef_list').bootstrapTable('load', data.data);
	},
	onClickRow : function(row, $element) {
		$('.changeColor').removeClass('changeColor');
		$($element).addClass('changeColor');
		// bootstrap table初始化数据

		$('#dictId2').val(row.dictId);
		$('#dictCode').val('');
		$('#dictinfoName').val('');
		$('#dictRemark').val('');
		queryDictinfo(row);
	}
});

// 格式化按钮
function operateFormatter(value, row, index) {
	return [ '<button type="button" class="DictOfdelete btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o" ></i> </button>' ]
			.join('');

}
// 格式化按钮
function operateFormatter2(value, row, index) {
	return [ '<button type="button" class="DictinfoOfdelete btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o" ></i> </button>' ]
			.join('');

}
// 初始化操作按钮的方法
window.operateEvents = {
	'click .DictOfdelete' : function(e, value, row, index) {
		// 询问框
		layer.confirm('是否确认删除该数据？', {
			skin: 'layui-bg-black',
			icon : 3,
			title : '提示',
			btn : [ '确认', '取消' ]
		}, function(index) {
			layer.close(index);
			var surl = localhostPath + "/mytools/admin/delDictdef";
			$.ajax({
				url : surl,
				type : 'POST',
				mask : true,
				data : JSON.stringify(row),
				contentType : "application/json",
				success : function(result) {
					if (result == "success") {
						$('#table_dictdef_list').bootstrapTable('refresh');
					}
				}
			});

			layer.msg('已删除', {
				icon : 1
			});
		});

	},
	'click .DictinfoOfdelete' : function(e, value, row, index) {
		var surl = localhostPath + "/mytools/admin/delDictinfo";
		$.ajax({
			url : surl,
			type : 'POST',
			mask : true,
			data : JSON.stringify(row),
			contentType : "application/json",
			success : function(result) {
				if (result == "success") {
					queryDictinfo(row);
				}
			}
		});
	}
};

function saveDictdefBtn() {
	var jsonInfo = $('#dictForm').serializeObject();
	var jsonString = JSON.stringify(jsonInfo);
	// var count = $('#table_dictdef_list').bootstrapTable('getData').length;
	// newFlag == 1的数据为新规的数据
	var surl = localhostPath + "/mytools/admin/saveDictdef";
	$.ajax({
		url : surl,
		type : 'POST',
		mask : true,
		data : jsonString,
		contentType : "application/json",
		success : function(result) {
			if (result == "success")
				$('#table_dictdef_list').bootstrapTable('refresh');
		}
	});
}
function saveDictinfoBtn() {
	var jsonInfo = $('#dictinfoForm').serializeObject();
	var jsonString = JSON.stringify(jsonInfo);
	// var count = $('#table_dictdef_list').bootstrapTable('getData').length;
	// newFlag == 1的数据为新规的数据
	var surl = localhostPath + "/mytools/admin/saveDictinfo";
	$.ajax({
		url : surl,
		type : 'POST',
		mask : false,
		data : jsonString,
		contentType : "application/json",
		success : function(result) {
			queryDictinfo(jsonInfo);
		}
	});
}

var data_dictinfo = '';
/*
 * 根据DictId 查询字典明细
 */
function queryDictinfo(row) {
	$.ajax({
		url : localhostPath + "/mytools/admin/queryDictinfo",
		type : 'POST',
		mask : true,
		data : JSON.stringify(row),
		contentType : "application/json",
		success : function(result) {
			data_dictinfo = JSON.parse(JSON.stringify(result.data.data));
			$('#dictinfo_title').html("字典编号[" + row.dictId + "]")
			$('#table_dictinfo_list').bootstrapTable('load', data_dictinfo);
		}
	});
}
/*
 * 初始化字典明细表
 */
$('#table_dictinfo_list').bootstrapTable({
	columns : columns_dictinfo,
	onClickRow : function(row, $element) {
		$('#dictCode').val(row.dictCode);
		$('#dictinfoName').val(row.dictName);
		$('#dictRemark').val(row.dictRemark);
	}
});
$('#table_dictinfo_list').bootstrapTable("hideLoading");

// 得到查询的参数
function queryParams(params) {

	var params = { // 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		// limit: params.limit, //页面大小
		offset : params.offset, // 页码
		pageSize : this.pageSize,
		pageNumber : this.pageNumber,
		projectId : $('#dictId2').val(),
		length : 6
	};
	return params;
};
