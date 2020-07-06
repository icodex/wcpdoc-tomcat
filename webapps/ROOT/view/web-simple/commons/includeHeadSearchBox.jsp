<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<PF:IfParameterEquals key="config.show.search.headbox" val="true">
	<form action="websearch/PubDo.do" method="post" id="lucenesearchFormId"
		style="margin-top: 10px;"
		class="navbar-form navbar-right hidden-xs hidden-sm hidden-md" role="search">
		<div class="form-group">
			<div class="input-group" style="max-width: 160px;">
				<input type="text" name="word" id="wordId" value="${word}"
					class="form-control input-sm" placeholder="检索词..."> <input
					type="hidden" id="pageNumId" name="pagenum"> <span
					class="input-group-btn">
					<button type="submit" class="btn btn-default btn-sm">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>检索
					</button>
				</span>
			</div>
		</div>
	</form>
</PF:IfParameterEquals>
<PF:IfParameterNoEquals key="config.show.search.headbox" val="true">
	<!-- 隐藏搜索框，只用于标签展示 -->
	<form action="websearch/PubDo.do" method="post" id="lucenesearchFormId"
		style="margin-top: 10px;"
		class="navbar-form navbar-right hidden-xs hidden-sm hidden-md hidden-lg"
		role="search">
		<div class="form-group">
			<div class="input-group" style="max-width: 120px;">
				<input type="text" name="word" id="wordId" value="${word}"
					class="form-control input-sm" placeholder="检索词..."> <input
					type="hidden" id="pageNumId" name="pagenum"> <span
					class="input-group-btn">
					<button type="submit" class="btn btn-default btn-sm">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				</span>
			</div>
		</div>
	</form>
</PF:IfParameterNoEquals>
