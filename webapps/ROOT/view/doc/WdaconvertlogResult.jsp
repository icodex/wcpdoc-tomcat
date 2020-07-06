<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>预览文档转换日志数据管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/view/conf/include.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false">
		<form id="searchWdaconvertlogForm">
			<table class="editTable">
				<tr>
					<td class="title">标题:</td>
					<td><input style="width: 100px;" name="TITLE:like" type="text"></td>
					<td class="title">状态:</td>
					<td><select name="PSTATE:=">
							<option value=""></option>
							<option value="0">初始化</option>
							<option value="1">可以转换</option>
							<option value="2">提交转换</option>
							<option value="3">转换完成</option>
							<option value="10">转换失败</option>
							<option value="11">禁止转换</option>
							<option value="12">不支持转换</option>
					</select></td>
					<td class="title">失败数&gt;=:</td>
					<td><input style="width: 50px;" name="ERRORNUM:>=" type="text"></td>
					<td class="title">失败数&lt;=:</td>
					<td><input style="width: 50px;" name="ERRORNUM:<=" type="text"></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="8"><a id="a_search" href="javascript:void(0)"
						class="easyui-linkbutton" iconCls="icon-search">查询</a> <a
						id="a_reset" href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-reload">清除条件</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="dataWdaconvertlogGrid">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="TITLE" data-options="sortable:true" width="50">标题</th>
					<th field="DOCID" data-options="sortable:true" width="30">知识id</th>
					<th field="FILEID" data-options="sortable:true" width="30">附件id</th>
					<th field="EXNAME" data-options="sortable:true" width="20">附件扩展名</th>
					<th field="CTIME" data-options="sortable:true" width="30">创建时间</th>
					<th field="ETIME" data-options="sortable:true" width="30">更新时间</th>
					<th field="PSTATE" data-options="sortable:true" width="20">状态</th>
					<th field="ERRORNUM" data-options="sortable:true" width="20">失败次数</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script type="text/javascript">
	var url_delActionWdaconvertlog = "wdaconvertlog/del.do";//删除URL
	var url_formActionWdaconvertlog = "wdaconvertlog/form.do";//增加、修改、查看URL
	var url_searchActionWdaconvertlog = "wdaconvertlog/query.do";//查询URL
	var title_windowWdaconvertlog = "预览文档转换日志管理";//功能名称
	var gridWdaconvertlog;//数据表格对象
	var searchWdaconvertlog;//条件查询组件对象
	var toolBarWdaconvertlog = [ {
		id : 'view',
		text : '查看',
		iconCls : 'icon-tip',
		handler : viewDataWdaconvertlog
	}
	//	, {
	//		id : 'add',
	//		text : '新增',
	//		iconCls : 'icon-add',
	//		handler : addDataWdaconvertlog
	//	}, {
	//		id : 'edit',
	//		text : '修改',
	//		iconCls : 'icon-edit',
	//		handler : editDataWdaconvertlog
	//	}
	, {
		id : 'del',
		text : '删除',
		iconCls : 'icon-remove',
		handler : delDataWdaconvertlog
	}, {
		id : 'del',
		text : '禁止&nbsp;/&nbsp;允许转换',
		iconCls : 'icon-busy',
		handler : cutStateWdaconvertlog
	}, {
		id : 'review',
		text : '重做预览文件',
		iconCls : 'icon-application_osx_terminal',
		handler : reViewConvert
	} ];
	$(function() {
		//初始化数据表格
		gridWdaconvertlog = $('#dataWdaconvertlogGrid').datagrid({
			url : url_searchActionWdaconvertlog,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarWdaconvertlog,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchWdaconvertlog = $('#searchWdaconvertlogForm').searchForm({
			gridObj : gridWdaconvertlog
		});
	});
	//查看
	function viewDataWdaconvertlog() {
		var selectedArray = $(gridWdaconvertlog).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionWdaconvertlog + '?pageset.pageType='
					+ PAGETYPE.VIEW + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winWdaconvertlog',
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
	function addDataWdaconvertlog() {
		var url = url_formActionWdaconvertlog + '?operateType=' + PAGETYPE.ADD;
		$.farm.openWindow({
			id : 'winWdaconvertlog',
			width : 600,
			height : 300,
			modal : true,
			url : url,
			title : '新增'
		});
	}
	//修改
	function editDataWdaconvertlog() {
		var selectedArray = $(gridWdaconvertlog).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionWdaconvertlog + '?operateType='
					+ PAGETYPE.EDIT + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winWdaconvertlog',
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

	//重新生成预览文件
	function reViewConvert() {
		var selectedArray = $(gridWdaconvertlog).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + "个附件将被重新生成预览文件，确定要执行该操作么？";
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridWdaconvertlog).datagrid('loading');
					$.post("wdafunc/reView.do" + '?ids='
							+ $.farm.getCheckedIds(gridWdaconvertlog, 'ID'),
							{}, function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridWdaconvertlog).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridWdaconvertlog).datagrid('reload');
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

	//禁止转换、取消禁止切换按钮
	function cutStateWdaconvertlog() {
		var selectedArray = $(gridWdaconvertlog).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = "是否切换该记录的禁止/允许状态?";
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridWdaconvertlog).datagrid('loading');
					$.post("wdaconvertlog/cutState.do" + '?ids='
							+ $.farm.getCheckedIds(gridWdaconvertlog, 'ID'),
							{}, function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridWdaconvertlog).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridWdaconvertlog).datagrid('reload');
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
	//删除
	function delDataWdaconvertlog() {
		var selectedArray = $(gridWdaconvertlog).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridWdaconvertlog).datagrid('loading');
					$.post(url_delActionWdaconvertlog + '?ids='
							+ $.farm.getCheckedIds(gridWdaconvertlog, 'ID'),
							{}, function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridWdaconvertlog).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridWdaconvertlog).datagrid('reload');
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