<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>热词管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/view/conf/include.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false">
		<table class="easyui-datagrid" id="dom_datagridwebCase">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="key" data-options="sortable:true" width="80">热词</th>
					<th field="num" data-options="sortable:true" width="80">热度</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script type="text/javascript">
	var url_searchActionwebCase = "webHotCase/query.do";//查询URL
	var gridwebCase;//数据表格对象
	var toolBarwebCase = [{
		id : 'del',
		text : '删除',
		iconCls : 'icon-remove',
		handler : delWebHosCase
	},{
		id : 'del',
		text : '清空',
		iconCls : 'icon-order-1',
		handler : clearWebHosCase
	}];
	
	$(function() {
		//初始化数据表格
		gridwebCase = $('#dom_datagridwebCase').datagrid({
			url : url_searchActionwebCase,
			'toolbar' : toolBarwebCase,
			fit : true,
			fitColumns : true,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
	});
	
	function delWebHosCase(){
		var selectedArray = $(gridwebCase).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridwebCase).datagrid('loading');
					$.post('webHotCase/del.do?keys='
							+ encodeURI(encodeURI($.farm.getCheckedIds(gridwebCase, 'key'))), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridwebCase).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridwebCase).datagrid('reload');
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
	function clearWebHosCase(){
		// 有数据执行操作
		$.messager.confirm(MESSAGE_PLAT.PROMPT, "是否清空所有？", function(flag) {
			if (flag) {
				$(gridwebCase).datagrid('loading');
				$.post('webHotCase/clear.do', {},
						function(flag) {
							var jsonObject = JSON.parse(flag, null);
							$(gridwebCase).datagrid('loaded');
							if (jsonObject.STATE == 0) {
								$(gridwebCase).datagrid('reload');
							} else {
								var str = MESSAGE_PLAT.ERROR_SUBMIT
										+ jsonObject.MESSAGE;
								$.messager.alert(MESSAGE_PLAT.ERROR, str,
										'error');
							}
						});
			}
		});
	}
</script>
</html>