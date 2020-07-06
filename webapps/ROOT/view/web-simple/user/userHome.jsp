<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>${username}-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="noindex,nofllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8"
	src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row column_box">
				<div class="col-md-2 hidden-xs hidden-sm clear-both">
					<p style="margin-top: 26px;">
						<jsp:include page="../operation/includeUserOperate.jsp"></jsp:include>
					</p>
				</div>
				<div class="col-md-10 clear-both">
					<div class="column_box hidden-xs hidden-sm">
						<jsp:include page="../statis/commons/includeMyStatis.jsp"></jsp:include>
					</div>
					<div class=" panel panel-default "
						style="background-color: #FCFCFA;">
						<div class="panel-body table-responsive">
							<c:if test="${type=='know'}">
								<ol class="breadcrumb">
									<li>${user.getName()}</li>
									<li><strong>文档知识</strong></li>
								</ol>
								<jsp:include page="commons/includeUserKnows.jsp"></jsp:include>
							</c:if>
							<c:if test="${type=='file'}">
								<ol class="breadcrumb">
									<li>${user.getName()}</li>
									<li><strong>资源知识</strong></li>
								</ol>
								<jsp:include page="commons/includeUserKnows.jsp"></jsp:include>
							</c:if>
							<c:if test="${type=='enjoy'}">
								<ol class="breadcrumb">
									<li>${user.getName()}</li>
									<li><strong>关注收藏</strong></li>
								</ol> 
								<jsp:include page="commons/includeUserEnjoy.jsp"></jsp:include>
							</c:if>
							<c:if test="${type=='comment'}">
								<ol class="breadcrumb">
									<li>${user.getName()}</li>
									<li><strong>留言板</strong></li>
								</ol>
								<jsp:include page="commons/includeExpertComment.jsp"></jsp:include>
							</c:if>
							<c:if test="${type=='usermessage'}">
								<ol class="breadcrumb">
									<li>${user.getName()}</li>
									<li><strong>我的消息</strong></li>
								</ol>
								<jsp:include page="commons/includeUserMessage.jsp"></jsp:include>
							</c:if>
							<c:if test="${type=='sharelink'}">
								<ol class="breadcrumb">
									<li>${user.getName()}</li>
									<li><strong>链接分享</strong></li>
								</ol>
								<jsp:include page="commons/includeUserShareLink.jsp"></jsp:include>
							</c:if>
							<c:if test="${type=='usercomment'}">
								<ol class="breadcrumb">
									<li>${user.getName()}</li>
									<li><strong>知识评论</strong></li>
								</ol>
								<jsp:include page="commons/includeUserComment.jsp"></jsp:include>
							</c:if>
						</div>
						<div class="list-group hidden-md hidden-lg">
							<a href="login/webPage.html"
								class="list-group-item active text-center">返回用户菜单</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function knowBoxGoPage(page) {
		window.location = basePath
				+ "webuser/PubHome.do?userid=${id}&query.currentPage=" + page;
	}
</script>
</html>