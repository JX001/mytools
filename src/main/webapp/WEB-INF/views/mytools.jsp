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
</head>
<body>
<div class="table-box" style="margin: 20px;">
    <div id="toolbar">
        <button id="button" class="btn btn-default">insertRow</button>
        <button id="getTableData" class="btn btn-default">getTableData</button>
    </div>
    <table id="table"></table>
</div>
</body>
<script type="text/javascript">
$(function() {
    let $table = $('#table');
    let $button = $('#button');
    let $getTableData = $('#getTableData');

    $button.click(function() {
        $table.bootstrapTable('insertRow', {
            index: 0,
            row: {
                id: '',
                name: '',
                price: ''
            }
        });
    });

    $table.bootstrapTable({
        url: 'data2.json',
        toolbar: '#toolbar',
        clickEdit: true,
        showToggle: true,
        pagination: true,       //显示分页条
        showColumns: true,
        showPaginationSwitch: true,     //显示切换分页按钮
        showRefresh: true,      //显示刷新按钮
        //clickToSelect: true,  //点击row选中radio或CheckBox
        columns: [{
            checkbox: true
        }, {
            field: 'id',
            title: 'Item ID'
        }, {
            field: 'name',
            title: 'Item Name'
        }, {
            field: 'price',
            title: 'Item Price'
        }, ],
        /**
         * @param {点击列的 field 名称} field
         * @param {点击列的 value 值} value
         * @param {点击列的整行数据} row
         * @param {td 元素} $element
         */
        onClickCell: function(field, value, row, $element) {
            $element.attr('contenteditable', true);
            $element.blur(function() {
                let index = $element.parent().data('index');
                let tdValue = $element.html();

                saveData(index, field, tdValue);
            })
        }
    });

    $getTableData.click(function() {
        alert(JSON.stringify($table.bootstrapTable('getData')));
    });

    function saveData(index, field, value) {
        $table.bootstrapTable('updateCell', {
            index: index,       //行索引
            field: field,       //列名
            value: value        //cell值
        })
    }

});
</script>
</html>