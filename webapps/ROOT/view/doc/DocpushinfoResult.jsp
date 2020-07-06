<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false">
		<form id="searchDocpushinfoForm">
			<table class="editTable">
				<tr>
					<td class="title">知识名称:</td>
					<td><input name="DOCNAMES:like" type="text"></td>
					<td class="title">接收人名称:</td>
					<td><input name="RECEIVERNAMES:like" type="text"></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="4"><a id="a_search" href="javascript:void(0)"
						class="easyui-linkbutton" iconCls="icon-search">查询</a> <a
						id="a_reset" href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-reload">清除条件</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="dataDocpushinfoGrid">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="DOCNAMES" data-options="sortable:true" width="130">知识名称</th>
					<th field="RECEIVERNAMES" data-options="sortable:true" width="130">接收人名称</th>
					<th field="PSTATE" data-options="sortable:true" width="60">状态</th>
					<th field="CUSERNAME" data-options="sortable:true" width="60">推送人</th>
					<th field="CTIME" data-options="sortable:true" width="120">推送时间</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var url_delActionDocpushinfo = "docpushinfo/del.do";//删除URL
	var url_formActionDocpushinfo = "docpushinfo/form.do";//增加、修改、查看URL
	var url_searchActionDocpushinfo = "docpushinfo/query.do";//查询URL
	var title_windowDocpushinfo = "知识推送记录管理";//功能名称
	var gridDocpushinfo;//数据表格对象
	var searchDocpushinfo;//条件查询组件对象
	var toolBarDocpushinfo = [ /**{
		id : 'view',
		text : '查看记录',
		iconCls : 'icon-tip',
		handler : viewDataDocpushinfo
	},**/ {
		id : 'add',
		text : '开始推送',
		iconCls : 'icon-add',
		handler : addDataDocpushinfo
	}, {
		id : 'del',
		text : '删除记录',
		iconCls : 'icon-remove',
		handler : delDataDocpushinfo
	} ];
	$(function() {
		//初始化数据表格
		gridDocpushinfo = $('#dataDocpushinfoGrid').datagrid({
			url : url_searchActionDocpushinfo,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarDocpushinfo,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchDocpushinfo = $('#searchDocpushinfoForm').searchForm({
			gridObj : gridDocpushinfo
		});
	});
	//查看
	function viewDataDocpushinfo() {
		var selectedArray = $(gridDocpushinfo).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDocpushinfo + '?pageset.pageType='
					+ PAGETYPE.VIEW + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDocpushinfo',
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
	function addDataDocpushinfo() {
		var url = url_formActionDocpushinfo + '?operateType=' + PAGETYPE.ADD
				+ '&ids=${ids}';
		$.farm.openWindow({
			id : 'winDocpushinfo',
			width : 600,
			height : 400,
			modal : true,
			url : url,
			title : '新增'
		});
	}
	//修改
	function editDataDocpushinfo() {
		var selectedArray = $(gridDocpushinfo).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDocpushinfo + '?operateType='
					+ PAGETYPE.EDIT + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDocpushinfo',
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
	function delDataDocpushinfo() {
		var selectedArray = $(gridDocpushinfo).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridDocpushinfo).datagrid('loading');
					$.post(url_delActionDocpushinfo + '?ids='
							+ $.farm.getCheckedIds(gridDocpushinfo, 'ID'), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridDocpushinfo).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridDocpushinfo).datagrid('reload');
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