<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<form role="form" id="knowSubmitFormId" class="wcp_noEnterSubmit"  method="post">
	<div class="row doc_column_box">
		<div class="col-sm-12">
			<span class="glyphicon glyphicon-pencil column_title">&nbsp;辅助修改信息</span>
		</div>
	</div>
	<div class="row ">
		<div class="col-sm-12"
			style="color: #999; padding-left: 15px; padding-top: 15px; text-align: right; font-size: 12px;">
			该知识发布在分类<b> <c:forEach var="node" items="${DOCE.currenttypes}"
					varStatus="status">
					/
					${node.name} 
			</c:forEach></b>下,<!-- <b>编辑者: ${DOCE.texts.cusername}</b> --> 于
			<PF:FormatTime date="${DOCE.texts.ctime}"
				yyyyMMddHHmmss="yyyy年MM月dd日" />
			编辑
		</div>  
	</div>
	<div class="row">
		<div class="col-md-12">
			<a name="markAuditEditform"></a>
			<hr class="hr_split" />
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="exampleInputEmail1"> 标题 <span
							class="alertMsgClass">*</span>
						</label> <input type="text" class="form-control" name="knowtitle"
							value="${DOCE.doc.title}" id="knowtitleId"
							placeholder="输入知识标题" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="exampleInputEmail1"> 文档分类 <span
							class="alertMsgClass">*</span>
						</label>
						<div class="row">
							<div class="col-md-12">
							    <div class="input-group">
							      <input type="text" class="form-control" id="knowtypeTitleId"
									readonly="readonly" placeholder="选择文档分类"
									value="${DOCE.type.name}" /> <input type="hidden"
									name="knowtype" id="knowtypeId"  value="${DOCE.type.id}" />
							      <div class="input-group-btn">
							       <button class="btn btn-default" data-toggle="modal"
									id="openChooseTypeButtonId" data-target="#myModal">
									选择分类</button>
							      </div>
							    </div><!-- /input-group -->
							</div><!-- /.col-lg-6 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row doc_column_box">
		<div class="col-sm-12">
			<span class="glyphicon glyphicon-user column_title">&nbsp;审核意见</span>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<a name="markAuditform"></a>
			<hr class="hr_split" />
			<div class="row">
				<div class="col-md-12">
					<textarea class="form-control" id="mesTextId" name="content"
						placeholder="请输入审核意见"></textarea>
					<input type="hidden" name="auditid" value="${DOCE.audit.id}" />
				</div>
			</div>
			<div class="row column_box">
				<div class="col-md-12">
					<div class="btn-group" role="group" aria-label="...">
						<button type="button" id="passSubmitButtonId"
							class="btn btn-success">通过</button>
						<button type="button" id="cantSubmitButtonId"
							class="btn btn-danger">拒绝</button>
					</div>
				</div>
				<div class="col-md-12">
					<span class="alertMsgClass" id="errormessageShowboxId"></span>
				</div>
			</div>
			<div class="row column_box">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="text/javascript/wcpTypes.js"></script>
<jsp:include
		page="/view/web-simple/type/commons/includeChooseTypes.jsp"></jsp:include>
<script>
	$(function() {
		$('#openChooseTypeButtonId').bind('click', function() {
			$('#myModal').modal({
				keyboard : false
			})
		});
		$('#passSubmitButtonId')
				.bind(
						'click',
						function() {
							if (!validate('knowSubmitFormId')) {
								$('#errormessageShowboxId').text('信息录入有误，请检查！');
							} else {
								if (confirm("是否提交?")) {
									$('#knowSubmitFormId').attr('action',"audit/auditYes.do");
									$('#cantSubmitButtonId').addClass("disabled");
									$('#passSubmitButtonId').addClass("disabled");
									$('#passSubmitButtonId').text("提交中...");
									$('#knowSubmitFormId').submit();
								}
							}
						});
		$('#cantSubmitButtonId')
				.bind(
						'click',
						function() {
							if (!validate('knowSubmitFormId')) {
								$('#errormessageShowboxId').text('信息录入有误，请检查！');
							} else {
								if (confirm("是否提交?")) {
									$('#knowSubmitFormId').attr('action',"audit/auditNo.do");
									$('#cantSubmitButtonId').addClass("disabled");
									$('#passSubmitButtonId').addClass("disabled");
									$('#cantSubmitButtonId').text("提交中...");
									$('#knowSubmitFormId').submit();
								}
							}
						});
		// 小组介绍
		validateInput('mesTextId', function(id, val, obj) {
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '不能为空'
				};
			}
			if (valid_maxLength(val, 256)) {
				return {
					valid : false,
					msg : '长度不能大于' + 256
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
		validateInput('knowtypeTitleId', function(id, val, obj) {
			// 分类
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '不能为空'
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
		//绑定一个表单的验证事件
		validateInput('knowtitleId', function(id, val, obj) {
			// 标题
			if (valid_isNull(val)) {
				return {
					valid : false,
					msg : '不能为空'
				};
			}
			if (valid_maxLength(val, 128)) {
				return {
					valid : false,
					msg : '长度不能大于' + 128
				};
			}
			return {
				valid : true,
				msg : '正确'
			};
		});
	});
</script>