<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--文档分类表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<div class="tableTitle_msg">${MESSAGE}</div>
		<div class="tableTitle_tag">
			<c:if test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</div>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formDoctype">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<table class="editTable">
				<tr>
					<td class="title">上级分类:</td>
					<td colspan="3"><c:if test="${parent!=null&&parent.id!=null}">
        ${parent.name}
        <input type="hidden" name='parentid' value="${parent.id}" />
						</c:if> <c:if test="${parent==null||parent.id==null}">
        无
      </c:if></td>
				</tr>
				<c:if test="${pageset.operateType==0}">
					<tr>
						<td class="title">ID:</td>
						<td colspan="3">${entity.id}</td>
					</tr>
				</c:if>
				<tr>
					<td class="title">栏目名称:</td>
					<td colspan="3"><input type="text" style="width: 360px;"
						class="easyui-validatebox"
						data-options="required:true,validType:[,'maxLength[512]']"
						id="entity_name" name="name" value="${entity.name}"> <c:if
							test="${pageset.operateType==1}">
							<br /> 多个分类间用逗号分隔</c:if></td>
				</tr>
				<tr>
					<td class="title">排列顺序:</td>
					<td><input type="text" style="width: 120px;"
						class="easyui-validatebox"
						data-options="required:true,validType:['integer','maxLength[5]']"
						id="entity_sort" name="sort" value="${entity.sort}"></td>
					<td class="title">知识展示方式:</td>
					<td><select id="entity_showmodel" name="showmodel"
						val="${entity.showmodel}">
							<option value="1">默认</option>
							<option value="2">网格</option>
							<option value="3">迷你</option>
					</select></td>
				</tr>
				<tr>
					<td class="title">栏目类型:</td>
					<td><select id="entity_type" name="type" val="${entity.type}">
							<option value="3">内容--可挂知识</option>
							<option value="1">结构--只能下挂分类</option>
							<!-- 
							<option value="1">
								内容
							</option>
							<option value="2">
								建设
							</option>
							<option value="4">
								链接
							</option>
							<option value="5">
								单页
							</option>
							<option value="6">
								模板
							</option> -->
					</select></td>
					<td class="title">状态:</td>
					<td><select id="entity_pstate" name="pstate"
						val="${entity.pstate}">
							<option value="1">正常</option>
							<option value="0">禁用</option>
					</select></td>
				</tr>
				<tr>
					<td class="title">知识分类:</td>
					<td><select id="entity_knowshow" name="knowshow"
						val="${entity.knowshow}">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
					<td class="title"></td>
					<td><input type="hidden" id="entity_fqashow" name="fqashow" value="" />
							</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==1}">
				<a id="dom_add_entityDoctype" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">增加</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entityDoctype" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formDoctype" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionDoctype = 'doctype/add.do';
	var submitEditActionDoctype = 'doctype/edit.do';
	var currentPageTypeDoctype = '${pageset.operateType}';
	var submitFormDoctype;
	$(function() {
		//表单组件对象
		submitFormDoctype = $('#dom_formDoctype').SubmitForm({
			pageType : currentPageTypeDoctype,
			grid : gridDoctype,
			currentWindowId : 'winDoctype'
		});
		//关闭窗口
		$('#dom_cancle_formDoctype').bind('click', function() {
			$('#winDoctype').window('close');
		});
		//提交新增数据
		$('#dom_add_entityDoctype').bind('click', function() {
			submitFormDoctype.postSubmit(submitAddActionDoctype,function(){
				$.messager.confirm('确认对话框', '数据更新,是否重新加载左侧分类树？', function(r){
					if (r){
						$('#DoctypeTree').tree('reload');
					}
				});
				return true;
			});
		});
		//提交修改数据
		$('#dom_edit_entityDoctype').bind('click', function() {
			submitFormDoctype.postSubmit(submitEditActionDoctype,function(){
				$.messager.confirm('确认对话框', '数据更新,是否重新加载左侧分类树？', function(r){
					if (r){
						$('#DoctypeTree').tree('reload');
					}
				});
				return true;
			});
		});
	});
//-->
</script>