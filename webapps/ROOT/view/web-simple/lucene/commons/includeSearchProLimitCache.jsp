<%@page import="java.net.URLEncoder"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 缓存高级查询的表单数据 -->
<form id="proSearchFormId" action="websearch/PubDopro.do" method="post">
	<!--  -->
	<input type="hidden" name="resultType" value="${resultType}" id="resultTypeProInputId">
	<!--  -->
	<input type="hidden" name="limitType" value="${limitType}">
	<!--  -->
	<input type="hidden" name="indexGroups" value="${indexGroups}">
	<!--  -->
	<input type="hidden" name="indexTypes" value="${indexTypes}">
	<!--  -->
	<input type="hidden" name="word" value="${word}">
	<!--  -->
	<input type="hidden" name="pagenum" id="pagenumProInputId" value="1">
	<!-- 展示类型 -->
	<input type="hidden" name="showType" id="showTypeProInputId" value="${showType}">
</form>