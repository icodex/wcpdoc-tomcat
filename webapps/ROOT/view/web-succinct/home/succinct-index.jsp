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
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<link href="view/web-succinct/atext/web-succinct.css" rel="stylesheet">
<link href="view/web-style/text/wcp-photoImgs.css" rel="stylesheet">
<style type="text/css">
.wcp-photo-box {
	margin-bottom: 20px;
	margin-top: 0px;
}

.wcp-photo-box a {
	color: #4d5356;
}

.wcp-photo-box a:HOVER {
	color: #D9534F;
}
</style>
</head>
<body>
	<jsp:include page="/view/web-simple/commons/head.jsp"></jsp:include>
	<jsp:include page="/view/web-simple/commons/superContent.jsp"></jsp:include>
	<!-- 置顶大图 -->
	<div style="background-color: #ffffff; padding-bottom: 40px;">
		<div class="container">
			<div class="row">
				<div class="col-xs-12" style="text-align: center;padding: 20px;padding-top: 40px;">
					<img style="text-align: center;max-height: 48px;" 
						src="<PF:basePath/>/actionImg/PubHomelogo.do">
				</div>
			</div>
			<div class="row">
				<div class="col-xs-3"></div>
				<div class="col-xs-6"><jsp:include
						page="/view/web-simple/lucene/commons/includeSearchForm.jsp"></jsp:include></div>
			</div>
		</div>
	</div>
	<div class="containerbox">
		<div class="container">
			<div class="row">
				<div class="col-xs-3">
					<!-- 用户消息 -->
					<jsp:include page="commons/includeMessageBox.jsp"></jsp:include>
					<!-- 热门知识 -->
					<jsp:include page="commons/includeHotKnowsMin.jsp"></jsp:include>
					<!-- 最新评论 -->
					<jsp:include page="commons/includeNewPubDocMessages.jsp"></jsp:include>
				</div>
				<div class="col-xs-9" style="padding-left: 5px;">
					<!-- 推荐阅读 -->
					<jsp:include page="commons/includeTopKnows.jsp"></jsp:include>
					<!-- 知識分類 -->
					<jsp:include page="commons/includePubType.jsp"></jsp:include>
					<!-- 最新知識 -->
					<c:if test="${!empty docbriefs}">
						<div class="wcp-su-out-box">
							<div class="unit">
								<div class="title">
									<i class="glyphicon glyphicon-star"></i> 最新知识 <a
										class="more-link" style="color: #D9534F;"
										href="webtype/view/Pub1.html">更多 &gt; </a>
								</div>
							</div>
							<jsp:include
								page="/view/web-simple/commons/includeListByDocBrief.jsp"></jsp:include>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/view/web-simple/commons/footServer.jsp"></jsp:include>
	<jsp:include page="/view/web-simple/commons/foot.jsp"></jsp:include>
</body>
</html>