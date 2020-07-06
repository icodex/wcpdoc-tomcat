<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>订阅关注数据管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/view/conf/include.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false">
		<form id="searchBookmarkForm">
			<table class="editTable">
				<tr>
					<td class="title">关注对象名称:</td>
					<td><input name="APPNAME:like" type="text"></td>
					<td class="title">关注对象ID:</td>
					<td><input name="APPID:like" type="text"></td>
					<td class="title">关注域类型:</td>
					<td><select name="TYPE:like">
							<option value="">~全部~</option>
							<option value="1">知识</option>
							<option value="3">分类</option>
					</select></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="6"><a id="a_search" href="javascript:void(0)"
						class="easyui-linkbutton" iconCls="icon-search">查询</a> <a
						id="a_reset" href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-reload">清除条件</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="dataBookmarkGrid">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="APPNAME" data-options="sortable:true" width="70">被关注对象名称</th>
					<th field="BOOKNUM" data-options="sortable:true" width="70">关注次数</th>
					<th field="APPABLE" data-options="sortable:false" width="70">对象状态</th>
					<th field="TYPE" data-options="sortable:true" width="40">关注类型</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script type="text/javascript">
	var url_delActionBookmark = "farmdocenjoy/del.do";//删除URL
	var url_formActionBookmark = "farmdocenjoy/form.do";//增加、修改、查看URL
	var url_searchActionBookmark = "farmdocenjoy/query.do";//查询URL
	var title_windowBookmark = "订阅关注管理";//功能名称
	var gridBookmark;//数据表格对象
	var searchBookmark;//条件查询组件对象
	var toolBarBookmark = [ {
		id : 'add',
		text : '添加对象',
		iconCls : 'icon-add',
		handler : addDataBookmark
	}, {
		id : 'del',
		text : '删除对象',
		iconCls : 'icon-remove',
		handler : delDataBookmark
	}, {
		id : 'bookUser',
		text : '管理关注人',
		iconCls : 'icon-client_account_template',
		handler : mngBookmarkUsers
	} ];
	$(function() {
		//初始化数据表格
		gridBookmark = $('#dataBookmarkGrid').datagrid({
			url : url_searchActionBookmark,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarBookmark,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchBookmark = $('#searchBookmarkForm').searchForm({
			gridObj : gridBookmark
		});
	});
	//新增
	function addDataBookmark() {
		var url = url_formActionBookmark + '?operateType=' + PAGETYPE.ADD;
		$.farm.openWindow({
			id : 'winBookmark',
			width : 600,
			height : 200,
			modal : true,
			url : url,
			title : '新增'
		});
	}

	//管理关注着
	function mngBookmarkUsers() {
		var selectedArray = $(gridBookmark).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = 'farmdocenjoy/bookUsers.do?operateType=' + PAGETYPE.EDIT
					+ '&bookmarkId=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winBookUsersWin',
				width : 650,
				height : 450,
				modal : true,
				url : url,
				title : '管理关注者'
			});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE_ONLY,
					'info');
		}
	}

	//删除
	function delDataBookmark() {
		var selectedArray = $(gridBookmark).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridBookmark).datagrid('loading');
					$.post(url_delActionBookmark + '?ids='
							+ $.farm.getCheckedIds(gridBookmark, 'ID'), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridBookmark).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridBookmark).datagrid('reload');
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