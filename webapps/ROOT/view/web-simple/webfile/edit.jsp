<%@page import="com.farm.parameter.FarmParameterService"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>上传资源文件- <PF:ParameterValue key="config.sys.title" /></title>
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
			<div class="row  column_box">
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
								<li class="active">编辑知识</li>
							</ol>
						</div>
					</div>
					<form role="form" action="webfile/editCommit.do"
						id="knowSubmitFormId" class="wcp_noEnterSubmit" method="post">
						<input type="hidden" name="docid" value="${doce.doc.id }" /> <input
							type="hidden" name="readtype" value="${doce.doc.readpop}" /> <input
							type="hidden" name="docgroup" value="${doce.doc.docgroupid}" />
						<DOC:canNoDelIsShow docId="${doce.doc.id}">
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
									<h1>
										<span class="typetagsearch" style="cursor: pointer;"
											title="${doce.type.name}"> <small>${doce.type.name}</small>
										</span>
									</h1>
								</div>
							</div>
						</DOC:canNoDelIsShow>
						<div class="row">
							<DOC:canDelIsShow docId="${doce.doc.id}">
								<div class="col-md-6">
									<div class="form-group">
										<label for="exampleInputEmail1"> 标题 <span
											class="alertMsgClass">*</span>
										</label> <input type="text" class="form-control" name="knowtitle"
											value="${doce.doc.title}" id="knowtitleId"
											placeholder="输入知识标题" />
									</div>
								</div>
							</DOC:canDelIsShow>
							<DOC:canDelIsShow docId="${doce.doc.id}">
								<div class="col-md-6">
									<div class="form-group">
										<label for="exampleInputEmail1"> 文档分类 <span
											class="alertMsgClass">*</span>
										</label>
										<div class="row">
											<div class="col-md-12">
												<div class="input-group">
													<input type="text" class="form-control"
														id="knowtypeTitleId" readonly="readonly"
														placeholder="选择文档分类" value="${doce.type.name}" /> <input
														type="hidden" name="knowtype" id="knowtypeId"
														value="${doce.type.id}" />
													<div class="input-group-btn">
														<button class="btn btn-info" data-toggle="modal"
															id="openChooseTypeButtonId" data-target="#myModal">选择</button>
													</div>
												</div>
												<div id="knowtypeValidId"></div>
											</div>
										</div>
									</div>
								</div>
							</DOC:canDelIsShow>
							<DOC:canNoDelIsShow docId="${doce.doc.id}">
								<input type="hidden" id="knowtypeId" value="${doce.type.id}" />
							</DOC:canNoDelIsShow>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading center-block webfile-buttonplus"
										style="height: 50px;">
										<div class="form-group" style="float: left;">
											<jsp:include page="commons/includeSingleUploadButton.jsp"></jsp:include>
										</div>
										<div style="float: right;">
											<jsp:include page="commons/includeManyUploadButtonHtml5.jsp"></jsp:include>
										</div>
									</div>
									<div class="panel-body WfsUploadDropBox" id="fileUploadDropBoxId">
										<div id="fileQueue">
											<div class="center-block text-center blocktip-title"
												style="display: none;">
												<i class="glyphicon glyphicon-paperclip"></i>&nbsp;可&nbsp;<b>将文件拖到此处</b>&nbsp;或通过&nbsp;<b>点击上方上传按钮</b>&nbsp;进行上传 <br />
												<span> 允许上传附件类型为 <b> <PF:ParameterValue
															key="config.doc.upload.types" />
												</b> ，最大<%=Long.valueOf(FarmParameterService.getInstance().getParameter("config.doc.upload.length.max"))
					/ 1024 / 1024%>M
												</span>
											</div>
										</div>
										<div class="row" id="fileListId" style="padding: 20px;"></div>
										<c:forEach var="file" items="${doce.files }">
											<script type="text/javascript">
												$(function() {
													addFileNode(
															'actionImg/PubIcon.do?id=${file.id }',
															'${file.name }',
															'${file.id }');
												});
											</script>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="panel panel-info">
							<div class="panel-heading">
								<b> 摘要</b>
							</div>
							<div class="panel-body" style="background-color: #e1edf3;">
								<div class="row">
									<div class="col-md-12">
										<!--超文本编辑器  name="text" id="contentId" -->
										<jsp:include page="editor/includeTextEditorKindEdit.jsp">
											<jsp:param name="text" value="${doce.texts.text}" />
										</jsp:include>
									</div>
								</div>
								<DOC:canDelIsShow docId="${doce.doc.id}">
									<div class="row hidden-xs" style="padding-top: 4px;">
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
													id="writetypeId" val="${doce.doc.writepop }">
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
										<div class="col-md-12">
											<div class="form-group">
												<label for="exampleInputEmail1"> 预览图 </label>
												<div class="row">
													<div class="col-md-12">
														<input type="button" id="uploadImgButton"
															class="btn btn-info btn-xs center-block"
															style="padding: 0px; padding-bottom: 8px;" value="上传预览图" />
														<input type="hidden" id="imgFileId" name="imgFileId"
															value="${doce.doc.imgid }">
														<button type="button" id="showImg"
															class="btn btn-info btn-sm" title="预览图片"
															data-container="body" data-toggle="popover"
															data-placement="bottom"
															<c:if test="${empty doce.doc.imgid }">
												style="visibility: hidden;"
												</c:if>
															data-trigger="focus"
															data-content="<img class='img-thumbnail center-block' style='width:270px;' />">预览图片</button>
														<button type="button" id="delImg"
															class="btn btn-info btn-sm" title="删除图片"
															<c:if test="${empty doce.doc.imgid }">
													style="visibility: hidden;"
													</c:if>
															onclick="_delImg();">删除图片</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</DOC:canDelIsShow>
							</div>
						</div>
						<!-- 修改 -->
						<c:if test="${doce.doc!=null&&doce.doc.id!=null}">
							<!-- 修改原因 -->
							<jsp:include page="../know/commons/includeEditNoteForm.jsp"></jsp:include>
						</c:if>
						<br /> <br />
						<div class="row">
							<div class="col-md-12">
								<button type="button" id="knowSubmitButtonId"
									class="btn btn-info btn-lg">修改</button>
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
	<jsp:include
		page="/view/web-simple/type/commons/includeChooseTypes.jsp"></jsp:include>
	<!-- /.modal -->
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include><a onclick=""></a>
</body>
<script type="text/javascript">
	$(function() {
		$('#openChooseTypeButtonId').bind('click', function() {
			$('#myModal').modal({
				keyboard : false
			})
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
						if ($('#contentId').val().length > 10000) {
							$('#errormessageShowboxId').text(
									'文档内容超长（' + $('#contentId').val().length
											+ '>10000)');
							return false;
						}
						//判断附件是否上传
						if ($("input[name='fileId']").length == 0) {
							$('#errormessageShowboxId').text('请上传文件');
							return false;
						}
						$('#errormessageShowboxId').text('');
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
		typeInputUpdate();

		//激活弹窗插件
		$("[data-toggle='popover']").popover({
			html : true
		});
		$("#showImg")
				.attr(
						"data-content",
						'<img class="img-thumbnail center-block" alt="预览图" src="actionImg/Publoadimg.do?id=${doce.doc.imgid }&type=min">');
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

	function removeFile(fileId) {
		$("#file_" + fileId).remove();
		//判断附件是否上传
		if ($("input[name='fileId']").length == 0) {
			$('.blocktip-title').show();
		}
	}

	function _delImg() {
		$("#imgFileId").val("");
		$("#showImg").attr("style", "visibility: hidden;");
		$("#delImg").attr("style", "visibility: hidden;");
		$("[data-toggle='popover']").popover('hide');
	}
	//分类变动回掉方法
	function typeInputUpdate() {
		try {
			//加载标签
			loadTypeTags($('#knowtypeId').val(), 'taglistboxId', 'knowtagId');
		} catch (e) {
			alert("请检查js文件knowCreatForm.js中的loadTypeTags()方法!");
		}
	}
</script>
<DOC:canDelIsShow docId="${doce.doc.id}">
	<script type="text/javascript">
		//上传预览图
		KindEditor
				.ready(function(K) {
					var uploadbutton = K
							.uploadbutton({
								button : K('#uploadImgButton')[0],
								fieldName : 'imgFile',
								url : basePath + 'actionImg/PubFPuploadImg.do',
								afterUpload : function(data) {
									if (data.error === 0) {
										$("#showImg")
												.attr(
														"data-content",
														'<img class="img-thumbnail center-block"  style="width:270px;" alt="预览图" src="actionImg/Publoadimg.do?id='
																+ data.id
																+ '&type=min">');
										$("#imgFileId").val(data.id);

										$("#showImg").attr("style", "");
										$("#delImg").attr("style", "");
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
	</script>
</DOC:canDelIsShow>
</html>