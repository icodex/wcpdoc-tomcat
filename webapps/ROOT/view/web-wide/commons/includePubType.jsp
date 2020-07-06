<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="wcp-widecolumn-titlebox">
	<div class="wcp-inner-titlebox">
		<i class=" glyphicon glyphicon-unchecked"></i> 知识分类
	</div>
	<hr />
</div>
<div class="row">
	<c:forEach items="${typesons}" var="node">
		<c:if test="${node.parentid=='NONE'}">
			<div class="col-sm-6 docTypeBox" style="height: 120px;">
				<div class="docTypeBox-innerBox" style="height: 110px;">
					<h1>
						<a href="webtype/view${node.id}/Pub1.html?typeDomainId=${node.id}"> ${node.name} </a>
						<c:if test="${node.num>0}">
							<span style="color: #D9534F; font-weight: bold; font-size: 13px;">
								<span class=" glyphicon glyphicon-bookmark"></span>&nbsp;${node.num}&nbsp;
							</span>
						</c:if>
					</h1>
					<ul>
						<c:forEach items="${typesons}" var="node1">
							<c:if test="${node1.parentid==node.id}">
								<li><a href="webtype/view${node1.id}/Pub1.html?typeDomainId=${node.id}">${node1.name}</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
		</c:if>
	</c:forEach>
</div>