<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>分类自定义属性数据管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/view/conf/include.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<div data-options="region:'west',split:true,border:false" style="width: 200px;">
		<div class="TREE_COMMON_BOX_SPLIT_DIV">
			<a id="FarmdocTreeReload" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" iconCls="icon-reload">刷新</a>
			<a id="FarmdocTreeOpenAll" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" iconCls="icon-sitemap">展开</a>
		</div>
		<ul id="FarmdocTree"></ul>
	</div>
	<div class="easyui-layout" data-options="region:'center',border:false">
		<div data-options="region:'north',border:false">
			<form id="searchTypefieldForm">
				<table class="editTable">
					<tr>
						<td class="title">分类:</td>
						<td>
							<input id="PARENTTITLE_RULE" type="text" readonly="readonly" style="background: #F3F3E8">
							<input id="PARENTID_RULE" name="B.ID:=" type="hidden">
						</td>
						<td class="title">属性代码:</td>
						<td>
							<input name="FIELDCODE:like" type="text">
						</td>
						<td class="title">属性名称:</td>
						<td>
							<input name="FIELDTITLE:like" type="text">
						</td>
					</tr>
					<tr style="text-align: center;">
						<td colspan="6">
							<a id="a_search" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
							<a id="a_reset" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">清除条件</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="dataTypefieldGrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="SORTNUM" data-options="sortable:true" width="20">排序</th>
						<th field="FIELDTITLE" data-options="sortable:true" width="60">属性名称</th>
						<th field="FIELDCODE" data-options="sortable:true" width="60">属性代码</th>
						<th field="VALIDATES" data-options="sortable:true" width="60">验证规则</th>
						<th field="INPUTTYPE" data-options="sortable:true" width="60">表单类型</th>
						<th field="TYPENAME" data-options="sortable:true" width="60">所属分类</th>
						<th field="SOURCENAME" data-options="sortable:true" width="60">来源</th>
						<th field="REQUIRED" data-options="sortable:true" width="20">必填</th>
						<th field="PSTATE" data-options="sortable:true" width="20">状态</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
	var url_delActionTypefield = "typefield/del.do";//删除URL
	var url_formActionTypefield = "typefield/form.do";//增加、修改、查看URL
	var url_searchActionTypefield = "typefield/query.do";//查询URL
	var title_windowTypefield = "分类自定义属性管理";//功能名称
	var gridTypefield;//数据表格对象
	var searchTypefield;//条件查询组件对象
	var toolBarTypefield = [ {
		id : 'view',
		text : '预览分类表单',
		iconCls : 'icon-blog',
		handler : viewFieldForm
	},
	//{
	//	id : 'view',
	//	text : '查看',
	//	iconCls : 'icon-tip',
	//	handler : viewDataTypefield
	//}, 
	{
		id : 'add',
		text : '新增属性',
		iconCls : 'icon-add',
		handler : addDataTypefield
	}, {
		id : 'copyToSon',
		text : '拷贝属性到子类',
		iconCls : 'icon-move_to_folder',
		handler : addFromSon
	}, {
		id : 'copyToCurrent',
		text : '拷贝属性到当前',
		iconCls : 'icon-move_to_folder',
		handler : copyToCurrent
	}, {
		id : 'edit',
		text : '修改',
		iconCls : 'icon-edit',
		handler : editDataTypefield
	}, {
		id : 'del',
		text : '删除',
		iconCls : 'icon-remove',
		handler : delDataTypefield
	} ];
	$(function() {
		//初始化数据表格
		gridTypefield = $('#dataTypefieldGrid').datagrid({
			url : url_searchActionTypefield,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarTypefield,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true,
			onLoadSuccess : function() {
				initButtons();
			}
		});
		//初始化条件查询
		searchTypefield = $('#searchTypefieldForm').searchForm({
			gridObj : gridTypefield
		});
		$('#FarmdocTree').tree({
			url : 'doctype/FarmDoctypeLoadTreeNode.do',
			onSelect : function(node) {
				$('#PARENTID_RULE').val(node.id);
				$('#PARENTTITLE_RULE').val(node.text);
				searchTypefield.dosearch({
					'ruleText' : searchTypefield.arrayStr()
				});
			},
			loadFilter : function(data, parent) {
				return data.treeNodes;
			}
		});
		$('#FarmdocTreeReload').bind('click', function() {
			$('#FarmdocTree').tree('reload');
		});
		$('#FarmdocTreeOpenAll').bind('click', function() {
			$('#FarmdocTree').tree('expandAll');
		});
		initButtons();
	});
	//预览表单
	function viewFieldForm() {
		if (!$('#PARENTID_RULE').val() || $('#PARENTID_RULE').val() == 'NONE') {
			$.messager.alert(MESSAGE_PLAT.PROMPT, "请先选择分类!", 'info');
		} else {
			var url = 'typefield/formview.do?typeid='+$('#PARENTID_RULE').val();
			$.farm.openWindow({
				id : 'winTypefieldForm',
				width : 700,
				height : 400,
				modal : true,
				url : url,
				title : '浏览'
			});
		}
	}
	//查看
	function viewDataTypefield() {
		if (!$('#PARENTID_RULE').val() || $('#PARENTID_RULE').val() == 'NONE') {
			$.messager.alert(MESSAGE_PLAT.PROMPT, "请先选择分类!", 'info');
		} else {
			var selectedArray = $(gridTypefield).datagrid('getSelections');
			if (selectedArray.length == 1) {
				var url = url_formActionTypefield + '?pageset.pageType='
						+ PAGETYPE.VIEW + '&ids=' + selectedArray[0].ID;
				$.farm.openWindow({
					id : 'winTypefield',
					width : 600,
					height : 400,
					modal : true,
					url : url,
					title : '浏览'
				});
			} else {
				$.messager.alert(MESSAGE_PLAT.PROMPT,
						MESSAGE_PLAT.CHOOSE_ONE_ONLY, 'info');
			}
		}
	}
	//初始化功能按钮，如果没有选择分类，有些按钮是不显示得
	function initButtons() {
		if (!$('#PARENTID_RULE').val() || $('#PARENTID_RULE').val() == 'NONE') {
			$('#view').hide();
			$('#copyToSon').hide();
			$('#copyToCurrent').hide();
		} else {
			$('#view').show();
			$('#copyToSon').show();
			$('#copyToCurrent').show();
		}
	}
	//选择一些属性拷贝到当前分类下
	function copyToCurrent() {
		chooseWindowCallBackHandle = function(row) {
			var ids;
			$(row).each(function(i, obj) {
				if (ids) {
					ids = ids + ',' + obj.ID;
				} else {
					ids = obj.ID;
				}
			});
			// 有数据执行操作
			$.messager.confirm(MESSAGE_PLAT.PROMPT, "是否拷贝" + row.length
					+ "条属性到本分类下?", function(flag) {
				if (flag) {
					$(gridTypefield).datagrid('loading');
					$.post("typefield/copyFieldToType.do" + '?typeid='
							+ $('#PARENTID_RULE').val() + '&fieldids=' + ids,
							{}, function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridTypefield).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$("#chooseCopytocurrentWin")
											.window('close');
									$(gridTypefield).datagrid('reload');
								} else {
									var str = MESSAGE_PLAT.ERROR_SUBMIT
											+ jsonObject.MESSAGE;
									$.messager.alert(MESSAGE_PLAT.ERROR, str,
											'error');
								}
							});
				}
			});
		};
		if (!$('#PARENTID_RULE').val() || $('#PARENTID_RULE').val() == 'NONE') {
			$.messager.alert(MESSAGE_PLAT.PROMPT, "请先选择分类!", 'info');
		} else {
			$.farm.openWindow({
				id : 'chooseCopytocurrentWin',
				width : 700,
				height : 400,
				modal : true,
				url : 'typefield/CopytocurrentChooseGridPage.do',
				title : '拷贝属性到当前分类下'
			});
		}
	}
	//新增
	function addDataTypefield() {
		if (!$('#PARENTID_RULE').val() || $('#PARENTID_RULE').val() == 'NONE') {
			$.messager.alert(MESSAGE_PLAT.PROMPT, "请先选择分类!", 'info');
		} else {
			var url = url_formActionTypefield + '?typeid='
					+ $('#PARENTID_RULE').val() + '&operateType='
					+ PAGETYPE.ADD;
			$.farm.openWindow({
				id : 'winTypefield',
				width : 600,
				height : 400,
				modal : true,
				url : url,
				title : '新增'
			});
		}
	}
	//传递到子类
	function addFromSon() {
		if (!$('#PARENTID_RULE').val() || $('#PARENTID_RULE').val() == 'NONE') {
			$.messager.alert(MESSAGE_PLAT.PROMPT, "请先选择分类!", 'info');
		} else {
			var selectedArray = $(gridTypefield).datagrid('getSelections');
			if (selectedArray.length > 0) {
				// 有数据执行操作
				var str = "确定要将这" + selectedArray.length + "条属性拷贝到所有子分类中?";
				$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
					if (flag) {
						$(gridTypefield).datagrid('loading');
						$.post("typefield/copyToSub.do" + '?typeid='
								+ $('#PARENTID_RULE').val() + '&ids='
								+ $.farm.getCheckedIds(gridTypefield, 'ID'),
								{}, function(flag) {
									var jsonObject = JSON.parse(flag, null);
									$(gridTypefield).datagrid('loaded');
									if (jsonObject.STATE == 0) {
										$(gridTypefield).datagrid('reload');
									} else {
										var str = MESSAGE_PLAT.ERROR_SUBMIT
												+ jsonObject.MESSAGE;
										$.messager.alert(MESSAGE_PLAT.ERROR,
												str, 'error');
									}
								});
					}
				});
			} else {
				$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE,
						'info');
			}
		}
	}
	//修改
	function editDataTypefield() {
		var selectedArray = $(gridTypefield).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionTypefield + '?operateType=' + PAGETYPE.EDIT
					+ '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winTypefield',
				width : 600,
				height : 400,
				modal : true,
				url : url,
				title : '修改'
			});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE_ONLY,
					'info');
		}
	}
	//删除
	function delDataTypefield() {
		var selectedArray = $(gridTypefield).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridTypefield).datagrid('loading');
					$.post(url_delActionTypefield + '?ids='
							+ $.farm.getCheckedIds(gridTypefield, 'ID'), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridTypefield).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridTypefield).datagrid('reload');
								} else {
									var str = MESSAGE_PLAT.ERROR_SUBMIT
											+ jsonObject.MESSAGE;
									$.messager.alert(MESSAGE_PLAT.ERROR, str,
											'error');
								}
							});
				}
			});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE,
					'info');
		}
	}
</script>
</html>