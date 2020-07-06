<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>自定义属性数据管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/view/conf/include.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<div data-options="region:'west',split:true,border:false" style="width: 250px;">
		<div class="TREE_COMMON_BOX_SPLIT_DIV">
			<a id="DoctypeTreeReload" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" iconCls="icon-reload">刷新</a>
			<a id="DoctypeTreeOpenAll" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" iconCls="icon-sitemap">展开</a>
		</div>
		<ul id="DoctypeTree"></ul>
	</div>
	<div class="easyui-layout" data-options="region:'center',border:false">
		<div data-options="region:'north',border:false">
			<form id="searchDocfieldlistForm">
				<table class="editTable">
					<tr>
						<td class="title">知识分类:</td>
						<td>
							<input id="entity_typeTitleId"  type="text">
							<input id="entity_typeValId" name="TYPEID:like" type="hidden">
						</td>
						<td class="title">知识名称:</td>
						<td>
							<input name="TITLE:like" type="text">
						</td>
					</tr>
					<tr>
						<td class="title">属性名称:</td>
						<td>
							<input name="FIELDTITLE:like" type="text">
						</td>
						<td class="title">属性值:</td>
						<td>
							<input name="FIELDVAL:like" type="text">
						</td>
					</tr>
					<tr style="text-align: center;">
						<td colspan="4">
							<a id="a_search" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
							<a id="a_reset" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">清除条件</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="dataDocfieldlistGrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="TITLE" data-options="sortable:true" width="30">知识名称</th>
						<th field="FIELDTITLE" data-options="sortable:true" width="30">属性名称</th>
						<th field="FIELDVAL" data-options="sortable:true" width="50">属性值</th>
					</tr>
				</thead>
			</table>
			<form method="post" action="docfieldlist/exportExcel.do" id="reportForm">
				<input type="hidden" name="ruleText" id="ruleTextId" />
			</form>
		</div>
	</div> 
</body>
<script type="text/javascript">
	var url_delActionDocfieldlist = "docfieldlist/del.do";//删除URL
	var url_formActionDocfieldlist = "docfieldlist/form.do";//增加、修改、查看URL
	var url_searchActionDocfieldlist = "docfieldlist/query.do";//查询URL
	var title_windowDocfieldlist = "自定义属性管理";//功能名称
	var gridDocfieldlist;//数据表格对象
	var searchDocfieldlist;//条件查询组件对象
	var toolBarDocfieldlist = [ {
		id : 'view',
		text : '查看',
		iconCls : 'icon-tip',
		handler : viewDataDocfieldlist
	}, {
		id : 'export',
		text : '导出excel',
		iconCls : 'icon-add',
		handler : feildsExport
	} /**, {
		id : 'add',
		text : '新增',
		iconCls : 'icon-add',
		handler : addDataDocfieldlist
	}, {
		id : 'edit',
		text : '修改',
		iconCls : 'icon-edit',
		handler : editDataDocfieldlist
	}, {
		id : 'del',
		text : '删除',
		iconCls : 'icon-remove',
		handler : delDataDocfieldlist
	}**/
	];
	$(function() {
		//初始化数据表格
		gridDocfieldlist = $('#dataDocfieldlistGrid').datagrid({
			url : url_searchActionDocfieldlist,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarDocfieldlist,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchDocfieldlist = $('#searchDocfieldlistForm').searchForm({
			gridObj : gridDocfieldlist
		});
		$('#DoctypeTree').tree({
			url : 'doctype/FarmDoctypeLoadTreeNode.do',
			onSelect : function(node) {
				$('#entity_typeValId').val(node.id);
				$('#entity_typeTitleId').val(node.text);
				searchDocfieldlist.dosearch({
					'ruleText' : searchDocfieldlist.arrayStr()
				});
			},
			loadFilter : function(data, parent) {
				return data.treeNodes;
			}
		});
		$('#DoctypeTreeReload').bind('click', function() {
			$('#DoctypeTree').tree('reload');
		});
		$('#DoctypeTreeOpenAll').bind('click', function() {
			$('#DoctypeTree').tree('expandAll');
		});
	});
	//查看
	function viewDataDocfieldlist() {
		var selectedArray = $(gridDocfieldlist).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDocfieldlist + '?pageset.pageType='
					+ PAGETYPE.VIEW + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDocfieldlist',
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
	function addDataDocfieldlist() {
		var url = url_formActionDocfieldlist + '?operateType=' + PAGETYPE.ADD;
		$.farm.openWindow({
			id : 'winDocfieldlist',
			width : 600,
			height : 300,
			modal : true,
			url : url,
			title : '新增'
		});
	}
	//修改
	function editDataDocfieldlist() {
		var selectedArray = $(gridDocfieldlist).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDocfieldlist + '?operateType='
					+ PAGETYPE.EDIT + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDocfieldlist',
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
	function delDataDocfieldlist() {
		var selectedArray = $(gridDocfieldlist).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridDocfieldlist).datagrid('loading');
					$.post(url_delActionDocfieldlist + '?ids='
							+ $.farm.getCheckedIds(gridDocfieldlist, 'ID'), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridDocfieldlist).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridDocfieldlist).datagrid('reload');
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
	//人员导出
	function feildsExport() {
		$('#ruleTextId').val(searchDocfieldlist.arrayStr());
		$('#reportForm').submit();
	}
</script>
</html>