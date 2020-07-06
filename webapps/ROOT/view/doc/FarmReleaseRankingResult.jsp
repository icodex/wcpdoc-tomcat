<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<PF:basePath/>">
<title>文档发布排名数据管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/view/conf/include.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false">
		<form id="searchReleaseRankingForm">
			<table class="editTable">
				<tr>
					<td class="title" style="width: 160px;">用户名称:</td>
					<td><input name="b.USERNAME:like" type="text"></td>
					<td class="title" style="width: 160px;">组织机构名称:</td>
					<td><input id="entity_orgId" name="b.ORGID:like" type="text"></td>
				</tr>
				<tr>
					<td class="title">时间范围开始(含):</td>
					<td><input name="STARTTIME:like" type="text"
						class="easyui-datebox"></input></td>
					<td class="title">时间范围结束(含):</td>
					<td><input name="ENDTIME:like" type="text"
						class="easyui-datebox"></input></td>
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
		<table id="dataReleaseRankingGrid">
			<thead data-options="frozen:true">
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="USERNAME" data-options="sortable:true" width="120">用户名称</th>
					<th field="ORGNAME" data-options="sortable:true" width="120">组织机构</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th field="DOCNUM" data-options="sortable:true" width="80">知识数量</th>
					<th field="GOODNUM" data-options="sortable:true" width="80">好评知识</th>
					<th field="BADNUM" data-options="sortable:true" width="80">差评知识</th>
					<th field="GOODRATE"
						data-options="sortable:true,formatter: function(value,row,index){return value + '%'}"
						width="100">知识好评率</th> 
					<th field="VISITNUM" data-options="sortable:true" width="80">被访问总量</th>
					<th field="PRAISEYES" data-options="sortable:true" width="100">知识累计好评</th>
					<th field="PRAISENO" data-options="sortable:true" width="100">知识累计差评</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="userToolbar">
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-blogs',plain:true,onClick:userReport">excel下载
		</a>
		<form method="post" action="farmReleaseRanking/loadReport.do"
			id="reportForm">
			<input type="hidden" name="ruleText" id="ruleTextId" />
		</form>
	</div>
</body>
<script type="text/javascript">
	var url_searchActionReleaseRanking = "farmReleaseRanking/query.do";//查询URL
	var title_windowReleaseRanking = "文档发布排名管理";//功能名称
	var gridReleaseRanking;//数据表格对象
	var searchReleaseRanking;//条件查询组件对象
	$(function() {
		//初始化数据表格
		gridReleaseRanking = $('#dataReleaseRankingGrid').datagrid({
			url : url_searchActionReleaseRanking,
			fit : true,
			fitColumns : true,
			'toolbar' : '#userToolbar',
			pagination : true,
			closable : true,
			checkOnSelect : true,
			border : false,
			striped : true,
			rownumbers : true,
			ctrlSelect : true
		});
		//初始化条件查询
		searchReleaseRanking = $('#searchReleaseRankingForm').searchForm({
			gridObj : gridReleaseRanking
		});
		//加载机构树（放在岗位列表后面）
		$('#entity_orgId')
				.combotree(
						{
							url : 'organization/loadTree.do',
							textFiled : 'name',
							parentField : 'parentid',
							loadFilter : function(data, parent) {
								var opt = $(this).data().tree.options;
								var idFiled, textFiled, parentField;
								if (opt.parentField) {
									idFiled = opt.idFiled || 'id';
									textFiled = opt.textFiled || 'text';
									parentField = opt.parentField;
									var i, l, treeData = [], tmpMap = [];
									for (i = 0, l = data.length; i < l; i++) {
										tmpMap[data[i][idFiled]] = data[i];
									}
									for (i = 0, l = data.length; i < l; i++) {
										if (tmpMap[data[i][parentField]]
												&& data[i][idFiled] != data[i][parentField]) {
											if (!tmpMap[data[i][parentField]]['children'])
												tmpMap[data[i][parentField]]['children'] = [];
											data[i]['text'] = data[i][textFiled];
											tmpMap[data[i][parentField]]['children']
													.push(data[i]);
										} else {
											data[i]['text'] = data[i][textFiled];
											treeData.push(data[i]);
										}
									}
									return treeData;
								}
								return data;
							},
							onSelect : function(node) {
							},
							onLoadSuccess : function(node, data) {
							}
						});
	});
	//人员导出
	function userReport() {
		$('#ruleTextId').val(searchReleaseRanking.arrayStr());
		$('#reportForm').submit();
	}
</script>
</html>