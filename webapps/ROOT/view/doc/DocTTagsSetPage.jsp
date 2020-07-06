<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div id="cc" class="easyui-layout" data-options="fit:true">
	<div data-options="region:'east',iconCls:'icon-bookmark',title:'可选标签'" style="width: 250px; padding: 4px;">
		<c:forEach items="${tags}" var="tagList">
			<div class="${tagList[0][1]} tagLimitUnitBox">
				<span style="font-weight: bold;">
					<!-- 标签类型 -->
					<c:if test="${tagList[0][0]!='NONE'}">
										${tagList[0][0]}:
										</c:if>
				</span>
				<c:forEach items="${tagList}" var="tag" varStatus="status">
					<c:if test="${status.index>0}">
						<!-- 标签 -->
						<a href="javascript:chooseTagUnit('${tag[0]}');" style="margin: 4px; color: #4c91ab;">${tag[0]}</a>
					</c:if>
				</c:forEach>
				<hr style="margin: 4px;">
			</div>
		</c:forEach>
	</div>
	<div data-options="region:'center'">
		<!--设置标签-->
		<form id="dom_tags_entity">
			<div class="TableTitle">
				<div class="tableTitle_msg">${MESSAGE}</div>
				<div class="tableTitle_tag">
					<c:if test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if>
					<c:if test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if>
					<c:if test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
				</div>
				<input type="hidden" name="id" value="${entity.doc.id}">
			</div>
			<table class="editTable">
				<tr>
					<td class="title">编辑类型:</td>
					<td colspan="3">
						<select name="addtype" id="entity_addtype">
							<option value="1">追加</option>
							<option value="0">覆蓋</option>
						</select>
					</td>
					<td class="title"></td>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td class="title">标签:</td>
					<td colspan="7">
						<textarea class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[256]']" rows="2" style="width: 100%" name="tagtext" id="tagtextId"></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="8" class="title" style="text-align: left;">目标文档（下列文档将被修改）:</th>
				</tr>
				<tr>
					<td colspan="8">
						<div id="showDocsTagsId" style="height: 65px; overflow: auto; color: #999;"></div>
						<input type="hidden" name="ids" id="ids_tags_id">
					</td>
				</tr>
				<tr>
					<th colspan="8">
						<div class="div_button" style="text-align: center;">
							<a id="dom_tags_edit_entity" href="javascript:void(0)" class="easyui-linkbutton">修改</a>
							<a id="dom_tags_cancle_form" href="javascript:void(0)" class="easyui-linkbutton" style="color: #000000;">取消</a>
						</div>
					</th>
				</tr>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript">
	var submitEditTagDoctype = 'doc/DocTageditCommit.do';
	var currentPageTypeTags = '2';
	var submitFormDocTags;
	$(function() {
		//表单组件对象
		submitFormDocTags = $('#dom_tags_entity').SubmitForm({
			pageType : currentPageTypeTags,
			grid : gridFarmdoc,
			comiitAfter : function() {
				$.messager.progress('close');
			},
			comiitBefore : function() {
				$.messager.progress({
					title : 'loading...',
					text : '处理中...'
				});
			},
			currentWindowId : 'winsettionTags'
		});
		//关闭窗口
		$('#dom_tags_cancle_form').bind('click', function() {
			$('#winsettionTags').window('close');
		});
		//提交修改数据
		$('#dom_tags_edit_entity').bind('click', function() {
			submitFormDocTags.postSubmit(submitEditTagDoctype);
		});
		var rows = $(gridFarmdoc).datagrid('getSelections');
		var ids;
		$(rows).each(function(index, obj) {
			$('#showDocsTagsId').append(obj.TITLE + ",");
			if (ids) {
				ids = ids + "," + obj.ID;
			} else {
				ids = obj.ID;
			}
		});
		$('#ids_tags_id').val(ids);
	});
	function chooseTagUnit(text) {
		var currentVal = $('#tagtextId').val();
		if (currentVal) {
			$('#tagtextId').val(currentVal + ',' + text);
		} else {
			$('#tagtextId').val(text);
		}
	}
//-->
</script>