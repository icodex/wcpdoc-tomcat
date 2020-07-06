<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../text/include-web.jsp"></jsp:include>
</head>
<body>
	<div class="page-group">
		<div class="page page-current" id='routers-file-view'>
			<jsp:include page="../commons/head.jsp">
				<jsp:param name="showback" value="true" />
			</jsp:include>
			<jsp:include page="../commons/nav.jsp">
				<jsp:param name="currentIcon" value="0" />
			</jsp:include>
			<div class="content">
				<div class="card-content-inner wcp-content">
					<p class="wcp-title">${DOCE.doc.title}</p>
					<p class="wcp-date">
						${DOCE.doc.cusername}&nbsp;创建知识于
						<PF:FormatTime date="${DOCE.doc.pubtime}"
							yyyyMMddHHmmss="yyyy年MM月dd日" />
						<c:if test="${DOCE.doc.pubtime!=DOCE.texts.etime}">
							,修改于
						<PF:FormatTime date="${DOCE.texts.etime}"
								yyyyMMddHHmmss="yyyy年MM月dd日" />
						</c:if>
					</p>
					<p class="wcp-date">
						<c:forEach var="node" items="${DOCE.currenttypes}"
							varStatus="status">
					/
					<a href="webtype/view${node.id}/Pub1.html" class="external" title="${node.name}">${node.name}</a>
						</c:forEach>
					</p>
					<div>
						<jsp:include page="../know/includeTypeFormView.jsp"></jsp:include>
					</div>
					<div class="wcp-text">
						<DOC:InitHtmlContentTag html="${DOCE.texts.text}"></DOC:InitHtmlContentTag>
					</div>
				</div>

				<c:forEach var="node" items="${DOCE.files}">
					<c:if
						test="${fn:toUpperCase(fn:replace(node.exname,'.',''))=='PNG'||fn:toUpperCase(fn:replace(node.exname,'.',''))=='JPG'||fn:toUpperCase(fn:replace(node.exname,'.',''))=='JPEG'||fn:toUpperCase(fn:replace(node.exname,'.',''))=='GIF'}">
						<div class="card facebook-card">
							<div class="card-header">${node.name}</div>
							<div class="card-content wcp-img-content">
								<img src="${node.medurl}" style="max-width: 100%">
							</div>
							<div class="card-footer no-border">
								<DOC:canDownloadShow docId="${DOCE.doc.id}">
									<a class="link external" style="color: #0894ec"  href="${node.url}">下载 ${node.len/1000}kb</a>
								</DOC:canDownloadShow>
								<DOC:canNoDownloadShow docId="${DOCE.doc.id}">
									<a class="link" >${node.len/1000}kb</a>
								</DOC:canNoDownloadShow>
								<!-- <DOC:canDownloadShow docId="${DOCE.doc.id}">
									<a href="${node.url}" class="link external"><span class="icon icon-download"></span>下载</a>
								</DOC:canDownloadShow>
								<DOC:canViewShow docId="${DOCE.doc.id}">
									<WDA:IsSupport fileid="${node.id}">
										<PF:IfParameterEquals key="config.sys.link.docview.target"
											val="auto">
											<a href="${node.url}" class="link external"><span class="icon icon-download"></span>下载</a>
										</PF:IfParameterEquals>
										<PF:IfParameterNoEquals key="config.sys.link.docview.target"
											val="auto">
											<WDA:IsNotConverterError fileid="${node.id}">
												<a
													href="<WDA:WdaFileViewUrl fileid="${node.id}" docid="${DOCE.doc.id}"></WDA:WdaFileViewUrl>"
													class="link">预览文件</a>
											</WDA:IsNotConverterError>
										</PF:IfParameterNoEquals>
									</WDA:IsSupport>
								</DOC:canViewShow> -->

							</div>
						</div>
					</c:if>
					<c:if
						test="${fn:toUpperCase(fn:replace(node.exname,'.',''))!='PNG'&&fn:toUpperCase(fn:replace(node.exname,'.',''))!='JPG'&&fn:toUpperCase(fn:replace(node.exname,'.',''))!='JPEG'&&fn:toUpperCase(fn:replace(node.exname,'.',''))!='GIF'}">
						<div class="card">
							<div class="card-header">${node.name}</div>
							<div class="card-content">
								<div class="list-block media-list">
									<ul>
										<li class="item-content">
											<div class="item-media">
												<img class="child"
													style="max-height: 120px; max-width: 176px;"
													alt="${node.name}"
													src="text/img/fileicon/${fn:toUpperCase(fn:replace(node.exname,'.',''))}.png" />
											</div>
											<div class="item-inner">
												<div class="item-title-row">
													<div class="item-title">${node.len/1000}kb</div>
												</div>
												<div class="item-subtitle">
													<DOC:canDownloadShow docId="${DOCE.doc.id}">
														<a href="${node.url}" class="link external"><span
															class="icon icon-download"></span>下载</a>
													</DOC:canDownloadShow>
													<DOC:canViewShow docId="${DOCE.doc.id}">
														<WDA:IsSupport fileid="${node.id}">
															<PF:IfParameterEquals
																key="config.sys.link.docview.target" val="auto">
																<a href="${node.url}" class="link external"><span
																	class="icon icon-download"></span>下载</a>
															</PF:IfParameterEquals>
															<PF:IfParameterNoEquals
																key="config.sys.link.docview.target" val="auto">
																<WDA:IsNotConverterError fileid="${node.id}">
																	<a
																		href="<WDA:WdaFileViewUrl fileid="${node.id}" docid="${DOCE.doc.id}"></WDA:WdaFileViewUrl>"
																		class="link  external"><span
																		class="icon icon-computer"></span>预览文件
																	</a>
																</WDA:IsNotConverterError>
															</PF:IfParameterNoEquals>
														</WDA:IsSupport>
													</DOC:canViewShow>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<jsp:include page="../commons/messageForm.jsp"></jsp:include>
				<jsp:include page="../commons/docMessage.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../text/include-webFoot.jsp"></jsp:include>
	<script type='text/javascript' src='view/web-mobile/text/js/docView.js'
		charset='utf-8'></script>
	<script>
		$(function() {
			$.init();
		});
	</script>
</body>
</html>