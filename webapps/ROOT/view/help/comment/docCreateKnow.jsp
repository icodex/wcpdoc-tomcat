<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<h1>创建文档知识</h1>
<p class="protocol">${CURL}/create/know.do</p>
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
			<th scope="row">title</th>
			<td>知识标题</td>
			<td class="demo">必填</td>
		</tr>
		<tr>
			<th scope="row">typeid</th>
			<td>知识分类id</td>
			<td class="demo">必填</td>
		</tr>
		<tr>
			<th scope="row">text</th>
			<td>知识正文</td>
			<td class="demo">必填</td>
		</tr>
		<tr>
			<th scope="row">writetype</th>
			<td>知识编辑类型</td>
			<td class="demo">必填：1分类,0创建人</td>
		</tr>
		<tr>
			<th scope="row">readtype</th>
			<td>知识阅读类型</td>
			<td class="demo">必填：1分类</td>
		</tr>
		<tr>
			<th scope="row">resourceurl</th>
			<td>知识来源url</td>
			<td class="demo">选填</td>
		</tr>
		<tr>
			<th scope="row">tags</th>
			<td>标签</td>
			<td class="demo">选填，多个标签间用英文逗号(,)分隔</td>
		</tr>
		<tr>
			<th scope="row">imgid</th>
			<td>预览图id</td>
			<td class="demo">选填</td>
		</tr>
		<tr>
			<th scope="row">typefieldjson</th>
			<td>分类属性</td>
			<td class="demo">选填，必须为json格式</td>
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
			<th scope="row">ID</th>
			<td>知识id</td>
			<td class="demo">32位UUID</td>
		</tr>
		<tr>
			<th scope="row">MESSAGE</th>
			<td>错误信息</td>
			<td class="demo"></td>
		</tr>
	</tbody>
</table>