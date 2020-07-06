<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<c:if test="${fn:length(topRecommends)>0}">
	<div class="wcp-zebra-2">
		<div class="container">
			<div class="row wcp-margin-top8">
				<div class="col-lg-12">
					<div>
						<div class="row"> 
							<c:forEach var="topDoc" items="${topRecommends}"
								varStatus="status">
								<c:if test="${topDoc.imgurl!=null}">
									<div class="col-xs-3 top-imgbox" style="padding-left: 4px;padding-right: 4px;">
										<div class="doc_max_box">
											<div class="wcp-photo-imgbox" style="overflow: hidden;">
												<a class="doc_node_title"
													target="${config_sys_link_newwindow_target}"
													href="${topDoc.exlink}"> <img alt="${topDoc.title}"
													class="effect-img" src="${topDoc.imgurl}">
												</a>
											</div>
											<a target="${config_sys_link_newwindow_target}"
												href="${topDoc.exlink}">
												<div class="doc_max_title top-titlebox"
													style="text-align: center; font-size: 14px;padding-top:4px;; height: 22px; overflow: hidden; color: #9b9ea0">
													<jsp:include
														page="../../web-simple/commons/includeKnowIcon.jsp">
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
				</div>
			</div>
		</div>
	</div>
</c:if>
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