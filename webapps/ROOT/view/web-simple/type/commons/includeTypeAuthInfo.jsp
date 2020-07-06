<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<DOC:isTypeManager typeId="${typeid}">
<!-- 超级管理员有权限查看 -->
<style>
<!--
.badge {
	font-weight: lighter;
	margin-top: 3px; 
}
-->
</style>
<c:if test="${typeid!='NONE'}">
	<div class="block-auth-box">
		<table class="table table-bordered table-hover">
			<tr>
				<td class="active" style="width: 200px;">
					<b>分类名称</b>
				</td>
				<td>${type.name }</td>
			</tr>
			<tr>
				<td class="active" style="width: 200px;">
					<b>分类类型</b>
				</td>
				<td>
					<c:if test="${type.type=='1'}">结构</c:if>
					<c:if test="${type.type=='3'}">知识</c:if>
				</td>
			</tr>
		</table>
	</div>
</c:if>
</DOC:isTypeManager>
