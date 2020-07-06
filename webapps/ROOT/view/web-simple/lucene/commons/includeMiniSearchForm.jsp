<%@page import="java.net.URLEncoder"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="text/lib/autocomplete/completer.min.js"></script>
<link rel="stylesheet" href="text/lib/autocomplete/completer.css">
<div class=" shadow-box hidden-xs" style="background-color: #f4f4f4;">
	<div class="title">
		<div style="margin: 16px; padding-left: 10%; padding-right: 10%;">
			<form action="websearch/PubDo.do" id="websearchpubdoId" method="post">
				<div class="input-group">
					<input type="text" class="form-control" name="word" value="${word}"
						id="searchInput" placeholder="请输入关键字...">
					<!-- 结果类型 -->
					<input type="hidden" name="resultType" id="resultTypeInputId"
						value="${resultType}">
					<div class="input-group-btn">
						<button class="btn btn-info" type="submit">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;<span
								id="resultTypeNameId">检索</span>
						</button>
						<button type="button" class="btn btn-info dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-menu-right">
							<li><a href="javascript:chooseResultTypeAll(0);">查找&nbsp;<b>全部</b></a></li>
							<li role="separator" class="divider"></li>
							<li><a href="javascript:chooseResultTypeKnow(0);">查找&nbsp;<b>知识</b></a></li>
							<li><a href="javascript:chooseResultTypeImg(0);">查找&nbsp;<b>图片</b></a></li>
						</ul>
					</div>
				</div>
				<script type="text/javascript">
				$('#searchPlusButtonId').bind(
						'click',
						function() {
							$('#websearchpubdoId').attr('action',
									"websearch/PubPlus.do");
							$('#websearchpubdoId').submit();
						});
				//选择查询知识
				function chooseResultTypeKnow() {
					$('#resultTypeNameId').text('知识');
					$('#resultTypeInputId').val('know');
					if($('#searchInput').val()){
						$('#websearchpubdoId').submit();
					}
				}
				//选择查询图片
				function chooseResultTypeImg() {
					$('#resultTypeNameId').text('图片');
					$('#resultTypeInputId').val('img');
					if($('#searchInput').val()){
						$('#websearchpubdoId').submit();
					}
				}
				//选择查询检索
				function chooseResultTypeAll() {
					$('#resultTypeNameId').text('检索');
					$('#resultTypeInputId').val('all');
					if($('#searchInput').val()){
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
					case 'img':
						$('#resultTypeNameId').text('图片');
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
</div>
<div class="widget-box shadow-box hidden-lg hidden-md hidden-sm" style="background-color: #faf6f5;">
	<div class="title">
		<div style="margin: 16px; padding-left: 10%; padding-right: 10%;">
			<form action="websearch/PubDo.do" id="websearchpubdoMiniId" method="post">
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
