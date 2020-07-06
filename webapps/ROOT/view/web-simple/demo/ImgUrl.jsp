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
	<!-- /.carousel -->
	<div class="containerbox">
		<div class="container" style="margin-top: 50px;">
			<div style="margin-top: 8px;"></div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">测试面板</div>
						<div class="panel-body">
							<img
								src="http://localhost:8080/wcp/actionImg/Publoadimg.do?id=402889ac5ce80dea015ce813dc660001&type=rotate90" />
							<img
								src="http://localhost:8080/wcp/actionImg/Publoadimg.do?id=402889ac5ce80dea015ce813dc660001&type=min" />
							<img
								src="http://localhost:8080/wcp/actionImg/Publoadimg.do?id=402889ac5ce80dea015ce813dc660001&type=med" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>