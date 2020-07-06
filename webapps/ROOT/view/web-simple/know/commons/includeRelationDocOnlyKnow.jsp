<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${fn:length(RELATIONDOCS)>0}">
	<!-- 分类下的知识列表，小的列表页面(缩写) -->
	<a name="markRelationDoc"></a><br />
	<div class="row">
		<div class="col-md-12">
			<div class=" doc_column_box">
				<span class="glyphicon glyphicon-link column_title">&nbsp;关联知识</span>
			</div>
			<hr class="hr_split" />
			<div id="newTypeBoxId">
				<ol>
					<c:forEach items="${RELATIONDOCS}" varStatus="status" var="node">
						<li><a href="webdoc/view/Pub${node.id}.html"><span
								class="glyphicon glyphicon-file"></span>&nbsp;${node.title}</a></li>
					</c:forEach>
				</ol>
			</div>
		</div>
	</div>
</c:if>