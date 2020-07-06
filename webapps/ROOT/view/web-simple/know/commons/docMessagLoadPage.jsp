<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<style>
<!--
.list-group {
	margin-top: 8px;
}

.list-group .list-group-item {
	background-color: #ffffee;
}
-->
</style>
<div class="row">
	<div class="col-sm-12">
		<c:forEach items="${result.resultList}" var="node">
			<div class="col-sm-12">
				<hr class="hr_split" />
			</div>
			<div class="col-sm-12 doc_node">
				<div class="media message_boxunit">
					<a class="pull-left"
						href="webuser/PubHome.do?userid=${node.CUSER }"
						style="max-width: 200px; text-align: center;"
						title="${node.CUSERNAME }"> <img
						class="img-circle side_unit_author_img_min"
						alt="${node.CUSERNAME}" src="<PF:basePath/>${node.IMGURL}">
						<br />
					</a>
					<div class="media-body">
						<div class="side_unit_info">
							<div class="side_unit_info">
								<span class="side_unit_info"> <a
									href="webuser/PubHome.do?userid=${node.CUSER }">${node.CUSERNAME }</a>
									${node.CTIME }
								</span>
							</div>
							<div class="doc_node_content" style="margin: 4px;">${node.CONTENT}</div>
							<div class="side_unit_info">
								<button id="approveOf${node.ID }" type="button"
									class="btn btn-default btn-xs"
									onclick="approveOf('${node.ID }')">赞同(${node.PRAISNUM })</button>
								<button id="oppose${node.ID }" type="button"
									class="btn btn-default btn-xs" onclick="oppose('${node.ID }')">反对(${node.CRITCISMNUM })</button>
								<button type="button" onclick="replyClick('${node.ID}')"
									class="btn btn-info btn-xs">回复</button>
							</div>
							<div class="side_unit_info message_reply_box"
								id="reply${node.ID}box" style="margin-top: 4px;">
								<form class="form-inline" action="webdocmessage/reply.do"
									onsubmit="return checkreply('${node.ID}')" method="post">
									<input type="hidden" name="id" value="${node.ID }" /> <input
										type="hidden" name="appid" value="${node.APPID }" />
									<div class="input-group">
										<!--  -->
										<input type="text" name="content"
											class="form-control replycontent${node.ID}">
										<!--  -->
										<span class="input-group-btn">
											<button type="submit" class="btn btn-default">回复</button>
										</span>
									</div>
								</form>
							</div>
						</div>
						<div class="side_unit_info">
							<ul class="list-group">
								<c:forEach var="replay" items="${node.replys }">
									<li class="list-group-item"><span class="side_unit_info">
											<a href="webuser/PubHome.do?userid=${replay.CUSER }"
											class="color_a"> ${replay.CUSERNAME }</a> <PF:FormatTime
												date="${replay.CTIME}" yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
									</span>：<br /> <br />${replay.CONTENT }</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('.message_reply_box').hide();
		$('.message_operate_box').hide();
	});
	//验证回复表单
	function checkreply(messageId) {
		var val = $('.replycontent' + messageId).val();
		if (!val || !val.trim()) {
			return false;
		}
		if(val.length>1024){
			alert("字符数超长,请小于1024个字符!");
			return false;
		}
		return true;
	}
	function replyClick(messageId) {
		if ($('#reply' + messageId + 'box').is(":hidden")) {
			$('.message_reply_box').hide();
			$('#reply' + messageId + 'box').show();
		} else {
			$('.message_reply_box').hide();
		}
	}
	//赞同
	function approveOf(id) {
		$.ajax({
			type : "post",
			url : "webdocmessage/approveOf.do?id=" + id,
			dataType : "json",
			async : false,
			success : function(obj) {
				$("#approveOf" + id).html(
						"赞同(" + obj.farmDocmessage.praisnum + ")");
			}
		});
	}

	//反对
	function oppose(id) {
		$.ajax({
			type : "post",
			url : "webdocmessage/oppose.do?id=" + id,
			dataType : "json",
			async : false,
			success : function(obj) {
				$("#oppose" + id).html(
						"反对(" + obj.farmDocmessage.critcismnum + ")");
			}
		});
	}
</script>