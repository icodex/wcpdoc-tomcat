<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>编辑知识预览图-<PF:ParameterValue key="config.sys.title" /></title>
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
<script charset="utf-8"
	src="<PF:basePath/>text/javascript/knowCreatForm.js"></script>
<script type="text/javascript" src="text/javascript/wcpTypes.js"></script>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container">
			<div class="row column_box ">
				<div class="col-md-2  visible-lg visible-md"></div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li class="active">知识</li>
								<li class="active">编辑预览图</li>
							</ol>
						</div>
					</div>
					<form role="form" action="webdoc/editImgCommit.do" id="knowSubmitFormId"
						class="wcp_noEnterSubmit" method="post">
						<input type="hidden" name="docid" value="${doce.doc.id}" />
						<div class="row">
							<div class="col-md-12">
								<span
									style="color: #008000; font-size: 12px; font-weight: lighter;">作者:<span
									style="color: #D9534F; font-size: 14px; font-weight: bold;">${doce.doc.author}</span>于<PF:FormatTime
										date="${doce.doc.pubtime}" yyyyMMddHHmmss="yyyy年MM月dd日" />发布
								</span>
								<h1>
									<a href="webdoc/view/Pub${doce.doc.id}.html">
										${doce.doc.title}</a> <br /> <small>[编辑:<c:if
											test="${doce.doc.writepop==1}">
									公开
									</c:if> <c:if test="${doce.doc.writepop==0}">
									私有
									</c:if> <c:if test="${doce.doc.writepop==2}">
									小组
									</c:if> ][读:<c:if test="${doce.doc.readpop==1}">
									公开
									</c:if> <c:if test="${doce.doc.readpop==0}">
									私有
									</c:if> <c:if test="${doce.doc.readpop==2}">
									小组
									</c:if> ]
									</small> <span class="typetagsearch" title="${doce.type.name}">
										<small>${doce.type.name}</small>
									</span>
								</h1>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<div id="docImgBoxId">
										<div class="text-center"
											style="border: 2px dotted #ccc; width: 360px; min-height: 60px; background-color: white; color: #ccc; padding-top: 20px;">知识预览图</div>
										<img class="img-thumbnail"
											style="max-width: 399px; max-height: 399px; display: none; border: 2px dotted #ccc;">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="exampleInputEmail1">上传预览图 </label>
									<div class="row">
										<div class="col-md-12">
											&nbsp;<input type="button" id="uploadButton"
												class="btn btn-info btn-xs center-block"
												style="padding: 0px; padding-bottom: 8px;" value="上传" /> <input
												type="hidden" id="fileId" name="fileid"
												value="${doce.doc.imgid}">
											<button type="button" id="showImg"
												class="btn btn-info btn-sm" title="预览" data-container="body"
												data-toggle="popover" data-placement="bottom"
												<c:if test="${empty doce.doc.imgid }">
														style="display: none;"
														</c:if>
												data-trigger="focus"
												data-content="<img class='img-thumbnail center-block' style='width:270px;' />">预览</button>
											<button type="button" id="delImg" class="btn btn-info btn-sm"
												title="删除"
												<c:if test="${empty doce.doc.imgid }">
														style="display: none;"
														</c:if>
												onclick="_delImg();">删除</button>
										</div>
									</div>
								</div>
							</div>
							<script type="text/javascript">
								//上传预览图
								KindEditor
										.ready(function(K) {
											var uploadbutton = K
													.uploadbutton({
														button : K('#uploadButton')[0],
														fieldName : 'imgFile',
														url : basePath
																+ 'actionImg/PubFPuploadImg.do',
														afterUpload : function(
																data) {
															if (data.error === 0) {
																$(
																		"#docImgBoxId div")
																		.hide();
																$(
																		"#docImgBoxId img")
																		.attr(
																				"src",
																				'actionImg/Publoadimg.do?id='
																						+ data.id
																						+ '&type=min');
																$(
																		"#docImgBoxId img")
																		.show();
																$("#fileId")
																		.val(
																				data.id);
															} else {
																alert(data.message);
															}
														},
														afterError : function(
																str) {
															alert('自定义错误信息: '
																	+ str);
														}
													});
											uploadbutton.fileBox
													.change(function(e) {
														uploadbutton.submit();
													});
										});
							</script>
						</div>
						<c:if test="${!empty imgs}">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="exampleInputEmail1">选择知识中已有图片 </label>
										<div class="row">
											<c:forEach items="${imgs}" var="node">
												<div class="col-md-2" style="margin-top: 16px;">
													<img class="img-thumbnail docHaveImgClass"
														id="${node.FILEID}"
														style="max-width: 100%; height: 64px; cursor: pointer;"
														src="${node.MINURL}" />
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<div class="row column_box">
							<div class="col-md-12" style="text-align: center;">
								<hr />
								<br/>
								<button type="button" id="knowSubmitButtonId"
									class="btn btn-info btn-lg">提交</button>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<span class="alertMsgClass" id="errormessageShowboxId"></span>
							</div>
						</div>
						<div class="row column_box">
							<div class="col-md-12"></div>
						</div>
					</form>
				</div>
				<div class="col-md-2  visible-lg visible-md"></div>
			</div>
		</div>
	</div>
	<!-- /.modal -->
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	var contentMaxSize = parseInt('<PF:ParameterValue key="config.doc.content.maxsize"/>');
	$(function() {
		if ($("#fileId").val()) {
			$("#docImgBoxId div").hide();
			$("#docImgBoxId img").attr(
					"src",
					'actionImg/Publoadimg.do?id=' + $("#fileId").val()
							+ '&type=min"');
			$("#docImgBoxId img").show();
		}
		$(".docHaveImgClass").bind(
				'click',
				function() {
					$("#docImgBoxId div").hide();
					$("#docImgBoxId img").attr(
							"src",
							'actionImg/Publoadimg.do?id=' + $(this).attr('id')
									+ '&type=min"');
					$("#docImgBoxId img").show();
					$("#fileId").val($(this).attr('id'))
				});
		$('#knowSubmitButtonId').bind('click', function() {
			if (!$("#fileId").val()) {
				$('#errormessageShowboxId').text('请上传预览图片!');
			} else {
				if (confirm("是否提交数据?")) {
					$('#knowSubmitFormId').submit();
					$('#knowSubmitButtonId').addClass("disabled");
					$('#knowSubmitButtonId').text("提交中...");
				}
			}
		});
		//激活弹窗插件
		$("[data-toggle='popover']").popover({
			html : true
		});
		$("#showImg")
				.attr(
						"data-content",
						'<img class="img-thumbnail center-block" style="width:270px;" alt="预览图" src="actionImg/Publoadimg.do?id=${doce.doc.imgid}&type=min">');
	});

	function _delImg() {
		$("#fileId").val("");
		$("#showImg").attr("style", "visibility: hidden;");
		$("#delImg").attr("style", "visibility: hidden;");
		$("[data-toggle='popover']").popover('hide');
	}
</script>
</html>