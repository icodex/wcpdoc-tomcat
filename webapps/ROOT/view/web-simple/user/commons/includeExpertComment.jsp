<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%><%@taglib
	uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!-- 留言版功能 -->
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
<div class="row column_box" style="margin-top: 4px;">
	<div class="col-sm-12">
		<span class="glyphicon glyphicon-star  column_title">&nbsp;${username}的留言板
		</span>
	</div>
</div>
<div class="row">
	<div class="col-sm-12">
		<c:forEach items="${message.resultList}" var="node">
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
								<c:if test="${USEROBJ!=null}">
									<button id="approveOf${node.ID }" type="button"
										class="btn btn-default btn-xs"
										onclick="approveOf('${node.ID }')">赞同(${node.PRAISNUM })</button>
									<button id="oppose${node.ID }" type="button"
										class="btn btn-default btn-xs" onclick="oppose('${node.ID }')">反对(${node.CRITCISMNUM })</button>
									<button type="button" onclick="replyClick('${node.ID}')"
										class="btn btn-info btn-xs">回复</button>
								</c:if>
								<c:if test="${self}">
									<button type="button" onclick="delClick('${node.ID}')"
										class="btn btn-danger btn-xs">刪除留言</button>
								</c:if>
							</div>
							<div class="side_unit_info message_reply_box"
								id="reply${node.ID}box" style="margin-top: 4px;">
								<form class="form-inline" action="webusercomment/reply.do"
									onsubmit="return checkreply('${node.ID}')" method="post">
									<input type="hidden" name="id" value="${node.ID }" /><input
										type="hidden" name="num" value="${num}" /><input
										type="hidden" name="userid" value="${node.APPID}" />
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
									</span>：<c:if test="${self}">
											<a type="button" onclick="delClick('${replay.ID}')">刪除留言</a>
										</c:if> <br /> <br />${replay.CONTENT }</li>
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
		//$(".message_boxunit").mouseenter(function() {
		//	$('.message_operate_box', this).show();
		//});
		//$(".message_boxunit").mouseleave(function() {
		//	$('.message_operate_box').hide();
		//	$('.message_reply_box').hide();
		//});
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
			url : "webusercomment/approveOf.do?id=" + id,
			dataType : "json",
			async : false,
			success : function(obj) {
				$("#approveOf" + id).html(
						"赞同(" + obj.farmDocmessage.praisnum + ")");
			}
		});

	}
	//主人刪除留言
	function delClick(id) {
		if (confirm("该留言删除后无法恢复，是否继续删除？")) {
			window.location =basePath + "webusercomment/del.do?num=${num}&userid=${userid}&id="
					+ id;
		}
	}
	//反对
	function oppose(id) {
		$.ajax({
			type : "post",
			url : "webusercomment/oppose.do?id=" + id,
			dataType : "json",
			async : false,
			success : function(obj) {
				$("#oppose" + id).html(
						"反对(" + obj.farmDocmessage.critcismnum + ")");
			}
		});
	}
</script>
<div class="row doc_column_box" style="margin: 0px;">
	<div class="col-sm-12">
		<c:if test="${fun:length(message.resultList) > 0}">
			<ul class="pagination pagination-sm pagenumbox" style="margin: 0px;">
				<c:forEach var="page" begin="${message.startPage}"
					end="${message.endPage}" step="1">
					<c:if test="${page==message.currentPage}">
						<li class="active"><a>${page} </a></li>
					</c:if>
					<c:if test="${page!=message.currentPage}">
						<li><a
							href="webuser/PubHome.do?userid=${userid}&type=comment&num=${page}"
							title="${page}">${page}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</c:if>
		<span class="pull-right" style="font-size: 16px; margin-right: 16px;">当前留言数<span>${message.totalSize}</span>条
		</span> <a name="markdocMessage"></a>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<hr class="hr_split" />
		<form role="form" action="webusercomment/addmsg.do"
			id="knowSubmitFormId" class="wcp_noEnterSubmit"  method="post">
			<input type="hidden" name="userid" value="${userid}" />
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<c:if test="${USEROBJ==null}">
							<textarea class="form-control" id="mesTextId" name="content"
								disabled="disabled" placeholder="请登陆后发表留言"></textarea>
						</c:if>
						<c:if test="${USEROBJ!=null}">
							<textarea class="form-control" id="mesTextId" name="content"
								style="border-color: #377bb5;" placeholder="请输入留言内容"></textarea>
						</c:if>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<c:if test="${USEROBJ==null}">
						<a href="login/webPage.html" class="btn btn-primary">登陆后发表留言</a>
					</c:if>
					<c:if test="${USEROBJ!=null}">
						<button type="button" id="msgSubmitButtonId"
							class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发表留言&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					</c:if>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('.pagenumbox,a').click(function() {
			loadMessagePage($(this).attr('title'));
		});
		$('#msgSubmitButtonId')
				.bind(
						'click',
						function() {
							if (!validate('knowSubmitFormId')) {
								//$('#errormessageShowboxId').text('信息录入有误，请检查！');
							} else {
								if (confirm("是否提交数据?")) {
									$('#knowSubmitFormId').submit();
									$('#msgSubmitButtonId').addClass("disabled");
									$('#msgSubmitButtonId').text("提交中...");
								}
							}
						});
		validateInput('mesTextId', function(id, val, obj) {
			// 留言
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '留言内容不能为空'
				};
			}
			if (valid_maxLength(val, 1024)) {
				return {
					valid : false,
					msg : '长度不能大于' + 1024
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
	});
</script>