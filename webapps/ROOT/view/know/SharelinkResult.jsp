<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>链接分享数据管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/view/conf/include.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false">
		<form id="searchSharelinkForm">
			<table class="editTable">
				<tr>
					<td class="title">分享关键字:</td>
					<td>
						<input name="SHAREKEY:like" type="text">
					</td>
					<td class="title">内容名称:</td>
					<td>
						<input name="NAME:like" type="text">
					</td>
					<td class="title">分享人:</td>
					<td>
						<input name="CUSERNAME:like" type="text">
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
		<table id="dataSharelinkGrid">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<!-- <th field="DOCTYPE" data-options="sortable:true" width="20">内容类型</th> -->
					<th field="NAME" data-options="sortable:true" width="50">内容名称</th>
					<th field="SHAREKEY" data-options="sortable:true" width="30">分享关键字</th>
					<th field="SHARETYPE" data-options="sortable:true" width="20">分享类型</th>
					<th field="SHARELIVE" data-options="sortable:true" width="20">分享时效</th>
					<th field="CTIME" data-options="sortable:true" width="40">分享时间</th>
					<th field="CUSERNAME" data-options="sortable:true" width="30">分享人</th>
					<th field="PSTATE" data-options="sortable:true" width="20">状态</th>
					<th field="VISITNUM" data-options="sortable:true" width="20">被访问次数</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script type="text/javascript">
	var url_delActionSharelink = "sharelink/del.do";//删除URL
	var url_formActionSharelink = "sharelink/form.do";//增加、修改、查看URL
	var url_searchActionSharelink = "sharelink/query.do";//查询URL
	var title_windowSharelink = "链接分享管理";//功能名称
	var gridSharelink;//数据表格对象
	var searchSharelink;//条件查询组件对象
	var toolBarSharelink = [ {
		id : 'view',
		text : '查看',
		iconCls : 'icon-tip',
		handler : viewDataSharelink
	},
	//{
	//	id : 'add',
	//	text : '新增',
	//	iconCls : 'icon-add',
	//	handler : addDataSharelink
	//}, {
	//	id : 'edit',
	//	text : '修改',
	//	iconCls : 'icon-edit',
	//	handler : editDataSharelink
	//}, 
	{
		id : 'unable',
		text : '取消分享',
		iconCls : 'icon-remove',
		handler : unDataSharelink
	}
	//, 
	//{
	//	id : 'del',
	//	text : '删除',
	//	iconCls : 'icon-remove',
	//	handler : delDataSharelink
	//} 
	];
	$(function() {
		//初始化数据表格
		gridSharelink = $('#dataSharelinkGrid').datagrid({
			url : url_searchActionSharelink,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarSharelink,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchSharelink = $('#searchSharelinkForm').searchForm({
			gridObj : gridSharelink
		});
	});
	//查看
	function viewDataSharelink() {
		var selectedArray = $(gridSharelink).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionSharelink + '?pageset.pageType='
					+ PAGETYPE.VIEW + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winSharelink',
				width : 600,
				height : 400,
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
	function addDataSharelink() {
		var url = url_formActionSharelink + '?operateType=' + PAGETYPE.ADD;
		$.farm.openWindow({
			id : 'winSharelink',
			width : 600,
			height : 300,
			modal : true,
			url : url,
			title : '新增'
		});
	}
	//修改
	function editDataSharelink() {
		var selectedArray = $(gridSharelink).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionSharelink + '?operateType=' + PAGETYPE.EDIT
					+ '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winSharelink',
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
	function delDataSharelink() {
		var selectedArray = $(gridSharelink).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridSharelink).datagrid('loading');
					$.post(url_delActionSharelink + '?ids='
							+ $.farm.getCheckedIds(gridSharelink, 'ID'), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridSharelink).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridSharelink).datagrid('reload');
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
	//取消分享
	function unDataSharelink() {
		var selectedArray = $(gridSharelink).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, "确认禁用分享?", function(flag) {
				if (flag) {
					$(gridSharelink).datagrid('loading');
					$.post("sharelink/unshare.do" + '?ids='
							+ $.farm.getCheckedIds(gridSharelink, 'ID'), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridSharelink).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridSharelink).datagrid('reload');
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