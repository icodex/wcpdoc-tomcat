<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<style>
<!--
.wcp-userjudge-users {
	text-align: center;
}

.wcp-userjudge-users img {
	max-width: 32px;
	max-height: 32px;
	margin: auto;
	margin: 4px;
}
-->
</style>

<div style="border: 1px dashed #ccc; padding: 20px; border-left: 0px; border-right: 0px;">
	<div class="row">
		<div class="col-md-12 text-center">
			<div class="btn-group btn-group-sm">
				<button type="button" id="btnPraiseOkId" class="btn btn-default btn-success btn-lg">
					好评
					<span id="praiseyesNumId">${DOCE.runinfo.praiseyes}</span>
				</button>
				<button type="button" id="textLablePraiseNumId" class="btn btn-default btn-lg" disabled="disabled">${DOCE.runinfo.evaluate}</button>
				<button type="button" id="btnPraiseNoId" class="btn btn-default btn-danger btn-lg">
					差评
					<span id="praisenoNumId">${DOCE.runinfo.praiseno}</span>
				</button>
			</div>
		</div>
	</div>
	<div class="row" style="margin-top: 20px;">
		<div id="doctypeJudgesId" class="col-md-12 text-center"></div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		var posting = false;
		$('#btnPraiseOkId').bind('click', function() {
			if (posting) {
				return;
			}
			$('#textLablePraiseNumId').text("...");
			posting = true;
			$.post('webdoc/PubPraiseYes.do', {
				id : '${DOCE.doc.id}'
			}, function(flag) {
				posting = false;
				if (flag.STATE == '0') {
					$('#textLablePraiseNumId').text(flag.runinfo.evaluate);
					$('#praiseyesNumId').text(flag.runinfo.praiseyes);
					$('#praisenoNumId').text(flag.runinfo.praiseno);
				} else {
					alert(flag.MESSAGE);
				}
			}, 'json');
		});
		$('#btnPraiseNoId').bind('click', function() {
			if (posting) {
				return;
			}
			$('#textLablePraiseNumId').text("...");
			posting = true;
			$.post('webdoc/PubPraiseNo.do', {
				id : '${DOCE.doc.id}'
			}, function(flag) {
				posting = false;
				if (flag.STATE == '0') {
					$('#textLablePraiseNumId').text(flag.runinfo.evaluate);
					$('#praiseyesNumId').text(flag.runinfo.praiseyes);
					$('#praisenoNumId').text(flag.runinfo.praiseno);
				} else {
					alert(flag.MESSAGE);
				}
			}, 'json');
		});
		loadTypeJudge();
	});
	function loadTypeJudge() {
		//$('#doctypeJudgesId').text('loadding...');
		$('#doctypeJudgesId').load('webjudge/PubDocJudges.do', {
			'docid' : '${DOCE.doc.id}'
		});
	}
</script>