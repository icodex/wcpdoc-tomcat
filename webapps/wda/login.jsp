<%@page import="com.farm.wda.util.Md5Utils"%>
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
<script type="text/javascript" src="js/jquery11.3.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
</head>
<%
	WdaAppInter wad = Beanfactory.getWdaAppImpl();
%>
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
	String password = request.getParameter("password");
	String message = "";
	if (password != null && !password.isEmpty()) {
		String passkey = AppConfig.getString("config.wda.password");
		if (password.toUpperCase().equals(Md5Utils.MD5(passkey + "FARM").toUpperCase())) {
			session.setAttribute("admin", true);
		} else {
			message = "密码错误";
		}
	}
	//登录成功就跳转到管理页面
	Object loginkey = session.getAttribute("admin");
	if (loginkey != null && (Boolean) loginkey) {
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "index.jsp";
		response.setHeader("Location", newLocn);
	}
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
					<div class="panel-heading">管理员登陆</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<form method="post" action="login.jsp" id="loginFormId">
									<div class="form-group">
										<label for="exampleInputEmail1">管理密码</label> <input
											name="password" type="password" class="form-control"
											id="exampleInputEmail1" placeholder="请输入管理员密码">
									</div>
									<div style="text-align: center;">
										<span class="label label-danger"><%=message%></span><br /> <br />
										<button id="submitButtonId" type="button"
											class="btn btn-primary">管理员登陆</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#submitButtonId").bind(
				"click",
				function() {
					$('#exampleInputEmail1').val(
							hex_md5($('#exampleInputEmail1').val() + "FARM"));
					submitForm();
				});
	});
	function submitForm() {
		$('#loginFormId').submit();
	}
</script>
</html>