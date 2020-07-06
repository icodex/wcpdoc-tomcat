<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<nav class="bar bar-tab">
	<c:if test="${param.currentIcon==1 }">
		<a class="tab-item wcp-menubar-item external"
			href="<PF:basePath/>home/Pubindex.html"> <img
			src="view/web-mobile/text/icon/all.png"></img> <span class="active">首页</span>
		</a>
	</c:if>
	<c:if test="${param.currentIcon!=1 }">
		<a class="tab-item wcp-menubar-item external"
			href="<PF:basePath/>home/Pubindex.html"> <img
			src="view/web-mobile/text/icon/all_.png"></img> <span
			class="tab-label">首页</span>
		</a>
	</c:if>

	<c:if test="${param.currentIcon==2 }">
		<a class="tab-item wcp-menubar-item external"
			href="webtype/view/Pub1.html"> <img
			src="view/web-mobile/text/icon/form.png"></img> <span class="active">知识</span>
		</a>
	</c:if>
	<c:if test="${param.currentIcon!=2 }">
		<a class="tab-item wcp-menubar-item external"
			href="webtype/view/Pub1.html"> <img
			src="view/web-mobile/text/icon/form_.png"></img> <span
			class="tab-label">知识</span>
		</a>
	</c:if>
	<c:if test="${param.currentIcon==4 }">
		<c:if test="${USEROBJ!=null}">
			<a class="tab-item wcp-menubar-item external"
				href="login/webPage.html"> <img
				src="view/web-mobile/text/icon/account.png"></img> <span
				class="active">我</span>
			</a>
		</c:if>
		<c:if test="${USEROBJ==null}">
			<a class="tab-item wcp-menubar-item external"
				href="login/webPage.html"> <img
				src="view/web-mobile/text/icon/account.png"></img> <span
				class="active">登录</span>
			</a>
		</c:if>
	</c:if>
	<c:if test="${param.currentIcon!=4 }">
		<c:if test="${USEROBJ!=null}">
			<a class="tab-item wcp-menubar-item external"
				href="login/webPage.html"> <img
				src="view/web-mobile/text/icon/account_.png"></img> <span
				class="tab-label">我</span>
			</a>
		</c:if>
		<c:if test="${USEROBJ==null}">
			<a class="tab-item wcp-menubar-item external"
				href="login/webPage.html"> <img
				src="view/web-mobile/text/icon/account_.png"></img> <span
				class="tab-label">登录</span>
			</a>
		</c:if>
	</c:if>
</nav>
