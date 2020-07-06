<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--小组知识管理-->
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false">
		<form id="searchDocgroupDocsForm">
			<table class="editTable">
				<tr>
					<td class="title">知识名称:</td>
					<td><input name="A.TITLE:like" type="text"></td>
					<td><a id="a_search" href="javascript:void(0)"
						class="easyui-linkbutton" iconCls="icon-search">查询</a> <a
						id="a_reset" href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-reload">清除条件</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="dataDocgroupDocsGrid">
			<thead>
				<tr>
					<!-- 标题 ,内容类型 ,发布时间  ,作者   -->
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="DOMTYPE" data-options="sortable:true" width="70">内容类型</th>
					<th field="TITLE" data-options="sortable:true" width="70">标题</th>
					<th field="PUBTIME" data-options="sortable:true" width="20">发布时间</th>
					<th field="AUTHOR" data-options="sortable:true" width="20">作者</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var url_searchActionDocgroupDocs = "docgroup/queryDocsList.do?id=${ids}";//查询URL
	var title_windowDocgroupDocs = "小组成员管理";//功能名称
	var gridDocgroupDocs;//数据表格对象
	var searchDocgroupDocs;//条件查询组件对象
	var toolBarDocgroupDocs = [ {
		id : 'add',
		text : '添加',
		iconCls : 'icon-add',
		handler : addDataDocgroupDocs
	}, {
		id : 'del',
		text : '移除',
		iconCls : 'icon-remove',
		handler : delDataDocgroupDocs
	} ];
	$(function() {
		//初始化数据表格
		gridDocgroupDocs = $('#dataDocgroupDocsGrid').datagrid({
			url : url_searchActionDocgroupDocs,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarDocgroupDocs,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			border : false,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchDocgroupDocs = $('#searchDocgroupDocsForm').searchForm({
			gridObj : gridDocgroupDocs
		});
	});

	//导入
	function addDataDocgroupDocs() {
		var url = "docgroup/toGroupChooseDoc.do";
		$.farm.openWindow({
			id : 'chooseDocsWin',
			width : 800,
			height : 450,
			modal : true,
			url : url,
			title : '导入知识'
		});
		chooseWindowCallBackHandle = function(row) {
			var docids;
			$(row).each(function(i, obj) {
				if (docids) {
					docids = docids + ',' + obj.ID;
				} else {
					docids = obj.ID;
				}
			});
			//alert('gourpId=${ids}'+'知识id='+docids);	return ;
			$.messager.progress({
				title : '提示',
				msg : '',
				text : '保存中...'
			});
			$(gridDocgroupDocs).datagrid('loading');
			$.post("docgroup/addDocsToGroup.do", {
				'docids' : docids,
				'groupid' : '${ids}'
			},
					function(flag) {
						$.messager.progress('close');
						if (flag.STATE == 0) {
							$('#chooseDocsWin').window('close');
							$(gridDocgroupDocs).datagrid('reload');
						} else {
							$.messager.alert(MESSAGE_PLAT.ERROR, flag.MESSAGE,
									'error');
						}
					}, 'json');
		};
	}

	//删除
	function delDataDocgroupDocs() {
		var selectedArray = $(gridDocgroupDocs).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridDocgroupDocs).datagrid('loading');
					$.post('docgroup/delDocsFromGroup.do?groupid=${ids}&docids='
							+ $.farm.getCheckedIds(gridDocgroupDocs, 'DOCID'), {},
							function(flag) {
								$(gridDocgroupDocs).datagrid('loaded');
								if (flag.STATE == 0) {
									$(gridDocgroupDocs).datagrid('reload');
								} else {
									var str = MESSAGE_PLAT.ERROR_SUBMIT
											+ flag.MESSAGE;
									$.messager.alert(MESSAGE_PLAT.ERROR, str,
											'error');
								}
							}, 'json');
				}
			});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE,
					'info');
		}
	}
</script>