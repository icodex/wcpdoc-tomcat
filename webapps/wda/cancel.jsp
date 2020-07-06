<%@page import="java.util.Map"%>
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
<style>
<!--
td {
	max-width: 200px;
	font-size: 12px;
	word-wrap: break-word;
}

.mini {
	max-width: 200px;
	font-size: 8px;
	word-wrap: break-word;
}
-->
</style>
<%
	session.setAttribute("admin", null);
%>
<body style="background-color: #8a8a8a;">
	<jsp:include page="/commons/head.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body text-center">
						<img alt="type" style="margin: auto;" class="img-responsive"
							src="img/type.png">
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading"></div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<table class="table table-bordered">
									<tr>
										<th colspan="8" align="center" style="text-align: center;">已经成功退出</th>
									</tr>
									<tr>
										<th colspan="8" align="center" style="text-align: center;"><a
											href="login.jsp" class="btn btn-primary">登录</a></th>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>