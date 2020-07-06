<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<ul class="nav navbar-nav navbar-right hidden-xs"
	style="margin-right: 10px;">
	<PF:IfParameterEquals key="config.show.search.headbox" val="true">
		<!-- 查询 -->
		<li class="hidden-lg"><a href="websearch/PubHome.html"><span
				class="glyphicon glyphicon-search"></span></a></li>
	</PF:IfParameterEquals>
	<PF:IfParameterNoEquals key="config.show.search.headbox" val="true">
		<!-- 查询 -->
		<li><a href="websearch/PubHome.html"><span
				class="glyphicon glyphicon-search"></span></a></li>
	</PF:IfParameterNoEquals>
	<!-- 登录注册 -->
	<c:if test="${USEROBJ==null}">
		<li><a href="login/webPage.html"><span
				class="glyphicon glyphicon glyphicon-user"></span> 登录<PF:IfParameterEquals
					key="config.show.local.regist.able" val="true">/注册</PF:IfParameterEquals></a></li>
	</c:if>
	<c:if test="${USEROBJ!=null}">
		<c:if test="${USEROBJ.type!='4'}">
			<!-- 创建知识和提问 -->
			<li class="dropdown	"><a class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false"> <span class="glyphicon glyphicon-plus"></span>
					知识<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<jsp:include page="../operation/includeCreatOperate.jsp"></jsp:include>
				</ul></li>
		</c:if>
		<!-- 登录後菜單 -->
		<li class="dropdown	"><a class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-haspopup="true"
			aria-expanded="false"> <span class="glyphicon glyphicon-user"></span>
				${USEROBJ.name}<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="webuser/PubHome.do"><span
						class=" glyphicon glyphicon-list-alt"></span>&nbsp;我的空间</a></li>
				<li><a href="resume/contacts.html"><span
						class="glyphicon glyphicon-earphone"></span>&nbsp;通讯录</a></li>
				<%
					String agent = request.getHeader("User-Agent").toLowerCase();
						if (agent.indexOf("dingtalk-win") > 0) {
				%>
				<li><a href="dingding/PubOpenLink.do"><span
						class="glyphicon glyphicon-globe"></span>&nbsp;打开外部浏览器</a></li>
				<%
					}
				%>
				<c:if test="${USEROBJ!=null&&!empty USERMENU}">
					<li><a href="frame/index.do"><span
							class="glyphicon glyphicon-cog"></span>&nbsp;管理控制台</a></li>
				</c:if>
				<DOC:WebUrls var="node" type="5">
					<li><a target="${config_sys_link_newwindow_target}"
						href='${node.URL}'><img class="imgMenuIcon img-circle"
							alt="${node.WEBNAME}" src="${node.IMGURL}" />${node.WEBNAME}</a></li>
				</DOC:WebUrls>
				<li><a href="login/webout.do"><span
						class="glyphicon glyphicon-off"></span>&nbsp;注销</a></li>
			</ul></li>

	</c:if>
	<c:if test="${USEROBJ!=null}">
		<li class="hidden-xs hidden-sm"><a id="wcpUserUessageTopId"
			style="display: none;"
			href="webuser/PubHome.do?type=usermessage&userid=${USEROBJ.id}"><span
				class="wcp-user-message"><span
					class="glyphicon glyphicon-envelope"></span>&nbsp;<span
					id="wcpUserUessageTopCountId"></span></span></a></li>
	</c:if>
</ul>