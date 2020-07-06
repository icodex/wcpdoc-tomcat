<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--选择文档-->
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false">
		<form id="searchLinkUserForm">
			<table class="editTable">
				<tr>
					<td class="title">用户姓名:</td>
					<td><input name="a.NAME:like" type="text"></td> 
					<td><a id="a_search" href="javascript:void(0)"
						class="easyui-linkbutton" iconCls="icon-search">查询</a> <a
						id="a_reset" href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-reload">清除条件</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table class="easyui-datagrid" id="dom_linkUserParasTable">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="ORGNAME" data-options="sortable:true" width="40">组织机构</th>
					<th field="NAME" data-options="sortable:true" width="40">用户姓名</th>
					<th field="PARAS" data-options="sortable:true" width="140">
						参数值(多个值用逗号分隔)</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var linkUserParasGrid;
	var toolbar_linkUserParas = [
			{
				text : '设置参数',
				iconCls : 'icon-pencil',
				handler : function() {
					var selectedArray = $(linkUserParasGrid).datagrid(
							'getSelections');
					if (selectedArray.length == 1) {
						var url = 'weburl/paraSetting.do?userId='
								+ selectedArray[0].USERID + '&weburlId=${id}';
						$.farm.openWindow({
							id : 'winWeburl',
							width : 500,
							height : 400,
							modal : true,
							url : url,
							title : '修改参数'
						});
					} else {
						$.messager.alert(MESSAGE_PLAT.PROMPT,
								MESSAGE_PLAT.CHOOSE_ONE_ONLY, 'info');
					}
				}
			},{
				text : '删除参数',
				iconCls : 'icon-remove',
				handler : function() {
					var selectedArray = $(linkUserParasGrid).datagrid('getSelections');
					if (selectedArray.length > 0) {
						// 有数据执行操作
						var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
						$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
							if (flag) {
								$(linkUserParasGrid).datagrid('loading');
								var delUrl='weburl/delpara.do?weburlid=${id}&userids='
									+ $.farm.getCheckedIds(linkUserParasGrid, 'USERID');
								$.post(delUrl, {},
										function(flag) {
											var jsonObject = JSON.parse(flag, null);
											$(linkUserParasGrid).datagrid('loaded');
											if (jsonObject.STATE == 0) {
												$(linkUserParasGrid).datagrid('reload');
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
			},
			{
				text : '下载导入模板',
				iconCls : 'icon-invoice',
				handler : function() {
					window.location.href = basePath + "weburl/templetDown.do?weburlid=${id}"
				}
			},
			{
				text : '导入模板参数',
				iconCls : 'icon-issue',
				handler : function() {
					$.farm.openWindow({
						id : 'toParametersImport',
						width : 400,
						height : 250,
						modal : true,
						url : "weburl/toParametersImport.do?weburlid=${id}",
						title : '导入模板参数'
					});
				}
			} ];
	$(function() {
		linkUserParasGrid = $('#dom_linkUserParasTable').datagrid({
			url : 'weburl/userParasQuery.do?id=${id}',
			fit : true,
			'toolbar' : toolbar_linkUserParas,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			rownumbers : true,
			ctrlSelect : true,
			fitColumns : true
		});
		//初始化条件查询
		var LinkUserSearchForm = $('#searchLinkUserForm').searchForm({
			gridObj : linkUserParasGrid
		});
	});
//-->
</script>
ssss
