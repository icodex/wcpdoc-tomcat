<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--分类模板表单-->
<div>
	<div>
		<form id="dom_formTypedemo">
			<table class="editTable">
				<tr>
					<td class="title" style="width: 80px;">模板名称:</td>
					<td><input type="text" class="easyui-validatebox"
						style="width: 200px;"
						data-options="required:true,validType:[,'maxLength[32]']"
						id="entity_name" name="name" value="${entity.name}"></td>
					<td class="title" style="width: 80px;">当前分类:</td>
					<td style="width: 150px;">${type.name}<c:if
							test="${type==null}">无分类，模板将被所有分类共享</c:if> <input type="hidden"
						name="typeid" value="${type.id}" /> <input type="hidden"
						name="id" value="${entity.id}" />
					</td>
					<td class="title" style="width: 80px;">状态:</td>
					<td style="width: 100px;"><select id="entity_pstate"
						name="pstate" val="${entity.pstate}">
							<option value="1">可用</option>
							<option value="0">禁用</option>
					</select></td>
				</tr>
				<tr>
					<td class="title">描述:</td>
					<td colspan="5"><textarea rows="1" style="width: 586px;"
							class="easyui-validatebox"
							data-options="validType:['maxLength[128]']" id="entity_pcontent"
							name="pcontent">${entity.pcontent}</textarea></td>
				</tr>
				<tr>
					<td colspan="6"><textarea id="entity_demotext" name="demotext"
							style="height: 310px; width: 100%; border: 0px;">${entity.demotext}</textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==1}">
				<a id="dom_add_entityTypedemo" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">增加</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entityTypedemo" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formTypedemo" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
	<div>
		<div class="tableTitle_msg" style="text-align: center;">${MESSAGE}</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionTypedemo = 'typedemo/add.do';
	var submitEditActionTypedemo = 'typedemo/edit.do';
	var currentPageTypeTypedemo = '${pageset.operateType}';
	var submitFormTypedemo;
	var editor;
	$(function() {
		//表单组件对象
		submitFormTypedemo = $('#dom_formTypedemo').SubmitForm({
			pageType : currentPageTypeTypedemo,
			grid : gridTypedemo,
			currentWindowId : 'winTypedemo'
		});
		//关闭窗口
		$('#dom_cancle_formTypedemo').bind('click', function() {
			$('#winTypedemo').window('close');
		});
		//提交新增数据
		$('#dom_add_entityTypedemo').bind('click', function() {
			if (!loadSuperText()) {
				return;
			}
			;
			submitFormTypedemo.postSubmit(submitAddActionTypedemo);
		});
		//提交修改数据
		$('#dom_edit_entityTypedemo').bind('click', function() {
			if (!loadSuperText()) {
				return;
			}
			submitFormTypedemo.postSubmit(submitEditActionTypedemo);
		});
		if ($('#entity_demotext').length > 0) {
			editor = KindEditor.create('textarea[name="demotext"]', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : true,
				minWidth : 600,
				cssPath : '<PF:basePath/>text/lib/kindeditor/editInner.css',
				uploadJson : basePath + 'actionImg/PubFPuploadMedia.do',
				formatUploadUrl : false,
				items : [ 'source', 'fontsize', 'forecolor', 'bold', 'italic',
						'underline', 'removeformat', '|', 'justifyleft',
						'justifycenter', 'insertorderedlist',
						'insertunorderedlist', '|', 'formatblock',
						'table', 'hr', '|', 'link', 'image',
						'code' ]
			});
			editor.html($('#contentId').val());
		}
	});
	function loadSuperText() {
		var limitLength = 20000;
		$("#entity_demotext").val(editor.html());
		if ($("#entity_demotext").val().length > limitLength) {
			$.messager.alert(MESSAGE_PLAT.PROMPT, "模板不能大于" + limitLength
					+ "个字符！当前" + $("#entity_demotext").val().length, 'info');
			return false;
		}
		return true;
	}
//-->
</script>