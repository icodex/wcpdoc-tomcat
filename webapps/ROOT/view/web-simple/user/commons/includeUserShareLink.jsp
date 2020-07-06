<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%><%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<div class="list-group">
	<c:forEach var="node" items="${docs.resultList}">
		<div class="list-group-item">
			<div class="row">
				<div class="col-md-12">
					<h5 class="list-group-item-heading">
						<c:if test="${node.PSTATE!='可用'}">
							<span class="label label-warning" style="font-size: 12px;">链接${node.PSTATE}</span>
						</c:if>
						<c:if test="${node.PSTATE=='可用'}">
							<a href="webshare/showlink.do?id=${node.ID}" type="button" class="btn btn-success btn-xs">链接${node.PSTATE}</a>
						</c:if>
						<span style="font-size: 14px; color: gray;">于</span>
						&nbsp;${node.CTIME}&nbsp;
						<span style="font-size: 14px; color: gray;">分享内容</span>
						&nbsp;${node.NAME}&nbsp;
						<span class="label label-default" style="font-size: 12px;">${node.SHARETYPE}/有效期${node.SHARELIVE}/访问${node.VISITNUM}人次</span>
						<c:if test="${node.PSTATE=='可用'}">
							<a href="javascript:unShareFunc('${node.ID}')" type="button" class="btn btn-info btn-xs">取消分享</a>
						</c:if>
					</h5>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<div class="row">
	<div class="col-xs-12">
		<c:if test="${fun:length(docs.resultList) > 0}">
			<ul class="pagination pagination-sm" style="float: left;">
				<c:forEach var="page" begin="${docs.startPage}" end="${docs.endPage}" step="1">
					<c:if test="${page==docs.currentPage}">
						<li class="active">
							<a>${page} </a>
						</li>
					</c:if>
					<c:if test="${page!=docs.currentPage}">
						<li>
							<a href="webuser/PubHome.do?type=${type}&num=${page}&userid=${userid}">${page}</a>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</div>
<script type="text/javascript">
	function unShareFunc(linkid) {
		var question = confirm("你确定要撤销该链接吗？");
		if (question) {
			window.location.href = basePath + "webshare/unShare.html?id="
					+ linkid + "&num=${docs.currentPage}";
		}
	}
</script>