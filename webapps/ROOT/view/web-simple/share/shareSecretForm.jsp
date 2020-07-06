<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>${DOCE.doc.title}-分享链接-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content="${DOCE.doc.docdescribe}" />
<meta name="author" content="${DOCE.doc.author}">
<meta name="keywords" content="${DOCE.doc.tagkey}">
<meta name="robots" content="index,fllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8" src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
<!-- 文档中的目录导航 -->
<style>
<!--
.affix {
	top: 54px;
	width: 230px;
}

.wcpdocMinConsole .disable {
	color: #ccc;
}
-->
</style>
</head>
<c:set var="typeid" value="${DOCE.type.id}" scope="request"></c:set>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top " role="navigation" style="margin: 0px;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="color: #ffffff; font-weight: bold; padding: 5px; cursor: default;">
					<img src="<PF:basePath/>actionImg/Publogo.do" height="40" alt="WCP" align="middle" />
					<PF:ParameterValue key="config.sys.title" />
				</a>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row" style="margin-top: 100px;">
				<div class="col-md-12 clear-both">
					<div class="panel panel-default ">
						<div class="panel-body" style="text-align: center;">
							<div style="color: gray; margin: 20px;">${message }</div>
							<form id="secretForm" action="webshare/Pub${key}.do" method="post" class="form-inline" style="text-align: center;">
								<div class="form-group">
									<input type="text" name="safecode" class="form-control" id="exampleInputSecret" placeholder="请输入提取码">
								</div>
								<button id="shareLinkButtonId" type="submit" class="btn btn-default">提交</button>
							</form>
						</div>
					</div>
					<div style="margin-top: 20px;"></div>
				</div>

			</div>
			<div class="row column_box">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<a name="markdocbottom"></a>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<jsp:include page="/view/web-simple/know/editor/includeHighlighter.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		$('#shareLinkButtonId').bind('click', function() {
			if ($('#exampleInputSecret').val()) {
				$('#secretForm').submit();
			}
		});
	});
</script>
</html>