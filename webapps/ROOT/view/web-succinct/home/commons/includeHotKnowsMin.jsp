<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="wcp-su-out-box">
	<div class="unit">
		<div class="title">
			<i class="glyphicon glyphicon-fire"></i> &nbsp;热门知识<a
				class="more-link" style="color: #D9534F;"
				target="${config_sys_link_newwindow_target}"
				href="webtype/view/Pub1.html">更多 &gt; </a>
		</div>
	</div>
	<c:forEach items="${hotdocs}" varStatus="status" var="node">
		<div class="unit unit-min link">
			<div class="wcp-su-one-line">
				<jsp:include page="/view/web-simple/commons/includeKnowIcon.jsp">
					<jsp:param value="${node.domtype}" name="domtype" />
				</jsp:include>
				<a title="${node.title}"
					target="${config_sys_link_newwindow_target}"
					href="webdoc/view/Pub${node.docid}.html">${node.title} </a>
			</div>
		</div>
	</c:forEach>
</div>
