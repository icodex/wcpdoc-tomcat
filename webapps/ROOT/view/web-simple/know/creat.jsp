<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>编辑知识- <PF:ParameterValue key="config.sys.title" /></title>
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
<script charset="utf-8"
	src="<PF:basePath/>text/lib/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/zh-CN.js"></script>
<link rel="stylesheet"
	href="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-kindeditor.css" />
<link rel="stylesheet"
	href="<PF:basePath/>view/web-simple/atext/style/web-forms.css" />
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
		<div class="container ">
			<div class="row  column_box ">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<c:if
									test="${doce.doc.docgroupid!=null&&doce.doc.docgroupid!=''}">
									<li><a
										href="webgroup/Pubshow.do?groupid=${doce.doc.docgroupid}"><span
											class="label label-success">小组知识</span></a></li>
								</c:if>
								<c:if
									test="${doce.doc.docgroupid==null||doce.doc.docgroupid==''}">
									<li class="active"><span class="label label-primary">公共知识</span></li>
								</c:if>
								<li class="active">创建知识</li>
							</ol>
						</div>
					</div>
					<form role="form" action="know/addsubmit.do" id="knowSubmitFormId"
						class="wcp_noEnterSubmit" method="post">
						<input type="hidden" name="readtype" value="${doce.doc.readpop}" />
						<input type="hidden" name="docgroup"
							value="${doce.doc.docgroupid}" />
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="exampleInputEmail1"> 标题 <span
										class="alertMsgClass">*</span>
									</label> <input type="text" class="form-control" name="knowtitle"
										value="${doce.doc.title}" id="knowtitleId"
										placeholder="输入知识标题" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="exampleInputEmail1"> 文档分类 <span
										class="alertMsgClass">*</span>
									</label>
									<div class="row">
										<div class="col-md-12">
											<div class="input-group">
												<input type="text" class="form-control" id="knowtypeTitleId"
													readonly="readonly" placeholder="选择文档分类"
													value="${doce.type.name}" /> <input type="hidden"
													name="knowtype" id="knowtypeId" value="${doce.type.id}" />
												<div class="input-group-btn">
													<button class="btn btn-info " data-toggle="modal"
														id="openChooseTypeButtonId" data-target="#myModal">选择分类</button>
													<button class="btn btn-info " data-toggle="modal"
														style="display: none;" id="openChooseDemoButtonId">加载模板</button>
												</div>
											</div>
											<div id="knowtypeValidId"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<script type="text/javascript">
									var loadExisSearchConfig = {
										inputId : "knowtitleId",
										domType : "1",
										typeTitle : "知识"
									};
								</script>
								<jsp:include page="../commons/includeLuceneSearchExistDoc.jsp"></jsp:include>
							</div>
						</div>
						<c:if test="${doce.doc.source!=null}">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="exampleInputEmail1">知识来源 </label> <input
											type="text" class="form-control" id="resourceUrlId"
											value="${doce.doc.source}" name="resourceUrl"
											readonly="readonly"
											placeholder="输入一个可用的URL地址，如http://www.wcpdoc.com" />
									</div>
								</div>
							</div>
						</c:if>
						<div class="panel panel-info">
							<div class="panel-heading">
								<b>知识文档</b>
							</div>
							<div class="panel-body"
								style="background-color: #e1edf3; padding-bottom: 0px;">
								<div class="row">
									<div class="col-md-3  visible-lg visible-md"
										style="margin-right: -10px;">
										<jsp:include page="commons/includeNavigationDocEdit.jsp"></jsp:include>
									</div>
									<div class="col-md-9"
										style="margin-left: -10px; padding-right: 4px; padding-bottom: 10px;">
										<!--超文本编辑器  name="text" id="contentId" -->
										<jsp:include page="editor/includeTextEditor.jsp">
											<jsp:param name="text" value="${doce.texts.text}" />
										</jsp:include>
									</div>
								</div>
								<div class="row hidden-xs">
									<div class="col-md-6">
										<div class="form-group">
											<label for="exampleInputEmail1"> 标签 </label> <input
												type="text" class="form-control" id="knowtagId"
												value="${doce.doc.tagkey}" name="knowtag"
												placeholder="输入类别标签,或从下方选择标签,多个标签间用逗号或空格分隔" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="exampleInputEmail1"> 编辑权限 <span
												class="alertMsgClass">*</span>
											</label> <select class="form-control" name="writetype"
												id="writetypeId" val="0">
												<option value="0">创建人私有</option>
												<option value="1">继承自分类</option>
												<c:if
													test="${doce.doc.docgroupid!=null&&doce.doc.docgroupid!=''}">
													<option value="2">小组编辑权限</option>
												</c:if>
											</select>
										</div>
									</div>
								</div>
								<div class="row hidden-xs hidden-sm">
									<div class="col-md-12" id="taglistboxId"></div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="exampleInputEmail1"> 上传预览图 </label>
											<div class="row">
												<div class="col-md-12">
													<input type="button" id="uploadButton"
														class="btn btn-info btn-xs center-block"
														style="padding: 0px; padding-bottom: 8px;" value="上传" />
													<input type="hidden" id="fileId" name="fileId" value="">
													<button type="button" id="showImg"
														class="btn btn-info btn-sm" title="预览"
														data-container="body" data-toggle="popover"
														data-placement="bottom" data-trigger="focus"
														style="display: none;"
														data-content="<img class='img-thumbnail center-block' style='width:270px;' />">预览</button>
													<button type="button" id="delImg"
														class="btn btn-info btn-sm" title="删除图片"
														onclick="_delImg();" style="display: none;">删除</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 关联知识 -->
									<div class="col-md-6 hidden-xs">
										<div class="form-group">
											<label for="exampleInputEmail1"> 关联知识 </label>
											<div class="row">
												<input type="hidden" name="relationdocs" value=""
													id="relationdocsid" />
												<div class="col-md-12">
													<button class="btn btn-info btn-sm" data-toggle="modal"
														id="openaAddRelationButtonId">添加关联知识</button>
												</div>
											</div>
											<div class="row">
												<div id="docrelation_tagbox" class="col-md-12"
													style="margin-top: 4px; margin-left: -4px;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 修改原因 -->
						<jsp:include page="commons/includeEditNoteForm.jsp"></jsp:include>
						<div class="row column_box">
							<div class="col-md-2">
								<button type="button" id="knowSubmitButtonId"
									class="btn btn-info btn-lg">提交</button>
							</div>
						</div>
						<div class="row">
							<div class="col-md-10">
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
	<jsp:include
		page="/view/web-simple/type/commons/includeChooseTypes.jsp"></jsp:include>
	<jsp:include
		page="/view/web-simple/type/commons/includeChooseDemos.jsp"></jsp:include>
	<jsp:include
		page="/view/web-simple/know/commons/includeChooseRelationDoc.jsp"></jsp:include>
	<!-- /.modal -->
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	var contentMaxSize = parseInt('<PF:ParameterValue key="config.doc.content.maxsize"/>');
	$(function() {
		$('#openChooseTypeButtonId').bind('click', function() {
			$('#myModal').modal({
				keyboard : false
			})
		});

		$('#openaAddRelationButtonId').bind('click', function() {
			$('#myDocs').modal({
				keyboard : false
			})
		});

		$('#openChooseDemoButtonId').bind('click', function() {
			if (loadTypeDemo($('#knowtypeId').val())) {
				$('#myDemos').modal({
					keyboard : false
				})
			} else {
				alert("请先选定分类!");
			}
		});
		$('select', '#knowSubmitFormId').each(function(i, obj) {
			var val = $(obj).attr('val');
			$(obj).val(val);
		});
		$('#knowSubmitButtonId').bind(
				'click',
				function() {
					syncEditorcontent();
					if (!validate('knowSubmitFormId')) {
						$('#errormessageShowboxId').text('信息录入有误，请检查！');
					} else {
						if ($('#contentId').val() == null
								|| $('#contentId').val() == '') {
							$('#errormessageShowboxId').text('请录入文档内容！');
							return false;
						}
						if ($('#contentId').val().length > contentMaxSize) {
							$('#errormessageShowboxId').text(
									'文档内容超长（' + $('#contentId').val().length
											+ '>' + contentMaxSize + ')');
							return false;
						}
						parseRelasDocsId();
						if (confirm("是否提交数据?")) {
							$('#knowSubmitFormId').submit();
							$('#knowSubmitButtonId').addClass("disabled");
							$('#knowSubmitButtonId').text("提交中...");
						}
					}
				});
		validateInput('knowtypeTitleId', function(id, val, obj) {
			// 分类
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '不能为空'
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		}, 'knowtypeValidId');
		//绑定一个表单的验证事件
		validateInput('knowtitleId', function(id, val, obj) {
			// 标题
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '不能为空'
				};
			}
			if (valid_maxLength(val, 128)) {
				return {
					valid : false,
					msg : '长度不能大于' + 128
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
		//绑定一个表单的验证事件
		validateInput('knowtagId', function(id, val, obj) {
			// 学生姓名
			if (valid_maxLength(val, 128)) {
				return {
					valid : false,
					msg : '长度不能大于' + 128
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
		//编辑权限
		validateInput('writetypeId', function(id, val, obj) {
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '不能为空'
				};
			}
			if (val == '2' && $('#docgroupId').val() == '0') {
				return {
					valid : false,
					msg : '请选择工作小组'
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
		//阅读权限
		validateInput('readtypeId', function(id, val, obj) {
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '不能为空'
				};
			}
			if (val == '2' && $('#docgroupId').val() == '0') {
				return {
					valid : false,
					msg : '请选择工作小组'
				};
			}
			if ($('#docgroupId').val() != '0') {
				if (val == '0') {
					return {
						valid : false,
						msg : '阅读权限至少是小组'
					};
				}
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
		//工作小组
		validateInput('docgroupId', function(id, val, obj) {
			return {
				valid : true,
				msg : '正确'
			};
		});
		//檢查是否顯示分類模板按鈕
		typeInputUpdate();
		//激活弹窗插件
		$("[data-toggle='popover']").popover({
			html : true
		});
		//上传预览图
		KindEditor
				.ready(function(K) {
					var uploadbutton = K
							.uploadbutton({
								button : K('#uploadButton')[0],
								fieldName : 'imgFile',
								url : basePath + 'actionImg/PubFPuploadImg.do',
								afterUpload : function(data) {
									if (data.error === 0) {
										$("#fileId").val(data.id);
										$("#showImg")
												.attr(
														"data-content",
														'<img class="img-thumbnail center-block" style="width:270px;" alt="预览图" src="actionImg/Publoadimg.do?id='
																+ data.id
																+ '&type=min">');
										$("#showImg").show();
										$("#delImg").show();
									} else {
										alert(data.message);
									}
								},
								afterError : function(str) {
									alert('自定义错误信息: ' + str);
								}
							});
					uploadbutton.fileBox.change(function(e) {
						uploadbutton.submit();
					});
				});
		window.setInterval(function() {
			//定时执行判断是否登录，如果未登录则跳转至登录页面
			try {
				$.post('login/PubCurrent.do', {}, function(flag) {
					if (!flag.islogin) {
						location.reload();
					}
				}, 'json');
			} catch (e) {
			}
		}, 20000);
	});

	//刪除内容圖
	function _delImg() {
		$("#fileId").val("");
		$("#showImg").hide();
		$("#delImg").hide();
	}
	//修改分类的回掉方法，如果有模板就顯示加載模板按鈕，沒有模板就隱藏按鈕
	function typeInputUpdate() {
		try {
			//加载标签
			loadTypeTags($('#knowtypeId').val(), 'taglistboxId', 'knowtagId');
		} catch (e) {
			alert("请检查js文件knowCreatForm.js中的loadTypeTags()方法!");
		}
		ishaveDemoRun($('#knowtypeId').val(), function() {
			$('#openChooseDemoButtonId').show();
			//分类改变，提示加载模板
			if (!getEditorcontent()) {
				if (!confirm("是否加载分类模板？")) {
					return;
				} else {
					$('#openChooseDemoButtonId').click();
				}
			}
		}, function() {
			$('#openChooseDemoButtonId').hide();
		});
	}
</script>
</html>