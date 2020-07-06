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
					<div id="textBlackId"
						style="background-color: white; border: 1px dotted #ccc; min-height: 50px; margin-top: 100px; padding: 16px;">
						同步EKCA接口【组织机构、用户机构、用户岗位、岗位、系统用户、问题、文档分类、知识】</div>
					<br /> <br /> <a class="btn btn-default" id="startSync"
						role="button">开始同步</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#startSync').click(function() {
				if (confirm("是否继续同步数据？")) {
					var $btn = $(this).button('loading');
					//启动同步线程
					$.post('demo/sycnEkcaDomainCommit.do', {}, function(flag) {
						showProgred();
					}, 'json');
				} else {
					$btn.button('reset');
				}
			});
		});

		function showProgred() {
			//获得当前同步状态
			$.post('demo/sycnEkcaDomainStat.do', {}, function(flag) {
				$('#textBlackId').text(
						"当前任务：" + flag.UNIT_CURRENT + "/" + flag.UNIT_All
								+ "总任务：" + flag.CURRENT + "/" + flag.ALL);
				if (flag.CURRENT < 8) {
					setTimeout(function() {
						showProgred();
					}, 200);
				}else{
					$('#startSync').button('reset');
				}
			}, 'json');
		}
	</script>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
</html>