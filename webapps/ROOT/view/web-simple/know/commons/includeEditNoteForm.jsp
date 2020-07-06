<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="row">
	<div class="col-md-12">
		<div class="form-group">
			<label for="exampleInputEmail1"> 版本备注 <span
				class="alertMsgClass">*</span>
			</label>
			<div class="row">
				<div class="col-md-12">
					<div class="input-group">
						<div class="input-group-btn">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								选择<span class="caret"></span>
							</button>
							<ul id="editNoteTypeId" class="dropdown-menu dropdown-menu-right">
								<c:if test="${doce.doc.id==null}">
									<li><a>创建版本</a></li>
								</c:if>
								<c:if test="${doce.doc.id!=null}">
									<li><a>格式调整</a></li>
									<li><a>修改标题</a></li>
									<li><a>调整分类</a></li>
									<li><a>其他原因...</a></li>
								</c:if>
							</ul>
						</div>
						<input type="text" class="form-control" id="knowEditNoteId"
							name="editNote" placeholder="版本备注将被记录" />
					</div>
					<div id="editNote_lableId"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#editNoteTypeId a').bind('click', function() {
			$('#knowEditNoteId').val($(this).text());
		});
		validateInput('knowEditNoteId', function(id, val, obj) {
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
		}, 'editNote_lableId');
	});
</script>