<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>编辑知识摘要- <PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="noindex,nofllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<link rel="stylesheet"
	href="<PF:basePath/>text/lib/kindeditor/themes/default/default.css" />
<link rel="stylesheet"
	href="<PF:basePath/>view/web-simple/atext/style/web-forms.css" />
<script charset="utf-8"
	src="<PF:basePath/>text/lib/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/zh-CN.js"></script>
<link rel="stylesheet"
	href="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-kindeditor.css" />
<script charset="utf-8"
	src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
<style>
.doc_relation_tag {
	background-color: #eeeeee;
}
</style>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container">
			<div class="row column_box ">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li class="active">知识</li>
								<li class="active">编辑知识摘要</li>
							</ol>
						</div>
					</div>
					<form role="form" action="webdoc/submitDocdescribe.do"
						id="knowSubmitFormId" class="wcp_noEnterSubmit" method="post">
						<input type="hidden" name="docid" value="${doce.doc.id}" />
						<div class="row">
							<div class="col-md-12">
								<span
									style="color: #008000; font-size: 12px; font-weight: lighter;">
									作者: <span
									style="color: #D9534F; font-size: 14px; font-weight: bold;">${doce.doc.author}</span>
									于 <PF:FormatTime date="${doce.doc.pubtime}"
										yyyyMMddHHmmss="yyyy年MM月dd日" /> 发布
								</span>
								<h1>
									<a href="webdoc/view/Pub${doce.doc.id}.html">
										${doce.doc.title}</a> <small> [编辑: <c:if
											test="${doce.doc.writepop==1}">
									公开
									</c:if> <c:if test="${doce.doc.writepop==0}">
									私有
									</c:if> <c:if test="${doce.doc.writepop==2}">
									小组
									</c:if> ][读: <c:if test="${doce.doc.readpop==1}">
									公开
									</c:if> <c:if test="${doce.doc.readpop==0}">
									私有
									</c:if> <c:if test="${doce.doc.readpop==2}">
									小组
									</c:if> ]
									</small>
								</h1>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 ">
								<div class="panel panel-default">
									<div class="panel-heading">
										<label>知识摘要</label>&nbsp;<span class="alertMsgClass">*</span>
									</div>
									<div class="panel-body">
										<div>
											<textarea id="docdescribeId" name="docdescribe"
												class="form-control" rows="3">${doce.doc.docdescribe}</textarea>
										</div>
										<div class="row column_box">
											<div class="col-md-12" style="text-align: center;">
												<button type="button" id="knowSubmitButtonId"
													class="btn btn-info btn-lg">提交</button>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<span class="alertMsgClass" id="errormessageShowboxId"></span>
											</div>
										</div> 
									</div>
								</div>
							</div>
						</div>
						<div class="row column_box">
							<div class="col-md-12"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		//绑定一个表单的验证事件
		validateInput('docdescribeId', function(id, val, obj) {
			if (valid_isNull(val)) {
				return {
					valid : false, 
					msg : '不能为空'
				};
			}
			if (valid_maxLength(val, 512)) {
				return {
					valid : false,
					msg : '长度不能大于' + 512
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
		$('#knowSubmitButtonId').bind('click', function() {
			if (!validate('knowSubmitFormId')) {
				$('#errormessageShowboxId').text('请录入知识摘要！');
			} else {
				//加载自定义分类属性到当前表单中
				$('#errormessageShowboxId').text(''); 
				if (confirm("是否提交数据?")) {
					$('#knowSubmitFormId').submit();
					$('#knowSubmitButtonId').addClass("disabled");
					$('#knowSubmitButtonId').text("提交中...");
				}
			}
		});
	});
</script>
</html>