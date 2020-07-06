<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="card">
	<c:forEach items="${typesons}" var="node">
		<c:if test="${node.parentid=='NONE'}">
			<div class="card-header no-border wcp-bottom-clear">
				<div class="facebook-avatar wcp-type-title">
					<a class="external" href="webtype/view${node.id}/Pub1.html"> ${node.name} </a>
				</div>
				<div class="facebook-date"></div>
				<div class="facebook-name">
					<c:if test="${node.num>0}">
						<span class="wcp-type-tip"> <span
							class=" glyphicon glyphicon-bookmark"></span>&nbsp;知识${node.num}&nbsp;
						</span>
					</c:if>
				</div>
			</div>
			<div class="card-content">
				<div class="card-content-inner wcp-top-clear wcp-type-sub">
					<c:forEach items="${typesons}" var="node1">
						<c:if test="${node1.parentid==node.id}">
							<a class="external" href="webtype/view${node1.id}/Pub1.html">${node1.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
					</c:forEach>
				</div>
			</div>
			<hr />
		</c:if>
	</c:forEach>
</div>