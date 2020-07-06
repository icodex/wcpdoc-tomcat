<%@page import="java.net.URLEncoder"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="text/lib/autocomplete/completer.min.js"></script>
<link rel="stylesheet" href="text/lib/autocomplete/completer.css">
<div class="row">
	<div class="col-sm-12 ">
		<form action="websearch/PubDo.do" id="websearchpubdoId" method="post">
			<div class="input-group">
				<div class="input-group-btn">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span id="limitTypeTag">全部</span>&nbsp;<span class="caret"></span>
					</button>
					<!-- 条件类型 -->
					<input type="hidden" name="limitType" id="limitTypeInputId"
						value="ALL">
					<ul class="dropdown-menu">
						<li><a href="javascript:chooseLimitType('ALL')" href="#">全部</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="javascript:chooseLimitType('TAG')">标签</a></li>
						<li><a href="javascript:chooseLimitType('TITLE')" href="#">标题</a></li>
						<li><a href="javascript:chooseLimitType('TYPE')" href="#">分类</a></li>
						<li><a href="javascript:chooseLimitType('AUTHOR')" href="#">作者</a></li>
					</ul>
				</div>
				<input type="text" class="form-control" name="word"
					value="${clearWord}" id="searchInput" placeholder="请输入关键字...">
				<!-- 结果类型 -->
				<input type="hidden" name="resultType" id="resultTypeInputId"
					value="${resultType}">
				<!-- 查询页数 -->
				<input type="hidden" name="pagenum" id="pagenumInputId" value="1">

				<!-- 展示类型 -->
				<input type="hidden" name="showType" id="showTypeInputId"
					value="${showType}">
				<div class="input-group-btn">
					<button class="btn btn-info" type="submit">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						&nbsp; <span id="resultTypeNameId">检索</span>
					</button>
					<button type="button" class="btn btn-info dropdown-toggle"
						data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="javascript:chooseResultTypeAll(0);">
								查找&nbsp; <b>全部</b>
						</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="javascript:chooseResultTypeKnow(0);">
								查找&nbsp; <b>知识</b>
						</a></li>
						<li><a href="javascript:chooseResultTypeFile(0);">
								查找&nbsp; <b>附件</b>
						</a></li>
					</ul>
				</div>
			</div>
			<script type="text/javascript">
				var limitType = '${limitType}';
				$(function() {
					$('#limitTypeTag').text(turnLimitType());
					$('#limitTypeInputId').val(limitType);
					$('#searchPlusButtonId').bind(
							'click',
							function() {
								$('#websearchpubdoId').attr('action',
										"websearch/PubPlus.do");
								$('#websearchpubdoId').submit();
							});
				});
				//选择条件类型
				function chooseLimitType(type) {
					//选择条件类型
					if (type == "TAG") {
						$('#limitTypeTag').text('标签');
						$('#limitTypeInputId').val("TAG");
					}
					if (type == "TITLE") {
						$('#limitTypeTag').text('标题');
						$('#limitTypeInputId').val("TITLE");
					}
					if (type == "ALL") {
						$('#limitTypeTag').text('全部');
						$('#limitTypeInputId').val("ALL");
					}
					if (type == "TYPE") {
						$('#limitTypeTag').text('分类');
						$('#limitTypeInputId').val("TYPE");
					}
					if (type == "AUTHOR") {
						$('#limitTypeTag').text('作者');
						$('#limitTypeInputId').val("AUTHOR");
					}
				}
				function turnLimitType() {
					if (limitType == "TYPE") {
						return '分类';
					}
					if (limitType == "TAG") {
						return '标签';
					}
					if (limitType == "AUTHOR") {
						return '作者';
					}
					if (limitType == "TITLE") {
						return '标题';
					}
					if (limitType == "ALL") {
						return '全部';
					}
				}
				//选择查询知识
				function chooseResultTypeKnow() {
					$('#resultTypeNameId').text('知识');
					$('#resultTypeInputId').val('know');
					if ($('#searchInput').val()) {
						$('#websearchpubdoId').submit();
					}
				}
				//选择查询附件
				function chooseResultTypeFile() {
					$('#resultTypeNameId').text('附件');
					$('#resultTypeInputId').val('file');
					if ($('#searchInput').val()) {
						$('#websearchpubdoId').submit();
					}
				}
				//选择查询图片
				function chooseResultTypeImg() {
					$('#resultTypeNameId').text('图片');
					$('#resultTypeInputId').val('img');
					if ($('#searchInput').val()) {
						$('#websearchpubdoId').submit();
					}
				}
				//选择查询全部
				function chooseResultTypeAll() {
					$('#resultTypeNameId').text('检索');
					$('#resultTypeInputId').val('all');
					if ($('#searchInput').val()) {
						$('#websearchpubdoId').submit();
					}
				}
				//初始化检索结果类型的组件
				$(function() {
					var resultType = $('#resultTypeInputId').val();
					switch (resultType) {
					case 'know':
						$('#resultTypeNameId').text('知识');
						break;
					case 'fqa':
						break;
					case 'file':
						$('#resultTypeNameId').text('附件');
						break;
					case 'img':
						$('#resultTypeInputId').val('all');
						$('#resultTypeNameId').text('检索');
						break;
					default:
						$('#resultTypeInputId').val('all');
						$('#resultTypeNameId').text('检索');
					}
				});
			</script>
			<!-- 专业版功能 -->
		</form>
	</div>
</div>
<c:if test="${fn:length(searchTypes)>0}">
	<div
		style="background-color: #f9f0c5; border: 1px dashed #f5e79e; padding: 8px; margin-top: 4px; margin-bottom: 4px; color: #8c6d3b; font-size: 14px;">
		在分类下查询:
		<c:if test="${fn:length(searchTypes)>3}">
			<c:forEach begin="0" end="2" var="node" items="${searchTypes }"> 
			[<b>${node.name}</b>]
			</c:forEach>
			...等${fn:length(searchTypes)}条分类或子分类</c:if>
		<c:if test="${fn:length(searchTypes)<=3}">
			<c:forEach var="node" items="${searchTypes }"> 
			[<b>${node.name}</b>]
			</c:forEach>
		</c:if>
	</div>
</c:if>
<div class="row" style="padding-top: 8px;">
	<div class="col-sm-12 "> 
		<c:forEach items="${hotCase}" var="node">
			<a class="hotWordsearch"> <span class="label label-danger"
				style="cursor: pointer;">${fn:length(node) <= 10 ? node : fn:substring(node,0,10) }</span>
			</a>
		</c:forEach>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('.hotWordsearch').bind('click', function() {
			luceneSearch($(this).text());
		});
	});
	//切换图片检索和普通检索
	function turnSearchType(flag) {
		if (type == "normal") {
			//普通检索
			if (flag == "list") {
				//列表
				$('#showTypeInputId').val('all');
			}
			if (flag == "img") {
				//图片
				$('#showTypeInputId').val('img');
			}
			$('#websearchpubdoId').submit();
		}
	}
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