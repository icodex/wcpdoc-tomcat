<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
</head>
<c:set var="typeid" value="${DOCE.type.id}" scope="request"></c:set>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row" style="margin-top: 70px;">
				<div class="col-md-10">
					<jsp:include page="../know/commons/version.jsp"></jsp:include>
					<c:if test="${fn:length(DOCE.files)>0}">
						<div class="panel panel-default">
							<div class="panel-body">
								<jsp:include page="../know/commons/includeDocFiles.jsp"></jsp:include>
							</div>
						</div>
					</c:if>
				</div>
				<div class="col-md-2  visible-lg visible-md">
					<div style="margin-left: -13px;">
						<jsp:include page="../know/commons/includeNavigationVersion.jsp"></jsp:include></div>
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
</body>
</html>