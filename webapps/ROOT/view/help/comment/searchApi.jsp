<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<h1>全文检索</h1>
<p class="protocol">${CURL}/search.do</p>
<p class="lead">只能够查询到知识</p>
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
			<th scope="row">word</th>
			<td>检索词</td>
			<td class="demo">必填</td>
		</tr>
		<tr>
			<th scope="row">domtype</th>
			<td>结果类型[know,fqa,all]</td>
			<td class="demo">必填，[know：知识]</td>
		</tr>
		<tr>
			<th scope="row">secret</th>
			<td>权限码</td>
			<td class="demo">必填,通过知识库配置文件预先配置</td>
		</tr>
		<tr>
			<th scope="row">operatorLoginname</th>
			<td>操作用户登陆名称</td>
			<td class="demo">必填（在用户权限范围内查询）</td>
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
			<th scope="row">TITLE</th>
			<td>标题</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">AUTHOR</th>
			<td>创建者</td>
			<td>如：系统管理员</td>
		</tr>
		<tr>
			<th scope="row">TYPENAME</th>
			<td>分类名称</td>
			<td>如：规范图集标准/暖通/规范解读</td>
		</tr>
		<tr>
			<th scope="row">VISITNUM</th>
			<td>访问量</td>
			<td>如：32</td>
		</tr>
		<tr>
			<th scope="row">READPOP</th>
			<td>阅读权限</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">HAVIMG</th>
			<td>是否有图片</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">TEXT</th>
			<td>文本描述</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">DOCID</th>
			<td>知识ID</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">ID</th>
			<td>索引ID</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">DOCDESCRIBE</th>
			<td>文本摘要</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">DOMTYPE</th>
			<td>文档类型</td>
			<td>1：文档知识，5:资源知识,6:网络资源</td>
		</tr>
		<tr>
			<th scope="row">PUBTIME</th>
			<td>发布时间</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">USERID</th>
			<td>用户id</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">TAGKEY</th>
			<td>文档标签</td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">TYPEID</th>
			<td>分类id</td>
			<td></td>
		</tr>
	</tbody>
</table>