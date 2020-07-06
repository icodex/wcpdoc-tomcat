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
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<jsp:include page="/view/web-simple/demo/lib/fileUpload/include-fileUpload.jsp"></jsp:include>
<style>
body {
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<!-- /.carousel -->
	<div class="containerbox">
		<div class="container">
			<div style="margin-top: 8px;"></div>
			<div class="row" id="superId">
				<div class="col-md-12 text-center">
					<div id="iframeBox" style="overflow: hidden; border: 1px dashed #ccc; cursor:">
						<iframe src="http://www.wcpdoc.cn/" style="width: 100%;" frameborder="0" id="test"></iframe>
						<div id="iframeBoxOver" style="position: absolute; cursor: w-resize; opacity: 0.05; border-right: 5px dashed #ccc; background-color: #000000;"></div>
					</div>
					<div id="iframeBoxButton" style="border: 1px dashed #ccc; cursor: pointer; padding: 20px; background-color: #000000; color: #ffffff; border-top: 0px;">点击展示更多...</div>
					<br />
					<br />
					<br />
					<br />
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	var moreHeight = 0;
	$(function() {
		initIframeState();
		$(window).resize(function() {
			initIframeState();
		});
		$('#iframeBoxButton').click(function() {
			moreHeight = moreHeight + $(window).height()/2;
			initIframeState();
		});
	});
	function initIframeState() {
		$("#test").height($(window).height() - 120 + moreHeight);
		$("#iframeBox").height($(window).height() - 135 + moreHeight);
		$("#iframeBoxOver").offset({
			top : $('#iframeBox').offset().top,
			left : $('#iframeBox').offset().left
		});
		$("#iframeBoxOver").height($('#iframeBox').height());
		$("#iframeBoxOver").width($('#iframeBox').width() - 60);
	}
</script>
</html>