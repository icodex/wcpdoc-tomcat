<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<div class="row">
	<c:forEach var="node" items="${DOCE.files}">
		<c:if test="${fn:length(DOCE.files)==1}">
			<DOC:canViewShow docId="${DOCE.doc.id}">
				<WDA:IsSupport fileid="${node.id}">
					<WDA:IsNotConverterError fileid="${node.id}">
						<div class="col-md-12 hidden-xs" style="text-align: center;">
							<jsp:include page="includeOnlineView.jsp">
								<jsp:param value="${node.id}" name="fileid" />
								<jsp:param value="${DOCE.doc.id}" name="docid" />
								<jsp:param value="${node.len}" name="doclen" />
								<jsp:param value="${node.url}" name="fileurl" />
								<jsp:param value="false" name="isfile" />
							</jsp:include>
						</div>
						<c:set value="true" var="IsView" scope="page"></c:set>
					</WDA:IsNotConverterError>
				</WDA:IsSupport>
			</DOC:canViewShow>
		</c:if>
		<c:if test="${fn:length(DOCE.files)==1}">
			<div class="col-md-4"></div>
		</c:if>
		<c:if test="${fn:length(DOCE.files)==2}">
			<div class="col-md-2"></div>
		</c:if>
		<!-- 如果iframe不显示则显示图标，如果iframe显示则，只有最小屏幕时才显示图标 -->
		<c:if test="${!IsView}">
			<div class="col-md-4">
		</c:if>
		<c:if test="${IsView}">
			<div class="col-md-4 hidden-sm hidden-md hidden-lg">
		</c:if>
		<div class="panel panel-default">
			<div class="panel-body " style="padding-bottom: 4px;">
				<div style="height: 200px;" class="parent">
					<a href="webdoc/view/PubFile${node.id}.html?docid=${DOCE.doc.id}">
						<c:if
							test="${fn:toUpperCase(fn:replace(node.exname,'.',''))=='PNG'||fn:toUpperCase(fn:replace(node.exname,'.',''))=='JPG'||fn:toUpperCase(fn:replace(node.exname,'.',''))=='JPEG'||fn:toUpperCase(fn:replace(node.exname,'.',''))=='GIF'}">
							<img class="child" style="max-height: 100%; max-width: 100%;"
								alt="${node.name}" src="${node.minurl}" />
						</c:if> <c:if
							test="${fn:toUpperCase(fn:replace(node.exname,'.',''))!='PNG'&&fn:toUpperCase(fn:replace(node.exname,'.',''))!='JPG'&&fn:toUpperCase(fn:replace(node.exname,'.',''))!='JPEG'&&fn:toUpperCase(fn:replace(node.exname,'.',''))!='GIF'}">
							<img class="child" style="max-height: 120px; max-width: 176px;"
								alt="${node.name}"
								src="text/img/fileicon/${fn:toUpperCase(fn:replace(node.exname,'.',''))}.png" />
						</c:if>
					</a>
				</div>
				<div title="${node.name}"
					style="white-space: nowrap; color: #666; overflow: hidden; text-overflow: ellipsis;">
					${node.name}</div>
			</div>
			<div class="panel-footer">
				<div style="overflow: hidden; height: 20px;">
					<span style="color: #666;"><fmt:formatNumber type="number" value="${node.len/1024/1024}" pattern="0.00" maxFractionDigits="2"/>MB</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<a title="查看文件详情" href="webdoc/view/PubFile${node.id}.html?docid=${DOCE.doc.id}"><span
						class="glyphicon glyphicon-info-sign"></span></a>
					<DOC:canDownloadShow docId="${DOCE.doc.id}">
						<a title="下载文件" class="downloadButton_wcp" href="${node.url}"><span
							class="glyphicon glyphicon-download-alt"></span></a>
					</DOC:canDownloadShow>
					<DOC:canViewShow docId="${DOCE.doc.id}">
						<WDA:IsSupport fileid="${node.id}">
							<PF:IfParameterEquals key="config.sys.link.docview.target" val="auto">
								<a  title="下载文件"
									target="${config_sys_link_newwindow_target}"
									href="<WDA:WdaFileViewUrl fileid="${node.id}" docid="${DOCE.doc.id}"></WDA:WdaFileViewUrl>">
									<span class="glyphicon glyphicon-eye-open"></span>
								</a>
							</PF:IfParameterEquals>
							<PF:IfParameterNoEquals key="config.sys.link.docview.target" val="auto">
								<WDA:IsNotConverterError fileid="${node.id}">
									<a  title="预览文件"
										target="<PF:ParameterValue key="config.sys.link.docview.target"/>"
										href="<WDA:WdaFileViewUrl fileid="${node.id}" docid="${DOCE.doc.id}"></WDA:WdaFileViewUrl>">
										<span class="glyphicon glyphicon-eye-open"></span>
									</a>
								</WDA:IsNotConverterError>
							</PF:IfParameterNoEquals>
						</WDA:IsSupport>
					</DOC:canViewShow>
				</div>
			</div>
		</div>
</div>
<c:if test="${fn:length(DOCE.files)==2}">
	<div class="col-md-2"></div>
</c:if>
</c:forEach>
</div>
<script type="text/javascript">
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