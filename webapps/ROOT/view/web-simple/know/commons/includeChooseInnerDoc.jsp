<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<style>
<!--
.docstable td {
	max-width: 300px;
	overflow: hidden;
}
-->
</style>
<div class="modal fade" id="myInnerDocs" tabindex="-1" role="dialog"
	aria-labelledby="myInnerModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 700px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myInnerModalLabel">插入知识</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<div class="input-group" style="max-width: 250px;">
						<input name="word" id="searchInnerDocCaseId" value=""
							class="form-control input-sm" placeholder="输入知识名称或分类名称查询"
							type="text"><span class="input-group-btn">
							<button type="button" id="docsInnerSearchButtonId"
								class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</span>
					</div>
				</div>
				<div id="alertMessageBox" class="alertMsgClass"></div>
				<div style="max-height: 300px; overflow: auto;">
					<table class="table table-striped docstable"
						id="docsInnerloadboxid">
					</table>
				</div>
				<div id="searchInnerdocsloadinfoboxid">加载知识中...</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<script type="text/javascript">
	$(function() {
		$('#docsInnerSearchButtonId').click(function() {
			loadRelaInnerDocs();
		});
		loadRelaInnerDocs();
	});

	function useInnerDoc(docid, docname) {
		var html = '<a href="webdoc/view/Pub'+docid+'.html">' + docname
				+ '</a>';
		insertEditorHtml(html);
		$('#myInnerDocs').modal('hide');
	}

	function loadRelaInnerDocs() {
		$
				.post(
						'home/FPsearchKnow.do',
						{
							'wordcase' : $('#searchInnerDocCaseId').val()
						},
						function(flag) {
							$('#searchInnerdocsloadinfoboxid').html("");
							$('#docsInnerloadboxid').html("");
							$('#docsInnerloadboxid')
									.append(
											"<tr><th>知识名称</th><th >知识类型</th><th >分类</th><th ></th></tr>");
							var demosobj = $.parseJSON(flag);
							if (demosobj.ALERTMES) {
								$('#alertMessageBox').html(demosobj.ALERTMES);
							}
							demos = new Array();
							$(demosobj.list)
									.each(
											function(i, obj) {
												var html = new Array();
												demos.push(obj.demotext);
												html.push("<tr>");
												html.push("<td>" + obj.TITLE
														+ "</td>");
												html.push("<td >" + obj.DOMTYPE
														+ "</td>");
												html.push("<td >"
														+ obj.TYPENAME
														+ "</td>");
												var buttonhtml = "<button onclick='useInnerDoc(\""
														+ obj.ID
														+ "\",\""
														+ obj.TITLE
														+ "\")' type='button' class='btn btn-primary btn-xs userdemocs'>插入</button>";
												html.push("<td >" + buttonhtml
														+ "</td>");
												html.push("</tr>");
												$('#docsInnerloadboxid')
														.append(html.join(""));
											});
						});
		return true;
	}
</script>