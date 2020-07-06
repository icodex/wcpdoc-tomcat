<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="row" style="margin-bottom: 20px;">
	<c:forEach items="${docbriefs}" var="node">
		<div class="col-md-4 wcp-photo-col">
			<div class="wcp-photo-box">
				<%@ include
					file="/view/web-style/photos/commons/includePhotoDocBrief.jsp"%>
			</div>
		</div>
	</c:forEach>
</div>
<script src="view/web-style/text/wcp-photoImgs.js"></script>
<script type="text/javascript">
	$(function() {
		$('.gridimg').each(function(i, obj) {
			var wid = $(obj).width();
			var hei = wid / 420 * 297;
			$(obj).height(hei);
		});
		//标签
		$('.tagsearch').bind('click', function() {
			luceneSearch('TAG:' + $(this).text());
		});
	});
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