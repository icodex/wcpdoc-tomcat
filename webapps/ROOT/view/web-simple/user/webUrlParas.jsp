<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>友情链接参数设置-<PF:ParameterValue key="config.sys.title" /></title>
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
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row column_box">
				<div class="col-md-12 clear-both">
					<div>
						<ul class="nav nav-tabs">
							<li role="presentation" class="active"><a
								href="webuser/webUrlSeting.do"><span
									class="glyphicon glyphicon-link"></span> 友情链接--参数设置</a></li>
							<!--  <li role="presentation"><a href="#">Profile</a></li>
							<li role="presentation"><a href="#">Messages</a></li>-->
						</ul>
					</div>
					<div class="panel-body"
						style="background-color: white; border: 1px solid #dddddd; border-top-width: 0px;">
						<c:forEach items="${urls}" var="urlNode">
							<c:if test="${urlNode.haveParas}">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											<c:if test="${urlNode.haveIcon}">
												<img src="${urlNode.iconUrl}"
													style="height: 16px; width: 16px; margin-top: -4px;">
											</c:if>
											${urlNode.weburl.webname}
										</h3>
									</div>
									<div class="panel-body">
										<form  action="webuser/webUrlSubmit.do"
											method="post">
											<input type="hidden" name="id" value="${urlNode.weburl.id}">
											<c:forEach items="${urlNode.paras}" var="paraNode">
												<div class="form-group">
													<label for="exampleInputEmail1">${paraNode.title}</label>
													<c:if test="${paraNode.password}">
														<input type="password" value="${paraNode.value}"
															class="form-control" id="${paraNode.varname}"
															name="VAR_${paraNode.varname}">
													</c:if>
													<c:if test="${!paraNode.password}">
														<input type="text" value="${paraNode.value}"
															class="form-control" id="${paraNode.varname}"
															name="VAR_${paraNode.varname}">
													</c:if>
												</div>
											</c:forEach>
											<button  type="button"
												class="btn btn-default submitParasButton">提交</button>
										</form>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<div style="text-align: center;">
						 	<a href="webuser/PubHome.do" class="btn btn-default">返回用户空间</a>
						</div>
					</div>
					<br/><br/><br/>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		$('.submitParasButton').bind('click', function() {
			if (confirm("确定提交数据?")) {
				$(this).parent("form").submit();
			}
		});
	});
</script>
</html>