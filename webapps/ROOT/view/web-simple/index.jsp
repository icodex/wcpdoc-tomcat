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
<title>首页- <PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="atext/include-web.jsp"></jsp:include>
<style type="text/css">
.super_content {
	border-bottom: 0px;
}
</style>
</head>
<body>
	<jsp:include page="commons/head.jsp"></jsp:include>
	<jsp:include page="commons/superContent.jsp"></jsp:include>
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
											<jsp:include page="commons/includeMaxTopKnows.jsp"></jsp:include>
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
	<!-- /.carousel -->
	<div class="containerbox "
		style="background-color: #f4f4f4; border-top: 1px solid #eeeeee; padding-bottom: 50px; padding-top: 20px;">
		<div class="container">
			<div class="row">
				<div class="col-md-3 hidden-xs hidden-sm hidden-md"
					style="padding: 1px;">
					<jsp:include page="commons/includeMessageBox.jsp"></jsp:include>
					<jsp:include page="commons/includeHotKnowsMin.jsp"></jsp:include>
					<c:if test="${!empty newmsgs}">
						<jsp:include page="commons/includeNewPubDocMessages.jsp"></jsp:include>
					</c:if>
				</div>
				<div class="col-lg-9" style="padding: 1px;">
					<div class="row" style="padding-left: 28px; padding-right: 26px;">
						<c:if test="${!empty topRecommends}">
							<jsp:include page="commons/includeTopKnows.jsp"></jsp:include>
						</c:if>
					</div>
					<PF:IfParameterEquals key="config.show.search.homepage" val="true">
						<jsp:include page="lucene/commons/includeMiniSearchForm.jsp"></jsp:include>
					</PF:IfParameterEquals>
					<PF:IfParameterEquals key="config.show.hometype" val="true">
						<!-- 分类展示组件 -->
						<jsp:include page="commons/includePubType.jsp"></jsp:include>
					</PF:IfParameterEquals>
					<c:if test="${!empty docbriefs&&false}">
						<jsp:include page="commons/includeMiniKnows.jsp"></jsp:include>
					</c:if>
					<c:if test="${!empty docbriefs}">
						<div class="widget-box shadow-box " style="padding-bottom: 0px;">
							<div class="title">
								<h3>
									<i class="glyphicon glyphicon-star"></i> 最新知识 <a
										class="more-link" href="webtype/view/Pub1.html">查看更多</a>
								</h3>
							</div>
							<jsp:include
								page="/view/web-simple/commons/includeListByDocBrief.jsp"></jsp:include>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="commons/footServer.jsp"></jsp:include>
	<jsp:include page="commons/foot.jsp"></jsp:include>
</body>
</html>