<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div style="text-align: center;">
	<a name="markDocPrice"></a><br />
	<jsp:include page="includeDocEvaluate.jsp">
		<jsp:param name="isMax" value="true" />
	</jsp:include>
</div>
<hr style="margin-top: 20px;border: 0px;" />
