<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--分类置顶知识表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary">
			<c:if test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formTypetopdoc">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<table class="editTable">
				<!-- <tr>
					<td class="title">副标题:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="validType:[,'maxLength[64]']" id="entity_title" name="title" value="${entity.title}">
					</td>
				</tr> -->
				<tr>
					<td class="title">排序:</td>
					<td colspan="3">
						<input type="text" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:['integer','maxLength[5]']" id="entity_sort" name="sort" value="${entity.sort}">
					</td>
				</tr>
				<tr>
					<td class="title">状态:</td>
					<td colspan="3">
						<select name="state" id="entity_state" val="${entity.state}">
							<option value="1">启用</option>
							<option value="0">禁用</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==1}">
				<a id="dom_add_entityTypetopdoc" href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton">增加</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entityTypetopdoc" href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formTypetopdoc" href="javascript:void(0)" iconCls="icon-cancel" class="easyui-linkbutton" style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionTypetopdoc = 'typetopdoc/add.do';
	var submitEditActionTypetopdoc = 'typetopdoc/edit.do';
	var currentPageTypeTypetopdoc = '${pageset.operateType}';
	var submitFormTypetopdoc;
	$(function() {
		//表单组件对象
		submitFormTypetopdoc = $('#dom_formTypetopdoc').SubmitForm({
			pageType : currentPageTypeTypetopdoc,
			grid : gridDoctypeTops,
			currentWindowId : 'winDoctypeTopEdit'
		});
		//关闭窗口
		$('#dom_cancle_formTypetopdoc').bind('click', function() {
			$('#winDoctypeTopEdit').window('close');
		});
		//提交新增数据
		$('#dom_add_entityTypetopdoc').bind('click', function() {
			submitFormTypetopdoc.postSubmit(submitAddActionTypetopdoc);
		});
		//提交修改数据
		$('#dom_edit_entityTypetopdoc').bind('click', function() {
			submitFormTypetopdoc.postSubmit(submitEditActionTypetopdoc);
		});
	});
//-->
</script>