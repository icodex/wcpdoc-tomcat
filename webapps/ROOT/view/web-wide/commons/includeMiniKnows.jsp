<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="wcp-widecolumn-titlebox">
	<div class="wcp-inner-titlebox">
		<i class=" glyphicon glyphicon-unchecked"></i> 最新知识
	</div>
	<hr />
</div>
<div class="stream-list p-stream">
	<div class="row">
		<div class="col-md-6 docTypeBox">
			<div class="docTypeBox-innerBox" style="height: 230px;">
				<ul class="box-list knowListUl" id="hots">
					<c:forEach items="${docbriefs}" varStatus="status" var="node">
						<c:if test="${status.index%2==0}">
							<li style="float: none; border-right: none 0px #fff;"><div
									class="li-out">
									<span class="last"> </span> <span class="name"
										style="width: 355px;"> <span style="font-size: 10px;">
											<PF:FormatTime date="${node.pubtime}"
												yyyyMMddHHmmss="yyyy-MM-dd" />
									</span> <jsp:include
											page="../../web-simple/commons/includeKnowIcon.jsp">
											<jsp:param value="${node.domtype}" name="domtype" />
										</jsp:include><a target="${config_sys_link_newwindow_target}"
										href="webdoc/view/Pub${node.docid}.html">${node.title}</a></span>
								</div></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="col-md-6 docTypeBox">
			<div class="docTypeBox-innerBox" style="height: 230px;">
				<ul class="box-list knowListUl" id="hots">
					<c:forEach items="${docbriefs}" varStatus="status" var="node">
						<c:if test="${status.index%2==1}">
							<li style="float: none; border-right: none 0px #fff;"><div
									class="li-out">
									<span class="last"> </span> <span class="name"
										style="width: 355px;"> <span style="font-size: 10px;">
											<PF:FormatTime date="${node.pubtime}"
												yyyyMMddHHmmss="yyyy-MM-dd" />
									</span> <jsp:include
											page="../../web-simple/commons/includeKnowIcon.jsp">
											<jsp:param value="${node.domtype}" name="domtype" />
										</jsp:include><a target="${config_sys_link_newwindow_target}"
										href="webdoc/view/Pub${node.docid}.html">${node.title}</a></span>
								</div></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div style="margin-top: 20px;"></div>
</div>
