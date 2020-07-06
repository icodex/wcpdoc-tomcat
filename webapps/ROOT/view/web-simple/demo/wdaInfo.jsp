<%@page import="java.rmi.Naming"%>
<%@page import="com.farm.wda.inter.WdaAppInter"%>
<%@page import="com.farm.wda.tag.server.impl.WdaRmiServer"%>
<%@page import="java.util.Set"%>
<%@page import="com.farm.wda.inter.domain.ConvertTypes"%>
<%@page import="com.farm.parameter.FarmParameterService"%>
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
<title>测试环境-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
</head>
<body>
	<%
		Exception e = null;
		try {
			WdaAppInter personService = (WdaAppInter) Naming
					.lookup(FarmParameterService.getInstance().getParameter("config.wda.rmi.url"));
			personService.getSupportTypes();
		} catch (Exception e1) {
			e = e1;
		}
	%>
	<!-- /.carousel -->
	<div class="containerbox">
		<div class="container" style="margin-top: 50px;">
			<div style="margin-top: 58px;"></div>
			<div class="row">
				<div class="col-md-12">
					<center>
						<h1>WDA接口状态调试信息</h1>
					</center>
					<br />
					<table class="table table-hover">
						<tr>
							<td class="active" style="width: 50%;">WDA预览功能启用状态</td>
							<td class="success" style="width: 50%;">config.fileview.state=<%=FarmParameterService.getInstance().getParameter("config.fileview.state").equals("true")%></td>
						</tr>
						<tr>
							<td class="active" style="width: 50%;">预览实现类型</td>
							<td class="success" style="width: 50%;">config.fileview.type=<%=FarmParameterService.getInstance().getParameter("config.fileview.type")%></td>
						</tr>
						<tr>
							<td class="active">远程RMI接口地址：</td>
							<td class="success"><%=FarmParameterService.getInstance().getParameter("config.wda.rmi.url")%></td>
						</tr>
						<tr>
							<td class="active">远程RMI接口调用状态：</td>
							<td class="success"><%=(e == null ? ("正常") : (e.getClass()))%></td>
						</tr>
						<%
							if (e != null) {
						%>
						<tr>
							<td class="active">远程RMI接口异常消息:</td>
							<td class="success"><%=(e == null ? ("正常") : (e.getMessage()))%></td>
						</tr>
						<tr>
							<td class="active">远程RMI接口异常原因:</td>
							<td class="success"><%=(e == null ? ("正常") : (e.getCause()))%></td>
						</tr>
						<%
							}
						%>
						<tr>
							<td class="active">WDA信息页面地址</td>
							<td class="success"><a target="_blank" href="/wda">立即访问</a></td>
						</tr>
					</table>
				</div>
			</div>
			<div style="margin-top: 288px;"></div>
		</div>
	</div>
</body>
</html>