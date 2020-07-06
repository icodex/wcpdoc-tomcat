<%@page import="java.net.URLEncoder"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="text/lib/autocomplete/completer.min.js"></script>
<link rel="stylesheet" href="text/lib/autocomplete/completer.css">
<div class="widget-box shadow-box hidden-xs"
	style="background-color: #f4f4f4;">
	<div class="title">
		<div
			style="margin: 16px;  padding-left: 10%; padding-right: 10%;">
			<form action="websearch/PubDo.do" id="websearchpubdoId" method="post">
				<div class="input-group">
					<input type="text" class="form-control" name="word" value="${word}"
						id="searchInput" placeholder="请输入检索关键字..."> <span
						class="input-group-btn">
						<button class="btn btn-info" type="submit">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</span>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="widget-box shadow-box hidden-lg hidden-md hidden-sm"
	style="background-color: #faf6f5;">
	<div class="title">
		<div style="margin: 16px; padding-left: 10%; padding-right: 10%;">
			<form action="websearch/PubDo.do" id="websearchpubdoMiniId"
				method="post">
				<div class="input-group">
					<input type="text" class="form-control" name="word" value="${word}"
						placeholder="请输入关键字..."> <span class="input-group-btn">
						<button class="btn btn-info" type="submit">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</span>
				</div>
			</form>
		</div>
	</div>
</div>
<div class=" hidden-xs"
	style="margin: 4px; margin-bottom: 8px; padding-left: 10%; padding-right: 10%;">
	<c:forEach items="${hotCase}" var="node">
		<a class="hotWordsearch"> <span class="label label-danger"
			style="cursor: pointer;">${fn:length(node) <= 10 ? node : fn:substring(node,0,10) }</span>
		</a>
	</c:forEach>
</div>
<script type="text/javascript">
	$(function() {
		$('.hotWordsearch').bind('click', function() {
			luceneSearch($(this).text());
		});
	});
</script>
<PF:IfParameterEquals key="config.search.autocomplete.able" val="true">
	<script type="text/javascript">
		$(function() {
			$('#searchInput').AutoComplete({
				'data' : "websearch/Pubsearch.do",
				'width' : 'auto',
				'ajaxType' : 'post',
				'ajaxDataType' : 'json',
				'onerror' : function(msg) {
					alert(msg);
				},
				'maxHeight' : 200,
				'itemHeight' : 30,
				'matchHandler' : function(keyword, data) {
					return true;
				}
			});
		});
	</script>
</PF:IfParameterEquals>