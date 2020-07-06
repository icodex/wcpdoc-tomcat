<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!-- 如果是内容类型等于4小组首页，则在此处不提供任何操作功能 -->
<c:if test="${DOCE.doc.domtype=='1'}">
	<div style="padding: 2px;" class="visible-lg visible-md">
		<c:if test="${USEROBJ!=null}">
			<DOC:canWriteIsShow docId="${DOCE.doc.id}">
				<button  type="button" id="versionRestoreButtonId" class="btn btn-warning center-block">更新知识为此版本</button>
			</DOC:canWriteIsShow>
		</c:if>
	</div>
</c:if>
<script type="text/javascript">
	$(function() {
		$('#versionRestoreButtonId').bind( 
				'click',
				function() {
					if (confirm("此版本将被创建为知识的最新版本，确定要继续吗？")) {
						window.location = basePath
								+ 'know/FLEditDocByVersion.do?textid=${DOCE.texts.id}';
					}
				});
	});
</script>