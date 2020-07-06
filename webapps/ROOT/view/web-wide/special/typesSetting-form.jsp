<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>分类${modle=='creat'?'创建':'编辑'}-
	<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords" content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author" content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../text/include-web.jsp"></jsp:include>
<script type="text/javascript" src="text/javascript/wcpTypes.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
</head>
<body>
	<jsp:include page="../../web-simple/commons/head.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/superContent.jsp"></jsp:include>
	<div class="containerbox wcp-zebra-3">
		<div class="container ">
			<div class="row">
				<div class="col-sm-12" style="height: 50px; padding-top: 20px;">
					<span class="glyphicon glyphicon-fire column_title">
					<a style="color: #d9534f" href="webspecial/editDoclist.do?specialid=${special.id}">${special.title}/分类${modle=='creat'?'创建':'编辑'}:</a>
					</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-body">
							<form id="typeSubmitFormId" method="post" action="${modle=='creat'?'webspecialType/typeAddSubmit.do':'webspecialType/typeEditSubmit.do'}">
								<input type="hidden" name="parentId" value="${ptypeId}">
								<input type="hidden" name="id" value="${type.id}">
								<input type="hidden" name="specialId" value="${special.id}">
								<div class="form-group">
									<label for="parentTitleId">上级分类</label>
									<input type="text" readonly="readonly" value="${ptypeTitle}" class="form-control" id="parentTitleId" placeholder="只读分类">
								</div>
								<div class="form-group">
									<label for="typeNameId">
										分类名称&nbsp;
										<span class="alertMsgClass">*</span>
									</label>
									<input type="text" class="form-control" id="typeNameId" name="name" value="${type.name}" placeholder="分类名称">
								</div>
								<div class="form-group">
									<label for="typeSortId">
										排序&nbsp;
										<span class="alertMsgClass">*</span>
									</label>
									<input type="text" class="form-control" id="typeSortId" name="sort" value="${type.sort}" placeholder="整数">
								</div>
							</form>
							<div>
								<span class="alertMsgClass" id="errormessageShowboxId"></span>
							</div>
						</div>
					</div>
					<div>
						<button id="submitButtonId" class="btn btn-info">提交</button>
						<a class="btn btn-default" href="webspecialType/typeSettings.do?specialId=${special.id}"> 返回 </a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../web-simple/commons/footServer.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		validateInput('typeNameId', function(id, val, obj) {
			// 标题
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '不能为空'
				};
			}
			if (valid_maxLength(val, 32)) {
				return {
					valid : false,
					msg : '长度不能大于' + 32
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
		validateInput('typeSortId', function(id, val, obj) {
			// 排序
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '不能为空'
				};
			}
			if (!valid_isNumber(val, 32)){
				return {
					valid : false,
					msg : '必须是数字'
				};
			}
			if (val>=1000){
				return {
					valid : false,
					msg : '排序号必须小于1000'
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
		$('#submitButtonId').bind('click', function() {
			if (!validate('typeSubmitFormId')) {
				$('#errormessageShowboxId').text('信息录入有误，请检查！');
			} else {
				if (confirm("确定提交？")) {
					$('#typeSubmitFormId').submit();
				}
			}
		});
	});
</script>
</html>