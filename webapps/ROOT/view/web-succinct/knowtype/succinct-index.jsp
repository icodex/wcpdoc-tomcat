<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title><c:if test="${type!=null}">${type.name}</c:if><c:if
		test="${type==null}">分类</c:if>- <PF:ParameterValue
		key="config.sys.title" /></title>
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
<script type="text/javascript" src="text/javascript/wcpTypes.js"></script>
</head>
<style>
.wcp-knowtype-right-operator {
	float: right;
	margin-top: -3px;
	margin-left: 4px;
}
</style>
<body>
	<jsp:include page="/view/web-simple/commons/head.jsp"></jsp:include>
	<jsp:include page="/view/web-simple/commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row">
				<div class="col-sm-12">
					<div class="unit" style="padding-bottom: 10px;">
						<div class="title"><jsp:include
								page="/view/web-simple/type/commons/includePubCurrentType.jsp"></jsp:include><c:set
								scope="request" var="OPTYPE" value="KNOW"></c:set>
							<!--列表操作按钮（网格/列表/排序条件等） -->
							<jsp:include
								page="/view/web-simple/type/commons/includeTypeListOp.jsp">
								<jsp:param value="${showType}" name="showType" />
							</jsp:include>
						</div>
						<hr style="clear: both; border: 0px;">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-3">
					<jsp:include page="commons/includePubType.jsp"></jsp:include>
				</div>
				<div class="col-xs-9" style="padding-left:5px;">
					<c:if test="${!empty docs.resultList}">
						<!-- 结果集合 -->
						<jsp:include page="commons/includeTypeDocs.jsp"></jsp:include>
					</c:if>
					<c:if test="${empty docs.resultList}">
						<div class="wcp-su-out-box">
							<div class="unit">
								<div class="alert alert-warning">未发现知识，请创建知识!</div>
							</div>
						</div>
					</c:if>
					<DOC:isTypeManager typeId="${typeid}">
						<div class="wcp-su-out-box">
							<div class="unit">
								<jsp:include
									page="/view/web-simple/type/commons/includeTypeAuthInfo.jsp"></jsp:include>
							</div>
						</div>
					</DOC:isTypeManager>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/view/web-simple/commons/footServer.jsp"></jsp:include>
	<jsp:include page="/view/web-simple/commons/foot.jsp"></jsp:include>
</body>
</html>