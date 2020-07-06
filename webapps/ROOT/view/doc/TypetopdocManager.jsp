<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false">
		<table id="dataDocToptagGrid">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="TITLE" data-options="sortable:true" width="60">标题</th>
					<th field="DOMTYPE" data-options="sortable:true" width="30">内容类型</th>
					<th field="SORT" data-options="sortable:true" width="20">排序</th>
					<th field="PUBTIME" data-options="sortable:true" width="60">发布时间</th>
					<th field="AUTHOR" data-options="sortable:true" width="40">作者</th>
					<th field="STATE" data-options="sortable:true" width="20">状态</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var url_delActionDoctypetag = "typetopdoc/del.do";//删除URL
	var url_formActionDoctypetag = "typetopdoc/form.do";//增加、修改、查看URL
	var title_windowDoctypetag = "分类标签管理";//功能名称
	var gridDoctypeTops;//数据表格对象
	var searchDoctypetag;//条件查询组件对象
	var toolBarDoctypetag = [ {
		id : 'add',
		text : '添加',
		iconCls : 'icon-add',
		handler : adddataDocToptag
	}, {
		id : 'edit',
		text : '刪除',
		iconCls : 'icon-remove',
		handler : deldataDocToptag
	}, {
		id : 'del',
		text : '設置',
		iconCls : 'icon-edit',
		handler : editdataDocToptag
	} ];
	$(function() {
		//初始化数据表格
		gridDoctypeTops = $('#dataDocToptagGrid').datagrid({
			url : "typetopdoc/query.do?typeid=${typeid}",
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarDoctypetag,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchDoctypetag = $('#searchDoctypetagForm').searchForm({
			gridObj : gridDoctypeTops
		});
	});

	//添加置顶知识
	function adddataDocToptag() {
		$.farm.openWindow({
			id : 'winDoctypeTop',
			width : 800,
			height : 450,
			modal : true,
			url : "typetopdoc/toTypeTopChooseDoc.do?typeid=${typeid}",
			title : '选择置顶知识'
		});
	}
	//选中知识后的回调函数
	function chooseWindowCallBackHandle(rows) {
		var ids = "";
		var count = 0;
		$(rows).each(function(i, o) {
			ids = ids + ',' + o.ID;
			count = count + 1;
		});
		if (count > 0) {
			$('#winDoctypeTop').window('close');
		} else {
			return;
		}
		$.messager.confirm(MESSAGE_PLAT.PROMPT, "确认添加" + count + "条知识置顶到该分类?",
				function(flag) {
					if (flag) {
						$(gridDoctypeTops).datagrid('loading');
						$.post(
								'typetopdoc/addDocToType.do?typeid=${typeid}&docids='
										+ ids, {}, function(flag) {
									var jsonObject = flag;
									$(gridDoctypeTops).datagrid('loaded');
									if (jsonObject.STATE == 0) {
										$(gridDoctypeTops).datagrid('reload');
									} else {
										var str = MESSAGE_PLAT.ERROR_SUBMIT
												+ jsonObject.MESSAGE;
										$.messager.alert(MESSAGE_PLAT.ERROR,
												str, 'error');
									}
								}, 'json');
					}
				});
	}

	//修改
	function editdataDocToptag() {
		var selectedArray = $(gridDoctypeTops).datagrid('getSelections');
		if (selectedArray.length ==1) {
			var url = url_formActionDoctypetag + '?operateType='
					+ PAGETYPE.EDIT + '&ids='
					+ $.farm.getCheckedIds(gridDoctypeTops, 'ID');
			$.farm.openWindow({
				id : 'winDoctypeTopEdit',
				width : 400,
				height : 260,
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
	function deldataDocToptag() {
		var selectedArray = $(gridDoctypeTops).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridDoctypeTops).datagrid('loading');
					$.post(url_delActionDoctypetag + '?ids='
							+ $.farm.getCheckedIds(gridDoctypeTops, 'ID'), {},
							function(flag) {
								var jsonObject = flag;
								$(gridDoctypeTops).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridDoctypeTops).datagrid('reload');
								} else {
									var str = MESSAGE_PLAT.ERROR_SUBMIT
											+ jsonObject.MESSAGE;
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