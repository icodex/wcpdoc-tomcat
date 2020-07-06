<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<c:forEach items="${form.fields}" var="node">
	<div class="col-md-${node.colspan*6}">
		<div class="form-group">
			<div for="exampleInputFile" style="overflow: hidden; height: 30px;">${node.title}
				<c:if test="${node.required&&node.type!='3'}">
					<span class="alertMsgClass">*</span>
				</c:if>
				<div style="float: right;" id="${node.name}Validate"></div>
			</div>
			<!-- 表单控件 -->
			<c:if test="${node.type=='1'}">
				<input title="${node.name}" validate="${node.validates}" value="${node.val}" id="typeForm${node.name}Id" type="text" class="form-control" placeholder="${node.note} ${node.valititle}">
			</c:if>
			<c:if test="${node.type=='2'}">
				<select title="${node.name}" id="typeForm${node.name}Id" class="form-control" val="${node.val}">
					<option value=""></option>
					<c:forEach var="option" items="${node.options}">
						<option value="${option}">${option}</option>
					</c:forEach>
				</select>
			</c:if>
			<c:if test="${node.type=='3'}">
				&nbsp;<c:forEach var="option" items="${node.options}">
					<label class="checkbox-inline">
						<input type="checkbox" title="${node.name}" value="${option}" val="${node.val}">
						${option}
					</label>
				</c:forEach>
			</c:if>
			<c:if test="${node.type=='4'}">
				<textarea title="${node.name}" validate="${node.validates}" id="typeForm${node.name}Id" class="form-control" placeholder="${node.note} ${node.valititle}" rows="3">${node.val}</textarea>
			</c:if>
		</div>
	</div>
	<c:if test="${node.required}">
		<script type="text/javascript">
			$(function() {
				validateInput('typeForm${node.name}Id', function(id, val, obj) {
					if (valid_isNull(val)) {
						return {
							valid : false,
							msg : '不能为空'
						};
					}
					if (valid_maxLength(val, 1000)) {
						return {
							valid : false,
							msg : '长度不能大于' + 1000
						};
					}
					if ($(obj).attr('validate')) {
						var reg = new RegExp($(obj).attr('validate'));
						if (!reg.test(val)) {
							return {
								valid : false,
								msg : '${node.title}格式不正确'
							};
						}
					}
					return {
						valid : true,
						msg : '正确'
					};
				}, '${node.name}Validate');
			});
		</script>
	</c:if>
	<c:if test="${!node.required}">
		<script type="text/javascript">
			$(function() {
				validateInput('typeForm${node.name}Id', function(id, val, obj) {
					if (!valid_isNull(val)) {
						if (valid_maxLength(val, 1000)) {
							return {
								valid : false,
								msg : '长度不能大于' + 1000
							};
						}
						if ($(obj).attr('validate')) {
							var reg = new RegExp($(obj).attr('validate'));
							if (!reg.test(val)) {
								return {
									valid : false,
									msg : '${node.title}格式不正确'
								};
							}
						}
					}
					return {
						valid : true,
						msg : '正确'
					};
				}, '${node.name}Validate');
			});
		</script>
	</c:if>
	<script type="text/javascript">
		$(function() {
			$('#typeFormBoxId').show();
		});
	</script>
</c:forEach>
<script type="text/javascript">
	$(function() {
		$('#typeFormContentId select').each(function(i, obj) {
			$(obj).val($(obj).attr("val"));
		});
		$("#typeFormContentId input[type='checkbox']").each(function(i, obj) {
			var fulltext = $(obj).attr("val").split(",");
			for (j = 0; j < fulltext.length; j++) {
				if ($(obj).val() == fulltext[j]) {
					$(obj).attr("checked", true);
				}
			}
		});
	});
</script>