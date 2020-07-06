<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>${DOCE.doc.title}-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content="${DOCE.doc.docdescribe}" />
<meta name="author" content="${DOCE.doc.author}">
<meta name="keywords" content="${DOCE.doc.tagkey}">
<meta name="robots" content="index,fllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8" src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
</head>
<c:set var="typeid" value="${DOCE.type.id}" scope="request"></c:set>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-10 clear-both">
					<div class="panel panel-default view-left-content">
						<div class="panel-body">
							<!-- 知识正文 -->
							<jsp:include page="../know/commons/doc.jsp"></jsp:include></div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<!-- 知識評價 -->
									<jsp:include page="../know/commons/includeOnlyPraiseDoc.jsp"></jsp:include>
									<!-- 关联知识 -->
									<jsp:include page="../know/commons/includeRelationDoc.jsp"></jsp:include>
									<!--  -->
									<jsp:include page="commons/includeNewComments.jsp"></jsp:include>
									<!--  -->
									<jsp:include page="commons/includeCommentsForm.jsp"></jsp:include>
								</div>
							</div>
						</div>
					</div>
					<div style="margin-top: 20px;"></div>
					<div class="panel panel-default view-left-content">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-6"><jsp:include page="../know/commons/includeTypeDoc.jsp"></jsp:include></div>
								<div class="col-md-6"><jsp:include page="../lucene/commons/includeLuceneResultMin.jsp"></jsp:include></div>
							</div>
							<div class="row">
								<div class="col-md-12"><jsp:include page="../know/commons/includeAuthInfo.jsp"></jsp:include>
									<jsp:include page="../know/commons/includeDocVersions.jsp"></jsp:include>
									<jsp:include page="../know/commons/includeDocFiles.jsp"></jsp:include></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2  visible-lg visible-md">
					<div style="margin-left: -13px;">
						<!-- includeNavigationDoc.jsp,includeNavigationMini.jsp -->
						<c:if test="${miniMenuAble}">
							<jsp:include page="../know/commons/includeNavigationMini.jsp"></jsp:include>
						</c:if>
						<c:if test="${!miniMenuAble}">
							<jsp:include page="../know/commons/includeNavigationDoc.jsp"></jsp:include>
						</c:if>
					</div>
				</div>
			</div>
			<div class="row column_box">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<a name="markdocbottom"></a>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<jsp:include page="/view/web-simple/know/editor/includeHighlighter.jsp"></jsp:include>
	<DOC:IsHaveRelationGraph html="${DOCE.texts.text}" html2="${DOCE.auditTemp.text}">
		<script charset="utf-8" src="<PF:basePath/>text/lib/echarts/echarts.all.2.2.7.js"></script>
	</DOC:IsHaveRelationGraph>
</body>
</html>