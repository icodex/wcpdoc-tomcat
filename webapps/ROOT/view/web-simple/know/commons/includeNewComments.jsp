<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<c:if test="${doc.runinfo.answeringnum>0||DOCE.runinfo.answeringnum>0}">
	<a name="markdocMessage"></a>
	<br />
	<div class="row doc_column_box">
		<div class="col-sm-12">
			<span class="glyphicon glyphicon-comment  column_title">&nbsp;最新评论</span>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12" id="newCommentBoxId">
			<script type="text/javascript">
				$(function() {
					$('#newCommentBoxId')
							.load(
									'webdocmessage/PubLoadmsg.do?docid=${DOCE.doc.id}${doc.doc.id}');
				});
			</script>
		</div>
	</div>
	<div class="row doc_column_box">
		<div class="col-sm-12">
			<span class="pull-right" style="font-size: 16px; margin-right: 16px;">当前评论数<span><a
					href="webdocmessage/Pubmsg.do?docid=${DOCE.doc.id}${doc.doc.id}"
					style="color: #377bb5; font-weight: bold;">${doc.runinfo.answeringnum}${DOCE.runinfo.answeringnum}</a>条</span>&nbsp;&nbsp;<span><a
					href="webdocmessage/Pubmsg.do?docid=${DOCE.doc.id}${doc.doc.id}"
					style="color: #377bb5;font-size: 14px;margin-left: 16px;">查看更多评论</a></span></span>
		</div>
	</div>
</c:if>
