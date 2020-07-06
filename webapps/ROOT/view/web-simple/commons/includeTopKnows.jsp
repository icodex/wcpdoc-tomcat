<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<style>
<!--
.top-imgbox {
	padding: 2px;
	padding-top: 0px;
	max-height: 250px;
	overflow: hidden;
}

.top-titlebox {
	text-align: left;
	background-color: #ffffff;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	color: #4d5356;
	padding-top: 6px;
	padding-bottom: 4px;
}

.top-titlebox:HOVER {
	color: #8d9092;
}

.wcp-photo-imgbox {
	border-top: 1px solid #ccc;
}
-->
</style>
<!-- ID,TITLE,DOCDESCRIBE,AUTHOR,PUBTIME,TAGKEY ,IMGID,VISITNUM,PRAISEYES,PRAISENO,HOTNUM,TYPENAME -->
<div style="padding-top: 0px; padding-bottom: 0px;padding-right: 2px;">
	<div class="row">
		<c:forEach var="topDoc" items="${topRecommends}" varStatus="status">
			<c:if test="${topDoc.imgurl!=null}">
				<div class="col-sm-4 top-imgbox">
					<div class="doc_max_box" style="padding: 0px;">
						<div class="wcp-photo-imgbox" style="overflow: hidden;">
							<a class="doc_node_title" target="${config_sys_link_newwindow_target}" href="${topDoc.exlink}">
								<img alt="${topDoc.title}" class="effect-img" src="${topDoc.imgurl}">
							</a>
						</div>
						<a target="${config_sys_link_newwindow_target}" href="${topDoc.exlink}">
							<div class="doc_max_title top-titlebox">
								<jsp:include page="includeKnowIcon.jsp">
									<jsp:param value="${topDoc.domtype}" name="domtype" />
								</jsp:include>
								${topDoc.title}
							</div>
						</a>
						<!-- <div class="doc_max_box_text">
							<span class="doc_node_info"> 阅读(${topDoc.visitnum }) | 评论(${topDoc.answeringnum }) </span>
							<DOC:Describe maxnum="40" text="${topDoc.text }"></DOC:Describe>
						</div> -->
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
<script src="view/web-style/text/wcp-photoImgs.js"></script>
<script type="text/javascript">
	$(function() {
		initPhotoImgsSize('.wcp-photo-imgbox');
		$(window).resize(function() {
			initPhotoImgsSize('.wcp-photo-imgbox');
		});
		$(".effect-img").load(function() {
			initPhotoImgSize($(this).parents('.wcp-photo-imgbox'));
		});
	});
</script>