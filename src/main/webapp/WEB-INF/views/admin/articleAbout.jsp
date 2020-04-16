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
					<h2 class="h5 no-margin-bottom">关于我</h2>
				</div>
			</div>
			<!-- Breadcrumb-->
			<div class="container-fluid">
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">关于我</li>
				</ul>
			</div>

			<section class="no-padding-top">
			<div class="container-fluid">
				<div class="row">
					<!-- Form Elements -->
					<div class="col-lg-12">
						<div class="block">
							<div class="title">
								<strong>关于我</strong>
							</div>
							<div class="block-body">
								<form class="form-inline" id="articleForm">
									<div class="col-sm-9">

										<div class="form-group-material">
											<div class="col-sm-12">
											<input id="articleTitle" type="text" name="articleTitle"
												required class="col-sm-12 form-control form-control-success">
												<input id="articleName" type="text" name="articleName"
												required class="col-sm-12 form-control form-control-success">
												<input id="articleId" type="hidden" name="articleId" required class="form-control form-control-success">
												<input id="articleType"   type="hidden" name="articleType" value="50" class="form-control form-control-success">
												<input id="articleStatus" type="hidden" name="articleStatus" value="70" class="form-control form-control-success">
												<input id="articleMenuid" type="hidden" name="articleMenuid" value="1300" class="form-control form-control-success">
											</div>
										</div>
										<div class="form-group-material">
											<!-- 加载编辑器的容器 -->
											<!-- <textarea id="container" style="width:auto;height:400px;" type="text/plain" name="articleContent"></textarea> -->
											<script id="container" type="text/plain" name="articleContent" style="width:auto;height:400px;"></script>
										</div>
										<div class="row">
											<div class="form-group">
												 &nbsp;&nbsp;&nbsp;
													<input id="articleKeywords" type="text" placeholder="文章标签"
														name="articleKeywords"  class="mr-sm-3 form-control"> 
													 
											</div>
											 
										</div>
										<div class="row">
										 
											<div class="form-group">
												 &nbsp;&nbsp;&nbsp;
													 
														<textarea rows="3" cols="80" id="articleDescription" name="articleDescription" placeholder="文章描述"></textarea>
													 
											</div>
										</div>
									</div>
									
									<div class="col-sm-9 form-group-material" align="left">
									<div class="line">&nbsp;</div>
										<button onclick="saveArticle10()" type="button"
											class="btn btn-primary">保存</button>
									</div>
								</form>

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

</body>
<script
	src="<%=request.getAttribute("basePath")%>static/js/view/admin/articleAdd.js"></script>
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
	var editor = UE.getEditor('container');

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
					window.location.href = localhostPath + "/mytools/admin/articleAbout";
			}
		});
	}
	
	$(function() {
		$.ajax({
			url : localhostPath + "/mytools/admin/queryArticleByType?type=50",
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data.data.data));
				var result = eval(data.data.data);
				$.each(result, function(key, value) {
					
			  		editor.setContent(value.articleContent,'');
			  	//alert(value.articleContent);
					$('#articleTitle').val(value.articleTitle);
			  		$('#articleId').val(value.articleId);
			  		$('#articleKeywords').val(value.articleKeywords);
			  		$('#articleDescription').val(value.articleDescription);
			  		$('#articleName').val(value.articleName);
			  		//alert(value.articleContent);
				})
				
			}
		});
	});
</script>
</html>
