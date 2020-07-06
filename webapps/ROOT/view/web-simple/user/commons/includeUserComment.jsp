<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%><%@taglib
	uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<table class="table">
	<!-- 等待审核的文章，审核操作页面 -->
	<thead>
		<tr>
			<th>评论内容</th>
			<th>知识</th>
			<th>评论时间</th>
			<th>回复數量</th>
			<th>赞/踩</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="node" items="${docs.resultList}">
			<tr>
				<td style="max-width: 300px;"><a href="webdocmessage/Pubmsg.do?docid=${node.DOCID}">${node.CONTENT}</a></td>
				<td><a target="${config_sys_link_newwindow_target}"  href="webdoc/view/Pub${node.DOCID}.html">${node.DOCTITLE}</a></td>
				<td>${node.CTIME}</td>
				<td>${node.REPLYNUM}</td>
				<td>${node.PRAISNUM}/${node.CRITCISMNUM}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${fun:length(docs.resultList) > 0}">
	<div class="row">
		<div class="col-xs-12">
			<ul class="pagination pagination-sm">
				<c:forEach var="page" begin="${docs.startPage}"
					end="${docs.endPage}" step="1">
					<c:if test="${page==docs.currentPage}">
						<li class="active"><a>${page} </a></li>
					</c:if>
					<c:if test="${page!=docs.currentPage}">
						<li><a
							href="webuser/PubHome.do?type=${type}&num=${page}&userid=${userid}">${page}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</c:if>