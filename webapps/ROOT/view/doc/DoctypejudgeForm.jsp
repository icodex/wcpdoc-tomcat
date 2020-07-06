<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--自定义评价表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary">
			<c:if test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formDoctypejudge">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<c:if test="${pageset.operateType==1}">
				<input type="hidden" id="typeid" name="typeid" value="${typeid}">
			</c:if>
			<table class="editTable">
				<tr>
					<td class="title">评价项名称:</td>
					<td >
						<input type="text" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[32]']" id="entity_judgetitle" name="judgetitle" value="${entity.judgetitle}">
					</td>
					<td class="title">评价项代码:</td>
					<td>
						<input type="text" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[16]','english']" id="entity_judgecode" name="judgecode" value="${entity.judgecode}">
					</td>
				</tr>
				<tr>
					<td class="title">排序号:</td>
					<td>
						<input type="text" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:['integer','maxLength[5]']" id="entity_sortnum" name="sortnum" value="${entity.sortnum}">
					</td>
					<td class="title">状态:</td>
					<td >
						<select style="width: 160px;" name="pstate" id="entity_pstate" val="${entity.pstate}">
							<option value="1">可用</option>
							<option value="0">禁用</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="title">备注:</td>
					<td colspan="3">
						<textarea rows="2" style="width: 460px;" class="easyui-validatebox" data-options="validType:[,'maxLength[64]']" id="entity_pcontent" name="pcontent">${entity.pcontent}</textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==1}">
				<a id="dom_add_entityDoctypejudge" href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton">增加</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entityDoctypejudge" href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formDoctypejudge" href="javascript:void(0)" iconCls="icon-cancel" class="easyui-linkbutton" style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionDoctypejudge = 'doctypejudge/add.do';
	var submitEditActionDoctypejudge = 'doctypejudge/edit.do';
	var currentPageTypeDoctypejudge = '${pageset.operateType}';
	var submitFormDoctypejudge;
	$(function() {
		//表单组件对象
		submitFormDoctypejudge = $('#dom_formDoctypejudge').SubmitForm({
			pageType : currentPageTypeDoctypejudge,
			grid : gridDoctypejudge,
			currentWindowId : 'winDoctypejudge'
		});
		//关闭窗口
		$('#dom_cancle_formDoctypejudge').bind('click', function() {
			$('#winDoctypejudge').window('close');
		});
		//提交新增数据
		$('#dom_add_entityDoctypejudge').bind('click', function() {
			submitFormDoctypejudge.postSubmit(submitAddActionDoctypejudge);
		});
		//提交修改数据
		$('#dom_edit_entityDoctypejudge').bind('click', function() {
			submitFormDoctypejudge.postSubmit(submitEditActionDoctypejudge);
		});
	});
//-->
</script>