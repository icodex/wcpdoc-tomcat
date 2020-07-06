<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<h1>通过base64上传图片</h1>
<p class="protocol">${CURL}/add/base64img.do</p>
<p class="lead">URL描述</p>
<h3>参数</h3>
<table class="table table-striped">
	<thead>
		<tr>
			<th>属性</th> 
			<th>描述</th>
			<th>备注</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">base64</th>
			<td>主键</td>
			<td class="demo">必填,图片的base64编码</td>
		</tr>
		<tr>
			<th scope="row">filename</th>
			<td>图片名称</td>
			<td class="demo">必填,图片名称需要带后缀，如：f42853157e261de9bf7d20.jpg</td>
		</tr>
		<tr>
			<th scope="row">secret</th>
			<td>权限码</td>
			<td class="demo">必填,通过知识库配置文件预先配置</td>
		</tr>
		<tr>
			<th scope="row">operatorLoginname</th>
			<td>操作用户登陆名称</td>
			<td class="demo">必填</td>
		</tr>
		<tr>
			<th scope="row">operatorPassword</th>
			<td>操作用户登陆密码</td>
			<td class="demo">必填</td>
		</tr>
	</tbody>
</table>
<h3>返回值</h3>
<table class="table table-striped">
	<caption></caption>
	<thead>
		<tr>
			<th>参数</th>
			<th>值</th>
			<th>例子</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">STATE</th>
			<td>状态</td>
			<td class="demo">0成功,1失败</td>
		</tr>
		<tr>
			<th scope="row">FILEID</th>
			<td>图片附件id</td>
			<td class="demo"></td>
		</tr>
		<tr>
			<th scope="row">URL</th>
			<td>图片的访问url</td>
			<td class="demo"></td>
		</tr>
		<tr>
			<th scope="row">MESSAGE</th>
			<td>错误信息</td>
			<td class="demo"></td>
		</tr>
	</tbody>
</table>