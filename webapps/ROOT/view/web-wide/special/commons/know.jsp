<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<style>
<!--
.inner-img {
	cursor: pointer;
}
-->
</style>
<!-- 展示知识内容 -->
<div class="row ">
	<div class="col-md-12">
		<div class="doc_title">${DOCE.doc.title}</div>
		<div class="doc-conentinfo">
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
			<jsp:include page="../../../web-simple/know/commons/includeTagInfo.jsp"></jsp:include>
		</div>
		<hr />
		<!-- 当前版本就是待审核版本，且当前知识是待审核状态-->
		<c:if test="${DOCE.texts.id==DOCE.auditTemp.id&&DOCE.auditTemp!=null}">
			<c:if test="${TYPE!='AUDIT' }">
				<div class="alert alert-danger" role="alert">该版本已经提交审核，请等待管理员审核。</div>
			</c:if>
			<div class="alert alert-warning" role="alert">版本注释：${DOCE.auditTemp.pcontent}</div>
		</c:if>
	</div>
</div>
<div class="row ke-content" style="margin-left: -18px; margin-right: -18px;">
	<!-- 当前版本就是待审核版本，或者知识非审核状态 -->
	<c:if test="${DOCE.texts.id==DOCE.auditTemp.id||DOCE.auditTemp==null}">
		<div class="col-md-12" id="docContentsId">
			<DOC:InitHtmlContentTag html="${DOCE.texts.text}"></DOC:InitHtmlContentTag>
			<c:if test="${DOCE.imgUrl!=null }">
				<hr />
				<img src="${DOCE.imgUrl}" alt="预览图" class="img-thumbnail center-block doc-contentimg" />
			</c:if>
		</div>
	</c:if>
	<!-- 知识当前版本和审核版本不同，且，审核版本存在(文章是待审核状态) -->
	<c:if test="${DOCE.texts.id!=DOCE.auditTemp.id&&DOCE.auditTemp!=null}">
		<div class="col-md-12" id="docContentsId">
			<div>
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" style="text-decoration: none;">
							待审核版本：
							<PF:FormatTime date="${DOCE.auditTemp.ctime}" yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
						</a>
					</li>
					<li role="presentation">
						<a href="#home" aria-controls="home" role="tab" data-toggle="tab" style="text-decoration: none;">
							当前版本：
							<PF:FormatTime date="${DOCE.texts.ctime}" yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
						</a>
					</li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="profile">
						<div class="panel panel-default" style="border-top: 0px;">
							<div class="panel-body">
								<div class="alert alert-warning" role="alert">${DOCE.auditTemp.pcontent}</div>
								<DOC:InitHtmlContentTag html="${DOCE.auditTemp.text}"></DOC:InitHtmlContentTag>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="home">
						<div class="panel panel-default" style="border-top: 0px;">
							<div class="panel-body">
								<div class="alert alert-info" role="alert">${DOCE.texts.pcontent}</div>
								<DOC:InitHtmlContentTag html="${DOCE.texts.text}"></DOC:InitHtmlContentTag>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
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
		//图片点击
		$('.inner-img').bind(
				'click',
				function() {
					window.location =  basePath+"webdoc/view/PubFile"
							+ $(this).attr("id") + ".html";
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