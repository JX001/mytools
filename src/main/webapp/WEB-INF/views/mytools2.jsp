<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css"
	rel="stylesheet">
	<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-table/1.12.0/extensions/treegrid/bootstrap-table-treegrid.js"></script>
<script
	src="https://cdn.bootcss.com/jquery-treegrid/0.2.0/js/jquery.treegrid.min.js"></script>
	<script th:src="@{/content/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js}"></script>
<script th:src="@{/content/plugins/bootstrap-table-tree/bootstraptable-treeview.js}"></script>
</head>
<body>
    
<div style="margin:20px">
    <input type="button" id="expandAllTree" value="展开所有" class="btn btn-defaul"/>
    <input type="button" id="collapseAllTree" value="折叠所有" class="btn btn-defaul"/>
    <table id="tree_table"></table>

</div>
</body>
<script th:inline="javascript">
    $(function () {
        var data = [
            {
                id: '1',
                name: "aa",
                desc: "这是一个描述",
                parentId: null
            }, {
                id: '11',
                name: "aa_sub1",
                desc: "这是一个描述_sub1",
                parentId: '1'
            }, {
                id: '111',
                name: "aa_sub1_sub2",
                desc: "这是一个描述_sub1_sub2",
                parentId: '11'
            },
            {
                id: '2',
                name: "bb",
                desc: "这是一个描述",
                parentId: null
            },
            {
                id: '22',
                name: "bb_sub1",
                desc: "这是一个描述_sub1",
                parentId: '2'
            }, {
                id: '23',
                name: "bb_sub2",
                desc: "这是一个描述_sub2",
                parentId: '2'
            }, {
                id: '233',
                name: "bb_sub2_sub2",
                desc: "这是一个描述_sub2_sub2",
                parentId: '23'
            }, {
                id: '2333',
                name: "bb_sub2_sub2_sub2",
                desc: "这是一个描述_sub2_sub2_sub2",
                parentId: '233'
            }, {
                id: '23333',
                name: "bb_sub2_sub2_sub23",
                desc: "这是一个描述_sub2_sub2_sub2",
                parentId: '233'
            }, {
                id: '233333',
                name: "bb_sub2_sub2_sub233",
                desc: "这是一个描述_sub2_sub2_sub2",
                parentId: '233'
            }, {
                id: '24',
                name: "bb_sub3",
                desc: "这是一个描述_sub3",
                parentId: '2'
            },
        ]
        $('#tree_table').bootstrapTable({
            class: 'table table-hover table-bordered',
            // url:'data.json',
            // contentType: 'application/x-www-form-urlencoded; charset=utf-8',
            //data: data,
            url: getRootPath() + '/a/menu/getSysMenuListAls',
            method: 'post',
            sidePagination: 'server',
            pagination: false,
            treeView: true,
            treeId: "id",
            treeField: "name",
            rowAttributes: function (row, index) {
                return {
                    xx: index
                };
            },
            columns: [{
                width: '1%',
                checkbox: true
            }, {
                width: '20%',
                field: 'name',
                title: '名称'
            }, {
                width: '30%',
                field: 'href',
                title: '地址'
            }, {
                width: '10%',
                field: 'icon',
                title: '图标'
            }, {
                width: '5%',
                field: 'isShow',
                title: '是否显示'
            }, {
                width: '10%',
                field: 'permission',
                title: '权限'
            }, {
                width: '5%',
                field: 'sort',
                title: '排序'
            }, {
                width: '10%',
                field: 'target',
                title: '打开方式'
            }]
        });
        $("#expandAllTree").on('click', function () {
            $('#tree_table').bootstrapTable("expandAllTree")
        })
        $("#collapseAllTree").on('click', function () {
            $('#tree_table').bootstrapTable("collapseAllTree")
        })
    });
</script>
</html>