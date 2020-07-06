<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<c:if test="${node.imgurl!=null}">
	<div class="wcp-photo-imgbox">
		<a class="doc_node_title" target="${config_sys_link_newwindow_target}"
			href="webdoc/view/Pub${node.docid}.html"> <img
			alt="${node.title}预览图" class="effect-img"
			src="<PF:basePath/>${node.imgurl}">
		</a>
	</div>
</c:if>
<c:if test="${node.imgurl==null}">
	<div class="wcp-photo-imgbox">
		<a class="doc_node_title" target="${config_sys_link_newwindow_target}"
			href="webdoc/view/Pub${node.docid}.html"> <img
			alt="${node.title}预览图" class="effect-img"
			src="<PF:basePath/>actionImg/PubloadDocImg.do?docid=${node.docid}">
		</a>
	</div>
</c:if>
<div class="wcp-photo-contentbox">
	<div class="wcp-photo-titlebox">
		<span class="wcp-photo-icon"> <c:if test="${node.domtype=='6'}">
				<span class="glyphicon glyphicon-globe"></span>
			</c:if> <c:if test="${node.domtype=='1'}">
				<span class="glyphicon glyphicon-book"></span>
			</c:if> <c:if test="${node.domtype=='5'}">
				<span class="glyphicon glyphicon-folder-close"></span>
			</c:if>
		</span> <a target="${config_sys_link_newwindow_target}"
			href="webdoc/view/Pub${node.docid}.html"> ${node.title}</a>
	</div>
	<div class="wcp-photo-info" style="margin-top: 8px;">
		<a
			href="http://127.0.0.1:8080/wcp/webtype/view${node.typeid}/Pub1.html"
			class="tip" title="${node.title }"> <span>${node.typename}</span>
		</a> <span style="float: right;"> <PF:FormatTime
				date="${node.etime}" yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
		</span>
	</div>
	<div class="wcp-photo-tags">
		<c:forEach var="tag1" items="${fn:split(node.tagkey,',')}">
			<c:forEach var="tag2" items="${fn:split(tag1,'，')}">
				<c:forEach var="tag3" items="${fn:split(tag2,' ')}">
					<span class="label label-default tagsearch" title="${tag3}">${tag3}</span>
				</c:forEach>
			</c:forEach>
		</c:forEach>
	</div>
	<div class="wcp-photo-info">
		<a href="webuser/PubHome.do?userid=${node.userid }" class="tip"
			title="${node.title }" style="float: right;"> <i
			class="glyphicon glyphicon-user"></i> <span>${node.username}</span>
		</a> <span title="评价" style="margin-right: 20px;"> <i
			class="glyphicon glyphicon-star"></i> ${node.evaluate}
		</span> <span title="阅读量" style="margin-right: 20px;"> <i
			class="glyphicon glyphicon-hand-up"></i> ${node.visitnum}
		</span> <span title="评论数" style="margin-right: 20px;"> <i
			class="glyphicon glyphicon-comment"></i> ${node.answeringnum}
		</span>
	</div>
</div>