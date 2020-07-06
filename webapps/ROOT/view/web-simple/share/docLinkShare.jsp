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
								分享该${typetitle}链接
							</h3>
						</div>
						<div class="stream-list p-stream" style="padding: 8px;">
							<div class="media">
								<c:if test="${type=='know' }"><jsp:include page="../user/commons/IncludeSendMessageKnow.jsp"></jsp:include></c:if>
								<c:if test="${type=='fqa' }"><jsp:include page="../user/commons/IncludeSendMessageFqa.jsp"></jsp:include>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="widget-box shadow-box" style="padding: 20px; padding-top: 34px;">
						<form class="form-horizontal" style="margin: auto; max-width: 400px;">
							<div style="color: #f5bcbc;">注意：含有图谱和站内附件的知识在访问时无法正常展示！</div>
							<div class="radio">
								<label>
									<input type="radio" name="typeRadios" id="optionsRadios1" value="sec" checked>
									<b>加密</b>
									&nbsp;&nbsp;&nbsp;&nbsp;输入提取码才能查看/下载
								</label>
							</div>
							<div class="radio">
								<label>
									<input type="radio" name="typeRadios" id="optionsRadios2" value="pub">
									<b>公开</b>
									&nbsp;&nbsp;&nbsp;&nbsp;任何人访问链接即可查看/下载
								</label>
							</div>
							<hr style="margin-top: 20px; margin-bottom: 20px;" />
							<div class="radio">
								<label>
									<input type="radio" name="liveRadios" id="optionsRadios3" value="level3">
									<b>有效期${level3Day}天</b>
								</label>
							</div>
							<div class="radio">
								<label>
									<input type="radio" name="liveRadios" id="optionsRadios4" value="level2">
									<b>有效期${level2Day}天</b>
								</label>
							</div>
							<div class="radio">
								<label>
									<input type="radio" name="liveRadios" id="optionsRadios5" value="level1" checked>
									<b>有效期${level1Day}天</b>
								</label>
							</div>
						</form>
					</div>
					<div class="widget-box shadow-box" style="border-top: 1px; margin-top: 0px; margin-bottom: 50px; padding: 12px; text-align: center; background-color: #fff;">
						<button type="button" class="btn btn-info " id="shareLinkButtonId">
							<i class="glyphicon glyphicon-link"></i>
							&nbsp;创建链接&nbsp;&nbsp;&nbsp;
						</button>
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
		$('#shareLinkButtonId').bind(
				'click',
				function() {
					//获得分享类型和分享时效
					var liveVal = $("input[name='liveRadios']:checked").val();
					var typeVal = $("input[name='typeRadios']:checked").val();
					//alert("分享类型" + typeVal);
					//alert("分享时效" + liveVal);
					var url = "webshare/creatlink.do?";
					url = url + "id=${id}&type=${type}&sharetype=" + typeVal
							+ "&livetype=" + liveVal;
					//alert(basePath+url);
					window.location = basePath + url;
				});
	});
</script>
</html>