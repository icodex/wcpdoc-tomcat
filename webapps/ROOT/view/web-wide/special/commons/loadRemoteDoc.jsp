<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="hidden-xs hidden-sm hidden-md"><jsp:include
		page="includeNavigationMini.jsp"></jsp:include></div>
<div class="widget-box shadow-box"
	style="padding: 40px; border-width: 0px;">
	<c:if test="${DOCE.doc.domtype=='5'}">
		<div class='noborder-wcp'></div>
		<jsp:include page="webfile.jsp"></jsp:include>
	</c:if>
	<c:if test="${DOCE.doc.domtype!='5'}">
		<jsp:include page="know.jsp"></jsp:include>
	</c:if>
	<!-- 是否启用小目录 -->
	<jsp:include
		page="../../../web-simple/know/commons/includeOnlyPraiseDoc.jsp"></jsp:include>
	<div class="text-center">
		<div class="table-responsive" style="overflow: auto; border: 0px;">
			<span class="button-wrap"> <a
				href="webdoc/view/Pub${DOCE.doc.id}.html"
				style="text-decoration: none;"
				class="button button-pill button-raised button-large"> <i
					class="glyphicon glyphicon-hand-up"></i> 点击访问原文
			</a>
			</span>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		try {
			initWcpGraph();
		} catch (e) {
			//知识图谱加载错误
			console.log(e);
		}
	});
</script>

