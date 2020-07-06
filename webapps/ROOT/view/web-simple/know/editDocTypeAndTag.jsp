<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>编辑分类标签-
	<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords" content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author" content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="noindex,nofllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<link rel="stylesheet" href="<PF:basePath/>text/lib/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<PF:basePath/>view/web-simple/atext/style/web-forms.css" />
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/zh-CN.js"></script>
<link rel="stylesheet" href="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-kindeditor.css" />
<script charset="utf-8" src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/javascript/knowCreatForm.js"></script>
<script type="text/javascript" src="text/javascript/wcpTypes.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/javascript/knowCreatForm.js"></script>
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
								<li class="active">编辑分类标签</li>
							</ol>
						</div>
					</div>
					<form role="form" action="webdoc/submitTypeTag.do" id="knowSubmitFormId" class="wcp_noEnterSubmit" method="post">
						<input type="hidden" name="docid" value="${doce.doc.id}" />
						<div class="row">
							<div class="col-md-12">
								<span style="color: #008000; font-size: 12px; font-weight: lighter;">
									作者:
									<span style="color: #D9534F; font-size: 14px; font-weight: bold;">${doce.doc.author}</span>
									于
									<PF:FormatTime date="${doce.doc.pubtime}" yyyyMMddHHmmss="yyyy年MM月dd日" />
									发布
								</span>
								<h1>
									<a href="webdoc/view/Pub${doce.doc.id}.html"> ${doce.doc.title}</a>
									<small>
										[编辑:
										<c:if test="${doce.doc.writepop==1}">
									公开
									</c:if>
										<c:if test="${doce.doc.writepop==0}">
									私有
									</c:if>
										<c:if test="${doce.doc.writepop==2}">
									小组
									</c:if>
										][读:
										<c:if test="${doce.doc.readpop==1}">
									公开
									</c:if>
										<c:if test="${doce.doc.readpop==0}">
									私有
									</c:if>
										<c:if test="${doce.doc.readpop==2}">
									小组
									</c:if>
										]
									</small>
								</h1>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 ">
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="exampleInputEmail1">
														文档分类
														<span class="alertMsgClass">*</span>
													</label>
													<div class="row">
														<div class="col-md-12">
															<div class="input-group">
																<input type="text" class="form-control" id="knowtypeTitleId" readonly="readonly" placeholder="选择栏目分类" value="${doce.type.name}" />
																<input type="hidden" name="knowtype" id="knowtypeId" value="${doce.type.id}" />
																<div class="input-group-btn">
																	<button class="btn btn-info" data-toggle="modal" id="openChooseTypeButtonId" data-target="#myModal">选择分类</button>
																</div>
															</div>
															<div id="knowtypeValidId"></div>
														</div>
													</div>
												</div>
											</div>
											<input type="hidden" id="knowtypeId" value="${doce.type.id}" />
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="exampleInputEmail1"> 标签 </label>
													<input type="text" class="form-control" id="knowtagId" value="${doce.doc.tagkey}" name="knowtag" placeholder="输入类别标签,或从下方选择标签,多个标签间用逗号或空格分隔" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12" id="taglistboxId"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="answerVacancyViewBox alert alert-warning" style="height: auto;">
									<i class="glyphicon glyphicon-info-sign"></i>
									&nbsp;当前页面下修改自定义属性不会形成新的版本，如需要记录版本请在"更新知识"界面下进行修改。
								</div>
							</div>
						</div>
						<div class="row column_box">
							<div class="col-md-12" style="text-align: center;">
 								<button type="button" id="knowSubmitButtonId" class="btn btn-info btn-lg">提交</button>
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
			</div>
		</div>
	</div>
	<jsp:include page="/view/web-simple/type/commons/includeChooseTypes.jsp"></jsp:include>
	<!-- /.modal -->
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		$('#knowSubmitButtonId').bind('click', function() {
			if (!validate('knowSubmitFormId')) {
				$('#errormessageShowboxId').text('信息录入有误，请检查！');
			} else {
				if (confirm("是否提交数据?")) {
					$('#knowSubmitFormId').submit();
					$('#knowSubmitButtonId').addClass("disabled");
					$('#knowSubmitButtonId').text("提交中...");
				}
			}
		});
		//檢查是否顯示分類模板按鈕
		typeInputUpdate();
	});
	//回掉方法，如果有模板就顯示加載模板按鈕，沒有模板就隱藏按鈕
	function typeInputUpdate() {
		try {
			//加载标签
			loadTypeTags($('#knowtypeId').val(), 'taglistboxId', 'knowtagId');
		} catch (e) {
			alert("请检查js文件knowCreatForm.js中的loadTypeTags()方法!");
		}
	}
</script>
</html>