<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<div class="media-body">
	<div style="margin-left: 4px;" class="pull-left">
		<div>
			<c:if test="${fqa.question.pstate==2}">
				<span class="label label-success">完成</span>
			</c:if>
			<c:if test="${fqa.question.pstate==1}">
				<span class="glyphicon glyphicon-question-sign"></span>
			</c:if>
			<a class="doc_node_title_min"
				target="${config_sys_link_newwindow_target}"
				href="webquest/fqa/Pub${fqa.question.id}.html"> ${fqa.question.title} </a>
		</div>
		<c:if test="${fqa.question.shortdesc!=''}">
			<div class="doc_node_content_box">
				<p class="doc_node_content">${fqa.question.shortdesc}</p>
			</div>
		</c:if>
		<div class="side_unit_info side_unit_info_left_box">
			<a class="color_a" href="webquest/view${fqa.question.typeid}/Pub1.html">${fqa.type.name}</a>
			&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-eye-open"></span>&nbsp;${fqa.question.visitnum}人阅读
			&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-comment"></span>&nbsp;${fqa.question.answers}人回答&nbsp;&nbsp;
			<PF:FormatTime date="${fqa.question.pubtime}"
				yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
		</div>
	</div>
</div>