<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>${DOCE.doc.title}-<PF:ParameterValue
		key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="noindex,nofllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8"
	src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
</head>
<c:set var="typeid" value="${DOCE.type.id}" scope="request"></c:set>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row" style="margin-top: 70px;">
				<c:if
					test="${DOCE.texts.id==DOCE.auditTemp.id||DOCE.auditTemp==null}">
					<!-- 当前版本和审核版本一致 -->
					<div class="col-md-3  visible-lg visible-md">
						<jsp:include page="../know/commons/includeNavigationAudit.jsp"></jsp:include>
					</div>
					<div class="col-md-9">
						<div class="panel panel-default">
							<div class="panel-body " style="padding: 20px;">
								<jsp:include page="../know/commons/doc.jsp"></jsp:include></div>
						</div>
						<div class="panel panel-default">
							<div class="panel-body">
								<a href="webdoc/view/Pub${DOCE.doc.id}.html"
									class="btn btn-info center-block" style="width: 200px;">查看知识当前版本
								</a>
							</div>
						</div>
						<c:if test="${TYPE=='AUDIT' }">
							<div class="panel panel-default">
								<div class="panel-body">
									<jsp:include page="../know/commons/includeAuditForm.jsp"></jsp:include>
								</div>
							</div>
						</c:if>
					</div>
				</c:if>
				<c:if
					test="${DOCE.texts.id!=DOCE.auditTemp.id&&DOCE.auditTemp!=null}">
					<!-- 当前版本和审核版本不一致 -->
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body" style="padding: 20px;">
								<jsp:include page="../know/commons/doc.jsp"></jsp:include></div>
						</div>
						<div class="panel panel-default">
							<div class="panel-body">
								<a href="webdoc/view/Pub${DOCE.doc.id}.html"
									class="btn btn-info center-block" style="width: 200px;">查看知识当前版本
								</a>
							</div>
						</div>
						<c:if test="${TYPE=='AUDIT' }">
							<div class="panel panel-default">
								<div class="panel-body">
									<jsp:include page="../know/commons/includeAuditForm.jsp"></jsp:include>
								</div>
							</div>
						</c:if>
					</div>
				</c:if>
				<div class="row column_box">
					<div class="col-md-12"></div>
				</div>
			</div>
		</div>
	</div>
	<a name="markdocbottom"></a>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<jsp:include page="/view/web-simple/know/editor/includeHighlighter.jsp"></jsp:include>
	<script charset="utf-8" src="<PF:basePath/>text/lib/echarts/echarts.all.2.2.7.js"></script>
</body>
</html>