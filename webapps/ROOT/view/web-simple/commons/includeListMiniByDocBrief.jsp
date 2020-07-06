<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<style>
.tagsearch {
	cursor: pointer;
	padding: 2px;
	padding-left: 4px;
	padding-right: 4px;
	font-size: 12px;
	background-color: #aaa;
}

.wcp-typetop {
	font-size: 18px;
	padding-left: 6px;
	padding-right: 6px;
	padding-top: 2px;
	padding-bottom: 1px;
}

.doc_brief .media-body {
	padding-top: 10px;
	padding-bottom: 10px;
}
.doc_brief .doc_node_title {
	font-size: 14px;
}
.doc_node_title_box code {
	font-size: 12px;
}
.doc_node_title_box {
	margin-bottom: 4px; 
}
.wcp-typetop{
	font-size: 14px;
}
</style>
<div class="doc_brief" style="padding-top: 8px;">
	<c:forEach items="${docbriefs}" var="node">
		<div class="stream-item" id="loop-30">
			<div class="media">
				<div class="media-body">
					<div style="margin-left: 4px;" class="pull-left">
						<div class="doc_node_title_box">
							<a class="doc_node_title"
								target="${config_sys_link_newwindow_target}"
								href="webdoc/view/Pub${node.docid}.html"> <c:if
									test="${node.sort!=null }">
									<span class="label label-danger wcp-typetop">置顶</span>
								</c:if> 
								<jsp:include page="includeKnowIcon.jsp">
									<jsp:param value="${node.domtype}" name="domtype" />
								</jsp:include> ${node.title}
							</a>&nbsp;&nbsp;
							<span style="font-size: 12px;color: #bbbbbb;font-weight: 500;"><span title="评价"> <i
								class="glyphicon glyphicon-star"></i> ${node.evaluate}
							</span> <span title="阅读量"> <i class="glyphicon glyphicon-hand-up"></i>
								${node.visitnum}
							</span> <span title="评论数"> <i class="glyphicon glyphicon-comment"></i>
								${node.answeringnum}
							</span> &nbsp;&nbsp; <PF:FormatTime date="${node.etime}" 
								yyyyMMddHHmmss="yyyy-MM-dd HH:mm" /></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<script src="view/web-style/text/wcp-photoImgs.js"></script>
<script type="text/javascript">
	$(function() {
		//标签
		$('.tagsearch').bind('click', function() {
			luceneSearch('TAG:' + $(this).text());
		});
		//格式化知识图片
		initPhotoImgsSize('.effect-img-box');
		$(window).resize(function() {
			initPhotoImgsSize('.effect-img-box');
		});
		$(".effect-img").load(function() {
			initPhotoImgSize($(this).parents('.effect-img-box'));
		});
	});
</script>