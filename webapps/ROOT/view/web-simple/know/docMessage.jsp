<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>评论-${doc.doc.title}
	<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords" content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author" content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<link rel="stylesheet" href="<PF:basePath/>text/lib/kindeditor/themes/default/default.css" />
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/zh-CN.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-9">
					<div class="panel panel-default" style="padding: 20px;">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<div class="doc_title">
										<a href="webdoc/view/Pub${doc.doc.id}.html"> ${doc.doc.title}</a>
									</div>
									<div class="doc-conentinfo">
										作者:
										<span class="authortagsearch" title="${doc.doc.author}">${doc.doc.author}</span>
										于
										<PF:FormatTime date="${doc.doc.pubtime}" yyyyMMddHHmmss="yyyy年MM月dd日" />
										<b>发布在分类</b>
										<c:forEach var="node" items="${doc.currenttypes}" varStatus="status">
									/
									<a href="webtype/view${node.id}/Pub1.html" title="${node.name}">${node.name}</a>
										</c:forEach>
										<b>下,并于</b>
										<PF:FormatTime date="${doc.texts.ctime}" yyyyMMddHHmmss="yyyy年MM月dd日" />
										<b>编辑</b>
									</div>
									<div style="padding: 2px;">
										<c:forEach items="${doc.tags}" var="node">
											<span class="label label-info typetagsearch" style="cursor: pointer;" title="${node}">${node}</span>
										</c:forEach>
										<span class="badge" title="访问量">
											<span class="glyphicon glyphicon-hand-up"></span>
											&nbsp;${doc.runinfo.visitnum}
										</span>
										<span class="badge" title="评论">
											<span class="glyphicon glyphicon-comment"></span>
											&nbsp;${doc.runinfo.answeringnum}
										</span>
									</div>
									<hr />
								</div>
							</div>
							<jsp:include page="commons/includeComments.jsp"></jsp:include>
							<jsp:include page="commons/includeCommentsForm.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<div class="col-md-3  visible-lg visible-md" style="padding: 1px;">
					<jsp:include page="../commons/includeHotKnowsMin.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(function() {
		//分类
		$('.typetagsearch').bind('click', function() {
			luceneSearch('TAG:' + $(this).attr('title'));
		});
	});
</script>
</html>