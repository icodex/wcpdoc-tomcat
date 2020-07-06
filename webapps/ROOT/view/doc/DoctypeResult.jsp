<%@page import="com.farm.core.auth.domain.LoginUser"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>文档分类数据管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/view/conf/include.jsp"></jsp:include>
<style>
<!--
.feild_red {
	color: red;
}

.feild_green {
	color: green;
}
-->
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'west',split:true,border:false"
		style="width: 200px;">
		<div class="TREE_COMMON_BOX_SPLIT_DIV">
			<a id="DoctypeTreeReload" href="javascript:void(0)"
				class="easyui-linkbutton" data-options="plain:true"
				iconCls="icon-reload">刷新</a> <a id="DoctypeTreeOpenAll"
				href="javascript:void(0)" class="easyui-linkbutton"
				data-options="plain:true" iconCls="icon-sitemap">展开</a>
		</div>
		<ul id="DoctypeTree"></ul>
	</div>
	<div class="easyui-layout" data-options="region:'center',border:false">
		<div data-options="region:'north',border:false">
			<form id="searchDoctypeForm">
				<table class="editTable">
					<tr>
						<td class="title">上级节点:</td>
						<td><input id="PARENTTITLE_RULE" type="text"
							readonly="readonly" style="background: #F3F3E8"> <input
							id="PARENTID_RULE" name="PARENTID:=" type="hidden"></td>
						<td class="title"></td>
						<td></td>
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
			<table id="dataDoctypeGrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="NAME" data-options="sortable:true" width="60">分类名称</th>
						<th field="SORT" data-options="sortable:true" width="20">排序</th>
						<th field="TYPE" data-options="sortable:true" width="20">类型</th>
						<th field="SHOWMODEL" data-options="sortable:true" width="20">展示</th>
						<th field="READPOP" data-options="sortable:true" width="35">浏览权限</th>
						<th field="WRITEPOP" data-options="sortable:true" width="35">编辑权限</th>
						<th field="AUDITPOP" data-options="sortable:true" width="35">知识审核</th>
						<th field="DOCNUM" data-options="sortable:true" width="25">知识数</th>
						<th field="TAGSNUM" data-options="sortable:true" width="25">标签数</th>
						<th field="TOPNUM" data-options="sortable:true" width="25">置顶数</th>
						<th field="PSTATE" data-options="sortable:true" width="20">状态</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div id="toolBarEditor">
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-tip',plain:true,onClick:viewDataDoctype">查看
		</a> <a class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true,onClick:addDataDoctype">新增
		</a> <a href="javascript:void(0)" class="easyui-menubutton"
			data-options="menu:'#update',iconCls:'icon-edit'">修改</a>
		<div id="update" style="width: 150px;">
			<div data-options="iconCls:'icon-edit'" onclick="editDataDoctype()">修改分类</div>
			<div data-options="iconCls:'icon-issue'" onclick="runSetState(true)">批量启用</div>
			<div data-options="iconCls:'icon-exclamation-button'"
				onclick="runSetState(false)">批量禁用</div>
		</div>
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true,onClick:delDataDoctype">删除
		</a> <a class="easyui-linkbutton"
			data-options="iconCls:'icon-communication',plain:true,onClick:moveTypetree">移动
		</a> <a class="easyui-linkbutton"
			data-options="iconCls:'icon-reload',plain:true,onClick:freshdocs">数量刷新
		</a> 
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-bookmark',plain:true,onClick:setTypeTags">分类标签
		</a> <a class="easyui-linkbutton"
			data-options="iconCls:'icon-lightbulb',plain:true,onClick:setTypeTops">置顶知识
		</a>
	</div>
</body>
<script type="text/javascript">
	var url_delActionDoctype = "doctype/del.do";//删除URL
	var url_formActionDoctype = "doctype/form.do";//增加、修改、查看URL
	var url_searchActionDoctype = "doctype/query.do";//查询URL
	var title_windowDoctype = "文档分类管理";//功能名称
	var gridDoctype;//数据表格对象
	var searchDoctype;//条件查询组件对象
	var currentType, currentTypeName;
	$(function() {
		//初始化数据表格
		gridDoctype = $('#dataDoctypeGrid').datagrid({
			url : url_searchActionDoctype,
			fit : true,
			fitColumns : true,
			'toolbar' : '#toolBarEditor',
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			border : false,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchDoctype = $('#searchDoctypeForm').searchForm({
			gridObj : gridDoctype
		});
		$('#DoctypeTree').tree({
			url : 'doctype/FarmDoctypeLoadTreeNode.do',
			onSelect : function(node) {
				$('#PARENTID_RULE').val(node.id);
				$('#PARENTTITLE_RULE').val(node.text);
				searchDoctype.dosearch({
					'ruleText' : searchDoctype.arrayStr()
				});
			},
			loadFilter : function(data, parent) {
				return data.treeNodes;
			}
		});
		$('#DoctypeTreeReload').bind('click', function() {
			$('#DoctypeTree').tree('reload');
		});
		$('#DoctypeTreeOpenAll').bind('click', function() {
			$('#DoctypeTree').tree('expandAll');
		});
	});
	//查看
	function viewDataDoctype() {
		var selectedArray = $(gridDoctype).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDoctype + '?operateType=' + PAGETYPE.VIEW
					+ '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDoctype',
				width : 600,
				height : 330,
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
	function addDataDoctype() {
		var url = url_formActionDoctype + '?ids=' + $('#PARENTID_RULE').val()
				+ '&operateType=' + PAGETYPE.ADD;
		$.farm.openWindow({
			id : 'winDoctype',
			width : 600,
			height : 330,
			modal : true,
			url : url,
			title : '新增'
		});
	}

	//修改
	function editDataDoctype() {
		var selectedArray = $(gridDoctype).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = url_formActionDoctype + '?operateType=' + PAGETYPE.EDIT
					+ '&ids=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDoctype',
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
	//设置分类标签
	function setTypeTags() {
		var selectedArray = $(gridDoctype).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = "doctypetag/list.do" + '?typeid=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDoctype',
				width : 600,
				height : 400,
				modal : true,
				url : url,
				title : '管理分类标签'
			});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE_ONLY,
					'info');
		}
	}
	//设置分类置顶知识
	function setTypeTops() {
		var selectedArray = $(gridDoctype).datagrid('getSelections');
		if (selectedArray.length == 1) {
			var url = "typetopdoc/list.do" + '?typeid=' + selectedArray[0].ID;
			$.farm.openWindow({
				id : 'winDoctype',
				width : 600,
				height : 400,
				modal : true,
				url : url,
				title : '管理置顶知识'
			});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE_ONLY,
					'info');
		}
	}

	//刷新知识数量
	function freshdocs() {
		var selectedArray = $(gridDoctype).datagrid('getSelections');
		var tipStr = "是否立即执行刷新操作?";
		if (selectedArray.length <= 0) {
			tipStr = "未选择分类将对所有分类进行计算,该操作有可能非常漫长,是否立即执行刷新操作?";
		}
		$.messager.confirm(MESSAGE_PLAT.PROMPT, tipStr, function(flag) {
			if (flag) {
				$(gridDoctype).datagrid('loading');
				$.post('doctype/freshdocs.do', {
					ids : $.farm.getCheckedIds(gridDoctype, 'ID')
				}, function(flag) {
					$(gridDoctype).datagrid('loaded');
					if (flag.STATE == 0) {
						$(gridDoctype).datagrid('reload');
					} else {
						var str = MESSAGE_PLAT.ERROR_SUBMIT + flag.MESSAGE;
						$.messager.alert(MESSAGE_PLAT.ERROR, str, 'error');
					}
				}, 'json');
			}
		});
	}
	//移动分类
	function moveTypetree() {
		var selectedArray = $(gridDoctype).datagrid('getSelections');
		if (selectedArray.length > 0) {
			$.messager.confirm(MESSAGE_PLAT.PROMPT,
					"警告:移动后该分类的各种权限将重置，是否确定要移动分类?", function(flag) {
						if (flag) {
							$.farm.openWindow({
								id : 'typeTreeNodeWin',
								width : 250,
								height : 300,
								modal : true,
								url : "doctype/typeTreeNodeView.do?ids="
										+ $.farm.getCheckedIds(gridDoctype,
												'ID'),
								title : '移动分类'
							});
						}
					});
		} else {
			$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE,
					'info');
		}
	}
	//（移动分类）选择分类树回调函数
	function chooseTypeHook(obj) {
		var typeids = $.farm.getCheckedIds(gridDoctype, 'ID');
		var typeId = obj.id;
		if ("NONE" == typeId) {
			$.messager.alert('提示', '请选择一个有效分类！', 'info');
			return;
		}
		$("#typeTreeNodeWin").window('close');
		$(gridDoctype).datagrid('loading');
		var url = "doctype/move2Type.do";
		$.post(url, {
			ids : typeids,
			typeId : typeId
		}, function(flag) {
			$(gridDoctype).datagrid('loaded');
			if (flag.STATE == 0) {
				$(gridDoctype).datagrid('reload');
				$.messager.alert(MESSAGE_PLAT.PROMPT, "分类已移动,稍后请手动重建全文索引!",
						'info');
				$.messager.confirm('确认对话框', '数据更新,是否重新加载左侧分类树？', function(r) {
					if (r) {
						$('#DoctypeTree').tree('reload');
					}
				});
			} else {
				var str = MESSAGE_PLAT.ERROR_SUBMIT + flag.MESSAGE;
				$.messager.alert(MESSAGE_PLAT.ERROR, str, 'error');
			}
		}, "json");
	}
	//删除
	function delDataDoctype() {
		var selectedArray = $(gridDoctype).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = selectedArray.length + MESSAGE_PLAT.SUCCESS_DEL_NEXT_IS;
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridDoctype).datagrid('loading');
					$.post(url_delActionDoctype + '?ids='
							+ $.farm.getCheckedIds(gridDoctype, 'ID'), {},
							function(flag) {
								$(gridDoctype).datagrid('loaded');
								if (flag.STATE == 0) {
									$(gridDoctype).datagrid('reload');
									$.messager.confirm('确认对话框',
											'数据更新,是否重新加载左侧分类树？', function(r) {
												if (r) {
													$('#DoctypeTree').tree(
															'reload');
												}
											});
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

	//批量启用或禁用分类
	function runSetState(typeState) { 
		var selectedArray = $(gridDoctype).datagrid('getSelections');
		if (selectedArray.length > 0) {
			// 有数据执行操作
			var str = "该操作将批量设置分类以及分类的子类为"+(typeState?"可用状态":"禁用状态")+",是否继续？";
			$.messager.confirm(MESSAGE_PLAT.PROMPT, str, function(flag) {
				if (flag) {
					$(gridDoctype).datagrid('loading');
					$.post('doctype/runSetState.do?state='+typeState+'&ids='
							+ $.farm.getCheckedIds(gridDoctype, 'ID'), {},
							function(flag) {
								$(gridDoctype).datagrid('loaded');
								if (flag.STATE == 0) {
									$(gridDoctype).datagrid('reload');
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
</html>