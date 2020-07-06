<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<h1>知识查询</h1>
<p class="protocol">${CURL}/get/know.do</p>
<p class="lead">只能够查询到，分类权限为公开的知识</p>
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
			<th scope="row">id</th>
			<td>主键</td>
			<td class="demo">可以为空</td>
		</tr>
		<tr>
			<th scope="row">categoryid</th>
			<td>分类ID</td>
			<td class="demo">可以为空</td>
		</tr>
		<tr>
			<th scope="row">domtype</th>
			<td>知识类型</td>
			<td class="demo">可以为空，1.文档，5.资源,6.URL</td>
		</tr>
		
		
		<tr>
			<th scope="row">sortfield</th>
			<td>排序字段[PUBTIME]</td>
			<td class="demo">可以为空，可选：PUBTIME</td>
		</tr>
		<tr>
			<th scope="row">sorttype</th>
			<td>排序类型[ASC,DESC]</td>
			<td class="demo">可以为空，可选：ASC,DESC</td>
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
			<th scope="row">DATA.list</th>
			<td>数据</td>
			<td class="demo"></td>
		</tr>
		<tr>
			<th scope="row">DATA.totalsize</th>
			<td>记录总数</td>
			<td class="demo"></td>
		</tr>
		<tr>
			<th scope="row">MESSAGE</th>
			<td>错误信息</td>
			<td class="demo"></td>
		</tr>
	</tbody>
</table>
<h3>字段说明</h3>
<table class="table table-bordered table-striped">
	<caption>字段说明</caption>
	<thead>
		<tr>
			<th>字段名</th>
			<th>字段含义</th>
			<th>备注</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">ID</th>
			<td>主键</td>
			<td>32位UUID</td>
		</tr>
		<tr>
			<th scope="row">AUTHOR</th>
			<td>作者</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">VISITNUM</th>
			<td>访问量</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">STATE</th>
			<td>知识状态</td>
			<td>1开放、0禁用、2文档创建待审核</td>
		</tr>
		<tr>
			<th scope="row">DOCDESCRIBE</th>
			<td>摘要</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">CATEGORYID</th>
			<td>分类id</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">CATEGORYNAME</th>
			<td>分类名称</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">IMGID</th>
			<td>图片id</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">ANSWERINGNUM</th>
			<td>评论量</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">DOMTYPE</th>
			<td>知识类型</td>
			<td>1.文档知识，5资源知识，6网络知识</td>
		</tr>
		<tr>
			<th scope="row">PUBTIME</th>
			<td>发布时间</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">TITLE</th>
			<td>标题 </td>
			<td></td>
		</tr>
	</tbody>
</table>