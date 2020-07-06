<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>自定义评价数据管理</title>
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
			<form id="searchDoctypejudgeForm">
				<table class="editTable">
					<tr>
						<td class="title">分类:</td>
						<td>
							<input id="PARENTTITLE_RULE" type="text" readonly="readonly" style="background: #F3F3E8">
							<input id="PARENTID_RULE" name="B.ID:=" type="hidden">
						</td>
						<td class="title">评价项代码:</td>
						<td>
							<input name="JUDGECODE:like" type="text">
						</td>
						<td class="title">评价项名称:</td>
						<td>
							<input name="JUDGETITLE:like" type="text">
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
			<table id="dataDoctypejudgeGrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="SORTNUM" data-options="sortable:true" width="30">排序</th>
						<th field="JUDGETITLE" data-options="sortable:true" width="50">评价项名称</th>
						<th field="JUDGECODE" data-options="sortable:true" width="50">评价项代码</th>
						<th field="TYPENAME" data-options="sortable:true" width="40">所属分类</th>
						<th field="SOURCENAME" data-options="sortable:true" width="40">来源</th>
						<th field="PSTATE" data-options="sortable:true" width="20">状态</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
	var url_delActionDoctypejudge = "doctypejudge/del.do";//删除URL
	var url_formActionDoctypejudge = "doctypejudge/form.do";//增加、修改、查看URL
	var url_searchActionDoctypejudge = "doctypejudge/query.do";//查询URL
	var title_windowDoctypejudge = "自定义评价管理";//功能名称
	var gridDoctypejudge;//数据表格对象
	var searchDoctypejudge;//条件查询组件对象
	var toolBarDoctypejudge = [ /**{
	                    		id : 'view',
	                    		text : '查看',
	                    		iconCls : 'icon-tip',
	                    		handler : viewDataDoctypejudge
	                    	}, **/
	{
		id : 'add',
		text : '新增评价项',
		iconCls : 'icon-add',
		handler : addDataDoctypejudge
	}, {
		id : 'copyToSon',
		text : '拷贝评价项到子类',
		iconCls : 'icon-move_to_folder',
		handler : addFromSon
	}, {
		id : 'copyToCurrent',
		text : '拷贝评价项到当前',
		iconCls : 'icon-move_to_folder',
		handler : copyToCurrent
	}, {
		id : 'edit',
		text : '修改',
		iconCls : 'icon-edit',
		handler : editDataDoctypejudge
	}, {
		id : 'del',
		text : '删除',
		iconCls : 'icon-remove',
		handler : delDataDoctypejudge
	} ];
	$(function() {
		//初始化数据表格
		gridDoctypejudge = $('#dataDoctypejudgeGrid').datagrid({
			url : url_searchActionDoctypejudge,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarDoctypejudge,
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
		searchDoctypejudge = $('#searchDoctypejudgeForm').searchForm({
			gridObj : gridDoctypejudge
		});
		$('#FarmdocTree').tree({
			url : 'doctype/FarmDoctypeLoadTreeNode.do',
			onSelect : function(node) {
				$('#PARENTID_RULE').val(node.id);
				$('#PARENTTITLE_RULE').val(node.text);
				searchDoctypejudge.dosearch({
					'ruleText' : searchDoctypejudge.arrayStr()
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
	//查看
	function viewDataDoctypejudge() {
		var selectedArray = $(gridDoctypejudge).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDoctypejudge + '?pageset.pageType='
					+ PAGETYPE.VIEW + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDoctypejudge',
				width : 600,
				height : 300,
				modal : true,
				url : url,
				title : '浏览'
			});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE_ONLY,
					'info');
		}
	}
	//新增
	function addDataDoctypejudge() {
		if (!$('#PARENTID_RULE').val() || $('#PARENTID_RULE').val() == 'NONE') {
			$.messager.alert(MESSAGE_PLAT.PROMPT, "请先选择分类!", 'info');
		} else {
			var url = url_formActionDoctypejudge + '?typeid='
					+ $('#PARENTID_RULE').val() + '&operateType='
					+ PAGETYPE.ADD;
			$.farm.openWindow({
				id : 'winDoctypejudge',
				width : 600,
				height : 300,
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
			var selectedArray = $(gridDoctypejudge).datagrid('getSelections');
			if (selectedArray.length > 0) {
				// 有数据执行操作
				var str = "确定要将这" + selectedArray.length + "条评价项拷贝到所有子分类中?";
				$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
					if (flag) {
						$(gridDoctypejudge).datagrid('loading');
						$.post("doctypejudge/copyToSub.do" + '?typeid='
								+ $('#PARENTID_RULE').val() + '&ids='
								+ $.farm.getCheckedIds(gridDoctypejudge, 'ID'),
								{}, function(flag) {
									var jsonObject = JSON.parse(flag, null);
									$(gridDoctypejudge).datagrid('loaded');
									if (jsonObject.STATE == 0) {
										$(gridDoctypejudge).datagrid('reload');
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
					+ "条评价项到本分类下?", function(flag) {
				if (flag) {
					$(gridDoctypejudge).datagrid('loading');
					$.post("doctypejudge/copyJudgeToType.do" + '?typeid='
							+ $('#PARENTID_RULE').val() + '&fieldids=' + ids,
							{}, function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridDoctypejudge).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$("#chooseCopytocurrentWin")
											.window('close');
									$(gridDoctypejudge).datagrid('reload');
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
				url : 'doctypejudge/CopytocurrentChooseGridPage.do',
				title : '选择评价项'
			});
		}
	}
	//修改
	function editDataDoctypejudge() {
		var selectedArray = $(gridDoctypejudge).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDoctypejudge + '?operateType='
					+ PAGETYPE.EDIT + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDoctypejudge',
				width : 600,
				height : 300,
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
	function delDataDoctypejudge() {
		var selectedArray = $(gridDoctypejudge).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridDoctypejudge).datagrid('loading');
					$.post(url_delActionDoctypejudge + '?ids='
							+ $.farm.getCheckedIds(gridDoctypejudge, 'ID'), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridDoctypejudge).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridDoctypejudge).datagrid('reload');
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
	//初始化功能按钮，如果没有选择分类，有些按钮是不显示得
	function initButtons() {
		if (!$('#PARENTID_RULE').val() || $('#PARENTID_RULE').val() == 'NONE') {
			$('#copyToSon').hide();
			$('#copyToCurrent').hide();
		} else {
			$('#copyToSon').show();
			$('#copyToCurrent').show();
		}
	}
</script>
</html>