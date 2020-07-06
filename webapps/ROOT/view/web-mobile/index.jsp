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
<title>首页-<PF:ParameterValue key="config.sys.title" /></title>
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
	<div class="page-group">
		<div class="page page-current" id='routers-home'>
			<jsp:include page="commons/head.jsp"></jsp:include>
			<jsp:include page="commons/nav.jsp">
				<jsp:param name="currentIcon" value="1" />
			</jsp:include>
			<div class="content">
				<!-- 查询框 -->
				<jsp:include page="commons/searchBox.jsp"></jsp:include>
				<!-- 置顶知识 -->
				<jsp:include page="commons/topDoc.jsp"></jsp:include>
				<!-- 知识分类 -->
				<jsp:include page="commons/docType.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="text/include-webFoot.jsp"></jsp:include>
	<script type='text/javascript' src='view/web-mobile/text/js/docView.js'
		charset='utf-8'></script>
	<script>
		$(function() {
			$.init();
		});
	</script>
</body>
</html>