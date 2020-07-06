<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--友情链接表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<div class="tableTitle_msg">${MESSAGE}</div>
		<div class="tableTitle_tag">链接参数</div>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formUserParas">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<table class="editTable">
				<tr>
					<td class="title">用户姓名:</td>
					<td>${user.name}</td>
				</tr>
				<tr>
					<td class="title">站点名称:</td>
					<td>${weburl.webname}</td>
				</tr>
				<tr>
					<td colspan="2">
						<!--  --> <input type="hidden" name="userid" value="${user.id}">
						<!--  --> <input type="hidden" name="id" value="${weburl.id}">
					</td>
				</tr>
				<c:forEach items="${paras.paras}" var="paraNode">
					<tr>
						<td class="title">${paraNode.title}:</td>
						<td><input type="text" style="width: 360px;"
							class="easyui-validatebox"
							data-options="required:true,validType:[,'maxLength[64]']"
							id="${paraNode.varname}" name="VAR_${paraNode.varname}"
							value="${paraNode.value}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<a id="dom_edit_entityUserParas" href="javascript:void(0)"
				iconCls="icon-save" class="easyui-linkbutton">修改</a> <a
				id="dom_cancle_formUserParas" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitEditActionUserParas = 'webuser/webUrlAjaxSubmit.do';
	var currentPageTypeUserParas = '2';
	var submitFormUserParas;
	$(function() {
		//表单组件对象
		submitFormUserParas = $('#dom_formUserParas').SubmitForm({
			pageType : currentPageTypeUserParas,
			grid : linkUserParasGrid,
			currentWindowId : 'winWeburl'
		});
		//关闭窗口
		$('#dom_cancle_formUserParas').bind('click', function() {
			$('#winWeburl').window('close');
		});
		//提交修改数据
		$('#dom_edit_entityUserParas').bind('click', function() {
			submitFormUserParas.postSubmit(submitEditActionUserParas);
		});
	});
//-->
</script>