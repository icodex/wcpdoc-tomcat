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
</head>
<body style="background-color: #8a8a8a;">
	<jsp:include page="/commons/head.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-body text-center">
						<!-- 文档的字符串信息 -->
						${txtinfo}
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">文档状态</div>
					<div class="panel-body">
						<table class="table">
							<tr>
								<td style="word-break: break-all;">
								${txt}
								<hr/>
								${LogText }
								</td>
							</tr>
						</table>
					</div>
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
</body>
</html>