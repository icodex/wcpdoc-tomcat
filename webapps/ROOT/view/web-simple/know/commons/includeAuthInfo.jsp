<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<DOC:canDelIsShow docId="${DOCE.doc.id}">
	<style>
<!--
.badge {
	font-weight: lighter;
	margin-top: 3px;
}
-->
</style>
	<a name="markdocauth"></a>
	<br />
	<div class="row doc_column_box">
		<div class="col-sm-12">
			<span class="glyphicon glyphicon-user   column_title">&nbsp;访问权限</span>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<hr class="hr_split" />
			<table class="table table-bordered table-hover"
				style="font-size: 12px;">
				<tr>
					<td class="active" style="width: 100px;"><b>创建人</b></td>
					<td><a href="webuser/PubHome.do?userid=${DOCE.user.id}">${DOCE.user.name}</a>
					</td>
				</tr>
				<c:if test="${DOCE.group.groupname!=null}">
					<tr>
						<td class="active"><b>工作小组</b></td>
						<td><a href="webgroup/Pubshow.do?groupid=${DOCE.group.id}">${DOCE.group.groupname}</a>
						</td>
					</tr>
				</c:if>
				<tr>
					<td class="active"><b>文档编辑权限</b></td>
					<td><c:if test="${DOCE.doc.writepop==3}">
							<code>禁止</code>
						</c:if> <c:if test="${DOCE.doc.writepop==1}">
							<code>公开</code>
						</c:if> <c:if test="${DOCE.doc.writepop==0}">
							<code>创建者私有</code>
						</c:if> <c:if test="${DOCE.doc.writepop==2}">
							<code>工作小组</code>
						</c:if> <c:if test="${DOCE.doc.docpopis=='2'||DOCE.doc.docpopis=='3'}">
							<code>编辑权限自定义</code>
						</c:if></td>
				</tr>
				<tr>
					<td class="active"><b>文档阅读权限</b></td>
					<td><c:if test="${DOCE.doc.readpop==3}">
							<code>禁止</code>
						</c:if> <c:if test="${DOCE.doc.readpop==1}">
							<code>公开</code>
						</c:if> <c:if test="${DOCE.doc.readpop==0}">
							<code>创建者私有</code>
						</c:if> <c:if test="${DOCE.doc.readpop==2}">
							<code>工作小组</code>
						</c:if> <c:if test="${DOCE.doc.docpopis=='1'||DOCE.doc.docpopis=='3'}">
							<code>阅读权限自定义</code>
						</c:if></td>
				</tr>
			</table>
		</div>
	</div>
</DOC:canDelIsShow>