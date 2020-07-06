<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="content-padded">
	<div class="searchbar row">
		<div class="search-input col-75">
			<label class="icon icon-search" for="search"></label> <input
				type="search" id='searchkey' value="${word}" placeholder='关键字...' />
		</div>
		<a href="javascript:searchLucene();" class="button button-fill button-primary col-25 external">检索</a>
	</div>
</div>
<form action="websearch/PubDo.do" method="post" id="lucenesearchFormId">
	<input type="hidden" id="wordId"    name="word" > 
	<input type="hidden" id="pageNumId" name="pagenum">
</form>