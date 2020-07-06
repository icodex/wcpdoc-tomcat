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
</style>
<div class="stream-list p-stream doc_brief">
	<c:forEach items="${docbriefs}" var="node">
		<div class="stream-item" id="loop-30">
			<div class="media">
				<c:if test="${node.imgurl!=null}">
					<div class="pull-right hidden-xs doc-brief-imgbox">
						<div class="effect-img-box"
							style="width: 100%; overflow: hidden; padding-top: 6px;">
							<a class="doc_node_title"
								target="${config_sys_link_newwindow_target}"
								href="webdoc/view/Pub${node.docid}.html"> <img
								class="effect-img" alt="${node.title}预览图"
								src="<PF:basePath/>${node.imgurl}">
							</a>
						</div>
					</div>
				</c:if>
				<div class="media-body">
					<div style="margin-left: 4px;" class="pull-left">
						<div class="doc_node_title_box">
							<a class="doc_node_title" target="${config_sys_link_newwindow_target}" href="webdoc/view/Pub${node.docid}.html">
								<c:if test="${node.sort!=null }">
									<span class="label label-danger wcp-typetop">置顶</span>
								</c:if>
								<jsp:include page="includeKnowIcon.jsp">
									<jsp:param value="${node.domtype}" name="domtype" />
								</jsp:include>  
								${node.title}
							</a>
						</div>
						<c:if test="${node.formFields!=null}">
							<div>
								<c:forEach items="${node.formFields}" var="field">
									<code>${field}</code>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${node.docdescribe!=null&&node.docdescribe!=''}">
							<div>
								<p class="doc_node_content" style="margin-bottom: 4px; height: auto;">
									<c:if test="${node.docpopis!='1'&&node.docpopis!='3'}">
										<DOC:Describe maxnum="170" text="${node.docdescribe}"></DOC:Describe>
									</c:if>
									<c:if test="${node.docpopis=='1'||node.docpopis=='3'}">
										<span style="color: #8c6d3b;" > 
											[该知识已定义阅读权限,请点击进入访问...]</span> 
									</c:if>
								</p>
							</div>
						</c:if>
						<div style="max-height: 48px; overflow: hidden; margin-bottom: 4px;">
							<c:forEach var="tag1" items="${fn:split(node.tagkey,',')}">
								<c:forEach var="tag2" items="${fn:split(tag1,'，')}">
									<c:forEach var="tag3" items="${fn:split(tag2,' ')}">
										<span class="label label-default tagsearch" title="${tag3}">${tag3}</span>
									</c:forEach>
								</c:forEach>
							</c:forEach>
						</div>
						<div class="side_unit_info side_unit_info_left_box">
							<a href="webuser/PubHome.do?userid=${node.userid }" class="tip"
								title="${node.title }"> <i class="glyphicon glyphicon-user"></i>
								<span>${node.username}</span>
							</a> &nbsp;&nbsp;&nbsp;
							<PF:FormatTime date="${node.etime}"
								yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
							&nbsp;&nbsp;&nbsp; <a href="webtype/view${node.typeid}/Pub1.html">
								來源: <span class="tip">${node.typename}</span>
							</a> &nbsp;&nbsp;&nbsp; <span title="评价"> <i
								class="glyphicon glyphicon-star"></i> ${node.evaluate}
							</span> <span title="阅读量"> <i class="glyphicon glyphicon-hand-up"></i>
								${node.visitnum}
							</span> <span title="评论数"> <i class="glyphicon glyphicon-comment"></i>
								${node.answeringnum}
							</span>
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