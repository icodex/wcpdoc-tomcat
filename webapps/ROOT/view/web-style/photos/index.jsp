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
<title>图文知识-
	<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords" content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author" content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../text/include-web.jsp"></jsp:include>
<link href="view/web-style/text/wcp-photoImgs.css" rel="stylesheet">
<style type="text/css">
.super_content {
	border-bottom: 0px;
}
</style>
</head>
<body>
	<jsp:include page="../../web-simple/commons/head.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/superContent.jsp"></jsp:include>
	<!-- /.carousel -->
	<c:if test="${!empty topMaxs}">
		<div style="background-color: #ffffff; padding-bottom: 20px;">
			<div class="container">
				<div class="row">
					<div class="col-xs-12" style="padding: 1px;">
						<div class="widget-box shadow-box hidden-xs hidden-sm">
							<div class="stream-list p-stream">
								<div class="stream-item-img" id="loop-30">
									<div class="row">
										<div class="col-sm-12">
											<jsp:include page="../../web-simple/commons/includeMaxTopKnows.jsp"></jsp:include>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<div class="containerbox " style="background-color: #f4f4f4; border-top: 1px solid #eeeeee; padding-bottom: 50px;">
		<div class="container">
			<div class="row" style="margin-right: -35px;">
				<c:forEach items="${docbriefs}" var="node">
					<div class="col-md-3 wcp-photo-col">
						<div class="wcp-photo-box">
							<%@ include file="commons/includePhotoDocBrief.jsp"%>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="../../web-simple/commons/footServer.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/foot.jsp"></jsp:include>
</body>
<script src="view/web-style/text/wcp-photoImgs.js"></script>
<script type="text/javascript">
	$(function() {
		initPhotoImgsSize('.wcp-photo-imgbox');
		$(window).resize(function() {
			initPhotoImgsSize('.wcp-photo-imgbox');
		});
		$("img").load(function() {
			initPhotoImgSize($(this).parents('.wcp-photo-imgbox'));
		});
	});
	$(function() {
		$('.gridimg').each(function(i, obj) {
			var wid = $(obj).width();
			var hei = wid / 420 * 297;
			$(obj).height(hei);
		});
		//标签
		$('.tagsearch').bind('click', function() {
			luceneSearch('TAG:' + $(this).text());
		});
	});
</script>
</html>