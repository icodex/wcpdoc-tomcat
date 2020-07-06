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
		<div class="page page-current" id='routers-type-list'>
			<jsp:include page="../commons/head.jsp">
				<jsp:param name="showback" value="false" />
			</jsp:include>
			<jsp:include page="../commons/nav.jsp">
				<jsp:param name="currentIcon" value="2" />
			</jsp:include>
			<div class="content infinite-scroll">
				<!-- 当前知识分类 -->
				<jsp:include page="../commons/currentType.jsp">
					<jsp:param name="type" value="1" />
				</jsp:include>
				<!-- 知识列表 -->
				<jsp:include page="../commons/docList.jsp"></jsp:include>
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
	var endPage = ${docs.endPage};
	$(document).on(
			'infinite',
			'.infinite-scroll',
			function() {
				if (!loading) {
					loading = true;
					//加载页面
					currentPage++;
					$.post('webtype/ajaxview${typeid}/Pub' + currentPage
							+ '.do', {}, function(flag) {
						var haveDoc=false;
						$(flag.docbriefs).each(function(i,obj){
							haveDoc=true;
							appendDocCard(obj);							
						});
						if(!haveDoc){
							$('.infinite-scroll-preloader').remove();
							//如果没有记录就始终保持true
							loading = true;
						}else{
							loading = false;
						}
					}, 'json');
				}
			});
</script>
</html>