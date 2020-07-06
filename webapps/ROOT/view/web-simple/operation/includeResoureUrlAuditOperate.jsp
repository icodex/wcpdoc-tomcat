<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!-- 必须满足：用户本人、审核失败 -->
<c:if test="${USEROBJ!=null}">
	<c:if test="${USEROBJ.type!='4'}">
		<c:if test="${DOCE.audit.cuser==USEROBJ.id&&DOCE.audit.pstate=='3'}">
			<div style="padding: 2px;">
				<DOC:canWriteIsShow docId="${DOCE.doc.id}">
					<button type="button" id="editTopButtonId"
						class="btn btn-default  btn-xs">
						<span class="glyphicon glyphicon-edit"></span>&nbsp;修改并再次提交审核
					</button>
				</DOC:canWriteIsShow>
			</div>
		</c:if>
	</c:if>
</c:if>
<script type="text/javascript">
	$(function() {
		$('#editTopButtonId').bind(
				'click',
				function() {
					window.location = basePath
							+ 'resourceUrl/edit.do?docid=${DOCE.doc.id}';
				});
	});
</script>