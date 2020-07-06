<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="stream-list p-stream " id="wcp-doc-list">
	<c:forEach items="${docs.resultList}" var="node">
		<div class="card ">
			<div class="card-header no-border">
				<div class="facebook-avatar wcp-auther-img">
					<!-- <img src="${node.PHOTOURL}" alt="${node.USERNAME}"> -->
					<c:if test="${node.PSTATE==2}">
						<img src="view/web-mobile/text/icon/success.png" width="32">
					</c:if>
					<c:if test="${node.PSTATE==1}">
						<img src="view/web-mobile/text/icon/help.png" width="32">
					</c:if>
				</div>
				<div class="facebook-avatar ">
					<div class="facebook-name wcp-auther-name">${node.USERNAME}</div>
				</div>
				<div class="facebook-date wcp-auther-name">
					<PF:FormatTime date="${node.PUBTIME}"
						yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
				</div>
			</div>
			<div class="card-header">
				<a class="wcp-card-title"
					href="webquest/fqa/Pub${node.QUESTIONID}.html"><nobr>${node.TITLE}</nobr></a>
			</div>
			<div class="card-content">
				<div class="card-content-inner">
					<a href="webquest/fqa/Pub${node.QUESTIONID}.html"> <DOC:Describe
							maxnum="100" text="${node.SHORTDESC}"></DOC:Describe>
					</a>
				</div>
			</div>
			<div class="card-footer no-border">
				<span class="link wcp-type-tip">阅读(${node.VISITNUM}) </span> <span
					class="link wcp-type-tip">回答(${node.ANSWERS})</span>
			</div>
		</div>
	</c:forEach>
</div>
<c:if test="${fun:length(docs.resultList)>=10}">
	<div class="infinite-scroll-preloader">
		<div class="preloader"></div>
	</div>
</c:if>