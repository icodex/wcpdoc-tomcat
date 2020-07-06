<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>向用户推送${typetitle}-
	<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords" content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author" content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="noindex,nofllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8" src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
<style>
<!--
.userPhotoUnit {
	height: 98px;
	overflow: hidden;
	text-align: center;
	width: 140px;
	float: left;
	margin: 16px;
	cursor: pointer;
}

.side_unit_ORG_info {
	font-size: 10px;
	color: #ccc;
}

.nochoose-title {
	width: 70%;
	border: 1px dotted #ccc;
	padding: 20px;
	color: #888;
	background-color: #f4f4f4;
	font-size: 14px;
	cursor: pointer;
}

.nochoose-title:HOVER {
	border: 1px dotted #9e9e9e;
}

.nochoose-title:active {
	background-color: #edeaea;
}
-->
</style>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container " style="max-width: 960px;">
			<div class="row">
				<div class="col-sm-12">
					<div class="widget-box shadow-box" style="padding-bottom: 16px; margin-top: 4px;">
						<div class="title">
							<h3 class="text-center">
								<i class="glyphicon glyphicon-envelope"></i>
								通过下面链接地址分享该${typetitle}
							</h3>
						</div>

						<div style="padding: 40px;">
							<form class="form-horizontal" style="padding-top: 20px;">
								<div style="border: 1px dashed #8a6d3b;padding-top: 20px;background-color: #fbf5d8;margin-bottom: 20px;">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label">分享内容:</label>
										<div class="col-sm-6" style="padding: 6px; font-size: 14px;">${title}</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label">分享链接:</label>
										<div class="col-sm-6" style="padding: 6px; font-size: 14px;">
											<PF:basePath />${link}</div>
									</div>
									<c:if test="${sharetype=='sec' }">
										<div class="form-group">
											<label for="inputPassword3" class="col-sm-4 control-label">提取码:</label>
											<div class="col-sm-6" style="padding: 6px; font-size: 14px; color: red;">${secret}</div>
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label">有效期:</label>
									<div class="col-sm-6" style="padding: 6px; font-size: 14px;">
										<c:if test="${isLive}">
											${livedays}/${levelDay}天<span style="color: #d4bd95;">&nbsp;(已分享天数/总分享天数)</span>
									</c:if>
										<c:if test="${!isLive}">
											<span style="color: red;">过期</span>(${levelDay}天) 
									</c:if>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label">开始时间:</label>
									<div class="col-sm-6" style="padding: 6px; font-size: 14px;">
										<PF:FormatTime date="${startTime}" yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label">访问次数:</label>
									<div class="col-sm-6" style="padding: 6px; font-size: 14px;">${visitnum}</div>
								</div> 
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<form action="webusermessage/sendUserDocSubmit.do" method="post" id="currentformId">
		<input value="${id}" id="input_id" name="id" type="hidden" />
		<input id="input_orgids" name="orgids" type="hidden" />
		<input id="input_userids" name="userids" type="hidden" />
		<input value="${type}" id="typeid" name="type" type="hidden" />
	</form>
</body>
<script type="text/javascript">
	$(function() {
		$('#shareLinkButtonId').bind('click', function() {
			window.history.go(-1);
		});
	});
</script>
</html>