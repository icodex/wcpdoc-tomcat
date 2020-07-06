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
<title>测试环境-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<link rel="stylesheet"
	href="<PF:basePath/>text/lib/kindeditor/themes/default/default.css" />
<script charset="utf-8"
	src="<PF:basePath/>text/lib/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/zh-CN.js"></script>
<link rel="stylesheet"
	href="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-kindeditor.css" />
<script charset="utf-8"
	src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-search-kindeditor.js"></script>
<script charset="utf-8"
	src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-draft-kindeditor.js"></script>
<script charset="utf-8"
	src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-multiimage-kindeditor.js"></script>
<!-- 上传组件 -->
<script src="view/web-simple/demo/lib/fileUpload/jquery.ui.widget.js"></script>
<script
	src="view/web-simple/demo/lib/fileUpload/jquery.iframe-transport.js"></script>
<script src="view/web-simple/demo/lib/fileUpload/jquery.fileupload.js"></script>
<link href="view/web-simple/demo/lib/fileUpload/jquery.fileupload.css"
	rel="stylesheet">
</head>
<body>
	<!-- /.carousel -->
	<div class="containerbox">
		<div class="container" style="margin-top: 50px;">
			<div style="margin-top: 8px;"></div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">测试面板</div>
						<div class="panel-body">
							<div>
								<h1>完整demo</h1>
								<textarea name="text" id="contentId"
									style="height: 500px; width: 100%;"></textarea>
								<script type="text/javascript">
									var editor;
									$(function() {
										editor = KindEditor
												.create(
														'textarea[id="contentId"]',
														{
															resizeType : 1,
															afterChange : function() {
																//生成导航目录
															},
															cssPath : '<PF:basePath/>text/lib/kindeditor/editInner.css',
															uploadJson : basePath
																	+ 'actionImg/PubFPuploadMedia.do',
															formatUploadUrl : false,
															allowPreviewEmoticons : false,
															allowImageRemote : true,
															allowImageUpload : true,
															items : [
																	'source',
																	'fullscreen',
																	'|',
																	'fontname',
																	'fontsize',
																	'forecolor',
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'removeformat',
																	'|',
																	'justifyleft',
																	'justifycenter',
																	'justifyright',
																	'insertorderedlist',
																	'insertunorderedlist',
																	'lineheight',
																	'|',
																	'formatblock',
																	'table',
																	'hr',
																	'pagebreak',
																	'|',
																	'link',
																	'image',
																	'multiimage',
																	'wcpimgs',
																	'${config_kindeditor_media_able=="true"?"media":"|"}',
																	'code',
																	'wcpdraft',
																	'wcpknow' ],
															afterCreate : function() {
																var doc = this.edit.doc;
																var cmd = this.edit.cmd;
																$(doc.body)
																		.bind(
																				'paste',
																				function(
																						ev) {
																					var $this = $(this);
																					var dataItem = ev.originalEvent.clipboardData.items[0];
																					if (dataItem) {
																						var file = dataItem
																								.getAsFile();
																						if (file) {
																							//暂时不处理，文件上传
																							return false;
																						}
																					}
																				});
															}
														});
										//加载草稿箱
										runAotoSubmitDraft(600);
									});
									//刷新超文本内容到表单中
									function syncEditorcontent() {
										editor.sync();
									}
									//获得潮文本内容
									function getEditorcontent() {
										return editor.html();
									}
									//获得潮文本内容
									function getEditorcontentText() {
										return editor.text();
									}
									//设置超文本内容
									function setEditorcontent(text) {
										editor.html(text);
									}
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>