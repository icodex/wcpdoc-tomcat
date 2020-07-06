<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>用户自定义评价值数据管理</title>
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
			<form id="searchDocuserjudgeForm">
				<table class="editTable">
					<tr>
						<td class="title">分类:</td>
						<td>
							<input id="PARENTTITLE_RULE" type="text" readonly="readonly" style="background: #F3F3E8">
							<input id="PARENTID_RULE" name="TYPEID:=" type="hidden">
						</td>
						<td class="title">知识名称:</td>
						<td>
							<input name="TITLE:like" type="text">
						</td>
					</tr>
					<tr>
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
						<td colspan="4">
							<a id="a_search" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
							<a id="a_reset" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">清除条件</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="dataDocuserjudgeGrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="TITLE" data-options="sortable:true" width="90">知识名称</th>
						<th field="JUDGETITLE" data-options="sortable:true" width="50">评价项名称</th>
						<th field="JUDGECODE" data-options="sortable:true" width="60">评价项代码</th>
						<th field="NUM" data-options="sortable:true" width="70">评价值</th>
					</tr>
				</thead>
			</table>
			<form method="post" action="docuserjudge/exportExcel.do" id="reportForm">
				<input type="hidden" name="ruleText" id="ruleTextId" />
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	var url_delActionDocuserjudge = "docuserjudge/del.do";//删除URL
	var url_formActionDocuserjudge = "docuserjudge/form.do";//增加、修改、查看URL
	var url_searchActionDocuserjudge = "docuserjudge/query.do";//查询URL
	var title_windowDocuserjudge = "用户自定义评价值管理";//功能名称
	var gridDocuserjudge;//数据表格对象
	var searchDocuserjudge;//条件查询组件对象
	var toolBarDocuserjudge = [ {
		id : 'view',
		text : '查看明细',
		iconCls : 'icon-tip',
		handler : viewDataDocuserjudge
	}, {
		id : 'export',
		text : '导出excel',
		iconCls : 'icon-add',
		handler : feildsExport
	} /**, {
		id : 'add',
		text : '新增',
		iconCls : 'icon-add',
		handler : addDataDocuserjudge
	}, {
		id : 'edit',
		text : '修改',
		iconCls : 'icon-edit',
		handler : editDataDocuserjudge
	}, {
		id : 'del',
		text : '删除',
		iconCls : 'icon-remove',
		handler : delDataDocuserjudge
	} **/
	];
	$(function() {
		//初始化数据表格
		gridDocuserjudge = $('#dataDocuserjudgeGrid').datagrid({
			url : url_searchActionDocuserjudge,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarDocuserjudge,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchDocuserjudge = $('#searchDocuserjudgeForm').searchForm({
			gridObj : gridDocuserjudge
		});
		$('#FarmdocTree').tree({
			url : 'doctype/FarmDoctypeLoadTreeNode.do',
			onSelect : function(node) {
				$('#PARENTID_RULE').val(node.id);
				$('#PARENTTITLE_RULE').val(node.text);
				searchDocuserjudge.dosearch({
					'ruleText' : searchDocuserjudge.arrayStr()
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
	});
	//查看
	function viewDataDocuserjudge() {
		var selectedArray = $(gridDocuserjudge).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var judgeid = selectedArray[0].JUDGEID;
			var docid = selectedArray[0].DOCID;
			var url = 'docuserjudge/infoList.do?judgeid=' + judgeid + '&docid='
					+ docid;
			$.farm.openWindow({
				id : 'winDocuserjudge',
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
	function addDataDocuserjudge() {
		var url = url_formActionDocuserjudge + '?operateType=' + PAGETYPE.ADD;
		$.farm.openWindow({
			id : 'winDocuserjudge',
			width : 600,
			height : 300,
			modal : true,
			url : url,
			title : '新增'
		});
	}
	//修改
	function editDataDocuserjudge() {
		var selectedArray = $(gridDocuserjudge).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDocuserjudge + '?operateType='
					+ PAGETYPE.EDIT + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDocuserjudge',
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
	function delDataDocuserjudge() {
		var selectedArray = $(gridDocuserjudge).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridDocuserjudge).datagrid('loading');
					$.post(url_delActionDocuserjudge + '?ids='
							+ $.farm.getCheckedIds(gridDocuserjudge, 'ID'), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridDocuserjudge).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridDocuserjudge).datagrid('reload');
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
		$('#ruleTextId').val(searchDocuserjudge.arrayStr());
		$('#reportForm').submit();
	}
</script>
</html>