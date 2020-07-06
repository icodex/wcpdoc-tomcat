<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>文档附件数据管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/view/conf/include.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false">
		<form id="searchDocfileForm">
			<table class="editTable">
				<tr>
					<td class="title">类型:</td>
					<td><select name="TYPE:=">
							<option value="">~全部~</option>
							<option value="1">图片</option>
							<option value="2">资源</option>
							<option value="3">压缩</option>
							<option value="0">其他</option>
					</select></td>
					<td class="title">显示名称:</td>
					<td><input name="NAME:like" type="text"></td>
					<td class="title">扩展名:</td>
					<td><input name="EXNAME:like" type="text"></td>
				</tr>
				<tr>
					<td class="title">文件名:</td>
					<td><input name="FILENAME:like" type="text"></td>
					<td class="title">状态:</td>
					<td><select name="PSTATE:=">
							<option value="1">使用</option>
							<option value="0">临时</option>
					</select></td>
					<td class="title">ID:</td>
					<td><input name="A.ID:like" type="text"></td>
				</tr>
				<tr>
					<td class="title">发布时间起:</td>
					<td><input name="STARTTIME:like" type="text" class="easyui-datebox"></td>
					<td class="title">发布时间止:</td>
					<td colspan="3"><input name="ENDTIME:like" type="text" class="easyui-datebox"></td>
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
		<table id="dataDocfileGrid">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="NAME" data-options="sortable:true" width="100">
						显示名称</th>
					<th field="TYPE" data-options="sortable:true" width="20">类型</th>
					<th field="EXNAME" data-options="sortable:true" width="20">
						扩展名</th>
						<th field="CTIME" data-options="sortable:true" width="40">
						创建时间</th>
					<th field="LEN" data-options="sortable:true" width="40">
						文件大小(b)</th>
					<!-- <th field="FILENAME" data-options="sortable:true" width="160">
							文件名
						</th> -->
					<th field="PSTATE" data-options="sortable:true" width="20">状态
					</th>
					<th field="DOWNUM" data-options="sortable:true" width="20">下载量
					</th>
					<th field="PCONTENT" data-options="sortable:true" width="50">备注
					</th>
					<th field="ID" data-options="sortable:true" width="50">
						附件ID</th>
					<th field="DESCRIBESMIN" data-options="sortable:true" width="50">
						内容预览</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script type="text/javascript">
	var url_delActionDocfile = "docfile/del.do";//删除URL
	var url_formActionDocfile = "docfile/form.do";//增加、修改、查看URL
	var url_searchActionDocfile = "fileindex/query.do";//查询URL 
	var title_windowDocfile = "文档附件管理";//功能名称
	var gridDocfile,gridfarmdoc;//数据表格对象
	var searchDocfile;//条件查询组件对象
	var toolBarDocfile = [{
		id : 'view',
		text : '对所查询文档重建索引',
		iconCls : 'icon-invoice',
		handler : reIndexDoc
	}, {
		id : 'del',
		text : '删除索引(附件)',
		iconCls : 'icon-remove',
		handler : delIndexDoc
	} ];
	$(function() {
		//初始化数据表格
		gridDocfile = $('#dataDocfileGrid').datagrid({
			url : url_searchActionDocfile,
			fit : true,
			fitColumns : true,
			'toolbar' : toolBarDocfile,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			border : false,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchDocfile = $('#searchDocfileForm').searchForm({
			gridObj : gridDocfile
		});
	});
	
	//建立索引
	function reIndexDoc() {
		// 有数据执行操作
		$.messager.confirm(MESSAGE_PLAT.PROMPT, "是否对所查询文档进行索引?",
				function(flag) {
					if (flag) {
						var limitStr = searchDocfile.arrayStr();
						var limitObj = {};
						if (limitStr != 'RESET') {
							limitObj = {
								'ruleText' : limitStr
							};
						}
						var pro = $.messager.progress({
							msg : '正在后台建立索引，请等待...',
							interval : 300,
							text : ''
						});
						isLoadSta = true;
						$.post("fileindex/reIndex.do", limitObj, function(flag) {
							if (flag.STATE == 1) {
								var str = MESSAGE_PLAT.ERROR_SUBMIT
										+ flag.MESSAGE;
								$.messager.alert(MESSAGE_PLAT.ERROR, str,
										'error');
							}
							loadproSta();
						}, 'json');
					}
				});
	}

	//删除索引
	function delIndexDoc() {
		var url = 'lucene/delForm.do?operateType=' + PAGETYPE.ADD;
		$.farm.openWindow({
			id : 'winDocindexdel',
			width : 600,
			height : 200,
			modal : true,
			url : url,
			title : '删除索引'
		});
	}

	//
	function loadproSta() {
		if (isLoadSta) {
			$.post("fileindex/indexPersont.do", {}, function(flag) {
				//0初始化，1删除原索引，2添加新索引，3完成，-1无任务
				if (flag.task.state == 0) {
					var progress=flag.task.processNum + "/" + flag.task.maxNum;
					$(".messager-p-msg").text("初始化文档中(1/3):["+progress+"]...:");
				}
				if (flag.task.state == 1) {
					var progress=flag.task.processNum + "/" + flag.task.maxNum;
					$(".messager-p-msg").text("删除历史索引中(2/3):["+progress+"]...:");
				}
				if (flag.task.state == 2) {
					var progress=flag.task.processNum + "/" + flag.task.maxNum;
					$(".messager-p-msg").text("添加新索引中(3/3):["+progress+"]...:");
				}
				if (flag.task.state == 3) {
					$(".messager-p-msg").text("重建索引完成，請關閉窗口！");
					$.messager.progress('close');
					isLoadSta = false;
					$.messager.alert(MESSAGE_PLAT.PROMPT, "操作成功!", 'info');
				}
				if (flag.task.state == -2) {
					$(".messager-p-msg").text("重建索引完成，請關閉窗口！");
					$.messager.progress('close');
					isLoadSta = false;
					$.messager.alert(MESSAGE_PLAT.ERROR, flag.task.message,
							'error');
				}
				setTimeout("loadproSta()", "500");
			}, 'json');
		}
	}
</script>
</html>