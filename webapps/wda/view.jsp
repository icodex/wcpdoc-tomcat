<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.farm.wda.util.ConfUtils"%>
<%@page import="com.farm.wda.inter.WdaAppInter"%>
<%@page import="com.farm.wda.util.AppConfig"%>
<%@page import="java.io.File"%>
<%@page import="com.farm.wda.Beanfactory"%>
<%@ page language="java" pageEncoding="utf-8"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=AppConfig.getString("config.web.title")%></title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
<!--
.panel-body img {
	margin: 15px;
	width: 64px;
	height: 64px;
}

body {
	color: #999;
}

.panel-heading {
	color: #999;
}
-->
</style>
</head>
<body style="background-color: #8a8a8a;">
	<jsp:include page="/commons/head.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading text-center" style="color: #888;">${txtinfo}</div>
					<div class="panel-body">
						<!-- ----各种文件预览图标生成--开始--------------------------------------------------------------------- -->
						<div style="text-align: center; color: #f15a24;margin-top: 20px;">
							<c:forEach var="link" items="${fileLinks}">
										${link}
							</c:forEach>
						</div>
						<!--  -->
						<c:if test="${isHaveFile&&isLoged}">
							<div style="text-align: center; color: #f15a24;">点击图标预览文件</div>
						</c:if>
						<!--  -->
						<c:if test="${!isHaveFile&&isLoged}">
							<div style="text-align: center; color: #f15a24;">
								<img alt="Brand" src="img/type.png">
							</div>
						</c:if>
						<!-- ----各种文件预览图标生成--结束--------------------------------------------------------------------- -->
						<c:if test="${!isError}">
							<c:if test="${!isHaveFile&&isLoged}">
								<center>文件正在处理中，请稍后...</center>
								<div class="progress">
									<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
								</div>
							</c:if>
						</c:if>
						<hr />
						${txt}
						<c:if test="${isLoged}">
							<a href="${logURL}">日志文件</a>
							<c:if test="${isadmin}">
								<a href="clearDir.jsp?key=${key}" title="用于重新构建预览">清空</a>
							</c:if>
						</c:if>
					</div>
					<hr />
					<div class="panel-heading">
						<c:if test="${isLoged&&isError}">
							<div style="text-align: left; color: #f15a24;">${LogText}</div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	<script src="js/jquery11.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<c:if test="${isOnlyOne&&!isadmin}">
		<script type="text/javascript">
			window.location = "${curentUrl}";
		</script>
	</c:if>
	<c:if test="${!isHaveFile&&!isError}">
		<script type="text/javascript">
			window.setTimeout(function() {
				location.reload();
			}, 3000);
		</script>
	</c:if>
</body>
</html>