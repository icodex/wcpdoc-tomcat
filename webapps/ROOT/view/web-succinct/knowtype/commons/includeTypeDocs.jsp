<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!-- DOCID,title,DOCDESCRIBE,AUTHOR,PUBTIME,TAGKEY
	 *         ,IMGID,VISITNUM,PRAISEYES,PRAISENO,HOTNUM,EVALUATE,ANSWERINGNUM,
	 *         TYPENAME -->
<c:if test="${showType=='grid'}">
	<!-- 網格展示知识 -->
	<div style="margin-top: -20px; padding-left: 18px;">
		<jsp:include
			page="/view/web-simple/commons/includeListGridByDocBrief.jsp"></jsp:include></div>
</c:if>
<c:if test="${showType=='minlist'}">
	<!-- mini列表展示知识 -->
	<div class="wcp-su-out-box" style="margin-bottom: 4px;">
		<div class="unit" style="padding: 0px; margin: 0px;">
			<jsp:include
				page="/view/web-simple/commons/includeListMiniByDocBrief.jsp"></jsp:include></div>
	</div>
</c:if>
<c:if test="${showType!='minlist'&&showType!='grid'}">
	<div class="wcp-su-out-box" style="margin-bottom: 4px;">
		<div class="unit"
			style="margin-top: 0px; padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px; padding-left: 10px; padding-right: 0px;">
			<!-- 列表展示知识 -->
			<jsp:include
				page="/view/web-simple/commons/includeListByDocBrief.jsp"></jsp:include></div>
	</div>
</c:if>
<c:if test="${fun:length(docs.resultList) > 0||type.questionnum>0}">
	<div class="wcp-su-out-box">
		<div class="unit"
			style="margin-top: 0px; padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
			<div class="page-box">
				<div class="row">
					<div class="col-sm-6">
						<c:if test="${fun:length(docs.resultList) > 0}">
							<ul class="pagination pagination-sm">
								<c:forEach var="page" begin="${docs.startPage}"
									end="${docs.endPage}" step="1">
									<c:if test="${page==docs.currentPage}">
										<li class="active"><a>${page} </a></li>
									</c:if>
									<c:if test="${page!=docs.currentPage}">
										<li><a
											href="webtype/view${typeid}/Pub${page}.html?typeDomainId=${typeDomainId}&showType=${showType}&pagenum=">${page}</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</div>
					<div class="col-sm-6">
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>