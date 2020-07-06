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
<title>restfulAPI-
	<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords" content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author" content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<script type="text/javascript" src="text/javascript/jquery-1.8.0.min.js"></script>
<link href="text/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="text/lib/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<script src="text/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="text/lib/bootstrap/respond.min.js"></script>
<script type="text/javascript">
	var basePath = '<PF:basePath/>';
	$(function() {
		$.ajaxSetup({
			cache : false
		});
	})
//-->
</script>
<style>
<!--
.container h1 {
	font-weight: 700;
	margin: 10px;
}

.container h3 {
	margin: 10px;
	color: #CE4844;
}

.container .protocol {
	color: #4fadc2;
	font-size: 24px;
	font-weight: 500px;
}

.container .demo {
	color: #4fadc2;
	max-width: 400px;
}

ul li {
	font-size: 18px;
	font-weight: 200;
}

h1 a {
	font-size: 12px;
	margin-left: 24px;
	padding-left: 24px;
	font-weight: 200;
}

.apimenu {
	
}

.apimenu li {
	margin: 0px;
	padding: 2px;
	line-height: 14px;
	font-size: 14px;
}

.apimenu li a {
	margin: 0px;
	padding: 4px;
}

.page-header {
	padding-top: 50px;
}

caption {
	text-align: left;
	color: #CE4844;
}
-->
</style>
</head>
<body class="container" style="padding: 16px;">
	<div class="row">
		<div class="col-sm-3 ">
			<nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix">
				<ul class="nav bs-docs-sidenav apimenu">
					<li>
						<a href="helper/super.do#upbase64">
							上传图片（base64）
						</a>
					</li>
					<li>
						<a href="helper/super.do#localFile">
							上传本地附件
						</a>
					</li>
					<li>
						<hr style="margin: 1px;" />
					</li>
					<li>
						<a href="helper/super.do#docCreateKnow">
							创建文档知识
						</a>
					</li>
					<li>
						<hr style="margin: 1px;" />
					</li>
					<li>
						<a href="helper/super.do#mergeIndex">
							合并索引文件
						</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="col-sm-9">
			<!-- 上传图片 -->
			<div id="upbase64" class="page-header">
				<jsp:include page="comment/imgBase64Up.jsp"></jsp:include>
			</div>
			<!-- 上传附件 -->
			<div id="localFile" class="page-header">
				<jsp:include page="comment/localFileUp.jsp"></jsp:include>
			</div>
			<!-- 創建知識 -->
			<div id="docCreateKnow" class="page-header">
				<jsp:include page="comment/docCreateKnow.jsp"></jsp:include>
			</div>
			<!-- 合并索引 -->
			<div id="mergeIndex" class="page-header">
				<jsp:include page="comment/mergeIndex.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>