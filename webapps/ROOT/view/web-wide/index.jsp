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
<title>首页- <PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="text/include-web.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../web-simple/commons/head.jsp"></jsp:include>
	<div class="wcp-space-h50"></div>
	<!-- /.carousel -->
	<div class=" hidden-xs hidden-sm hidden-md">
		<c:if test="${!empty topMaxs}">
			<jsp:include page="commons/includeMaxTopKnows.jsp"></jsp:include>
		</c:if>
	</div>
	<jsp:include page="commons/includePubKnow.jsp"></jsp:include>
	<jsp:include page="commons/superContent.jsp"></jsp:include>
	<div class="wcp-zebra-1">
		<div class="container">
			<div class="row wcp-margin-top8">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<jsp:include page="commons/includeMiniSearchForm.jsp"></jsp:include>
				</div>
				<div class="col-lg-1"></div>
			</div>
		</div>
	</div>
	<div class="wcp-zebra-2">
		<div class="container">
			<div class="row wcp-margin-top8">
				<div class="col-lg-12">
					<div>
						<jsp:include page="commons/includePubType.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wcp-zebra-1">
		<div class="container  hidden-xs">
			<div class="row wcp-margin-top8">
				<div class="col-lg-12">
					<div>
						<jsp:include page="commons/includeMiniKnows.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../web-simple/commons/footServer.jsp"></jsp:include>
	<jsp:include page="../web-simple/commons/foot.jsp"></jsp:include>
</body>
</html>