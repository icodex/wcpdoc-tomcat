<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
<!--
.imgtitle {
	font-size: 10px;
	color: #ffffff;
	background-color: #000000;
	max-width: 960px;
	margin: auto;
}
-->
</style>
<div class="panel panel-default">
	<div class="panel-body"
		style="padding-top: 50px; padding-bottom: 50px;">
		<c:forEach var="node" items="${DOCE.files}">
			<div class="row">
				<div class="col-md-12" style="padding: 0px;">
					<a href="webdoc/view/PubFile${node.id}.html?docid=${DOCE.doc.id}">
						<img class="lazy" style="max-width: 100%; margin-top: 4px;"
						src="<PF:basePath/>text/img/loading2.gif" alt="${node.name}"
						data-original="${node.medurl}" />
					</a>
					<div class="imgtitle">${node.name}</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script type="text/javascript" charset="utf-8">
	$(function() {
		$("img.lazy").lazyload({
			effect : "fadeIn"
		});
	});
</script>
<script charset="utf-8"
	src="<PF:basePath/>text/javascript/jquery.lazyload.js?v=1.9.1"></script>