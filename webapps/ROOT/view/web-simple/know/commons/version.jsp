<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="panel panel-default">
	<div class="panel-body">
		<div class="row">
			<div class="col-md-12">
				<div class="doc_title" >
					<span style="color: #d9534f;">
						<PF:FormatTime date="${DOCE.texts.etime}" yyyyMMddHHmmss="yyyy-MM-dd HH:mm:ss" />
						版本
					</span>
					: ${DOCE.doc.title}
				</div>
				<div class="doc-conentinfo" >
					作者:
					<span class="authortagsearch" title="${DOCE.doc.author}">${DOCE.doc.author}</span>
					于
					<PF:FormatTime date="${DOCE.doc.pubtime}" yyyyMMddHHmmss="yyyy年MM月dd日" />
					<b>发布在分类</b>
					<c:forEach var="node" items="${DOCE.currenttypes}" varStatus="status">
					/
					<a href="webtype/view${node.id}/Pub1.html" title="${node.name}">${node.name}</a>
					</c:forEach>
					<b>下,并于</b>
					<PF:FormatTime date="${DOCE.texts.ctime}" yyyyMMddHHmmss="yyyy年MM月dd日" />
					<b>编辑</b>
				</div>
				<jsp:include page="../../know/commons/includeDocVersions.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
<div class="panel panel-default">
	<div class="panel-body">
		<div class="row">
			<div class="col-md-12" id="docContentsId">
				<c:if test="${DOCE.imgUrl!=null}">
					<img class="center-block" alt="${DOCE.doc.title}" src="${DOCE.imgUrl}">
				</c:if>
				<div>
					<jsp:include page="../../operation/includeDocVersionOperate.jsp"></jsp:include>
				</div>
				<div>
					<c:if test="${!empty DOCE.fieldForm.fields}">
						<!--分类自定义表单-->
						<jsp:include page="includeTypeFormView.jsp"></jsp:include>
					</c:if>
					<hr style="clear: both; margin-bottom: 20px; border-top: dashed 1px #ddd;" />
				</div>
				<div class="table-responsive ke-content" style="overflow: auto; border: 0px;">
					<DOC:InitHtmlContentTag html="${DOCE.texts.text}"></DOC:InitHtmlContentTag>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		//分类
		$('.typetagsearch').bind('click', function() {
			luceneSearch('TYPE:' + $(this).attr('title'));
		});
		//作者
		$('.authortagsearch').bind('click', function() {
			luceneSearch('AUTHOR:' + $(this).attr('title'));
		});
		//标签
		$('.tagsearch').bind('click', function() {
			luceneSearch('TAG:' + $(this).attr('title'));
		});
	});
</script>
<script type="text/javascript" charset="utf-8">
	$(function() {
		$("img.lazy").lazyload({
			effect : "fadeIn"
		});
	});
</script>
<script charset="utf-8" src="<PF:basePath/>text/javascript/jquery.lazyload.js?v=1.9.1"></script>