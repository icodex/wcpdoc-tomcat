<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<c:if test="${type!=null}">
	<div class="hidden-sm hidden-xs hidden-md wcp-knowtype-lefttop-title"
		style="float: left;">
		<c:if test="${typedomain==null}">
			<span class="glyphicon glyphicon-fire  column_title">&nbsp;知识:</span>
		</c:if>
		<c:if test="${typedomain!=null}">
			<span class="glyphicon glyphicon-fire  column_title">&nbsp;${typedomain.name}:</span>
		</c:if>
		<c:forEach items="${typepath}" var="node">
			<c:if test="${type.id==node.id}">
				<a style="color: #d9534f" href="webtype/view${node.id}/Pub1.html"
					class="active"><span class="label label-success">${node.name}</span></a>
			</c:if>
		</c:forEach>
	</div>
	<div class="hidden-lg" style="float: left;">
		<span class="glyphicon glyphicon-fire  column_title">&nbsp;知识:</span>
		<c:forEach items="${typepath}" var="node">
				/<a style="color: #d9534f" href="webtype/view${node.id}/Pub1.html"
				class="active">${node.name}</a> 
		</c:forEach> 
	</div>
</c:if>
<c:if test="${type==null}">
	<span class="glyphicon glyphicon-fire  column_title">&nbsp;知识</span>
</c:if>
