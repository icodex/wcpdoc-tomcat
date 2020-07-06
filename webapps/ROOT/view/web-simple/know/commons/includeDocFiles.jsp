<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<a name="markdocFile"></a><br/>
<c:if test="${fn:length(DOCE.files)>0}">
	<div class="row doc_column_box">
		<div class="col-sm-12">
			<span class="glyphicon glyphicon-paperclip column_title">&nbsp;附件</span>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<hr class="hr_split" />
			<c:set var="isHaveImg" value="false"></c:set>
			<c:set var="isHaveFile" value="false"></c:set>
			<c:set var="fileNum" value="0"></c:set>
			<c:forEach var="node" items="${DOCE.files}" varStatus="status">
				<c:set var="isHaveFile" value="true"></c:set>
				<c:set var="exname"
					value="${fn:toUpperCase(fn:replace(node.exname,'.',''))}"></c:set>
				<c:if
					test="${exname=='PNG'||exname=='JPG'||exname=='JPEG'||exname=='GIF'}">
					<c:set var="isHaveImg" value="true"></c:set>
				</c:if>
				<c:set var="fileNum" value="${fileNum+1}"></c:set>
			</c:forEach>
			<!-- 需要特殊显示的文件_开始 -->
			<table class="table table-bordered table-hover"
				style="font-size: 12px;">
				<tr>
					<td class="active" style="width: 100px;"><b>附件类型</b></td>
					<td><p>
							<c:forEach var="node" items="${FILETYPES}">
								<img style="max-height: 42px; max-width: 42px;" alt="${node}"
									src="<PF:basePath/>text/img/fileicon/${node}.png" />${node}
							</c:forEach>
						</p></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 需要特殊显示的文件_结束 --> <!-- 详细附件列表_开始 --> <c:if
							test="${isHaveFile}">
							<p style="text-align: center;">
								<button type="button" id="ShowAllDocFileId"
									class="btn btn-primary btn-xs">显示附件列表(${fileNum})</button>
							</p>
							<div id="docFilesListPId" style="display: none;">
								<c:forEach var="node" items="${DOCE.files}">
									<p>
										<a href="webdoc/view/PubFile${node.id}.html"><span
											class="glyphicon glyphicon-paperclip"></span> ${node.name}</a>(${node.len}b)
									</p>
								</c:forEach>
							</div>
							<script type="text/javascript">
								$(function() {
									$('#ShowAllDocFileId').bind('click',
											function() {
												$('#docFilesListPId').show();
												$('#ShowAllDocFileId').hide();
											});
								});
							</script>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 详细附件列表_结束 -->
</c:if>