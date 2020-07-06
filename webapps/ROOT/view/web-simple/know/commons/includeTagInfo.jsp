<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${fn:length(DOCE.tags)>0}">
<a name="markdocTag"></a>
	<div class="row">
		<div class="col-md-12 text-left" style="margin-top: 8px;margin-bottom: 4px;">
			<c:forEach items="${DOCE.tags}" var="node">
				<span class="label label-default tagsearch" style="cursor: pointer;"
					title="${node}">${node}</span>
			</c:forEach>
		</div>
	</div>
</c:if>
<script type="text/javascript">
	//标签
	$('.tagsearch').bind('click', function() {
		luceneSearch('TAG:' + $(this).attr('title'));
	});
</script>