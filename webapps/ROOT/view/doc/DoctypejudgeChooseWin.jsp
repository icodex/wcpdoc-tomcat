<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false">
		<form id="dom_chooseSearchCopytocurrent">
			<table class="editTable">
				<tr>
					<td class="title">分类名称:</td>
					<td>
						<input name="JUDGECODE:like" type="text" style="width: 120px;">
					</td>
					<td class="title">评价项代码:</td>
					<td>
						<input name="JUDGECODE:like" type="text" style="width: 120px;">
					</td>
					<td class="title">评价项名称:</td>
					<td>
						<input name="JUDGETITLE:like" type="text" style="width: 120px;">
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
		<table id="dom_chooseGridCopytocurrent">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="SORTNUM" data-options="sortable:true" width="20">排序</th>
					<th field="JUDGETITLE" data-options="sortable:true" width="50">评价项名称</th>
					<th field="JUDGECODE" data-options="sortable:true" width="50">评价项代码</th>
					<th field="TYPENAME" data-options="sortable:true" width="40">所属分类</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var chooseGridCopytocurrent;
	var chooseSearchfarmCopytocurrent;
	var toolbar_chooseCopytocurrent = [ {
		text : '复制到当前分类',
		iconCls : 'icon-ok',
		handler : function() {
			var selectedArray = $('#dom_chooseGridCopytocurrent').datagrid(
					'getSelections');
			if (selectedArray.length > 0) {
				chooseWindowCallBackHandle(selectedArray);
			} else {
				$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE,
						'info');
			}
		}
	} ];
	$(function() {
		chooseGridCopytocurrent = $('#dom_chooseGridCopytocurrent').datagrid({
			url : 'doctypejudge/CopytocurrentChooseQuery.do',
			fit : true,
			'toolbar' : toolbar_chooseCopytocurrent,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			rownumbers : true,
			ctrlSelect : true,
			fitColumns : true
		});
		chooseSearchfarmCopytocurrent = $('#dom_chooseSearchCopytocurrent')
				.searchForm({
					gridObj : chooseGridCopytocurrent
				});
	});
//-->
</script>