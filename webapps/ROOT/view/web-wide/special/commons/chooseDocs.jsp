<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<style>
<!--
.docstable td {
	max-width: 300px;
	overflow: hidden;
}
-->
</style>
<!-- 迭代专题 -->
<div class="widget-box shadow-box">
	<div class="stream-list p-stream">
		<div class="title">
			<div class="row">
				<div class="col-md-12 "
					style="font-size: 18px; padding: 4px; color: #D9534F; height: 60px; padding-top: 16px; text-align: center;">
					<i class="glyphicon glyphicon-list-alt"></i> &nbsp;可选知识 &nbsp;
				</div>
			</div>
		</div>
		<div style="padding: 20px;">
			<div class="form-group" style="float: right;">
				<div class="input-group" style="max-width: 250px;">
					<input name="word" id="searchDocCaseId" value=""
						class="form-control input-sm" placeholder="输入知识名称或分类名称查询"
						type="text"> <span class="input-group-btn">
						<button type="button" id="docsSearchButtonId"
							class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</span>
				</div>
			</div>
			<div style="height: 60px;">
				<div id="relationAlertMessageBox" class="alertMsgClass">
					<span class="glyphicon glyphicon-list"></span>&nbsp;专题中只能够展示公开阅读权限的知识
				</div>
			</div>
			<div style="height: 500px; overflow: auto;">
				<div id="loadProcessBoxId"
					style="text-align: center; display: none; background-color: #d9534f; color: #ffffff;">loading...</div>
				<table class="table table-striped docstable" id="docsloadboxid">
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#docsSearchButtonId').click(function() {
			loadRelaDocs();
		});
		loadRelaDocs();
	});
	//提交表单的时候，生成关联知识
	function parseRelasDocsId() {
		//合计关联知识id
		var relationDocIds;
		$('.relation_tagname').each(
				function(i, obj) {
					if (!relationDocIds) {
						relationDocIds = $(obj).attr('id').replace("tag", "");
					} else {
						relationDocIds = relationDocIds + ','
								+ $(obj).attr('id').replace("tag", "");
					}
				});
		$('#relationdocsid').val(relationDocIds);
	}
	function userRelation(docid, docname) {
		try {
			addUserEventHandle(docid, docname);
		} catch (e) {
			alert("addUserEventHandle(docid, docname);");
		}
	}
	function openRelationDoc(docid) {
		window.open(basePath
				+ "webspecial/view/Pub${special.special.id}.do?docid=" + docid);
	}

	function creatKnowtagHtml(docid, docname) {
		var html = new Array();
		html
				.push("<div class='doc_relation_tag'> <span class='glyphicon glyphicon-link'></span>&nbsp;");
		html.push("<span class='relation_tagname' id='tag"+docid+"'>" + docname
				+ "</span> ");
		html
				.push("&nbsp;<span onclick=\"openRelationTag('"
						+ docid
						+ "',this)\" class='glyphicon glyphicon-search tagbutton'></span>");
		html
				.push("&nbsp;<span onclick=\"removeRelationTag('"
						+ docid
						+ "',this)\" class='glyphicon glyphicon-remove tagbutton'></span>&nbsp;");
		html.push("</div>");
		return html.join("");
	}
	function removeRelationTag(docid, obj) {
		$(obj).parent('.doc_relation_tag').remove();
	}
	function openRelationTag(docid, obj) {
		window.open("webdoc/view/Pub" + docid + ".html");
	}
	function loadRelaDocs() {
		$('#loadProcessBoxId').show();
		$
				.post(
						'home/FPsearchKnow.do',
						{
							'wordcase' : $('#searchDocCaseId').val()
						},
						function(flag) {
							$('#loadProcessBoxId').hide();
							$('#docsloadboxid').html("");
							$('#docsloadboxid')
									.append(
											"<tr><th>知识名称</th><th >知识类型</th><th ></th></tr>");
							var demosobj = $.parseJSON(flag);
							if (demosobj.ALERTMES) {
								$('#relationAlertMessageBox').html(
										demosobj.ALERTMES);
							}
							demos = new Array();
							$(demosobj.list)
									.each(
											function(i, obj) {
												var html = new Array();
												demos.push(obj.demotext);
												html.push("<tr>");
												html
														.push("<td><a href='javascript:openRelationDoc(\""
																+ obj.ID
																+ "\")'>"
																+ obj.TITLE
																+ "</a></td>");
												html.push("<td >" + obj.DOMTYPE
														+ "</td>");
												var buttonhtml = "<button onclick='userRelation(\""
														+ obj.ID
														+ "\",\""
														+ obj.TITLE
														+ "\")' type='button' class='btn btn-primary btn-xs userdemocs'>添加</button>";
												html.push("<td >" + buttonhtml
														+ "</td>");
												html.push("</tr>");
												$('#docsloadboxid').append(
														html.join(""));
											});
						});
		return true;
	}
</script>