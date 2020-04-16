<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>XML导出定义表</title>
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-table/1.12.0/extensions/treegrid/bootstrap-table-treegrid.js"></script>
<script
	src="https://cdn.bootcss.com/jquery-treegrid/0.2.0/js/jquery.treegrid.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/jquery-treegrid/0.2.0/css/jquery.treegrid.min.css">
</head>

<body>
	<div class="container">
		<h1>XML导出定义表</h1>
		<div id="toolbar">
        <button id="insertRow" class="btn btn-default">insertRow</button>
        <button id="getTableData" class="btn btn-default">getTableData</button>
    </div>
		<table id="table"></table>
		<br />
	</div>
	<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div>
				<form class="form-horizontal" role="form" id="form1">
					<div class="form-group">
						<label class="col-sm-2 control-label">编号</label>
						<div class="col-sm-10">
							<input type="hidden" class="form-control" name="xmlcode" id="xmlcode" />
							<p class="form-control-static" id="xmlcodeval"></p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">元素级次</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="elementlevl" id="id" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">PID</label>
						<div class="col-sm-10">
							<input type="hidden" class="form-control" name="pid" id="pid" />
							<p class="form-control-static" id="pidval"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">元素名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="elementname" id="elementname" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">元素描述</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="elementdesc" id="elementdesc" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">表名\描述</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="tables" id="tables" />
						</div>
					</div>
				<!-- 	<div class="form-group">
						<label class="col-sm-2 control-label">字段名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="fldname" id="fldname" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">小数</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="flddecimal" id="flddecimal" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">缺省值</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="flddefault" id="flddefault" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">属性</label>
						<div class="col-sm-10">
							<label class="checkbox-inline">
						       <input type="checkbox" id="flags" value="1"> 按行数重复
						   </label>
						   <label class="checkbox-inline">
						       <input type="checkbox" id="inlineCheckbox2" value="2"> 行数为零导出格式
						   </label>
						   <label class="checkbox-inline">
						       <input type="checkbox" id="inlineCheckbox3" value="4"> 值取名
						   </label>
						</div>
						
					</div> -->
				</form>
				 
				<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="RoleOfsave()">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>

<script type="text/javascript">
	var $table = $('#table');
	//alert('${data}');
	var data =JSON.parse('${data}');
	/* var data = JSON
			.parse('[{"xmlcode":1001,"id":10,"pid":0,"elementname":1,"elementdesc":"用户管理","tables":"open:user:manage"},'
					+ '{"xmlcode":1001,"id":20,"pid":0,"elementname":1,"elementdesc":"系统管理","tables":"open:system:manage"},'
					+ '{"xmlcode":1001,"id":1010,"pid":10,"elementname":1,"elementdesc":"新增用户","tables":"open:user:add"},'
					+ '{"xmlcode":1001,"id":1011,"pid":10,"elementname":1,"elementdesc":"修改用户","tables":"open:user:edit"},'
					+ '{"xmlcode":1001,"id":1012,"pid":10,"elementname":0,"elementdesc":"删除用户","tables":"open:user:del"},'
					+ '{"xmlcode":1001,"id":2010,"pid":20,"elementname":1,"elementdesc":"系统配置管理","tables":"open:systemconfig:manage"},'
					+ '{"xmlcode":1001,"id":201010,"pid":2010,"elementname":1,"elementdesc":"新增配置","tables":"open:systemconfig:add"},'
					+ '{"xmlcode":1001,"id":201011,"pid":2010,"elementname":1,"elementdesc":"修改配置","tables":"open:systemconfig:edit"},'
					+ '{"xmlcode":1001,"id":201012,"pid":2010,"elementname":0,"elementdesc":"删除配置","tables":"open:systemconfig:del"},'
					+ '{"xmlcode":1001,"id":2030,"pid":20,"elementname":1,"elementdesc":"系统日志管理","tables":"open:log:manage"},'
					+ '{"xmlcode":1001,"id":203010,"pid":2030,"elementname":1,"elementdesc":"新增日志","tables":"open:log:add"},'
					+ '{"xmlcode":1001,"id":203011,"pid":2030,"elementname":1,"elementdesc":"修改日志","tables":"open:log:edit"},'
					+ '{"xmlcode":1001,"id":203012,"pid":2030,"elementname":0,"elementdesc":"删除日志","tables":"open:log:del"}]');
 */					 
	$(function() {
		 let $insertRow = $('#insertRow');
		 let $getTableData = $('#getTableData');
		 $insertRow.click(function() {
		        $table.bootstrapTable('insertRow', {
		            index: 0,
		            row: {
		            	xmlcode: '',
		            	id: '',
		            	elementname: '',
		            	elementdesc: '',
		            	flags:'',
		            	tables:'',
		            	fldname:'',
		            	flddecimal:'',
		            	flddefault:'',
		            }
		        });
		    });
		//控制台输出一下数据
		console.log(data);
		//$table.bootstrapTable('destroy');
		$table.bootstrapTable({
			data : data,
			idField : 'id',
			dataType : 'jsonp',
			editable : true,//开启编辑模式  
			clickEdit: true,
			//clickToSelect : true,
			cache : false,
			// showColumns: true,
			columns : [ 
				 [
	                    {
	                        "title": "XML导出定义表",
	                        "halign":"center",
	                        "align":"center",
	                        "colspan": 10
	                    }
	                ],[
				{
				field : 'xmlcode',
				title : '编号',
				colspan: 1,
                rowspan: 2
			}, {
				field : 'id',
				title : '元素级次',
				//align : "center",
				colspan: 1,
                rowspan: 2
			}, {
				field : 'elementname',
				title : '元素名称',
				//align : "center",
				colspan: 1,
                rowspan: 2
			},{
				field : 'elementdesc',
				title : '元素描述',
				//align : "center",
				colspan: 1,
                rowspan: 2
				 
			},  {
                title: "取值",
                valign:"middle",
                align:"center",
                colspan: 4,
                rowspan: 1
            },{
				field : 'flags',
				title : '按行数重复',
				formatter : 'flagsFormatter',
				colspan: 1,
                rowspan: 2,
                width:100
                
			},{
				field : 'operate',
				title : '操作',
				align : 'center',
				events : operateEvents,
				formatter : 'operateFormatter',
					colspan: 1,
	                rowspan: 2,
	                width:250
			}],[
			// {field: 'id', title: '编号', sortable: true, align: 'center'},
			// {field: 'pid', title: '所属上级'},
			  {
				field : 'tables',
				title : '表名\描述',
				width: 80
			}, {
				field : 'fldname',
				title : '字段名'
			}, {
				field : 'flddecimal',
				title : '小数'
			}, {
				field : 'flddefault',
				title : '缺省值'
			}
			
			]],

			// bootstrap-table-treegrid.js 插件配置 -- start

			//在哪一列展开树形
			treeShowField : 'id',
			//指定父id列
			parentIdField : 'pid',

	 
			onResetView : function(data) {
				//console.log('load');
				$table.treegrid({
					//initialState : 'collapsed',// 所有节点都折叠
					 initialState: 'expanded',// 所有节点都展开，默认展开
					treeColumn : 1,
					// expanderExpandedClass: 'glyphicon glyphicon-minus',  //图标样式
					// expanderCollapsedClass: 'glyphicon glyphicon-plus',
					onChange : function() {
						$table.bootstrapTable('resetWidth');
					}
				});

				//只展开树形的第一级节点
				$table.treegrid('getRootNodes').treegrid('expand');

			},
			onCheck : function(row) {
				var datas = $table.bootstrapTable('getData');
				// 勾选子类
				selectChilds(datas, row, "id", "pid", true);

				// 勾选父类
				selectParentChecked(datas, row, "id", "pid")

				// 刷新数据
				$table.bootstrapTable('load', datas);
			},

			onUncheck : function(row) {
				var datas = $table.bootstrapTable('getData');
				selectChilds(datas, row, "id", "pid", false);
				$table.bootstrapTable('load', datas);
			},
		// bootstrap-table-treetreegrid.js 插件配置 -- end
		});
	 

	});
	// 格式化状态
	function flagsFormatter(value, row, index) {
			return '<input type="checkbox" name="flags" value="1"/>';
	}
	// 格式化按钮
	function operateFormatter(value, row, index) {
		return [
				'<button type="button" class="RoleOfadd btn-small  btn-primary" style="margin-right:15px;"><i class="fa fa-plus" ></i>&nbsp;新增</button>',
				'<button type="button" class="RoleOfedit btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;修改</button>',
				'<button type="button" class="RoleOfdelete btn-small   btn-primary" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button>' ]
				.join('');

	}
	//初始化操作按钮的方法
	window.operateEvents = {
		'click .RoleOfadd' : function(e, value, row, index) {
			add(row);
		},
		'click .RoleOfdelete' : function(e, value, row, index) {
			del(row.id);
		},
		'click .RoleOfedit' : function(e, value, row, index) {
			update(row);
		} 
	};
	 
	$(function() {
	    $('#myModal').on('hide.bs.modal',function() {
	       // alert('嘿，我听说您喜欢模态框...');
	    })
	    $('#myModal').on('show.bs.modal', function () {
			//alert('11嘿，我听说您喜欢模态框...');
		})
	});
	//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8080
    var localhostPath = curWwwPath.substring(0, pos);

	 function RoleOfsave(){
		 var jsonInfo = $('#form1').serializeObject();
			var jsonString = JSON.stringify(jsonInfo);
			var count = $('#table').bootstrapTable('getData').length;
		    // newFlag == 1的数据为新规的数据
		    var surl = localhostPath+"/mytools/demo1";
		    $.ajax({
		           url:surl,
		           type:'POST',
		           mask:true,
		           data:jsonString,
		           contentType:"application/json",
		           success:function(result){
		        	    
		        	  //saveFileFordowntableForFileOfSon1(result.data);
		        	  if(result=="success")
		                  location.href=localhostPath+'/mytools/xmltool';
		           }
		       });
		    $('#myModal').modal('hide');
	 }
	 $.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if(o[this.name]) {
					if(!o[this.name].push) {
						o[this.name] = [o[this.name]];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};
</script>
<script>
	/**
	 * 选中父项时，同时选中子项
	 * @param datas 所有的数据
	 * @param row 当前数据
	 * @param id id 字段名
	 * @param pid 父id字段名
	 */
	function selectChilds(datas, row, id, pid, checked) {
		for ( var i in datas) {
			if (datas[i][pid] == row[id]) {
				datas[i].check = checked;
				selectChilds(datas, datas[i], id, pid, checked);
			}
			;
		}
	}

	function selectParentChecked(datas, row, id, pid) {
		for ( var i in datas) {
			if (datas[i][id] == row[pid]) {
				datas[i].check = true;
				selectParentChecked(datas, datas[i], id, pid);
			}
			;
		}
	}

	function test() {
		var selRows = $table.bootstrapTable("getSelections");
		if (selRows.length == 0) {
			alert("请至少选择一行");
			return;
		}

		var postData = "";
		$.each(selRows, function(i) {
			postData += this.id;
			if (i < selRows.length - 1) {
				postData += "， ";
			}
		});
		alert("你选中行的 id 为：" + postData);

	}

	function add(row) {
		$('#xmlcode').val(row.xmlcode);
		$('#xmlcodeval').html(row.xmlcode);
		$('#pid').val(row.id);
		$('#pidval').html(row.id);
		$('#id').val(row.id);
		$('#elementname').val(row.elementname);
		$('#elementdesc').val(row.elementdesc);
		$('#tables').val(row.tables);
		$('#fldname').val(row.fldname);
		$('#flddecimal').val(row.flddecimal);
		$('#flddefault').val(row.flddefault);
		$('#flags').val(row.flags);
		$('#myModal').modal('show');
	 
	}
	function del(id) {
        $('#table').bootstrapTable('remove', {
            field: "id",   //此处的 “id”对应的是字段名
            values: [parseInt(id)]
        });
	}
	function update(row) {
		$('#xmlcode').val(row.xmlcode);
		$('#pid').val(row.id);
		$('#id').val(row.id);
		$('#elementname').val(row.elementname);
		$('#elementdesc').val(row.elementdesc);
		$('#tables').val(row.tables);
		$('#fldname').val(row.fldname);
		$('#flddecimal').val(row.flddecimal);
		$('#flddefault').val(row.flddefault);
		$('#flags').val(row.flags);
		$('#myModal').modal('show');
	}
	 
</script>

</html>