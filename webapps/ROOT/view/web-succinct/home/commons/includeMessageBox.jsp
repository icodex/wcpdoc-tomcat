<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<c:if test="${USEROBJ!=null}">
	<div class="wcp-su-out-box">
		<div class="unit">
			<div class="title">
				<i class="glyphicon glyphicon-envelope"></i>&nbsp;未读消息&nbsp;(${unreadMsgNum==null?0:unreadMsgNum})
				<a class="more-link" style="color: #D9534F;"
					target="${config_sys_link_newwindow_target}"
					href="webuser/PubHome.do?type=usermessage">更多 &gt; </a>
			</div>
		</div>
		<c:forEach items="${unreadMessages}" varStatus="status" var="node">
			<div class="unit unit-min link">
				<a title="${node.NOTAGTITLE}"
					target="${config_sys_link_newwindow_target}"
					href="webusermessage/showMessage.do?id=${node.ID}"><i
					class="glyphicon glyphicon-envelope"></i>&nbsp;${node.TITLE}</a>
			</div>
		</c:forEach>

	</div>
</c:if>