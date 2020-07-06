<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<style>
.wcp-home-type-list li {
	float: left;
	padding: 4px;
	padding-left: 12px;
	padding-right: 12px;
	border-radius: 4px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.wcp-home-type-list {
	margin: 0px;
	padding: 0px;
}

.wcp-home-type-list .level1 {
	font-weight: 700;
	font-size: 16px;
}

.wcp-home-type-list a {
	color: #4d5356;
}

.wcp-home-type-list a:HOVER {
	color: #ba2636;
}

.wcp-home-type-list li:HOVER {
	background-color: #f2f2f2;
}
</style>
<div class="wcp-su-out-box">
	<div class="unit">
		<div class="title">
			<i class="glyphicon glyphicon-list-alt"></i> 知识分类
		</div>
	</div>
	<c:forEach items="${typesons}" var="node">
		<c:if test="${node.parentid=='NONE'}">
			<div class="unit unit-min link wcp-type-homebox"
				style="padding-top: 0px; padding-bottom: 0px; max-height: 55px; overflow: hidden;">
				<ul class="wcp-home-type-list">
					<li title="知识${node.num}" class="level1"><a
						href="webtype/view${node.id}/Pub1.html?typeDomainId=${node.id}">
							${node.name} </a></li>
					<li
						style="color: #eeeeee; padding-left: 0px; padding-right: 0px; margin-left: 10px; margin-right: 10px;">
						<i class="glyphicon glyphicon-chevron-right"></i>
					</li>
					<c:forEach items="${typesons}" var="node1">
						<c:if test="${node1.parentid==node.id}">
							<li><a class="level2" title="知识${node1.num}"
								href="webtype/view${node1.id}/Pub1.html?typeDomainId=${node.id}">${node1.name}</a></li>
						</c:if>
					</c:forEach>
				</ul>
				<hr style="clear: both; border: 0px;" />
			</div>
		</c:if>
	</c:forEach>
</div>
<script type="text/javascript">
	$(function() {
		$('.wcp-type-homebox').bind('mouseover', function() {
			$(this).css('max-height', '165px');
		});
		$('.wcp-type-homebox').bind('mouseout', function() {
			$(this).css('max-height', '55px');
		});
	});
</script>
