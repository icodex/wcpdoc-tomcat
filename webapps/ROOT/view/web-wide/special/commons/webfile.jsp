<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="row">
	<div class="col-md-12">
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
			<jsp:include page="../../../web-simple/know/commons/includeTagInfo.jsp"></jsp:include>
		</div>
		<c:if test="${DOCE.audit!=null }">
			<div class="alert alert-warning" role="alert">版本注释：${DOCE.auditTemp.pcontent}</div>
		</c:if>
	</div>
</div>
<hr />
<a name="markdocFile"></a>
<br />
<div class="row">
	<div class="col-md-12">
		<div style="text-align: center;">
			<c:if test="${ISALLIMG}">
				<!-- 如果是纯图片就单屏幕显示图片 -->
				<jsp:include page="../../../web-simple/webfile/commons/includeImgs.jsp"></jsp:include>
			</c:if>
			<c:if test="${!ISALLIMG}">
				<!-- 如果是非图片就阵列显示 -->
				<jsp:include page="../../../web-simple/webfile/commons/includeFiles.jsp"></jsp:include>
			</c:if>
		</div>
	</div>
</div>
<c:if test="${DOCE.texts.text!=null&&DOCE.texts.text!=''}">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="col-md-12" id="textsBoxId">
					<c:if test="${DOCE.imgUrl!=null }">
						<br />
						<img src="${DOCE.imgUrl}" alt="预览图" class="img-thumbnail center-block doc-contentimg" />
						<hr />
					</c:if>
					<div id="docContentsId" class="ke-content">${DOCE.texts.text}</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
<script type="text/javascript">
	$(function() {
		$('#textsBoxId img').addClass("img-responsive");
	});
</script>
