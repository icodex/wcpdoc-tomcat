<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<header class="bar bar-nav wcp-head">
	<c:if test="${param.showback}">
		<a class="button button-link button-nav pull-left back"> <span
			class="icon icon-left"></span> 返回
		</a>
	</c:if>
	<div class="title">
		<div class="wcp-head-mark">
			<img src="<PF:basePath/>actionImg/Publogo.do" alt="WCP" title="WCP"
				align="middle" />
			<PF:ParameterValue key="config.sys.title" />
		</div>
	</div>
</header>