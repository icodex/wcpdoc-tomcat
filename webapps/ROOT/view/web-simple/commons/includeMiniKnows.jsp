<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="widget-box shadow-box">
	<div class="title">
		<h3>
			<i class="glyphicon glyphicon-star"></i> 最新知识<a class="more-link"
				href="webtype/view/Pub1.html">查看更多</a>
		</h3>
	</div>
	<div class="stream-list p-stream">
		<div class="row">
			<div class="col-sm-6">
				<ul class="box-list" id="hots">
					<c:forEach items="${docbriefs}" varStatus="status" var="node">
						<c:if test="${status.index%2==0}">
							<li><div class="li-out">
									<span class="last"> </span>
									<span class="name" style="width: 355px;">
									<span style="font-size: 10px;">
									<PF:FormatTime date="${node.etime}" yyyyMMddHHmmss="yyyy-MM-dd" /></span> 
									<jsp:include page="includeKnowIcon.jsp">
										<jsp:param value="${node.domtype}" name="domtype" />
									</jsp:include><a target="${config_sys_link_newwindow_target}"  href="webdoc/view/Pub${node.docid}.html">${node.title}</a></span>
								</div></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="col-sm-6">
				<ul class="box-list" id="hots">
					<c:forEach items="${docbriefs}" varStatus="status" var="node">
						<c:if test="${status.index%2==1}">
							<li><div class="li-out">
									<span class="last"> </span><span class="name"
										style="width: 355px;"> <span style="font-size: 10px;"><PF:FormatTime
												date="${node.pubtime}" yyyyMMddHHmmss="yyyy-MM-dd" /></span>
									<jsp:include page="includeKnowIcon.jsp">
										<jsp:param value="${node.domtype}" name="domtype" />
									</jsp:include><a  target="${config_sys_link_newwindow_target}"  href="webdoc/view/Pub${node.docid}.html">${node.title}</a></span>
								</div></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div style="margin-top: 20px;"></div>
	</div>
</div>