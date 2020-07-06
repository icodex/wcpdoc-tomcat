<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- includeTextEditorKindEdit.jsp, includeTextEditorUeditor.jsp-->
<script type="text/javascript" charset="utf-8"
	src="text/lib/syntax-highlighter/shCore.js"></script>
<link rel="stylesheet"
	href="text/lib/syntax-highlighter/shCoreDefault.css" type="text/css">
<script type="text/javascript">
	$(function() {
		SyntaxHighlighter.defaults['html-script'] = false; //是否开启html的混合形式 默认为false 为关闭  
		SyntaxHighlighter.all();
	});
</script>