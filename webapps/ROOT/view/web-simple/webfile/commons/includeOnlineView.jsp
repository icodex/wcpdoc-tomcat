<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<!-- 当只有一个可预览的文件时显示 -->
<div class="panel panel-default">
	<div class="panel-footer">
		<iframe style="width: 100%; height: 600px; border: 0px;"
			src="<WDA:WdaFileViewUrl fileid="${param.fileid}" docid="${param.docid}"></WDA:WdaFileViewUrl>">
		</iframe>
		<!-- 预览文件的回调，可以记录附件预览事件 -->
		<WDA:WdaViewHandle fileid="${param.fileid}"></WDA:WdaViewHandle>
		<div style="overflow: hidden; height: 20px;">
			<c:if test="${!param.isfile}">
				<span style="color: #666;">${param.doclen/1000}kb</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<a
					href="webdoc/view/PubFile${param.fileid}.html?docid=${param.docid}"><span
					class="glyphicon glyphicon-info-sign"></span></a>
				<DOC:canDownloadShow docId="${param.docid}">
					<a class="downloadButton_wcp" href="${param.fileurl}"><span
						class="glyphicon glyphicon-download-alt"></span></a>
				</DOC:canDownloadShow>
				<WDA:IsSupport fileid="${param.fileid}">
					<PF:IfParameterEquals key="config.sys.link.docview.target"
						val="auto">
						<a
							target="${config_sys_link_newwindow_target}"
							href="<WDA:WdaFileViewUrl fileid="${param.fileid}" docid="${param.docid}"></WDA:WdaFileViewUrl>">
							<span class="glyphicon glyphicon-eye-open"></span>
						</a>
					</PF:IfParameterEquals>
					<PF:IfParameterNoEquals key="config.sys.link.docview.target"
						val="auto">
						<a
							target="<PF:ParameterValue key="config.sys.link.docview.target"/>"
							href="<WDA:WdaFileViewUrl fileid="${param.fileid}" docid="${param.docid}"></WDA:WdaFileViewUrl>">
							<span class="glyphicon glyphicon-eye-open"></span>
						</a>
					</PF:IfParameterNoEquals>
				</WDA:IsSupport>
			</c:if>
		</div>
	</div>
</div>