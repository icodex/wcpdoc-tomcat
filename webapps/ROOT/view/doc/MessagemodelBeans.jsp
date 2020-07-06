<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--设置消息的发送器-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary"> 设置消息的发送方式 </span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formMessageBeans">
			<input type="hidden" id="modelIds_id" name="modelIds" value="${ids}">
			<input type="hidden" id="beanKeys_id" name="beanKeys" value="">
			<table class="editTable">
				<tr>
					<td class="title">消息发送方式:</td>
					<td><select class="easyui-combobox"  id="beanKeysInput"
						data-options="multiple:true" style="width: 300px;">
							<option></option>
							<c:forEach items="${senderIds}" var="node">
								<option value="${node.key}">${node.value}</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<a id="dom_edit_entityMessageBeans" href="javascript:void(0)"
				iconCls="icon-save" class="easyui-linkbutton">修改</a> <a
				id="dom_cancle_formMessageBeans" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitFormMessageBeans;
	$(function() {
		//表单组件对象
		submitFormMessageBeans = $('#dom_formMessageBeans').SubmitForm({
			pageType : '1',
			grid : gridMessagemodel,
			currentWindowId : 'winMessageBeans'
		});
		//关闭窗口
		$('#dom_cancle_formMessageBeans').bind('click', function() {
			$('#winMessageBeans').window('close');
		});
		//提交修改数据
		$('#dom_edit_entityMessageBeans').bind('click', function() {
			$('#beanKeys_id').val(($('#beanKeysInput').combo('getValues')));
			submitFormMessageBeans.postSubmit('messagemodel/submitBeans.do');
		});
	});
//-->
</script>