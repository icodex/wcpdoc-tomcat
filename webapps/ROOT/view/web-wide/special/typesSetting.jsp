<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>私有分类设置- <PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../text/include-web.jsp"></jsp:include>
<script type="text/javascript" src="text/javascript/wcpTypes.js"></script>
</head>
<body>
	<jsp:include page="../../web-simple/commons/head.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/superContent.jsp"></jsp:include>
	<div class="containerbox wcp-zebra-3">
		<div class="container ">
			<div class="row">
				<div class="col-sm-12" style="height: 50px; padding-top: 20px;">
					<span class="glyphicon glyphicon-fire column_title"> <a
						style="color: #d9534f"
						href="webspecial/editDoclist.do?specialid=${special.id}">${special.title}/私有分类设置</a>:
					</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<jsp:include page="commons/includeSettingType.jsp"></jsp:include>
					<c:if test="${MESSAGE!=null}">
						<div class="alert alert-danger" style="margin-bottom: 0px;">
							<p class="bg-warning">${MESSAGE}</p>
						</div>
					</c:if>
					<div style="margin-top: 20px;">
						<a class="btn btn-default"
							href="webspecial/editDoclist.do?specialid=${special.id}"> 返回
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../web-simple/commons/footServer.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/foot.jsp"></jsp:include>
</body>
</html>