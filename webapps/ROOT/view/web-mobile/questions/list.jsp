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
<title>知识-<PF:ParameterValue key="config.sys.title" /></title>
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
		<div class="page page-current" id='routers-question-list'>
			<jsp:include page="../commons/head.jsp">
				<jsp:param name="showback" value="false" />
			</jsp:include>
			<jsp:include page="../commons/nav.jsp">
				<jsp:param name="currentIcon" value="3" />
			</jsp:include>
			<div class="content infinite-scroll">
				<div class="buttons-tab">
					<a href="#tab1" class="tab-link active button">全部问答</a> <a
						href="#tab2" class="tab-link button">待回答问题</a>
				</div>
				<div class="tabs">
					<div id="tab1" class="tab active">
						<!-- 当前知识分类 -->
						<jsp:include page="../commons/currentType.jsp">
							<jsp:param name="type" value="2" />
						</jsp:include>
						<!-- 问答列表 -->
						<jsp:include page="../commons/questionList.jsp"></jsp:include>
					</div>
					<div id="tab2" class="tab">
						<div>
							<!-- 等待回答的问题列表 -->
							<jsp:include page="../commons/waitQuestion.jsp"></jsp:include>
						</div>
					</div>
				</div>
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
	</script>
</body>
<script type="text/javascript">
	var loading = false;
	var currentPage = 1;
	var endPage = '${docs.endPage}';
	$(document).on(
			'infinite',
			'.infinite-scroll',
			function() {
				if (!loading) {
					loading = true;
					//加载页面
					currentPage++;
					$.post('webquest/ajaxview${typeid}/Pub' + currentPage
							+ '.do', {}, function(flag) {
						var haveDoc = false;
						$(flag.docs.resultList).each(function(i, obj) {
							haveDoc = true;
							appendQuestionCard(obj);
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
</html>