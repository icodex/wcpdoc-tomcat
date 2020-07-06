<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>${DOCE.doc.title}-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content="${DOCE.doc.title}${DOCE.doc.docdescribe}" />
<meta name="author" content="${DOCE.doc.author}">
<meta name="keywords" content="${doc.title}${DOCE.doc.tagkey}">
<meta name="robots" content="index,follow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8" src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container">
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-11">
					<jsp:include page="commons/doc.jsp"></jsp:include>
					<div class="panel panel-default view-left-content">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-6"><jsp:include page="../know/commons/includeTypeDoc.jsp"></jsp:include></div>
								<div class="col-md-6"><jsp:include page="../lucene/commons/includeLuceneResultMin.jsp"></jsp:include></div>
							</div>
							<div class="row">
								<div class="col-md-12"><jsp:include page="../know/commons/includeAuthInfo.jsp"></jsp:include>
									<jsp:include page="../know/commons/includeDocVersions.jsp"></jsp:include>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-1  visible-lg visible-md">
					<div style="margin-left: -13px;">
						<jsp:include page="../know/commons/includeNavigationMini.jsp"></jsp:include></div>
				</div>
			</div>
		</div>
	</div>
	<a name="markdocbottom"></a>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<jsp:include page="/view/web-simple/know/editor/includeHighlighter.jsp"></jsp:include>
	<script charset="utf-8" src="<PF:basePath/>text/lib/echarts/echarts.all.2.2.7.js"></script>
	<script type="text/javascript">
		$(function() {
			$('img', '#docContentsId').addClass("img-thumbnail");
		});
	</script>
</body>
</html>