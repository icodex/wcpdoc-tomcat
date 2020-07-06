<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>${DOCE.doc.title}-<PF:ParameterValue
		key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="noindex,nofllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8"
	src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container">
			<div class="row" style="margin-top: 70px;">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<c:if test="${DOCE.audit==null }">
								<jsp:include page="../operation/includeWebFileOperate.jsp"></jsp:include>
							</c:if>
							<c:if test="${DOCE.audit!=null }">
							</c:if>
							<div class="doc_title">${DOCE.doc.title}</div>
							<div class="doc-conentinfo">
								<b>作者:</b><a
									href="webuser/PubHome.do?type=file&userid=${DOCE.doc.cuser}"
									title="${DOCE.doc.author}">${DOCE.doc.author}</a> 于
								<PF:FormatTime date="${DOCE.doc.pubtime}"
									yyyyMMddHHmmss="yyyy年MM月dd日" />
								<b>发布在分类</b>
								<c:forEach var="node" items="${DOCE.currenttypes}"
									varStatus="status">
					/
					<a href="webtype/view${node.id}/Pub1.html" title="${node.name}">${node.name}</a>
								</c:forEach>
								<b>下,并于</b>
								<PF:FormatTime date="${DOCE.texts.ctime}"
									yyyyMMddHHmmss="yyyy年MM月dd日" />
								<b>编辑</b>
								<jsp:include page="../know/commons/includeTagInfo.jsp"></jsp:include>
							</div>
						</div>
					</div>
					<c:if test="${TYPE!='AUDIT' }">
						<!-- 0待审核、1审核中、2审核通过、3审核未通过、4废弃 -->
						<div class="alert alert-danger" role="alert">
							<c:if test="${DOCE.audit!=null&&DOCE.audit.pstate=='3' }">
								该版本审核未通过，审核备注：${DOCE.audit.pcontent}
							</c:if>
							<c:if test="${DOCE.audit!=null&&DOCE.audit.pstate=='2' }">
								该版本已审核通过，审核备注：${DOCE.audit.pcontent}
							</c:if>
							<c:if test="${DOCE.audit==null||(DOCE.audit.pstate!='3'&&DOCE.audit.pstate!='2' )}">
								该版本已经提交审核，请等待管理员审核。
							</c:if>
						</div>
					</c:if>
					<!-- 是否当前就一个版本 -->
					<c:if test="${DOCE.auditTemp.id==DOCE.texts.id}">
						<style>
.parent {
	height: 200px;
}
</style>
						<div class="row">
							<div class="col-md-12">
								<jsp:include page="commons/docAuditVersion.jsp"></jsp:include><br />
							</div>
						</div>
					</c:if>
					<!-- 是否当前多个版本 -->
					<c:if test="${DOCE.auditTemp.id!=DOCE.texts.id}">
						<style>
.parent {
	height: 150px;
}
</style>
						<div class="row">
							<div class="col-md-6">
								<jsp:include page="commons/docCurrentVersion.jsp"></jsp:include><br />
							</div>
							<div class="col-md-6" style="border-left: dotted 2px #ccc;">
								<jsp:include page="commons/docAuditVersion.jsp"></jsp:include><br />
							</div>
						</div>
					</c:if>
					<br /> <br />
					<c:if test="${TYPE!='AUDIT' }">
						<div class="panel panel-default">
							<div class="panel-body">
								<a href="webdoc/view/Pub${DOCE.doc.id}.html"
									class="btn btn-info center-block" style="width: 200px;">查看知识当前版本
								</a>
							</div>
						</div>
					</c:if>
					<c:if test="${TYPE=='AUDIT' }">
						<div class="panel panel-default">
							<div class="panel-body">
								<jsp:include page="../know/commons/includeAuditForm.jsp"></jsp:include>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<a name="markdocbottom"></a>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<script type="text/javascript">
		$(function() {
			$('img', '#docContentsId').addClass("img-thumbnail");
		});
	</script>
</body>
</html>