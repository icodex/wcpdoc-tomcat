<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%><%@taglib
	uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<div class="list-group">
	<c:forEach var="node" items="${docs.resultList}">
		<a href="webquest/fqa/Pub${node.ID}.html" class="list-group-item"
			target="${config_sys_link_newwindow_target}">
			<div class="row">
				<div class="col-md-7">
					<h5 class="list-group-item-heading">${node.TITLE}&nbsp;${node.PSTATE == "完成" ? "<span  title='已完成' class='label label-success' style='font-size:10px;'><span class='glyphicon glyphicon-ok'></span></span>" : ""}</h5>
				</div>
				<div class="col-md-5">
					<p class="list-group-item-text" style="color: #8c92a4;">
						${node.PUBTIME}&nbsp;&nbsp;访问${node.VISITNUM}/回答${node.ANSWERS}</p>
				</div>
			</div>
		</a>
	</c:forEach>
</div>
<c:if test="${fun:length(docs.resultList) > 0}">
	<div class="row">
		<div class="col-xs-12">
			<ul class="pagination pagination-sm">
				<c:forEach var="page" begin="${docs.startPage}"
					end="${docs.endPage}" step="1">
					<c:if test="${page==docs.currentPage}">
						<li class="active"><a>${page} </a></li>
					</c:if>
					<c:if test="${page!=docs.currentPage}">
						<li><a
							href="webuser/PubHome.do?type=${type}&num=${page}&userid=${userid}">${page}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</c:if>