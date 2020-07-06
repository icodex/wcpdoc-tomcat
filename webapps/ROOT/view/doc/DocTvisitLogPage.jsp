<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--小组用户-->
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false">
		<form id="searchDocVlogForm">
			<table class="editTable">
				<tr>
					<td class="title">知识名称:</td>
					<td><input name="TITLE:like" type="text"></td>
					<td><a id="a_search" href="javascript:void(0)"
						class="easyui-linkbutton" iconCls="icon-search">查询</a> <a
						id="a_reset" href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-reload">清除条件</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="dataDocVlogGrid">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="TITLE" data-options="sortable:true" width="70">
						知识名称</th>
					<th field="USERNAME" data-options="sortable:true" width="50">
						访问人</th>
					<th field="USERIP" data-options="sortable:true" width="50">
						访问ip</th>
					<th field="CTIME" data-options="sortable:true" width="50">
						访问时间</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var url_searchActionDocVlog = "doc/docVisitLogQuery.do?ids=${ids}";//查询URL
	var gridDocVlog;//数据表格对象
	var searchDocVlog;//条件查询组件对象
	var toolBarDocVlog = [];
	$(function() {
		//初始化数据表格
		gridDocVlog = $('#dataDocVlogGrid').datagrid({
			url : url_searchActionDocVlog,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarDocVlog,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			border : false,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchDocVlog = $('#searchDocVlogForm').searchForm({
			gridObj : gridDocVlog
		});
	});
</script>