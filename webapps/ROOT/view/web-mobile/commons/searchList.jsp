<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<c:if test="${word!=null}">
	<div class="card">
		<div class="card-content">
			<div class="card-content-inner">检索到${result.totalSize}条结果,用时${result.runtime}毫秒</div>
		</div>
	</div>
</c:if>
<c:if test="${word==null}">
	<div class="card">
		<div class="card-content">
			<div class="card-content-inner">请输入关键字后进行检索</div>
		</div>
	</div>
</c:if>
<div class="stream-list p-stream " id="wcp-doc-list">
	<c:forEach items="${result.resultList}" var="node">
		<c:if test="${node.DOMTYPE=='file'}">
			<c:set var="url" value="webdoc/view/PubFile${node.ID}.html"></c:set>
			<c:set var="imgurl" value="view/web-mobile/text/icon/attachment.png"></c:set>
		</c:if>
		<c:if test="${node.DOMTYPE=='fqa'}">
			<c:set var="url" value="webquest/fqa/Pub${node.ID}.html"></c:set>
			<c:set var="imgurl" value="view/web-mobile/text/icon/help.png"></c:set>
		</c:if>
		<c:if test="${node.DOMTYPE!='file'&&node.DOMTYPE!='fqa'}">
			<c:set var="url" value="webdoc/view/Pub${node.ID}.html"></c:set>
			<c:set var="imgurl" value="view/web-mobile/text/icon/form.png"></c:set>
		</c:if>
		<!-- 卡片 -->
		<div class="card ">
			<div class="card-header no-border">
				<div class="facebook-avatar wcp-auther-img">
					<img src="${imgurl}" />
				</div>
				<div class="facebook-avatar ">
					<div class="facebook-name wcp-auther-name">${node.AUTHOR}</div>
				</div>
				<div class="facebook-date wcp-auther-name">
					<PF:FormatTime date="${node.PUBTIME}"
						yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
				</div>
			</div>
			<div class="card-header">
				<a class="wcp-card-title" href="${url}"><nobr>${node.TITLE}</nobr></a>
			</div>
			<div class="card-content">
				<div class="card-content-inner">
					<a href="${url}">${fun:replace(node.DOCDESCRIBE,'[ANSWER]','<span class="text-success">最佳答案</span>')}
					</a>
				</div>
			</div>
			<div class="card-footer no-border">
				<span class="link wcp-type-tip">${node.TYPENAME}</span>
			</div>
		</div>
	</c:forEach>
</div>
<c:if test="${fun:length(result.resultList)>=10}">
	<div class="infinite-scroll-preloader">
		<div class="preloader"></div>
	</div>
</c:if>