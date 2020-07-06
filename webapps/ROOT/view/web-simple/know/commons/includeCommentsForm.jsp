<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<a name="markdocMessage"></a>
<!--<br /><div class="row doc_column_box">
	<div class="col-sm-12">
	 <span class="glyphicon glyphicon-comment  column_title">&nbsp;评论当前知识</span>
	</div>
</div> -->
<div class="row">
	<div class="col-md-12">
		<hr class="hr_split" />
		<form role="form" action="webdocmessage/addmsg.do"
			id="knowSubmitFormId" class="wcp_noEnterSubmit" method="post">
			<input type="hidden" name="docid" value="${doc.doc.id}${DOCE.doc.id}" />
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<c:if test="${USEROBJ==null}">
							<textarea class="form-control" id="mesTextId" name="content"
								disabled="disabled" placeholder="请登陆后发表评论"></textarea>
						</c:if>
						<c:if test="${USEROBJ!=null}">
							<textarea class="form-control" id="mesTextId" name="content"
								style="border-color: #377bb5;" placeholder="请输入评论内容"></textarea>
						</c:if>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<c:if test="${USEROBJ==null}">
						<a href="login/webPage.html" class="btn btn-primary">登陆后发表评论</a>
					</c:if>
					<c:if test="${USEROBJ!=null}">
						<button type="button" id="msgSubmitButtonId"
							class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发表评论&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					</c:if>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#msgSubmitButtonId').bind('click', function() {
			if (!validate('knowSubmitFormId')) {

			} else {
				$('#knowSubmitFormId').submit();
				$('#msgSubmitButtonId').addClass("disabled");
				$('#msgSubmitButtonId').text("提交中...");
			}
		});
		validateInput('mesTextId', function(id, val, obj) {
			// 留言
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '评论内容不能为空'
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