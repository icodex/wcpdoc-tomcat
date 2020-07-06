<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<c:forEach var="topDoc" items="${topMaxs}" varStatus="status">
	<div class="card">
		<div class="card-header">
			<a
				class="wcp-card-title ${fn:startsWith(topDoc.exlink,'http')?'link external':''}"
				href="${topDoc.exlink}"> <nobr>${topDoc.title}</nobr>
			</a>
		</div>
		<c:if test="${topDoc.imgurl!=null}">
			<div class="card-content">
				<div class="card-content-inner" style="text-align: center;">
					<a href="${topDoc.exlink}"
						class="${fn:startsWith(topDoc.exlink,'http')?'link external':''}">
						<img style="max-height: 300px; max-width: 100%;"
						src="${topDoc.imgurl}" alt="${topDoc.title}">
					</a>
				</div>
			</div>
		</c:if>
		<c:if test="${topDoc.imgurl==null}">
			<div class="card-content">
				<div class="card-content-inner">
					<a href="${topDoc.exlink}"
						class="${fn:startsWith(topDoc.exlink,'http')?'link external':''}">
						${topDoc.docdescribe} </a>
				</div>
			</div>
		</c:if>
		<div class="card-footer no-border">
			<span class="link">${topDoc.pubtime}</span> <span
				class="link wcp-type-tip">阅读(${topDoc.visitnum })</span> <span
				class="link wcp-type-tip">评论(${topDoc.answeringnum })</span>
		</div>
	</div>
</c:forEach>
<c:forEach var="topDoc" items="${topRecommends}" varStatus="status">
	<div class="card">
		<div class="card-header">
			<a
				class="wcp-card-title ${fn:startsWith(topDoc.exlink,'http')?'link external':''}"
				href="${topDoc.exlink}"> <nobr>${topDoc.title}</nobr>
			</a>
		</div>
		<c:if test="${topDoc.imgurl!=null}">
			<div class="card-content">
				<div class="card-content-inner" style="text-align: center;">
					<a href="${topDoc.exlink}"
						class="${fn:startsWith(topDoc.exlink,'http')?'link external':''}">
						<img style="max-height: 300px; max-width: 100%;"
						src="${topDoc.imgurl}" alt="${topDoc.title}">
					</a>
				</div>
			</div>
		</c:if>
		<c:if test="${topDoc.imgurl==null}">
			<div class="card-content">
				<div class="card-content-inner">
					<a href="${topDoc.exlink}"
						class="${fn:startsWith(topDoc.exlink,'http')?'link external':''}">${topDoc.text}</a>
				</div>
			</div>
		</c:if>
		<div class="card-footer no-border">
			<span class="link">${topDoc.pubtime} </span> <span
				class="link wcp-type-tip">阅读(${topDoc.visitnum })</span> <span
				class="link wcp-type-tip">评论(${topDoc.answeringnum })</span>
		</div>
	</div>
</c:forEach>