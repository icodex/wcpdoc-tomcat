<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!-- 构造 知识得自定义属性 -->
<style>
.typeform-mobile-box {
	margin-top: 20px;
	font-size: 12px;
	color: #676767;
	background-color: #f7f7f7;
	border: dashed 1px #ddd;
}

.typeform-unitbox {
	border-top: dashed 1px #ddd;
	padding-top: 8px;
	padding-bottom: 8px;
}

.typeform-unitbox .field-title {
	padding-left: 8px;
	text-align: right;
	font-weight: 700;
	white-space: nowrap;
	vertical-align: top;
	max-width: 90px;
}

.typeform-unitbox .field-val {
	padding-left: 20px;
}
</style>
<div class="typeform-mobile-box">
	<c:forEach items="${DOCE.fieldForm.fields}" var="node">
		<div class=" typeform-unitbox">
			<table>
				<tr>
					<td class="field-title">${node.title}:</td>
					<td class="field-val">${node.val}</td>
				</tr>
			</table>
		</div>
	</c:forEach>
</div>