<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>受控异常-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="noindex,nofllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<%
	System.out.println("errorUrl:" + request.getAttribute("URL"));
%>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top " role="navigation" style="margin: 0px;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="color: #ffffff; font-weight: bold; padding: 5px;cursor: default;">
					<img src="<PF:basePath/>actionImg/Publogo.do" height="40" alt="WCP" align="middle" />
					<PF:ParameterValue key="config.sys.title" />
				</a>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox" style="background-color: #fff;">
		<div class="container ">
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default userbox"
						style="margin: auto; width: 300px; margin-top: 100px; margin-bottom: 100px; background-color: #fcfcfc;">
						<div class="panel-body">
							<div class="text-center">
								<img src="<PF:basePath/>actionImg/PubHomelogo.do" alt="wcp"
									style="margin: 20px; max-width: 128px;" />
							</div>
							<div class="text-center" id="errorMessageId"
								style="background-color: #f2dede; border: solid 1px #ccc; color: #666; margin: -4px; padding: 4px; padding-top: 20px; padding-bottom: 20px;">${MESSAGE}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/foot.jsp"></jsp:include><script
		type="text/javascript">
		$(function() {
			//查询
			$('#queryErrorId').bind('click', function() {
				luceneSearch($("#errorMessageId").text());
			});
		});
	</script>
</body>
</html>
