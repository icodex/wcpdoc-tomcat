<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="widget-box shadow-box">
	<div class="title">
		<h3>
			<i class="glyphicon glyphicon-fire"></i>
			&nbsp;热门知识
		</h3>
	</div>
	<ul class="box-list" id="hots">

		<c:forEach items="${hotdocs}" varStatus="status" var="node">
			<c:if test="${!status.last}">
				<li>
					<div class="li-out">
						<span class="last"> </span>
						<span class="name">
							<jsp:include page="includeKnowIcon.jsp">
								<jsp:param value="${node.domtype}" name="domtype" />
							</jsp:include>
							<a title="${node.title}" target="${config_sys_link_newwindow_target}" href="webdoc/view/Pub${node.docid}.html">${node.title}</a>
						</span>
						<span class="nums">${node.visitnum}</span>
					</div>
				</li>
			</c:if>
			<c:if test="${status.last}">
				<li style="border-bottom:0px;padding-bottom: 12px;">
					<div class="li-out">
						<span class="last"> </span>
						<span class="name">
							<jsp:include page="includeKnowIcon.jsp">
								<jsp:param value="${node.domtype}" name="domtype" />
							</jsp:include>
							<a title="${node.title}" target="${config_sys_link_newwindow_target}" href="webdoc/view/Pub${node.docid}.html">${node.title}</a>
						</span>
						<span class="nums">${node.visitnum}</span>
					</div>
				</li>
			</c:if>
		</c:forEach>
	</ul>
</div>
