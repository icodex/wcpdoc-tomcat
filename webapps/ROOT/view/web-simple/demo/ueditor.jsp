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
<script type="text/javascript" charset="utf-8"
	src="text/lib/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="text/lib/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8"
	src="text/lib/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8"
	src="text/lib/ueditor/lang/en/en.js"></script>
<link rel="stylesheet" href="text/lib/ueditor/themes/default/css/ueditor.css"
	type="text/css">
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
							<div>
								<h1>完整demo</h1>
								<script id="editor" type="text/plain"
									style="width: 100%; height: 200px;">測試</script>
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
		var ue = UE.getEditor('editor');
	});
</script>
</html>