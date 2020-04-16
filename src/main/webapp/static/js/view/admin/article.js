//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
var curWwwPath = window.document.location.href;
// 获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
// 获取主机地址，如： http://localhost:8080
var localhostPath = curWwwPath.substring(0, pos);
var columns = [{
    field: 'xuhao',
    title: '序号',
    formatter: idFormatter
}, {
	field : 'articleId',
	title : '文章ID',
	visible : false
}, {
	field : 'articleTitle',
	title : '文章标题'
}, {
	field : 'articleMenuid',
	title : '分类专栏',
	formatter : function(value, row, index) {
		return menuFormatter(value)
	}
}, {
	field : 'articleCreatedate',
	title : '时间',
	formatter : function(value, row, index) {
		return changeDateFormat(value)
	}
}, {
	field : 'articleStatus',
	title : '状态',
	formatter : function(value, row, index) {
		return statusFormatter(value)
	}
}, {
	field : 'operate',
	title : '操作',
	align : 'center',
	events : 'operateEvents',
	formatter : 'operateFormatter'
} ];

// bootstrap table初始化数据
$('#table_article_list').bootstrapTable({
	columns : columns,
	idField : 'articleId',
	// classes: "table table-bordered table-striped table-sm ", //设置表格样式
	// height:400,
	// ******服务器端分页设置****
	url : localhostPath + "/mytools/admin/queryArticleList2",// 服务器返回数据的网址
	method : 'GET', // 数据请求方式
	toolbar : '#toolbar',
	cache: false,  
	sidePagination : 'server',
	search : false, // ******开启搜索框****//
	searchOnEnterKey : true, // ******回车后执行搜索****//
	pagination : true,
	pageNumber : 1,
	pageSize : 10,
	pageList : "[5, 10, 20, 50]",
	paginationHAlign : "left",
	paginationDetailHAlign : "right",
	 paginationPreText: '上一页',
     paginationNextText: '下一页',
     data_local: "zh-US",//表格汉化
	uniqueId: "articleId",
	//得到查询的参数
    queryParams : function (params) {
        //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        var temp = {   
        		offset: params.offset,//从数据库第几条记录开始
                limit: params.limit,  //找多少条				  //页码
                page:params.page
        };
        return temp;
    },
	// ******服务器端分页设置****
	onLoadSuccess : function(data) {
		// alert(JSON.stringify(data.data.data));
		//$('#table_article_list').bootstrapTable('load', data.data);
	},
	onLoadError: function () {
        showTips("数据加载失败！");
    },
	onClickRow : function(row, $element) {
		// bootstrap table初始化数据
	}
});

//格式化按钮
function operateFormatter(value, row, index) {
	return [ '<button type="button" class="ArticleOfedit btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>修改</button>',
		'<button type="button" class="ArticleOfdelete2 btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>删除</button>' ]
			.join('');

}
function statusFormatter(value, row, index) {
	if(value==10){
		return "草稿";
	}else if(value==70){
		return "生效";
	}
	
}
function menuFormatter(value, row, index) {
	if(value==1000){
		return "首页";
	}else if(value==1100){
		return "学习笔记";
	}else if(value==1200){
		return "资源下载";
	}else if(value==1300){
		return "关于我";
	}
	
}
// 初始化操作按钮的方法
window.operateEvents = {
	'click .ArticleOfdelete2' : function(e, value, row, index) {
		var surl = localhostPath + "/mytools/admin/delArticle";
		$.ajax({
			url : surl,
			type : 'POST',
			mask : true,
			data : JSON.stringify(row),
			contentType : "application/json",
			success : function(result) {
				if (result == "success") {
					$('#table_article_list').bootstrapTable('refresh');
				}
			}
		});
	},
	'click .ArticleOfedit' : function(e, value, row, index) {
		window.location.href = localhostPath + "/mytools/admin/articleUpd?articleId="+row.articleId;
	}
};

function toArticlePage() {
	window.location.href = localhostPath + "/mytools/admin/articleAdd";
}

