<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>向用户推送${typetitle}-<PF:ParameterValue
		key="config.sys.title" /></title>
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
					<div class="widget-box shadow-box"
						style="padding-bottom: 16px; margin-top: 4px;">
						<div class="title">
							<h3 class="text-center">
								<i class="glyphicon glyphicon-envelope"></i> 推送该${typetitle}
							</h3>
						</div>
						<div class="stream-list p-stream" style="padding: 8px;">
							<div class="media">
								<c:if test="${type=='know' }"><jsp:include
										page="commons/IncludeSendMessageKnow.jsp"></jsp:include></c:if>
								<c:if test="${type=='fqa' }"><jsp:include
										page="commons/IncludeSendMessageFqa.jsp"></jsp:include>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="widget-box shadow-box"
						style="padding-bottom: 16px; margin-top: 4px;">
						<jsp:include page="commons/includeChooseSenderBox.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<form action="webusermessage/sendUserDocSubmit.do" method="post"
		id="currentformId">
		<input value="${id}" id="input_id" name="id" type="hidden" /> <input
			id="input_orgids" name="orgids" type="hidden" /> <input
			id="input_userids" name="userids" type="hidden" /> <input
			value="${type}" id="typeid" name="type" type="hidden" />
	</form>
</body>
<script type="text/javascript">
	//在弹出框中选择完用户和机构后的回显方法
	function chooseUserAndOrgsHandle() {
		//获得人员ids和组织机构ids
		//获得人员数量和组织机构数量
		var orgs, users, orgNum = 0, userNum = 0;
		$(choosOrgs).each(function(i, obj) {
				var id = obj.id;
				orgs = (!orgs ? id : (orgs + ','+ id));
				orgNum++;
		});
		$(choosUsers).each(function(i, obj) {
				var id = obj.id;
				users = (!users ? id : (users + ',' + id));
				userNum++;
		});
		if (!orgs) {
			orgs = "";
		}
		if (!users) {
			users = "";
		}
		if (userNum + orgNum <= 0) {
			alert('请选择接收人员!');
			return;
		}
		if (confirm('选中' + userNum + '人' + orgNum + '机构,是否立即发送？')) {
			$('#input_orgids').val(orgs);
			$('#input_userids').val(users);
			$('#sendMessageButtonId').addClass("disabled");
			$('#sendMessageButtonId').text("提交中...");
			$('#currentformId').submit();
		}
	}
</script>
</html>