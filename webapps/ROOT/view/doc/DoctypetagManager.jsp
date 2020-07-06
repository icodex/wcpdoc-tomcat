<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false">
		<table id="dataDoctypetagGrid">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="TITLE" data-options="sortable:true" width="70">标签名称</th>
					<th field="TYPETAG" data-options="sortable:true" width="40">类别</th>
					<th field="SORT" data-options="sortable:true" width="40">排序</th>
					<th field="CTIME" data-options="sortable:true" width="60">
						创建时间</th>
					<th field="CUSERNAME" data-options="sortable:true" width="50">
						创建人</th>
					<th field="PSTATE" data-options="sortable:true" width="40">状态</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var url_delActionDoctypetag = "doctypetag/del.do";//删除URL
	var url_formActionDoctypetag = "doctypetag/form.do";//增加、修改、查看URL
	var title_windowDoctypetag = "分类标签管理";//功能名称
	var gridDoctypetag;//数据表格对象
	var searchDoctypetag;//条件查询组件对象
	var toolBarDoctypetag = [ {
		id : 'add',
		text : '新增',
		iconCls : 'icon-add',
		handler : addDataDoctypetag
	}, {
		id : 'edit',
		text : '修改',
		iconCls : 'icon-edit',
		handler : editDataDoctypetag
	}, {
		id : 'del',
		text : '删除',
		iconCls : 'icon-remove',
		handler : delDataDoctypetag
	} ];
	$(function() {
		//初始化数据表格
		gridDoctypetag = $('#dataDoctypetagGrid').datagrid({
			url : "doctypetag/query.do?typeid=${typeid}",
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
			gridObj : gridDoctypetag
		});
	});
	//查看
	function viewDataDoctypetag() {
		var selectedArray = $(gridDoctypetag).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDoctypetag + '?pageset.pageType='
					+ PAGETYPE.VIEW + '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDoctypetag',
				width : 500,
				height : 360,
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
	function addDataDoctypetag() {
		var url = url_formActionDoctypetag + '?typeid=${typeid}&operateType=' + PAGETYPE.ADD;
		$.farm.openWindow({
			id : 'winDoctypetag',
			width : 500,
			height : 360,
			modal : true,
			url : url,
			title : '新增'
		});
	}
	//修改
	function editDataDoctypetag() {
		var selectedArray = $(gridDoctypetag).datagrid('getSelections');
		if (selectedArray.length > 0) {
			var url = url_formActionDoctypetag + '?operateType='
					+ PAGETYPE.EDIT + '&ids=' + $.farm.getCheckedIds(gridDoctypetag, 'ID');
			$.farm.openWindow({
				id : 'winDoctypetag',
				width : 500,
				height :360,
				modal : true,
				url : url,
				title : '修改'
			});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE,
					'info');
		}
	}
	//删除
	function delDataDoctypetag() {
		var selectedArray = $(gridDoctypetag).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridDoctypetag).datagrid('loading');
					$.post(url_delActionDoctypetag + '?typeid=${typeid}&ids='
							+ $.farm.getCheckedIds(gridDoctypetag, 'ID'), {},
							function(flag) {
								var jsonObject = flag;
								$(gridDoctypetag).datagrid('loaded');
								if (jsonObject.STATE == 0) {
									$(gridDoctypetag).datagrid('reload');
								} else {
									var str = MESSAGE_PLAT.ERROR_SUBMIT
											+ jsonObject.MESSAGE;
									$.messager.alert(MESSAGE_PLAT.ERROR, str,
											'error');
								}
							},'json');
				}
			});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE,
					'info');
		}
	}
</script>