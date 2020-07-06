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
		<div class="page page-current" id='routers-file-fileview'>
			<jsp:include page="../commons/head.jsp">
				<jsp:param name="showback" value="true" />
			</jsp:include>
			<jsp:include page="../commons/nav.jsp">
				<jsp:param name="currentIcon" value="0" />
			</jsp:include>
			<div class="content">
				<div class="card-content-inner wcp-content">
					<p class="wcp-title">${file.name}</p>

				</div>
				<c:if
					test="${fn:toUpperCase(fn:replace(file.exname,'.',''))=='PNG'||fn:toUpperCase(fn:replace(file.exname,'.',''))=='JPG'||fn:toUpperCase(fn:replace(file.exname,'.',''))=='JPEG'||fn:toUpperCase(fn:replace(file.exname,'.',''))=='GIF'}">
					<img class="img-responsive" id="currentfileImgId"
						style="cursor: pointer; margin: auto;" alt="${file}"
						src="${ROTATE0_URL}" />
					<br />
				</c:if>
				<div class="list-block">
					<ul>
						<li class="item-content">
							<div class="item-inner">
								<div class="item-title">下载量</div>
								<div class="item-after">${file.downum}</div>
							</div>
						</li>
						<li class="item-content">
							<div class="item-inner">
								<div class="item-title">文件大小</div>
								<div class="item-after">${file.len/1000}kb</div>
							</div>
						</li>
						<li class="item-content">
							<div class="item-inner">
								<div class="item-title">创建时间</div>
								<div class="item-after">
									<PF:FormatTime date="${file.ctime}"
										yyyyMMddHHmmss="yyyy-MM-dd HH:mm:ss" />
								</div>
							</div>
						</li>
						<li class="item-content">
							<div class="item-inner">
								<div class="item-title">创建人</div>
								<div class="item-after">${file.cusername}</div>
							</div>
						</li>
						<li class="item-content">
							<div class="item-inner">
								<div class="item-title">扩展名</div>
								<div class="item-after">${file.exname}</div>
							</div>
						</li>
						<li class="item-content">
							<div class="item-inner">
								<div class="item-title">ID</div>
								<div style="font-size: 10px;" class="item-after">${file.id}</div>
							</div>
						</li>
						<li class="item-content">
							<div class="item-inner">
								<div class="item-title">操作</div>
								<div class="item-after">
									<DOC:canDownloadShow docId="${docid}">
										<a target="${config_sys_link_newwindow_target}" href="${file.url}" title="下载" class="external"> 下载</a>
									</DOC:canDownloadShow>
									&nbsp;&nbsp;
									<!-- 预览开始 -->
									<DOC:canViewShow docId="${docid}">
										<WDA:IsSupport fileid="${file.id}">
											<WDA:IsNotConverterError fileid="${file.id}">
												<a target="${config_sys_link_newwindow_target}" title="预览文件" class="external"
													href="<WDA:WdaFileViewUrl fileid='${file.id}' docid='none'></WDA:WdaFileViewUrl>">预览</a>
											</WDA:IsNotConverterError>
										</WDA:IsSupport>
									</DOC:canViewShow>
									<!-- 预览结束 -->
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="content-block">
					<p>
						<a href="webdoc/view/Pub${docid}.html"
							class="button button-big button-round  button-fill"> 立即访问知识</a>
					</p>
				</div>
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