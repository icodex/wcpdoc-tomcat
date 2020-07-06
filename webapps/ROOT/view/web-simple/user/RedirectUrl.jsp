<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>注册-<PF:ParameterValue key="config.sys.title" />
</title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="noindex,nofllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8"
	src="<PF:basePath/>/text/lib/super-validate/validate.js"></script>
<script charset="utf-8"
	src="<PF:basePath/>/text/lib/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="text/javascript/md5.js"></script>	
<link rel="stylesheet"
	href="<PF:basePath/>/text/lib/kindeditor/themes/default/default.css" />
</head>
<body style="text-align: center;background-color: white;">
	<c:if test="${weburl.method=='1'}">
		<form id="formId" action="${url}" method="get">
			<c:forEach items="${paras}" var="para">
				<input type="hidden" name="${para.varname}"  id="${para.varname}" value="${para.value}">
			</c:forEach>
		</form>
	</c:if>
	<c:if test="${weburl.method!='1'}">
		<form id="formId" action="${url}" method="post">
			<c:forEach items="${paras}" var="para">
				<input type="hidden" name="${para.varname}" id="${para.varname}"  value="${para.value}">
			</c:forEach>
		</form>
	</c:if>
</body>
<c:forEach items="${paras}" var="para">
<script type="text/javascript"> var ${para.varname}="${para.value}";</script>
</c:forEach>
<script type="text/javascript">
	$(function() {
		try{
			${script}
			$("#formId").submit();
		}catch(e){alert('js错误');}
	});
</script>
</html>