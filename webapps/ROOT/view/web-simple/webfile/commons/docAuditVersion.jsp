<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<style>
<!--
.parent {
	width: 800px;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

.child {
	display: inline-block;
}
-->
</style>
<div class="alert alert-warning" role="alert">新版本注释：${DOCE.auditTemp.pcontent}</div>
<!-- 自定义表单展示 -->
<c:if test="${!empty DOCE.auditFieldForm.fields}">
	<div class="panel panel-default">
		<div class="panel-body">
			<jsp:include page="../../know/commons/includeTypeFormViewTemp.jsp"></jsp:include>
		</div>
	</div>
</c:if>
<div class="row">
	<div class="col-md-12">
		<div style="text-align: center;">
			<div class="row">
				<c:forEach var="node" items="${DOCE.auditTempfiles}">
					<div class="col-md-4">
						<div class="panel panel-default">
							<div class="panel-body " style="padding-bottom: 4px;">
								<div class="parent">
									<c:if test="${fn:toUpperCase(fn:replace(node.exname,'.',''))=='PNG'||fn:toUpperCase(fn:replace(node.exname,'.',''))=='JPG'||fn:toUpperCase(fn:replace(node.exname,'.',''))=='JPEG'||fn:toUpperCase(fn:replace(node.exname,'.',''))=='GIF'}">
										<img class="child" style="max-height: 100%; max-width: 100%;" alt="${node.name}" src="${node.minurl}" />
									</c:if>
									<c:if test="${fn:toUpperCase(fn:replace(node.exname,'.',''))!='PNG'&&fn:toUpperCase(fn:replace(node.exname,'.',''))!='JPG'&&fn:toUpperCase(fn:replace(node.exname,'.',''))!='JPEG'&&fn:toUpperCase(fn:replace(node.exname,'.',''))!='GIF'}">
										<img class="child" style="max-height: 128px; max-width: 100%;" alt="${node.name}" src="text/img/fileicon/${fn:toUpperCase(fn:replace(node.exname,'.',''))}.png" />
									</c:if>
								</div>
								<div style="white-space: nowrap; color: #666; overflow: hidden; text-overflow: ellipsis;">${node.name}</div>
							</div>
							<div class="panel-footer">
								<div style="overflow: hidden; height: 20px;">
									<span style="color: #666;">${node.len/1000}kb</span>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a title="下载文件" class="downloadButton_wcp" href="${node.url}">
										<span class="glyphicon glyphicon-download-alt"></span>
									</a>
									<DOC:canViewShow docId="${DOCE.doc.id}">
										<WDA:IsSupport fileid="${node.id}">
											<WDA:IsNotConverterError fileid="${node.id}">
												<a title="预览文件" target="<PF:ParameterValue key="config.sys.link.docview.target"/>" href="<WDA:WdaFileViewUrl fileid="${node.id}" docid="${DOCE.doc.id}"></WDA:WdaFileViewUrl>">
													<span class="glyphicon glyphicon-eye-open"></span>
												</a>
											</WDA:IsNotConverterError>
										</WDA:IsSupport>
									</DOC:canViewShow>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<c:if test="${DOCE.auditTemp.text!=null&&DOCE.auditTemp.text!=''}">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="col-md-12" id="textsBoxId">
					<c:if test="${DOCE.imgUrl!=null }">
						<br />
						<img src="${DOCE.imgUrl}" alt="预览图" class="img-thumbnail center-block doc-contentimg" />
						<hr />
					</c:if>
					<span style="color: #aaa;font-size: 14px;">知识摘要： </span>
					<p class="ke-content">${DOCE.auditTemp.text}</p>
				</div>
			</div>
		</div>
	</div>
</c:if>
<script type="text/javascript">
	$(function() {
		$('#textsBoxId img').addClass("img-responsive");
	});
	$(function() {
		if (is_weixin()) {
			$('.downloadButton_wcp').hide();
		}
	});
	function is_weixin() {
		var ua = navigator.userAgent.toLowerCase();
		if (ua.match(/MicroMessenger/i) == "micromessenger") {
			return true;
		} else {
			return false;
		}
	}
</script>