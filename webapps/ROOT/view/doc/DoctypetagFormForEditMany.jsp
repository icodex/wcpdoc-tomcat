<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--分类标签表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary"> <c:if
				test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formDoctypetag">
			<input type="hidden" id="entity_id" name="ids" value="${ids}">
			<table class="editTable">
				<tr>
					<td class="title" style="width: 50px;"></td>
					<td></td>
					<td class="title" style="width: 80px;"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4">本次共修改文件数：${num}</td>
				</tr>
				<tr>
					<td class="title">类别:</td>
					<td colspan="1"><input type="text" style="width: 120px;"
						class="easyui-validatebox"
						data-options="validType:[,'maxLength[32]']" id="entity_typetag"
						name="typetag" value="${entity.typetag}"></td>
					<td class="title">状态:</td>
					<td colspan="1"><select name="pstate" id="entity_pstate"
						style="width: 120px;" val="${entity.pstate}">
							<option value="1">可用</option>
							<option value="0">禁用</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="4">类别的格式为：[序号] - [类别名称],如:1-颜色,在前台展示时类别不被显示</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entityDoctypetag" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formDoctypetag" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitEditActionDoctypetag = 'doctypetag/editmany.do';
	var currentPageTypeDoctypetag = '${pageset.operateType}';
	var submitFormDoctypetag;
	$(function() {
		//表单组件对象
		submitFormDoctypetag = $('#dom_formDoctypetag').SubmitForm({
			pageType : currentPageTypeDoctypetag,
			grid : gridDoctypetag,
			currentWindowId : 'winDoctypetag'
		});
		//关闭窗口
		$('#dom_cancle_formDoctypetag').bind('click', function() {
			$('#winDoctypetag').window('close');
		});
		//提交修改数据
		$('#dom_edit_entityDoctypetag').bind('click', function() {
			submitFormDoctypetag.postSubmit(submitEditActionDoctypetag);
		});
	});
//-->
</script>