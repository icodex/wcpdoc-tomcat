<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="stream-list p-stream " id="wcp-doc-list">
	<c:forEach items="${docbriefs}" var="node">
		<div class="card ">
			<div class="card-header no-border">
				<div class="facebook-avatar wcp-auther-img">
					<img src="${node.photourl}" alt="${node.username}">
				</div>
				<div class="facebook-avatar ">
					<div class="facebook-name wcp-auther-name">${node.username}</div>
				</div>
				<div class="facebook-date wcp-auther-name">
					<PF:FormatTime date="${node.etime}" yyyyMMddHHmmss="yyyy/MM/dd HH:mm" />
				</div>
			</div>
			<div class="card-header">
				<a class="wcp-card-title" href="webdoc/view/Pub${node.docid}.html">
					<nobr>${node.title}</nobr>
				</a>
			</div>
			<div class="card-content">
				<div class="card-content-inner">
					<a href="webdoc/view/Pub${node.docid}.html">
						<c:if test="${node.imgurl!=null}">
							<div style="text-align: center;">
								<img style="max-height: 300px;max-width: 100%;" alt="${node.title}预览图" src="<PF:basePath/>${node.imgurl}">
							</div>
						</c:if>
						<DOC:Describe maxnum="100" text="${node.docdescribe}"></DOC:Describe>
					</a>
				</div>
			</div>
			<div class="card-footer no-border">
				<span class="link wcp-type-tip">阅读(${node.visitnum }) </span>
				<span class="link wcp-type-tip">评论(${node.answeringnum })</span>
			</div>
		</div>
	</c:forEach>
</div>
<c:if test="${fun:length(docbriefs)>=10}">
	<div class="infinite-scroll-preloader">
		<div class="preloader"></div>
	</div>
</c:if>