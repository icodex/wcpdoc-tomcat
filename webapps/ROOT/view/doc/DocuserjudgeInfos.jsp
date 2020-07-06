<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false">
		<table id="dataDocuserjudgeInfos">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="USERKEY" data-options="sortable:true" width="90">用户</th>
					<th field="JUDGETIME" data-options="sortable:true" width="50">评价时间</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var gridDocuserjudgeInfo;
	$(function() {
		//初始化数据表格
		gridDocuserjudgeInfo = $('#dataDocuserjudgeInfos')
				.datagrid(
						{
							url : "docuserjudge/infoQuery.do?judgeid=${judgeid}&docid=${docid}",
							fit : true,
							fitColumns : true,
							pagination : true,
							closable : true,
							checkOnSelect : true,
							border : false,
							striped : true,
							rownumbers : true,
							ctrlSelect : true
						});
	});
</script>
