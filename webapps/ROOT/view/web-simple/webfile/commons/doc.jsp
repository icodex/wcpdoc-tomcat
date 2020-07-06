<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row">
	<div class="col-md-12">
		<c:if test="${DOCE.audit==null }">
			<jsp:include page="../../operation/includeWebFileOperate.jsp"></jsp:include>
		</c:if>
		<c:if test="${DOCE.audit!=null }">
		</c:if>
		<div class="doc_title">${DOCE.doc.title}</div>
		<div class="doc-conentinfo">
			<b>作者:</b>
			<a href="webuser/PubHome.do?type=file&userid=${DOCE.doc.cuser}" title="${DOCE.doc.author}">${DOCE.doc.author}</a>
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
			<jsp:include page="../../know/commons/includeTagInfo.jsp"></jsp:include>
			<c:if test="${DOCE.doc.describetype=='2'}">
				<div class="wcp-doc-describe" >
					${DOCE.doc.docdescribe}</div>
			</c:if> 
		</div>
		<c:if test="${DOCE.audit!=null }">
			<div class="alert alert-warning" role="alert">版本注释：${DOCE.auditTemp.pcontent}</div>
		</c:if>
	</div>
</div>
<hr />
<a name="markdocFile"></a>
<br />
<c:if test="${!empty DOCE.fieldForm.fields}">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<!-- 自定义表单展示 -->
					<jsp:include page="../../know/commons/includeTypeFormView.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</c:if>
<div class="row">
	<div class="col-md-12">
		<div style="text-align: center;">
			<c:if test="${ISALLIMG}">
				<!-- 如果是纯图片就单屏幕显示图片 -->
				<jsp:include page="includeImgs.jsp"></jsp:include>
			</c:if>
			<c:if test="${!ISALLIMG}">
				<!-- 如果是非图片就阵列显示 -->
				<jsp:include page="includeFiles.jsp"></jsp:include>
			</c:if>
		</div>
	</div>
</div>
<div class="panel panel-default" style="padding: 20px;">
	<div class="panel-body">
		<div class="row">
			<div class="col-md-12" id="textsBoxId">
				<c:if test="${(DOCE.texts.text!=null&&DOCE.texts.text!='')||DOCE.imgUrl!=null}">
					<div id="docContentsId" class="ke-content">${DOCE.texts.text}</div>
				</c:if>
				<c:if test="${DOCE.imgUrl!=null }">
					<div style="border-top: 1px dashed #ccc; padding-top: 20px; padding-top: 20px;">
						<img src="${DOCE.imgUrl}" alt="预览图" class="img-thumbnail center-block doc-contentimg" />
					</div>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12"><jsp:include page="../../know/commons/includeOnlyPraiseDoc.jsp"></jsp:include></div>
		</div>
		<c:if test="${fn:length(RELATIONDOCS)>0}">
			<div class="row">
				<div class="col-md-12">
					<jsp:include page="../../know/commons/includeRelationDocOnlyKnow.jsp"></jsp:include>
				</div>
			</div>
		</c:if>
		<div class="row">
			<div class="col-md-12"><jsp:include page="../../know/commons/includeNewComments.jsp"></jsp:include><jsp:include page="../../know/commons/includeCommentsForm.jsp"></jsp:include></div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('#textsBoxId img').addClass("img-responsive");
	});
</script>
