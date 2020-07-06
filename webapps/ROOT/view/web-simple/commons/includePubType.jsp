<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="widget-box shadow-box" style="padding-bottom: 16px;">
	<div class="title" style="border-bottom-width:0px">
		<h3>
			<i class="glyphicon glyphicon-tree-conifer"></i> 知识分类
		</h3>
	</div>
	<div class="stream-list p-stream" style="margin-top: -10px;">
		<c:forEach items="${typesons}" var="node">
			<c:if test="${node.parentid=='NONE'}">
				<div class="col-sm-6 docTypeBox">
					<h1>
						<a href="webtype/view${node.id}/Pub1.html?typeDomainId=${node.id}"> ${node.name} </a>
						<c:if test="${node.num>0||node.questionnum>0}">
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
			</c:if>
		</c:forEach>
	</div>
</div>



