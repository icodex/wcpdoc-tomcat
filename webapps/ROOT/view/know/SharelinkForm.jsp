<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--链接分享表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary">
			<c:if test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formSharelink">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<table class="editTable">
				<tr>
					<td class="title">分享链接:</td>
					<td colspan="7">
						<PF:basePath />
						webshare/Pub${entity.sharekey}.html
					</td>
				</tr>
				<tr>
					<td class="title">提取码:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[128]']" id="entity_sharesecret" name="sharesecret" value="${entity.sharesecret}">
					</td>

					<td class="title">分享KEY:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[16]']" id="entity_sharekey" name="sharekey" value="${entity.sharekey}">
					</td>
				</tr>
				<tr>
					<td class="title">APPID:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="validType:[,'maxLength[16]']" id="entity_appid" name="appid" value="${entity.appid}">
					</td>
					<td class="title">分享类型:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[8]']" id="entity_sharetype" name="sharetype" value="${entity.sharetype}">
					</td>
				</tr>
				<tr>
					<td class="title">分享时效:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[8]']" id="entity_sharelive" name="sharelive" value="${entity.sharelive}">
					</td>
					<td class="title">访问次数:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="validType:[,'maxLength[5]']" id="entity_visitnum" name="visitnum" value="${entity.visitnum}">
					</td>
				</tr>
				<tr>
					<td class="title">内容类型:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[1]']" id="entity_doctype" name="doctype" value="${entity.doctype}">
					</td>
					<td class="title">备注:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="validType:[,'maxLength[64]']" id="entity_pcontent" name="pcontent" value="${entity.pcontent}">
					</td>
				</tr>
				<tr>
					<td class="title">内容名称:</td>
					<td colspan="7">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[128]']" id="entity_name" name="name" value="${entity.name}">
					</td>
				</tr>
				<tr>
					<td class="title">状态:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[1]']" id="entity_pstate" name="pstate" value="${entity.pstate}">
					</td>
					<td class="title">CUSER:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[16]']" id="entity_cuser" name="cuser" value="${entity.cuser}">
					</td>
				</tr>
				<tr>
					<td class="title">分享时间:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[8]']" id="entity_ctime" name="ctime" value="${entity.ctime}">
					</td>
					<td class="title">分享人:</td>
					<td colspan="3">
						<input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[32]']" id="entity_cusername" name="cusername" value="${entity.cusername}">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==1}">
				<a id="dom_add_entitySharelink" href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton">增加</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entitySharelink" href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formSharelink" href="javascript:void(0)" iconCls="icon-cancel" class="easyui-linkbutton" style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionSharelink = 'sharelink/add.do';
	var submitEditActionSharelink = 'sharelink/edit.do';
	var currentPageTypeSharelink = '${pageset.operateType}';
	var submitFormSharelink;
	$(function() {
		//表单组件对象
		submitFormSharelink = $('#dom_formSharelink').SubmitForm({
			pageType : currentPageTypeSharelink,
			grid : gridSharelink,
			currentWindowId : 'winSharelink'
		});
		//关闭窗口
		$('#dom_cancle_formSharelink').bind('click', function() {
			$('#winSharelink').window('close');
		});
		//提交新增数据
		$('#dom_add_entitySharelink').bind('click', function() {
			submitFormSharelink.postSubmit(submitAddActionSharelink);
		});
		//提交修改数据
		$('#dom_edit_entitySharelink').bind('click', function() {
			submitFormSharelink.postSubmit(submitEditActionSharelink);
		});
	});
//-->
</script>