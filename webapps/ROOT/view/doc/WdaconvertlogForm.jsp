<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--预览文档转换日志表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary"> <c:if
				test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formWdaconvertlog">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<table class="editTable">
				<tr>
					<td class="title">标题:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="required:true,validType:[,'maxLength[32]']"
						id="entity_title" name="title" value="${entity.title}"></td>
				</tr>
				<tr>
					<td class="title">知识id:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="required:true,validType:[,'maxLength[16]']"
						id="entity_docid" name="docid" value="${entity.docid}"></td>
				</tr>
				<tr>
					<td class="title">附件id:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="required:true,validType:[,'maxLength[16]']"
						id="entity_fileid" name="fileid" value="${entity.fileid}">
					</td>
				</tr>
				<tr>
					<td class="title">备注:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="validType:[,'maxLength[64]']" id="entity_pcontent"
						name="pcontent" value="${entity.pcontent}"></td>
				</tr>
				<tr>
					<td class="title">错误信息:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="validType:[,'maxLength[512]']" id="entity_errorinfo"
						name="errorinfo" value="${entity.errorinfo}"></td>
				</tr>
				<!-- 
				<tr>
					<td class="title">更新时间:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="validType:[,'maxLength[8]']" id="entity_etime"
						name="etime" value="${entity.etime}"></td>
				</tr><tr>
					<td class="title">状态:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="required:true,validType:[,'maxLength[1]']"
						id="entity_pstate" name="pstate" value="${entity.pstate}">
					</td>
				</tr><tr>
					<td class="title">附件扩展名:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="required:true,validType:[,'maxLength[8]']"
						id="entity_exname" name="exname" value="${entity.exname}">
					</td>
				</tr><tr>
					<td class="title">创建时间:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="required:true,validType:[,'maxLength[8]']"
						id="entity_ctime" name="ctime" value="${entity.ctime}"></td>
				</tr>
				<tr>
					<td class="title">创建人:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="required:true,validType:[,'maxLength[32]']"
						id="entity_cusername" name="cusername" value="${entity.cusername}">
					</td>
				</tr>
				 -->
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==1}">
				<a id="dom_add_entityWdaconvertlog" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">增加</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entityWdaconvertlog" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formWdaconvertlog" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionWdaconvertlog = 'wdaconvertlog/add.do';
	var submitEditActionWdaconvertlog = 'wdaconvertlog/edit.do';
	var currentPageTypeWdaconvertlog = '${pageset.operateType}';
	var submitFormWdaconvertlog;
	$(function() {
		//表单组件对象
		submitFormWdaconvertlog = $('#dom_formWdaconvertlog').SubmitForm({
			pageType : currentPageTypeWdaconvertlog,
			grid : gridWdaconvertlog,
			currentWindowId : 'winWdaconvertlog'
		});
		//关闭窗口
		$('#dom_cancle_formWdaconvertlog').bind('click', function() {
			$('#winWdaconvertlog').window('close');
		});
		//提交新增数据
		$('#dom_add_entityWdaconvertlog').bind('click', function() {
			submitFormWdaconvertlog.postSubmit(submitAddActionWdaconvertlog);
		});
		//提交修改数据
		$('#dom_edit_entityWdaconvertlog').bind('click', function() {
			submitFormWdaconvertlog.postSubmit(submitEditActionWdaconvertlog);
		});
	});
//-->
</script>