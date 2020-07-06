<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container">
	<div class="row" style="margin-top: 70px;">
		<div class="col-md-12 text-center">
			<c:if test="${last!=null}">
				<a href="webdoc/view/PubFile${last.id}.html?docid=${docid}"
					type="button" class="btn btn-info btn-sm"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a>
			</c:if>
			<c:if test="${docid!=null}">
				<a href="webdoc/view/Pub${docid}.html" type="button"
					class="btn btn-info btn-sm">返回知识</a>
			</c:if>
			<c:if test="${next!=null}">
				<a href="webdoc/view/PubFile${next.id}.html?docid=${docid}"
					type="button" class="btn btn-info btn-sm"><span
					class="glyphicon glyphicon-chevron-right"></span></a>
			</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4"></div>
	</div>
	<div class="row" style="margin-top: 4px;">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row doc_column_box">
						<div class="col-sm-12 hidden-sm hidden-xs">
							<div style="text-align: center;">
								<span class="column_title">${file.name}</span>
								<hr class="hr_split" />
								<!-- wda预览逻辑----------开始 -->
								<DOC:canViewShow docId="${docid}">
									<WDA:IsSupport fileid="${file.id}">
										<WDA:IsNotConverterError fileid="${file.id}">
											<c:set value="true" var="IsView" scope="page"></c:set>
										</WDA:IsNotConverterError>
									</WDA:IsSupport>
								</DOC:canViewShow>
								<!-- 可以预览 -->
								<c:if test="${IsView}">
									<jsp:include page="includeOnlineView.jsp">
										<jsp:param value="${file.id}" name="fileid" />
										<jsp:param value="${docid}" name="docid" />
										<jsp:param value="${file.len}" name="doclen" />
										<jsp:param value="${file.url}" name="fileurl" />
										<jsp:param value="true" name="isfile" />
									</jsp:include>
								</c:if>
								<!-- 可以预览 -->
								<c:if test="${!IsView}">
									<img style="max-height: 128px; max-width: 128px;" alt="${file}"
										src="text/img/fileicon/${fn:toUpperCase(fn:replace(file.exname,'.',''))}.png" />
								</c:if>
								<!-- wda预览逻辑----------结束 -->
							</div>
						</div>
						<div class="col-sm-12 hidden-md hidden-lg">
							<div style="text-align: center;">
								<img style="max-height: 128px; max-width: 128px;" alt="${file}"
									src="text/img/fileicon/${fn:toUpperCase(fn:replace(file.exname,'.',''))}.png" />
								<hr class="hr_split" />
								<span class="column_title">${file.name}</span>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top: 8px;">
						<div class="col-md-12 table-responsive">
							<table class="table table-bordered table-hover"
								style="font-size: 12px;">
								<tr>
									<td class="active" style="width: 100px;"><b>名称</b></td>
									<td style="width: 35%">${file.name}</td>
									<td class="active" style="width: 100px;"><b>下载量</b></td>
									<td style="width: 35%">${file.downum}</td>
								</tr>
								<tr class="downloadButton_wcp">
									<td class="active" style="width: 100px;"><b>操作</b></td>
									<td><DOC:canDownloadShow docId="${docid}">
											<a href="${file.url}" title="下载"><span
												class="glyphicon glyphicon-download-alt"></span>&nbsp;下载</a>
										</DOC:canDownloadShow> &nbsp;&nbsp; <!-- 预览开始 --> <DOC:canViewShow docId="${docid}">
											<WDA:IsSupport fileid="${file.id}">
												<WDA:IsNotConverterError fileid="${file.id}">
													<a target="${config_sys_link_newwindow_target}"
														title="预览文件"
														href="<WDA:WdaFileViewUrl fileid='${file.id}' docid='none'></WDA:WdaFileViewUrl>"><span
														class="glyphicon glyphicon-eye-open"></span>&nbsp;预览</a>
												</WDA:IsNotConverterError>
											</WDA:IsSupport>
										</DOC:canViewShow> <!-- 预览结束 --> <!-- 重新生成预览文件 开始 --> <DOC:canDelIsShow
											docId="${docid}">
											<DOC:canViewShow docId="${docid}">
												<WDA:IsSupport fileid="${file.id}">
													&nbsp;&nbsp; <a title="重新生成预览文件"
														href="webdoc/view/PubReViews${file.id}.html"><span
														class="glyphicon glyphicon-refresh"></span>&nbsp;重置</a>
												</WDA:IsSupport>
											</DOC:canViewShow>
											<WDA:IsSupport fileid="${file.id}">
													&nbsp; &nbsp; <a
													target="${config_sys_link_newwindow_target}" title="预览日志信息"
													href="<WDA:WdaLogViewUrl fileid="${file.id}"></WDA:WdaLogViewUrl>"><span
													class="glyphicon glyphicon-info-sign"></span>&nbsp;日志</a>
											</WDA:IsSupport>
										</DOC:canDelIsShow> <!-- 重新生成预览文件 结束 --></td>
									<td class="active" style="width: 100px;"><b>文件大小</b></td>
									<td><fmt:formatNumber type="number"
											value="${file.len/1024/1024}" pattern="0.00"
											maxFractionDigits="2" />MB</td>
								</tr>
								<tr>
									<td class="active" style="width: 100px;"><b>创建时间</b></td>
									<td><PF:FormatTime date="${file.ctime}"
											yyyyMMddHHmmss="yyyy-MM-dd HH:mm:ss" /></td>
									<td class="active" style="width: 100px;"><b>创建人</b></td>
									<td>${file.cusername}</td>
								</tr>
								<tr>
									<td class="active" style="width: 100px;"><b>扩展名</b></td>
									<td>${file.exname}</td>
									<td class="active" style="width: 100px; word-wrap: break-word;"><b>ID</b></td>
									<td style="font-size: 8px;">${file.id}</td>
								</tr>
								<c:if test="${convertlog!=null }">
									<tr>
										<td class="active" style="width: 100px;"><b>预览状态</b></td>
										<td><PF:runDictionaryByStr
												dicStr="0:初始化,1:可以转换,2:提交转换,3:转换完成,10:转换失败,11:禁止转换,12:不支持转换,13:文件传输中"
												val="${convertlog.pstate}" /></td>
										<td class="active" style="width: 100px;"><b>预览文件id</b></td>
										<td>${convertlog.appid}</td>
									</tr>
								</c:if>
								<c:if test="${filetext!=null }">
									<tr>
										<td class="active" style="width: 100px;"><b>索引状态</b></td>
										<td><PF:runDictionaryByStr dicStr="1:已索引,0:未索引,2:未知"
												val="${filetext.indexed}" /></td>
										<td class="active" style="width: 100px;"><b>附件文本</b></td>
										<td><DOC:Describe maxnum="50"
												text="${filetext.describes}"></DOC:Describe></td>
									</tr>
								</c:if>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>