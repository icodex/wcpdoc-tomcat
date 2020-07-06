<%@page import="com.farm.parameter.service.impl.ConstantVarService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.farm.parameter.FarmParameterService"%>
<%@page import="com.farm.doc.domain.ex.TypeBrief"%>
<%@page import="com.farm.util.spring.BeanFactory"%>
<%@page import="com.farm.doc.server.FarmDocTypeInter"%>
<%@page import="com.farm.doc.domain.FarmDoctype"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%> 
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/"; 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title><PF:ParameterValue key="config.sys.title" /></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="text/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="text/lib/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">
<script type="text/javascript" src="text/javascript/jquery-1.8.0.min.js"></script>
<script src="text/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="text/lib/bootstrap/respond.min.js"></script>
<style>
.wcp-hometypes a {
	font-size: 10px;
	margin-left: 4px;
}
</style>
</head>
<body style="background-color: #000000;">
	<div class="containerbox ">
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div
						style="color: #ffffff; text-align: center; margin: auto; margin-top: 200px;">
						<div>
							<img style="max-width: 64px; max-height: 64px;"
								src="view/web-simple/atext/png/icon" alt="..."
								class="img-rounded">
						</div>
						<div>
							<h1>
								<PF:ParameterValue key="config.sys.title" />
							</h1>
							<div
								style="border-bottom: 1px dashed #cccccc; padding-bottom: 30px;">

							</div>
							<h3 style="color: #cccccc; font-size: 14px; padding-top: 20px;">
								<PF:ParameterValue key="config.sys.foot" />
								-V
								<PF:ParameterValue key="config.sys.version" />
								<br /><br /><a style="color: #ffffff;text-decoration: underline;" href="http://www.wcpdoc.com" target="blank_">免费版</a>
								<br /> <br /> <a style="color: #ffffff;"
									href="<DOC:defaultIndexPage/>" title="立即加载"><span
									id="waitTime"></span>加载首页....</a> <br /> <br />
							</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 wcp-hometypes">
							<%
								FarmDocTypeInter aloneIMP = (FarmDocTypeInter) BeanFactory.getBean("farmDocTypeManagerImpl");
								List<TypeBrief> types = aloneIMP.getTypeInfos(null, "NONE");
								for (TypeBrief type : types) {
							%>
							<a href="webtype/view<%=type.getId()%>/Pub1.html"><%=type.getName()%></a>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script language="javascript" type="text/javascript">
	var waitTime = 0;
	$(function() {
		if (waitTime == 0) {
			gotoHomePage();
		} else {
			$('#waitTime').text(waitTime + "秒后 ");
			waitTime = waitTime - 1;
			setInterval("redirect()", 1000);
		}
	});
	function redirect() {
		if (waitTime >= 0) {
			$('#waitTime').text(waitTime + "秒后 ");
		}
		if (waitTime < 0) {
			gotoHomePage();
		}
		waitTime--;
	}
	function gotoHomePage() {
		location.href = '<DOC:defaultIndexPage/>';
	}
</script>
</html>