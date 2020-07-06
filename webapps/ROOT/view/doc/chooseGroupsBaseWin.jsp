<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--选择文档-->
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false">
		<table class="easyui-datagrid" id="dom_chooseGridChooseGroup">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="GROUPNAME" data-options="sortable:true" width="40">小组名称</th>
					<th field="JOINCHECK" data-options="sortable:true" width="10">
						加入时验证</th>
					<th field="PSTATE" data-options="sortable:true" width="10">状态</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var chooseGridChooseGroup;
	var chooseSearchfarmChooseGroup;
	var toolbar_chooseChooseGroup = [ {
		text : '选择小组',
		iconCls : 'icon-ok',
		handler : function() {
			var selectedArray = $('#dom_chooseGridChooseGroup').datagrid(
					'getSelections');
			if (selectedArray.length == 1) {
				chooseWindowCallBackHandle(selectedArray);
			} else {
				$.messager.alert(MESSAGE_PLAT.PROMPT,
						MESSAGE_PLAT.CHOOSE_ONE_ONLY, 'info');
			}
		}
	} ];
	$(function() {
		chooseGridChooseGroup = $('#dom_chooseGridChooseGroup').datagrid({
			url : 'docgroup/query.do',
			fit : true,
			'toolbar' : toolbar_chooseChooseGroup,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			rownumbers : true,
			ctrlSelect : true,
			fitColumns : true
		});
	});
//-->
</script>
ssss
