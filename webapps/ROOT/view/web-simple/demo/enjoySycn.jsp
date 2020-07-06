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
				<div class="col-md-12 text-center">
					<a class="btn btn-default" id="docSync" role="button">开始同步关注知识</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		$('#docSync').bind('click', function() {
			$('#docSync').text('同步中...');
			$.post('demo/autoSyncEnjoyDocs.do', {}, function(flag) {
				$('#docSync').text('同步完成');
				if(flag.STATE=='1'){
					alert(flag.MESSAGE);
				}else{
					alert('完成');
				}
			}, 'json');
		});
	});
</script>
</html>