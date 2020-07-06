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
<title>检索-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../text/include-web.jsp"></jsp:include>
</head>
<body>
	<div class="page-group">
		<div class="page page-current" id='routers-home'>
			<jsp:include page="../commons/head.jsp"></jsp:include>
			<jsp:include page="../commons/nav.jsp">
				<jsp:param name="currentIcon" value="0" />
			</jsp:include>
			<div class="content infinite-scroll">
				<!-- 查询框 -->
				<jsp:include page="../commons/searchBox.jsp"></jsp:include>
				<!-- 知识列表 -->
				<jsp:include page="../commons/searchList.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../text/include-webFoot.jsp"></jsp:include>
	<script type='text/javascript' src='view/web-mobile/text/js/docView.js'
		charset='utf-8'></script>
	<script>
		$(function() {
			$.init();
		});
		var loading = false;
		var currentPage = 1;
		var endPage = '${result.endPage}';
		$(document).on('infinite', '.infinite-scroll', function() {
			if (!loading) {
				loading = true;
				//加载页面
				currentPage++;
				// + currentPage + '.do'
				var word = '${word}';
				$.post('websearch/PubajaxDo.do', {
					'pagenum' : currentPage,
					'word' : word
				}, function(flag) {
					var haveDoc = false;
					$(flag.result.resultList).each(function(i, obj) {
						haveDoc = true;
						appendSearchCard(obj);
					});
					if (!haveDoc) {
						$('.infinite-scroll-preloader').remove();
						//如果没有记录就始终保持true
						loading = true;
					} else {
						loading = false;
					}
				}, 'json');
			}
		});
	</script>
</body>
</html>