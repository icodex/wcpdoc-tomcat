<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="row" style="padding-left: 14px;">
	<c:if test="${!empty topRecommends}">
		<c:forEach var="topDoc" items="${topRecommends}" varStatus="status">
			<div class="col-md-4 wcp-photo-col">
				<div class="wcp-photo-box">
					<!-- up -->
					<c:if test="${topDoc.imgurl!=null}">
						<div class="wcp-photo-imgbox">
							<a class="doc_node_title"
								target="${config_sys_link_newwindow_target}"
								href="${topDoc.exlink}"> <img alt="${topDoc.title}"
								class="effect-img" src="${topDoc.imgurl}">
							</a>
						</div>
					</c:if>
					<div class="wcp-photo-contentbox">
						<div class="wcp-photo-titlebox">
							<a target="${config_sys_link_newwindow_target}"
								href="${topDoc.exlink}">${topDoc.title}</a>
						</div>
						<div class="wcp-photo-info" style="margin-top: 8px;">
							<span><i class="glyphicon glyphicon-star"></i> ${topDoc.domtype}</span> <span style="float: right;">
								<PF:FormatTime date="${topDoc.etime}"
									yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
							</span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>
<script src="view/web-style/text/wcp-photoImgs.js"></script>
<script type="text/javascript">
	$(function() {
		initPhotoImgsSize('.wcp-photo-imgbox');
		$(window).resize(function() {
			initPhotoImgsSize('.wcp-photo-imgbox');
		});
		$("img").load(function() {
			initPhotoImgSize($(this).parents('.wcp-photo-imgbox'));
		});
	});
</script>