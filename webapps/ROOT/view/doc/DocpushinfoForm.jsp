<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<style>
<!--
.docsBox span {
	border: 1px #d7d7d7 solid;
	padding: 2px;
	margin: 4px;
	line-height: 24px;
	background-color: #fef9dc;
}
-->
</style>
<!--知识推送记录表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary"> <c:if
				test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formDocpushinfo">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<table class="editTable">
				<tr>
					<td class="title">知识:</td>
					<td colspan="4" class="docsBox"><input type="hidden"
						id="entity_docids" name="docids" value="${ids}"> <input
						type="hidden" id="entity_docnames" name="docnames"
						value="${names}"> ${names}</td>
				</tr>
				<tr>
					<td class="title">接收人:</td>
					<td colspan="3"><input type="hidden" id="entity_receiverids"
						name="receiverids" value="${entity.receiverids}"> <input
						type="hidden" id="entity_receivernames" name="receivernames"
						value="${entity.receivernames}">
						<div id="namesChooseId" class="docsBox">${usernames}</div></td>
					<td><c:if test="${pageset.operateType==1}">
							<a id="addPushUserbtn" class="easyui-linkbutton"
								data-options="iconCls:'icon-add'">添加用户</a>
						</c:if></td>
				</tr>
				<c:if test="${pageset.operateType==0}">
					<tr>
						<td class="title">备注:</td>
						<td colspan="4"><input type="text" style="width: 360px;"
							class="easyui-validatebox"
							data-options="validType:[,'maxLength[64]']" id="entity_pcontent"
							name="pcontent" value="${entity.pcontent}"></td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==1}">
				<a id="dom_add_entityDocpushinfo" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">立即推送</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entityDocpushinfo" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formDocpushinfo" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionDocpushinfo = 'docpushinfo/add.do';
	var submitEditActionDocpushinfo = 'docpushinfo/edit.do';
	var currentPageTypeDocpushinfo = '${pageset.operateType}';
	var submitFormDocpushinfo;
	$(function() {
		//表单组件对象
		submitFormDocpushinfo = $('#dom_formDocpushinfo').SubmitForm({
			pageType : currentPageTypeDocpushinfo,
			grid : gridDocpushinfo,
			currentWindowId : 'winDocpushinfo'
		});
		//关闭窗口
		$('#dom_cancle_formDocpushinfo').bind('click', function() {
			$('#winDocpushinfo').window('close');
		});
		//提交新增数据
		$('#dom_add_entityDocpushinfo').bind('click', function() {
			submitFormDocpushinfo.postSubmit(submitAddActionDocpushinfo);
		});
		//提交修改数据
		$('#dom_edit_entityDocpushinfo').bind('click', function() {
			submitFormDocpushinfo.postSubmit(submitEditActionDocpushinfo);
		});
		$('#addPushUserbtn').bind('click', function() {
			addDataDocgroupuser();
		});

	});
	//导入
	function addDataDocgroupuser() {
		var url = "user/chooseUser.do";
		$.farm.openWindow({
			id : 'chooseUserWin',
			width : 600,
			height : 400,
			modal : true,
			url : url,
			title : '导入用户'
		});
		chooseWindowCallBackHandle = function(row) {
			var userids;
			var userNames;
			$(row).each(function(i, obj) {
				if (userids) {
					userids = userids + ',' + obj.ID;
					userNames = userNames + ",<span>" + obj.NAME + "</span>";

				} else {
					userids = obj.ID;
					userNames = "<span>" + obj.NAME + "</span>";
				}
			});
			$('#namesChooseId').html(userNames);
			$('#entity_receivernames').val(userNames);
			$('#entity_receiverids').val(userids);
			$('#chooseUserWin').window('close');
		};
	}
//-->
</script>