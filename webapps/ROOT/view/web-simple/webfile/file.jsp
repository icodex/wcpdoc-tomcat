<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>${file.name}-<PF:ParameterValue key="config.sys.title" /></title>
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
<script charset="utf-8"
	src="<PF:basePath/>text/javascript/intense.img.max.min.js"></script>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<div class="containerbox">
		<c:if
			test="${fn:toUpperCase(fn:replace(file.exname,'.',''))=='PNG'||fn:toUpperCase(fn:replace(file.exname,'.',''))=='JPG'||fn:toUpperCase(fn:replace(file.exname,'.',''))=='JPEG'||fn:toUpperCase(fn:replace(file.exname,'.',''))=='GIF'}">
			<jsp:include page="commons/includeImgFile.jsp"></jsp:include>
		</c:if>
		<c:if
			test="${fn:toUpperCase(fn:replace(file.exname,'.',''))!='PNG'&&fn:toUpperCase(fn:replace(file.exname,'.',''))!='JPG'&&fn:toUpperCase(fn:replace(file.exname,'.',''))!='JPEG'&&fn:toUpperCase(fn:replace(file.exname,'.',''))!='GIF'}">
			<jsp:include page="commons/includeFile.jsp"></jsp:include>
		</c:if>
	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<script type="text/javascript">
		$(function() {
			if (is_weixin()) {
				$('.downloadButton_wcp').hide();
			}
		});
		function is_weixin() {
			var ua = navigator.userAgent.toLowerCase();
			if (ua.match(/MicroMessenger/i) == "micromessenger") {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>