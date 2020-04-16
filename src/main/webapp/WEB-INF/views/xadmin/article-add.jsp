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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎页面-X-admin2.2</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="<%=request.getAttribute("basePath")%>static/X-admin/css/font.css">
<link rel="stylesheet" href="<%=request.getAttribute("basePath")%>static/X-admin/css/xadmin.css">
<script type="text/javascript" src="<%=request.getAttribute("basePath")%>static/X-admin/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getAttribute("basePath")%>static/X-admin/js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<form class="layui-form">
				<div class="layui-form-item">
					<label for="articleTitle" class="layui-form-label"> <span
						class="x-red">*</span>文章标题
					</label>
					<div class="layui-input-inline">
						<input type="text" id="articleTitle" name="articleTitle" required=""
							lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
			 <div class="layui-form-item layui-form-text">
					<label for="container" class="layui-form-label">正文</label>
					<div class="layui-input-block">
						<textarea id="container" name="articleContent"></textarea>
					</div>
				</div>
			 
				<div class="layui-form-item">
					<label for="username" class="layui-form-label"> <span
						class="x-red">*</span>分类专栏
					</label>
					<div class="layui-input-inline">
						 <select id ="articleMenuid" name="articleMenuid" placeholder="分类专栏" class="valid">
						                          </select>
					</div>
				</div>
				 
				 
				<div class="layui-form-item layui-form-text">
					<label for="articleDescription" class="layui-form-label">描述</label>
					<div class="layui-input-block">
						<textarea placeholder="请输入内容" id="articleDescription" name="articleDescription"
							class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"></label>
					<button class="layui-btn" lay-filter="add" lay-submit="">增加</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;

			//自定义验证规则
			form.verify({
				nikename : function(value) {
					if (value.length < 5) {
						return '昵称至少得5个字符啊';
					}
				},
				pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
				repass : function(value) {
					if ($('#L_pass').val() != $('#L_repass').val()) {
						return '两次密码不一致';
					}
				}
			});

			//监听提交
			form.on('submit(add)', function(data) {
				console.log(data);
				//发异步，把数据提交给php
				layer.alert("增加成功", {
					icon : 6
				}, function() {
					// 获得frame索引
					var index = parent.layer.getFrameIndex(window.name);
					//关闭当前frame
					parent.layer.close(index);
				});
				return false;
			});

		});
	</script>
	
	<!-- 配置文件 -->
<script type="text/javascript"
	src="<%=request.getAttribute("basePath")%>static/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript"
	src="<%=request.getAttribute("basePath")%>static/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getAttribute("basePath")%>static/ueditor/lang/zh-cn/zh-cn.js"></script>

<!-- 实例化编辑器 -->
<script type="text/javascript">

var ueditorserver="http://127.0.0.1:8081";//上传服务器
//自己的项目地址，你要修改的就是这个（来源Referer中有时取不到所以临时传入）
var fromdomain="http://localhost:8080";
	var editor = UE.getEditor('container', { serverUrl: ueditorserver+"/ueditor/jsp/controller.jsp?fromdomain="+fromdomain });

	function saveArticle10() {
		var jsonInfo = $('#articleForm').serializeObject();
		var jsonString = JSON.stringify(jsonInfo);
		// var count = $('#table_dictdef_list').bootstrapTable('getData').length;
		// newFlag == 1的数据为新规的数据
		var surl = localhostPath + "/mytools/admin/saveArticle";
		$.ajax({
			url : surl,
			type : 'POST',
			mask : true,
			data : jsonString,
			contentType : "application/json",
			success : function(result) {
				if (result == "success")
					toBack();
			}
		});
	}
	
	$(function() {
		$.ajax({
			url : localhostPath + "/mytools/admin/queryMenuListByType20",
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data.data.data));
				var result = eval(data.data.data);
				var str = '';
				$.each(result, function(key, value) {
					var op = new Option(value.menuName);
					//alert(value.menuName);
			  		
   					str += '<option value="'+ value.menuId +'">'+ value.menuName +'</option>'
				})
				$('#articleMenuid').html(str);
			}
		});
	});
</script>
</body>
</html>