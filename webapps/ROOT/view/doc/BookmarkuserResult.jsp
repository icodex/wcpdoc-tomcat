<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false">
		<form id="searchBookmarkuserForm">
			<table class="editTable">
				<tr>
					<td class="title">人员姓名:</td>
					<td><input name="USERNAME:like" type="text"></td>
					<td class="title">人员ID:</td>
					<td><input name="USERID:like" type="text"></td>
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
		<table id="dataBookmarkuserGrid">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="USERNAME" data-options="sortable:true" width="80">关注者</th>
					<th field="BOOKTIME" data-options="sortable:true" width="80">关注时间</th>
					<th field="APPNAME" data-options="sortable:true" width="100">关注对象</th>
					<th field="BOOKTYPE" data-options="sortable:true" width="80">关注类型</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var url_searchActionBookmarkuser = "farmdocenjoy/usersQuery.do?bookmarkId=${bookmarkId}";//查询URL
	var title_windowBookmarkuser = "订阅收藏用户管理";//功能名称
	var gridBookmarkuser;//数据表格对象
	var searchBookmarkuser;//条件查询组件对象
	var toolBarBookmarkuser = [ {
		id : 'add',
		text : '添加关注者',
		iconCls : 'icon-add',
		handler : addDataBookmarkuser
	}, {
		id : 'del',
		text : '删除关注者',
		iconCls : 'icon-remove',
		handler : delDataBookmarkuser
	} ];
	$(function() {
		//初始化数据表格
		gridBookmarkuser = $('#dataBookmarkuserGrid').datagrid({
			url : url_searchActionBookmarkuser,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarBookmarkuser,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchBookmarkuser = $('#searchBookmarkuserForm').searchForm({
			gridObj : gridBookmarkuser
		});
	});
	//新增
	function addDataBookmarkuser() {
		$.farm.openWindow({
			id : 'chooseUserWin',
			width : 600,
			height : 500,
			modal : true,
			url : 'user/chooseUser.do',
			title : '选择用户'
		});
	}
	//添加用户到關注者
	function chooseWindowCallBackHandle(selectedArray) {
		var useridsvar;
		$(selectedArray).each(function(i, obj) {
			if (useridsvar) {
				useridsvar = useridsvar + ',' + obj.ID;
			} else {
				useridsvar = obj.ID;
			}
		});
		$('#chooseUserWin').window('close');
		$(gridBookmarkuser).datagrid('loading');
		$.post('farmdocenjoy/addBookUser.do?bookmarkId=${bookmarkId}&userids='
				+ useridsvar, {}, function(flag) {
			var jsonObject = JSON.parse(flag, null);
			$(gridBookmarkuser).datagrid('loaded');
			if (jsonObject.STATE == 0) {
				$(gridBookmarkuser).datagrid('reload');
			} else {
				var str = MESSAGE_PLAT.ERROR_SUBMIT + jsonObject.MESSAGE;
				$.messager.alert(MESSAGE_PLAT.ERROR, str, 'error');
			}
		});
	}
	//删除
	function delDataBookmarkuser() {
		var selectedArray = $(gridBookmarkuser).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridBookmarkuser).datagrid('loading');
					$.post('farmdocenjoy/delBookUser.do?bookmarkUserIds='
							+ $.farm.getCheckedIds(gridBookmarkuser, 'ID'), {},
							function(flag) {
								var jsonObject = JSON.parse(flag, null);
								$(gridBookmarkuser).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridBookmarkuser).datagrid('reload');
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