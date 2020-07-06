<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--参数模板导入表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<div class="tableTitle_msg">${MESSAGE}</div>
		<div class="tableTitle_tag">参数模板导入</div>
	</div>
	<div data-options="region:'center'">
		<div style="margin-bottom: 20px; padding: 8px;">
			<form id="doParasImportForm">
				<input type="hidden" name="weburlid" value="${weburlid}"> <input
					class="easyui-filebox" name="file"
					data-options="prompt:'请选择',buttonText:'请选择'" style="width: 100%">
				<div style="margin: 4px; text-align: center;">
					<a class="easyui-linkbutton" id="importButtonId"
						data-options="iconCls:'icon-move_to_folder',onClick:doUserImport">导入</a>
				</div>
				<span id="doParasImportMessage" style="color: red;"></span>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	function doUserImport() {
		if (confirm("请再次确认导入模板，导入后所覆盖数据将无法恢复")) {
			var formData = new FormData($("#doParasImportForm")[0]);
			var doParasImportMessage = $("#doParasImportMessage");
			$('#importButtonId').linkbutton('disable');
			$
					.ajax({
						url : 'weburl/doParasImport.do',
						type : 'POST',
						data : formData,
						async : false,
						cache : false,
						contentType : false,
						processData : false,
						success : function(data) {
							$('#importButtonId').linkbutton('enable');
							var $data = $.parseJSON(data)
							if ($data.STATE == 1) {
								doParasImportMessage.html($data.MESSAGE);
								return;
							}
							doParasImportMessage.html("导入成功！");
							$(linkUserParasGrid).datagrid('reload');
							setTimeout(
									"$('#toParametersImport').window('close')",
									1500);
						},
						error : function(data) {
							$('#importButtonId').linkbutton('enable');
							var $data = $.parseJSON(data)
							if ($data.STATE == 1) {
								doParasImportMessage.html($data.MESSAGE);
								return;
							}
							doParasImportMessage.html("导入成功！");
							$(linkUserParasGrid).datagrid('reload');
							setTimeout(
									"$('#toParametersImport').window('close')",
									1500);
						}
					});
		}
	}
</script>