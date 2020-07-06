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
<div class="row">
	<div class="col-md-12">
		<c:if test="${DOCE.audit==null }">
			<jsp:include page="../../operation/includeDocOperate.jsp"></jsp:include>
		</c:if>
		<c:if test="${DOCE.audit!=null }">
			<!-- 审核的操作按钮 -->
			<jsp:include page="../../operation/includeDocAuditOperate.jsp"></jsp:include>
		</c:if>
	</div>
</div>
<!-- 展示知识内容 -->
<div class="row ">
	<div class="col-md-12">
		<div class="doc_title">${DOCE.doc.title}</div>
		<div class="doc-conentinfo">
			<c:if test="${DOCE.doc.source!=null}">
				<div>
					<b>来源:</b>${DOCE.doc.source}
				</div>
			</c:if>
			作者: <span class="authortagsearch" title="${DOCE.doc.author}">${DOCE.doc.author}</span>
			于
			<PF:FormatTime date="${DOCE.doc.pubtime}"
				yyyyMMddHHmmss="yyyy年MM月dd日" />
			<b>发布在分类</b>
			<c:forEach var="node" items="${DOCE.currenttypes}" varStatus="status">
					/
					<a href="webtype/view${node.id}/Pub1.html" title="${node.name}">${node.name}</a>
			</c:forEach>
			<b>下,并于</b>
			<PF:FormatTime date="${DOCE.texts.ctime}"
				yyyyMMddHHmmss="yyyy年MM月dd日" />
			<b>编辑</b>
			<jsp:include page="includeTagInfo.jsp"></jsp:include>
			<c:if test="${DOCE.doc.describetype=='2'}">
				<div class="wcp-doc-describe">${DOCE.doc.docdescribe}</div>
			</c:if>
		</div>
		<!-- 当前版本就是待审核版本，且当前知识是待审核状态-->
		<c:if test="${DOCE.texts.id==DOCE.auditTemp.id&&DOCE.auditTemp!=null}">
			<c:if test="${TYPE!='AUDIT' }">
				<!-- 0待审核、1审核中、2审核通过、3审核未通过、4废弃 -->
				<div class="alert alert-danger" role="alert">
					<c:if test="${DOCE.audit!=null&&DOCE.audit.pstate=='3' }">
						该版本审核未通过，审核备注：${DOCE.audit.pcontent}
					</c:if>
					<c:if test="${DOCE.audit!=null&&DOCE.audit.pstate=='2' }">
						该版本已审核通过，审核备注：${DOCE.audit.pcontent}
					</c:if>
					<c:if test="${DOCE.audit==null||(DOCE.audit.pstate!='3'&&DOCE.audit.pstate!='2' )}">
						该版本已经提交审核，请等待管理员审核。
					</c:if>
				</div>
			</c:if>
			<div class="alert alert-warning" role="alert">版本注释：${DOCE.auditTemp.pcontent}</div>
		</c:if>
	</div>
</div>
<div class="row" style="margin-left: -18px; margin-right: -18px;">
	<!-- 当前版本就是待审核版本，或者知识非审核状态 -->
	<c:if test="${DOCE.texts.id==DOCE.auditTemp.id||DOCE.auditTemp==null}">
		<div class="col-md-12" id="docContentsId">
			<!-- 自定义表单展示 -->
			<c:if test="${!empty DOCE.fieldForm.fields}">
				<jsp:include page="includeTypeFormView.jsp"></jsp:include>
			</c:if>
			<hr
				style="clear: both; margin-bottom: 20px; border-top: dashed 1px #ddd;" />
			<div class="ke-content currentVersion">
				<DOC:InitHtmlContentTag html="${DOCE.texts.text}"></DOC:InitHtmlContentTag>
			</div>
			<c:if test="${DOCE.imgUrl!=null }">
				<hr style="clear: both;" />
				<div style="padding-top: 16px;">
					<img src="${DOCE.imgUrl}" alt="预览图"
						class="img-thumbnail center-block doc-contentimg" />
				</div>
			</c:if>
		</div>
	</c:if>
	<!-- 知识当前版本和审核版本不同，且，审核版本存在(文章是待审核状态) -->
	<c:if test="${DOCE.texts.id!=DOCE.auditTemp.id&&DOCE.auditTemp!=null}">
		<div class="col-md-12" id="docContentsId">
			<div>
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#profile"
						aria-controls="profile" role="tab" data-toggle="tab"
						style="text-decoration: none;"> 待审核版本： <PF:FormatTime
								date="${DOCE.auditTemp.ctime}" yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
					</a></li>
					<li role="presentation"><a href="#home" aria-controls="home"
						role="tab" data-toggle="tab" style="text-decoration: none;">
							当前版本： <PF:FormatTime date="${DOCE.texts.ctime}"
								yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
					</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="profile">
						<div class="panel panel-default" style="border-top: 0px;">
							<div class="panel-body">
								<!-- 0待审核、1审核中、2审核通过、3审核未通过、4废弃 -->
								<div class="alert alert-danger" role="alert">
									<c:if test="${DOCE.audit!=null&&DOCE.audit.pstate=='3' }">
										该版本审核未通过，审核备注：${DOCE.audit.pcontent}
									</c:if>
									<c:if test="${DOCE.audit!=null&&DOCE.audit.pstate=='2' }">
										该版本已审核通过，审核备注：${DOCE.audit.pcontent}
									</c:if>
									<c:if test="${DOCE.audit==null||(DOCE.audit.pstate!='3'&&DOCE.audit.pstate!='2' )}">
										该版本已经提交审核，请等待管理员审核。
									</c:if>
								</div>
								<div class="alert alert-warning" role="alert">${DOCE.auditTemp.pcontent}</div>
								<!-- 自定义表单展示 -->
								<c:if test="${!empty DOCE.auditFieldForm.fields}">
									<jsp:include page="includeTypeFormViewTemp.jsp"></jsp:include>
								</c:if>
								<hr
									style="clear: both; margin-bottom: 20px; border-top: dashed 1px #ddd;" />
								<div class="ke-content">
									<DOC:InitHtmlContentTag html="${DOCE.auditTemp.text}"></DOC:InitHtmlContentTag>
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="home">
						<div class="panel panel-default" style="border-top: 0px;">
							<div class="panel-body">
								<div class="alert alert-info" role="alert">${DOCE.texts.pcontent}</div>
								<!-- 自定义表单展示 -->
								<c:if test="${!empty DOCE.fieldForm.fields}">
									<jsp:include page="includeTypeFormView.jsp"></jsp:include>
								</c:if>
								<hr
									style="clear: both; margin-bottom: 20px; border-top: dashed 1px #ddd;" />
								<div class="ke-content">
									<DOC:InitHtmlContentTag html="${DOCE.texts.text}"></DOC:InitHtmlContentTag>
								</div>
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
		$('.currentVersion .inner-img').bind(
				'click',
				function() {
					window.location = basePath + "webdoc/view/PubFile"
							+ $(this).attr("id") + ".html";
				});
		//版本审核时第二个页签中的图片直接加载
		$('#home img').each(function(i, obj) {
			if ($(obj).attr('data-original')) {
				$(obj).attr('src', $(obj).attr('data-original'));
			}
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
<script type="text/javascript">
	var baseUrl = '<PF:basePath/>';
</script>
<script charset="utf-8"
	src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-relation-viewer.js"></script>
<script charset="utf-8"
	src="<PF:basePath/>text/javascript/jquery.lazyload.js?v=1.9.1"></script>