<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<style>
<!-- /**#1text，2select，3checkbox，4texteare**/
.inputall {
	padding: 8px;
	font-size: 10px;
}

.inputall .title {
	text-align: right;
	width: 100px;
	font-weight: 700;
	font-size: 14px;
}

.inputall .field {
	text-align: left;
	font-size: 14px;
}

.input1 {
	width: 50%;
	float: left;
	height: 50px;
	border-bottom: solid 1px #ddd;
}

.input2 {
	width: 100%;
	clear: both;
	min-height: 30px;
	border-bottom: solid 1px #ddd;
}
-->
</style>
<!--分类自定义属性表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary"> 表单预览 </span>
	</div>
	<div data-options="region:'center'">
		<c:forEach items="${form.fields}" var="node">
			<div class="input${node.colspan} inputall">
				<table>
					<tr>
						<td class="title">
							<c:if test="${node.required}">
								<span style="color: red;">${node.title}</span>
							</c:if>
							<c:if test="${!node.required}">
								<span>${node.title}</span>
							</c:if>
							:
						</td>
						<td class="field">
							&nbsp;&nbsp;
							<c:if test="${node.type=='1'}">
								<input name="${node.name}" type="text" value="${node.validates}">
							</c:if>
							<c:if test="${node.type=='2'}">
								<select name="${node.name}">
									<c:forEach var="option" items="${node.options}">
										<option value="${option}">${option}</option>
									</c:forEach>
								</select>
							</c:if>
							<c:if test="${node.type=='3'}">
								<c:forEach var="option" items="${node.options}">
									<input name="${node.name}" value="${option}" type="checkbox">&nbsp;${option}&nbsp;&nbsp;
								</c:forEach>
							</c:if>
							<c:if test="${node.type=='4'}">
								<textarea name="${node.name}" style="width: 530px;">${node.validates}</textarea>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<a id="dom_cancle_formTypefieldView" href="javascript:void(0)" iconCls="icon-cancel" class="easyui-linkbutton" style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		//关闭窗口
		$('#dom_cancle_formTypefieldView').bind('click', function() {
			$('#winTypefieldForm').window('close');
		});
	});
//-->
</script>