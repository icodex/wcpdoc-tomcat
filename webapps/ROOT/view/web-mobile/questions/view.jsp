<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>问答-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../text/include-web.jsp"></jsp:include>
</head>
<body>
	<div class="page-group">
		<div class="page page-current" id='routers-qustion-view'>
			<jsp:include page="../commons/head.jsp">
				<jsp:param name="showback" value="true" />
			</jsp:include>
			<jsp:include page="../commons/nav.jsp">
				<jsp:param name="currentIcon" value="0" />
			</jsp:include>
			<div class="content">
				<div class="card-content-inner wcp-content">
					<p class="wcp-title">${fqa.question.title}</p>
					<p class="wcp-date">
						${fqa.question.cusername}&nbsp;创建问题于
						<PF:FormatTime date="${fqa.question.ctime}"
							yyyyMMddHHmmss="yyyy年MM月dd日 HH:mm" />
					</p>
					<p class="wcp-date">
						<c:forEach var="node" items="${fqa.typepath}" varStatus="status">
							/<a href="webquest/view${node.id}/Pub1.html" class="external"
								title="${node.name}">${node.name}</a>
						</c:forEach>
					</p>
					<div class="wcp-text">
						<DOC:InitHtmlContentTag html="${fqa.question.description}"></DOC:InitHtmlContentTag>
					</div>
					<!-- 追加问题  -->
					<c:forEach items="${fqa.questionpluses}" var="node">
						<div class="wcp-text ">
							<p class="wcp-date ">
								作者于
								<PF:FormatTime date="${node.ctime}"
									yyyyMMddHHmmss="yyyy年MM月dd日 HH:mm" />
								追加提问：
							</p>
							<DOC:InitHtmlContentTag html="${node.description}"></DOC:InitHtmlContentTag>
						</div>
					</c:forEach>
				</div>
				<!-- 下方扩展信息-最佳答案 -->
				<c:if test="${fqa.question.pstate=='2'}">
					<div class="content-block-title">最佳答案</div>
					<div class="card facebook-card">
						<div class="card-header no-border">
							<div class="facebook-avatar">
								<img src="${fqa.qanswer.photourl}" width="34" height="34">
							</div>
							<div class="facebook-name">${fqa.qanswer.cusername}</div>
							<div class="facebook-date">
								<PF:FormatTime date="${fqa.qanswer.ctime}"
									yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
							</div>
						</div>
						<div class="card-content card-content-inner">
							${fqa.qanswer.description}</div>
					</div>
				</c:if>
				<!-- 下方扩展信息-备选答案 -->
				<c:if test="${fun:length(fqa.qanswers)>0}">
					<div class="content-block-title">备选答案</div>
				</c:if>
				<c:forEach items="${fqa.qanswers}" var="node">
					<div class="card facebook-card">
						<div class="card-header no-border">
							<div class="facebook-avatar">
								<img src="${node.photourl}" width="34" height="34">
							</div>
							<div class="facebook-name">${node.cusername}</div>
							<div class="facebook-date">
								<PF:FormatTime date="${node.ctime}"
									yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
							</div>
						</div>
						<div class="card-content card-content-inner">
							${node.description}</div>
					</div>
				</c:forEach>
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