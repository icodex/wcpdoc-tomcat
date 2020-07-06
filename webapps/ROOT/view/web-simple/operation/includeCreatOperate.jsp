<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<c:if test="${USEROBJ.type=='1'||USEROBJ.type=='3'||USEROBJ.type=='5'}">
	<!-- head头部创建知识按钮 -->
	<li><a target="${config_sys_link_newwindow_target}"
		href="know/add.do?typeid=${typeid}&groupid=${groupid}"><span
			class="glyphicon glyphicon-book"></span>&nbsp;创建文档知识</a></li>
	<PF:IfParameterEquals key="config.show.webdownload" val="true">
		<li><a target="${config_sys_link_newwindow_target}"
			href="know/webdown.do?typeid=${typeid}&groupid=${groupid}"><span
				class="glyphicon glyphicon-cloud"></span>&nbsp;下载网页知识 </a></li>
	</PF:IfParameterEquals>
	<li><a target="${config_sys_link_newwindow_target}"
		href="home/wordup.do?typeid=${typeid}&groupid=${groupid}"><span
			class="glyphicon glyphicon-file"></span>&nbsp;word创建知识 </a></li>
	<li style="margin: 0px; padding: 0px;"><hr style="margin: 0px;" /></li>
	<li><a target="${config_sys_link_newwindow_target}"
		href="webfile/add.do?typeid=${typeid}&groupid=${groupid}"><span
			class="glyphicon glyphicon-folder-close"></span>&nbsp;上传资源知识 </a></li>
</c:if> 