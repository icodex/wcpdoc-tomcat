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
<title>专题-<PF:ParameterValue key="config.sys.title" /></title>
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
	<jsp:include page="../../web-simple/commons/head.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/superContent.jsp"></jsp:include>
	<!-- /.carousel -->
	<div class="containerbox wcp-zebra-3">
		<div class="container">
			<div style="margin-top: 8px;"></div>
			<!-- 迭代专题 -->
			<div class="row" style="margin-top: 8px;">
				<div class="col-lg-12" style="padding: 1px;">
					<div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../web-simple/commons/footServer.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/foot.jsp"></jsp:include>
</body>
</html>