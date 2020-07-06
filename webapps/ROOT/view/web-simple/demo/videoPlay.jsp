<%@page import="java.util.Date"%>
<%@page import="com.farm.core.time.TimeTool"%>
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
<title>文件上传-
	<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords" content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author" content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<script type="text/javascript" src="text/javascript/jquery-1.8.0.min.js"></script>
<script src="view/web-simple/demo/lib/html5media.min.js"></script>
<style>
<!--
.bar {
	height: 18px;
	background: green;
}
-->
</style>
</head>
<body>
	<!-- /.carousel -->
	<div class="containerbox">
		<div class="container">
			<div style="margin-top: 8px;"></div>
			<div class="row">
				<div class="col-md-12">
					<video  autostart="true" autoplay="autoplay" src="view/web-simple/demo/lib/movie.mp4?time=<%=(new Date()).getTime() %>" width="320" height="200" controls preload></video>
				</div> 
			</div>
			<div class="row">
				<div class="col-md-12">
					<video autostart="true" autoplay="autoplay" loop="true" src="actionImg/PubPlayMedia.do?id=4028b881688d6a8501688d81016c0001" controls="true" preload="true" class="img-responsive" width="550" height="400"></video>
				</div>
			</div>
		</div>
	</div>
	<img src="<PF:basePath/>home/PubQRCode.do" />
</body>
</html>