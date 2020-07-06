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
<title>文件上传-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<jsp:include
	page="/view/web-simple/demo/lib/fileUpload/include-fileUpload.jsp"></jsp:include>
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
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<!-- /.carousel -->
	<div class="containerbox">
		<div class="container">
			<div style="margin-top: 8px;"></div>
			<div class="row">
				<div class="col-md-12">
					<br /> <a
						href="http://blog.csdn.net/meng1339746727/article/details/50801229">http://blog.csdn.net/meng1339746727/article/details/50801229</a>
					<br />
					<a href="http://blog.csdn.net/lengxue789/article/details/43169965">http://blog.csdn.net/lengxue789/article/details/43169965</a>
					<br />
					<span class="btn btn-success fileinput-button"> <i
						class="glyphicon glyphicon-plus"></i> <span>Select files...</span>
						<!-- The file input field used as target for the file upload widget -->
						<input id="fileupload" type="file" name="imgFile" multiple>
					</span> <br />
					<div id="progress">
						<div class="bar" style="width: 0%;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#fileupload').fileupload(
					{
						url : "actionImg/PubFPupload.do",
						dataType : 'json',
						done : function(e, data) {
							alert(data.result.url);
						},
						progressall : function(e, data) {
							var progress = parseInt(data.loaded / data.total
									* 100, 10);
							$('#progress .bar').css('width', progress + '%');
						}
					});
		});
	</script>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
</html>