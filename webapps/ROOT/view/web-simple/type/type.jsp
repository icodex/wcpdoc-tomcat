<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
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
<link href="view/web-style/text/wcp-photoImgs.css" rel="stylesheet"> 
<script type="text/javascript" src="text/javascript/wcpTypes.js"></script>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row">
				<div class="col-sm-12" style="margin-top: 26px;">
					<jsp:include page="commons/includePubCurrentType.jsp"></jsp:include><c:set
						scope="request" var="OPTYPE" value="KNOW"></c:set>
					<!--列表操作按钮（网格/列表/排序条件等） -->
					<jsp:include page="commons/includeTypeListOp.jsp">
						<jsp:param value="${showType}" name="showType" />
					</jsp:include>
				</div> 
			</div>
			<div class="row">
				<div class="col-sm-3  hidden-xs clear-both">
					<jsp:include page="commons/includePubType.jsp"></jsp:include>
				</div>
				<div class="col-sm-9  clear-both">
					<div style="margin-top: 8px;"></div>
					<div class="panel panel-default block-info-box">
						<div class="panel-body">
							<c:if test="${!empty docs.resultList}">
								<jsp:include page="commons/includePubTypeByBox.jsp"></jsp:include>
								<!-- 结果集合 -->
								<jsp:include page="commons/includeTypeDocs.jsp"></jsp:include>
							</c:if>
							<c:if test="${empty docs.resultList}">
								<div
									style="margin: 20px; margin-top: 20px; margin-bottom: 10px;">
									<div class="alert alert-warning">未发现知识，请创建知识!</div>
								</div>
							</c:if>
							<jsp:include page="commons/includeTypeAuthInfo.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
</html>