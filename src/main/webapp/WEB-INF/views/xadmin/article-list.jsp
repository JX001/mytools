<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<html class="x-admin-sm">

<head>
<meta charset="UTF-8">
<title>欢迎页面-X-admin2.2</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet"
	href="<%=request.getAttribute("basePath")%>static/X-admin/css/font.css">
<link rel="stylesheet"
	href="<%=request.getAttribute("basePath")%>static/X-admin/css/xadmin.css">
<script
	src="<%=request.getAttribute("basePath")%>static/X-admin/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="<%=request.getAttribute("basePath")%>static/X-admin/js/xadmin.js"></script>
</head>

<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">演示</a>
			<a> <cite>导航元素</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			onclick="location.reload()" title="刷新"> <i
			class="layui-icon layui-icon-refresh" style="line-height: 30px"></i>
		</a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body ">
						<form class="layui-form layui-col-space5">
							<div class="layui-input-inline layui-show-xs-block">
								<input class="layui-input" placeholder="开始日" name="start"
									id="start">
							</div>
							<div class="layui-input-inline layui-show-xs-block">
								<input class="layui-input" placeholder="截止日" name="end" id="end">
							</div>
							<div class="layui-input-inline layui-show-xs-block">
								<select name="contrller">
									<option>支付方式</option>
									<option>支付宝</option>
									<option>微信</option>
									<option>货到付款</option>
								</select>
							</div>
							<div class="layui-input-inline layui-show-xs-block">
								<select name="contrller">
									<option value="">订单状态</option>
									<option value="0">待确认</option>
									<option value="1">已确认</option>
									<option value="2">已收货</option>
									<option value="3">已取消</option>
									<option value="4">已完成</option>
									<option value="5">已作废</option>
								</select>
							</div>
							<div class="layui-input-inline layui-show-xs-block">
								<input type="text" name="username" placeholder="请输入订单号"
									autocomplete="off" class="layui-input">
							</div>
							<div class="layui-input-inline layui-show-xs-block">
								<button class="layui-btn" lay-submit="" lay-filter="sreach">
									<i class="layui-icon">&#xe615;</i>
								</button>
							</div>
						</form>
					</div>
					<div class="layui-card-header">
						<div class="layui-btn-group demoTable">
						<button class="layui-btn"
							onclick="xadmin.open('添加用户','article-add',800,600)">
							<i class="layui-icon"></i>添加
						</button>
						  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
						  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
						  <button class="layui-btn" data-type="isAll">验证是否全选</button>
						</div>
					</div>
					<div class="layui-card-body ">
						<table class="layui-table" id="demo" lay-filter="demo">
							<!-- <thead>
								<tr>
									<th><input type="checkbox" name="" lay-skin="primary">
									</th>
									<th lay-data="{field:'articleId', width:80, sort: true}">文章ID</th>
									<th lay-data="{field:'articleTitle', width:80}">文章标题</th>
									<th lay-data="{field:'articleMenuid', width:80}">分类专栏</th>
									<th lay-data="{field:'articleCreatedate', width:80}">时间</th>
									<th lay-data="{field:'articleStatus', width:80}">状态</th>
									<th>操作</th>
								</tr>
							</thead> -->
						</table>
					</div>
					
					<!--  <div class="layui-card-body ">
						<div class="page">
							<div>
								<a class="prev" href="">&lt;&lt;</a> <a class="num" href="">1</a>
								<span class="current">2</span> <a class="num" href="">3</a> <a
									class="num" href="">489</a> <a class="next" href="">&gt;&gt;</a>
							</div>
						</div>
					</div>  -->
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	layui.use([ 'laydate', 'form' ], function() {
		var laydate = layui.laydate;
		//执行一个laydate实例
		laydate.render({
			elem : '#start' //指定元素
		});

		//执行一个laydate实例
		laydate.render({
			elem : '#end' //指定元素
		});

	});

	layui.use(['table','laypage', 'layer'], function() {
		var table = layui.table;
		var laypage = layui.laypage;
		var layer = layui.layer;
		//执行渲染
		table.render({
			elem : '#demo' //指定table容器            
			,
			method : 'POST',
			url : 'http://localhost:8080/mytools/xadmin/getAllArticleList',
			//page : true, //开启分页
			page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
			      layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
		      //,curr: 5 //设定初始在第 5 页
		      ,groups: 1 //只显示 1 个连续页码
		      ,first: false //不显示首页
		      ,last: false //不显示尾页
		      
		    }
			,even : true //开启隔行背景           
		    ,limits: [10,20,50]  //每页条数的选择项，默认：[10,20,30,40,50,60,70,80,90]。
            ,limit: 2 //每页默认显示的数量
            ,id:'articleId'
			,
			cellMinWidth: 80,
			cols : [ [ //表头               
				{
				type:'checkbox',
				width:80,
				fixed: 'left'
				},
			{
				field : 'articleId',
				title : '文章ID',
				primary:true,
				width : 200,
				sort : true
			}, {
				field : 'articleTitle',
				title : '文章标题',
				width : 200,
			}, {
				field : 'articleMenuid',
				title : '分类专栏'
			}, {
				field : 'articleCreatedate',
				title : '时间'
			}, {
				field : 'articleStatus',
				title : '状态'
			}, {
				title : '操作',
				fixed: 'right', width:178, align:'center', toolbar: '#barDemo'
			} ] ]
			
			,
			request: {
			    pageName: 'page',   // 页码的参数名称，默认：page
			    limitName: 'size'   // 每页数据量的参数名，默认：limit
			},
			response:{
				countName:'count'
			}
			,done: function(res, curr, count){
				laypage.render({
		            cont:'layui-table-page1' // 容器id
		            , pages: res.count //总页数
		            , curr: curr
		            , jump: function (obj,first) {
		            	if(!first){
		            		alert(obj.curr);  
			            	alert(obj.limit); 
		            	}
		            	 
		            }
				});
			}
		});
		 //监听表格复选框选择
		  table.on('checkbox(demo)', function(obj){
		    console.log(obj)
		  });
		  //监听工具条
		  table.on('tool(demo)', function(obj){
		    var data = obj.data;
		    if(obj.event === 'detail'){
		      layer.msg('ID：'+ data.articleId + ' 的查看操作');
		    } else if(obj.event === 'del'){
		      layer.confirm('真的删除行么', function(index){
		        obj.del();
		        layer.close(index);
		      });
		    } else if(obj.event === 'edit'){
		      layer.alert('编辑行：<br>'+ JSON.stringify(data))
		    }
		  });
		  var $ = layui.$, active = {
	    getCheckData: function(){ //获取选中数据
	      var checkStatus = table.checkStatus('articleId')
	      ,data = checkStatus.data;
	      layer.alert(JSON.stringify(data));
	    }
	    ,getCheckLength: function(){ //获取选中数目
	      var checkStatus = table.checkStatus('articleId')
	      ,data = checkStatus.data;
	      layer.msg('选中了：'+ data.length + ' 个');
	    }
	    ,isAll: function(){ //验证是否全选
	      var checkStatus = table.checkStatus('articleId');
	      layer.msg(checkStatus.isAll ? '全选': '未全选')
	    }
	  };
	  
	  $('.demoTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	});
 
</script>

<script id="barDemo" type="text/html">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</html>