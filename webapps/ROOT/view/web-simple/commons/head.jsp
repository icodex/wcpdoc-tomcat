<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!-- class="navbar navbar-default|navbar-inverse" -->
<style>
<!--
.imgMenuIcon {
	width: 16px;
	height: 16px;
	margin-right: 4px;
	margin-left: -2px;
	margin-top: -2px;
}
-->
</style>
<div class="navbar navbar-inverse navbar-fixed-top " role="navigation"
	style="margin: 0px;">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				style="color: #ffffff; font-weight: bold; padding: 5px;"
				href="<DOC:defaultIndexPage/>"> <img
				src="<PF:basePath/>actionImg/Publogo.do" height="40" alt="WCP"
				align="middle" />
			</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<PF:IfParameterEquals key="config.show.home" val="true">
					<li><a href="home/Pubindex.html"><span
							class="glyphicon glyphicon-home"></span> 首页</a></li>
				</PF:IfParameterEquals>
				<li><a href="webtype/view/Pub1.html"><span
						class="glyphicon glyphicon-book"></span> 知识</a></li>
				<PF:IfParameterEquals key="config.about" val="true">
					<li class="hidden-xs hidden-sm hidden-md"><a
						href='<PF:ParameterValue key="config.about.url"/>'><span
							class="glyphicon glyphicon-phone-alt"></span> <PF:ParameterValue
								key="config.about.title" /></a></li>
				</PF:IfParameterEquals>
				<DOC:WebUrls var="node" type="3">
					<li class="hidden-xs hidden-sm hidden-md"><a
						target="${config_sys_link_newwindow_target}" href='${node.URL}'><img
							class="imgMenuIcon img-circle" alt="${node.WEBNAME}"
							src="${node.IMGURL}" />&nbsp;${node.WEBNAME}</a></li>
				</DOC:WebUrls>
				<li class="dropdown hidden-xs"><a class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> <span class="glyphicon glyphicon-th"></span>
						<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<PF:IfParameterEquals key="config.show.glory" val="true">
							<li><a href="webstat/PubHome.html"><span
									class="glyphicon glyphicon-stats"></span> 荣誉</a></li>
						</PF:IfParameterEquals>
						<DOC:WebUrls var="node" type="4">
							<li><a target="${config_sys_link_newwindow_target}"
								href='${node.URL}'><img class="imgMenuIcon img-circle"
									alt="${node.WEBNAME}" src="${node.IMGURL}" />${node.WEBNAME}</a></li>
						</DOC:WebUrls>
					</ul></li>
			</ul>
			<jsp:include page="includeToolmenu.jsp"></jsp:include>
			<jsp:include page="includeHeadSearchBox.jsp"></jsp:include>
		</div>
	</div>
	<!-- /.navbar-collapse -->
</div>
<jsp:include page="/view/web-simple/atext/include-html.jsp"></jsp:include>
<script type="text/javascript">
	function luceneSearch(key) {
		$('#wordId').val(key);
		$('#lucenesearchFormId').submit();
	}
	function luceneSearchGo(page) {
		$('#pageNumId').val(page);
		$('#lucenesearchFormId').submit();
	}
//-->
</script>
<c:if test="${USEROBJ!=null}">
	<script>
		//抓取用戶消息
		var url = "webusermessage/showHomeMessage.do";
		$.post(url, {}, function(obj) {
			if (obj.unReadCount > 0) {
				$('#wcpUserUessageTopId').show();
				$('#wcpUserUessageTopId').attr('title', obj.newMessage);
				$('#wcpUserUessageTopCountId').text(obj.unReadCount);
			} else {
				$('#wcpUserUessageTopId').hide();
			}
		}, "json");
	</script>
</c:if>