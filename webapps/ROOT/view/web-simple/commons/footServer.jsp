<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="super_contentfoot  hidden-xs" style="margin: 0px;">
	<div class="container ">
		<div class="row">
			<div class="col-sm-1"><jsp:include
					page="../commons/includeTowDCode.jsp"></jsp:include></div>
			<div class="col-sm-11 putServerBox">
				<ul id="recommendServiceList" class="footServerUl">
					<DOC:WebUrls var="node" type="1">
						<li><img class="img-circle footServerImg"
							alt="${node.WEBNAME}" src="${node.IMGURL}" />&nbsp; <a
							href="${node.URL}" target="${config_sys_link_newwindow_target}">${node.WEBNAME}</a></li>
					</DOC:WebUrls>
					<c:if test="${USEROBJ!=null}">
						<DOC:WebUrls var="node" type="2">
							<li><img class="img-circle footServerImg"
								alt="${node.WEBNAME}" src="${node.IMGURL}" />&nbsp; <a
								href="${node.URL}" target="${config_sys_link_newwindow_target}">${node.WEBNAME}</a></li>
						</DOC:WebUrls>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>