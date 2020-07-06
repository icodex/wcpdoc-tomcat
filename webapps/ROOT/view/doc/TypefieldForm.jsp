<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--分类自定义属性表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary">
			<c:if test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formTypefield">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<c:if test="${pageset.operateType==1}">
				<input type="hidden" id="typeid" name="typeid" value="${typeid}">
			</c:if>
			<table class="editTable">
				<tr>
					<td class="title">排序号:</td>
					<td>
						<input type="text" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:['integer','maxLength[5]']" id="entity_sortnum" name="sortnum" value="${entity.sortnum}">
					</td>
					<td class="title">属性代码:</td>
					<td>
						<input type="text" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[16]','english']" id="entity_fieldcode" name="fieldcode" value="${entity.fieldcode}">
					</td>
				</tr>
				<tr>
					<td class="title">属性名称:</td>
					<td>
						<input type="text" style="width: 160px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[32]']" id="entity_fieldtitle" name="fieldtitle" value="${entity.fieldtitle}">
					</td>
					<td class="title">表单类型:</td>
					<td>
						<!-- 1text，2select，3checkbox，4texteare -->
						<select style="width: 160px;" name="inputtype" id="entity_inputtype" val="${entity.inputtype}">
							<option value="1">文本</option>
							<option value="2">单选</option>
							<option value="3">复选</option>
							<option value="4">大文本</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="color: green;">验证规则请在数据字典中配置键为TYPFIELD_VALIDATE的字典项，如英文字母^[a-zA-Z]+$</td>
				</tr>
				<tr>
					<td class="title">验证规则:</td>
					<td>
						<select style="width: 160px;" id="entity_validates" name="validates" val="${entity.validates}">
							<option value="">无</option>
							<PF:OptionDictionary index="TYPFIELD_VALIDATE" isTextValue="1" />
						</select>
					</td>
					<td class="title">是否必填:</td>
					<td>
						<select style="width: 160px;" name="required" id="entity_required" val="${entity.required}">
							<option value="0">否</option>
							<option value="1">是</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="title">枚举项:</td>
					<td colspan="3">
						<textarea rows="2" style="width: 460px;" class="easyui-validatebox" data-options="validType:[,'maxLength[256]']" id="entity_inputenums" name="inputenums">${entity.inputenums}</textarea>
						<div style="color: #999;">多个枚举项用逗号分隔</div>
					</td>
				</tr>
				<tr>
					<td class="title">备注(属性说明):</td>
					<td colspan="3">
						<textarea rows="2" style="width: 460px;" class="easyui-validatebox" data-options="validType:[,'maxLength[64]']" id="entity_pcontent" name="pcontent">${entity.pcontent}</textarea>
					</td>
				</tr>
				<tr>
					<td class="title">状态:</td>
					<td colspan="3">
						<select style="width: 160px;" name="pstate" id="entity_pstate" val="${entity.pstate}">
							<option value="1">可用</option>
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
				<a id="dom_add_entityTypefield" href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton">增加</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entityTypefield" href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formTypefield" href="javascript:void(0)" iconCls="icon-cancel" class="easyui-linkbutton" style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionTypefield = 'typefield/add.do';
	var submitEditActionTypefield = 'typefield/edit.do';
	var currentPageTypeTypefield = '${pageset.operateType}';
	var submitFormTypefield;
	$(function() {
		//表单组件对象
		submitFormTypefield = $('#dom_formTypefield').SubmitForm({
			pageType : currentPageTypeTypefield,
			grid : gridTypefield,
			currentWindowId : 'winTypefield'
		});
		//关闭窗口
		$('#dom_cancle_formTypefield').bind('click', function() {
			$('#winTypefield').window('close');
		});
		//提交新增数据
		$('#dom_add_entityTypefield').bind('click', function() {
			submitFormTypefield.postSubmit(submitAddActionTypefield);
		});
		//提交修改数据
		$('#dom_edit_entityTypefield').bind('click', function() {
			submitFormTypefield.postSubmit(submitEditActionTypefield);
		});
	});
//-->
</script>