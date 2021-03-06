<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>知识-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content="${DOCE.doc.docdescribe}" />
<meta name="author" content="${DOCE.doc.author}">
<meta name="keywords" content="${DOCE.doc.tagkey}">
<meta name="robots" content="index,follow">
<jsp:include page="../text/include-web.jsp"></jsp:include>
</head>
<body>
	<div class="page-group">
		<div class="page page-current" id='routers-know-view'>
			<jsp:include page="../commons/head.jsp">
				<jsp:param name="showback" value="true" />
			</jsp:include>
			<jsp:include page="../commons/nav.jsp">
				<jsp:param name="currentIcon" value="0" />
			</jsp:include>
			<div class="content">
				<div class="card-content-inner wcp-content">
					<p class="wcp-title">${DOCE.doc.title}</p>
					<p class="wcp-date">
						${DOCE.doc.cusername}&nbsp;创建知识于
						<PF:FormatTime date="${DOCE.doc.pubtime}"
							yyyyMMddHHmmss="yyyy年MM月dd日" />
						<c:if test="${DOCE.doc.pubtime!=DOCE.texts.etime}">
							,修改于
						<PF:FormatTime date="${DOCE.texts.etime}"
								yyyyMMddHHmmss="yyyy年MM月dd日" />
						</c:if>
					</p>
					<p class="wcp-date">
						<c:forEach var="node" items="${DOCE.currenttypes}"
							varStatus="status">
					/
					<a href="webtype/view${node.id}/Pub1.html" class="external"
								title="${node.name}">${node.name}</a>
						</c:forEach>
					</p>
					<div>
						<jsp:include page="includeTypeFormView.jsp"></jsp:include>
					</div>
					<div class="wcp-text">
						<DOC:InitHtmlContentTag html="${DOCE.texts.text}"></DOC:InitHtmlContentTag>
					</div>
				</div>
				<jsp:include page="../commons/messageForm.jsp"></jsp:include>
				<jsp:include page="../commons/docMessage.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../text/include-webFoot.jsp"></jsp:include>
	<script type='text/javascript' src='view/web-mobile/text/js/docView.js'
		charset='utf-8'></script>
	<script>
		$(function() {
			$.init();
		});
	</script>
</body>
</html>