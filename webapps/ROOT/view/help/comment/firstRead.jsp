<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!-- 机构接口 -->
<h1>准备</h1>
<h2>API访问地址的根路径为：</h2>
<p class="protocol">${CURL}</p>
<p class="lead">本接口采用http协议通过json传参方式进行调用</p>
<h2>接口启用状态为：</h2>
<p class="protocol">
	<PF:ParameterValue key="config.restful.state" />
</p>
<h2>接口调试状态为：</h2>
<p class="protocol">
	<PF:ParameterValue key="config.restful.debug" />
</p>
<h2>接口校验类型为：</h2>
<p class="protocol">
	<PF:ParameterValue key="config.restful.secret.type" />
</p>
<p class="lead" style="color: gray; font-size: 14px;">
	<b>complex</b>[使用安全码的同时必须带入操作人信息]|<b>simple</b>[简单模式直接使用安全码访问]
</p>
<h2>允许调研接口IP白名单：</h2>
<p class="protocol">
	<PF:ParameterValue key="config.restful.whitelist.ips" />
</p>
<h2>SECRET为：</h2>
<p class="lead" style="color: gray; font-size: 14px;">
	<b>SECRET:</b> 在配置文件中配置的一组随机数密码，本系统中为
	<PF:ParameterValue key="config.restful.secret.key" />
</p>