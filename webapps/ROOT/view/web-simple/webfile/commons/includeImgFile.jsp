<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="container">
	<div class="row" style="margin-top: 70px;">
		<div class="col-md-12 text-center">
			<c:if test="${last!=null}">
				<a href="webdoc/view/PubFile${last.id}.html?docid=${docid}"
					type="button" class="btn btn-info btn-sm"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a>
			</c:if>
			<c:if test="${docid!=null}">
				<a href="webdoc/view/Pub${docid}.html" type="button"
					class="btn btn-info btn-sm">返回知识</a>
			</c:if>
			<c:if test="${file.exname!='gif'&&file.exname!='GIF'}">
				<!-- 旋转图片 gif不能旋转-->
				<a href="javascript:rotationImg();" type="button"
					class="btn btn-info btn-sm"><span
					class="glyphicon glyphicon-repeat"></span></a>
			</c:if>
			<c:if test="${next!=null}">
				<a href="webdoc/view/PubFile${next.id}.html?docid=${docid}"
					type="button" class="btn btn-info btn-sm"><span
					class="glyphicon glyphicon-chevron-right"></span></a>
			</c:if>
		</div>
	</div>
	<div class="row" style="margin-top: 8px;">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div
					style="text-align: center; font-size: 12px; margin-top: 4px; color: #666;">${file.name}</div>
				<div class="panel-body">
					<div class="row doc_column_box">
						<div class="col-sm-12">
							<div style="text-align: center;">
								<img class="img-responsive" id="currentfileImgId"
									style="cursor: pointer; margin: auto;" alt="${file}"
									src="${ROTATE0_URL}" /> <br />
							</div>
						</div>
					</div>
					<div class="row" style="margin-top: 8px;">
						<div class="col-md-12 table-responsive">
							<table class="table table-bordered table-hover"
								style="font-size: 12px;">
								<tr>
									<td class="active" style="width: 100px;"><b>名称</b></td>
									<td >${file.name}</td>
									<td class="active" style="width: 100px;"><b>下载量</b></td>
									<td>${file.downum}</td>
								</tr>
								<tr class="downloadButton_wcp">
									<td class="active" style="width: 100px;"><b>操作</b></td>
									<td><DOC:canDownloadShow docId="${docid}">
											<a href="${file.url}"><span
												class="glyphicon glyphicon-download-alt"></span></a>
										</DOC:canDownloadShow></td>
									<td class="active" style="width: 100px;"><b>文件大小</b></td>
									<td>${file.len/1000}kb</td>
								</tr>
								<tr>
									<td class="active" style="width: 100px;"><b>创建时间</b></td>
									<td><PF:FormatTime date="${file.ctime}"
											yyyyMMddHHmmss="yyyy-MM-dd HH:mm:ss" /></td>
									<td class="active" style="width: 100px;"><b>创建人</b></td>
									<td>${file.cusername}</td>
								</tr>
								<tr>
									<td class="active" style="width: 100px;"><b>扩展名</b></td>
									<td>${file.exname}</td>
									<td class="active" style="width: 100px; word-wrap: break-word;"><b>ID</b></td>
									<td style="font-size: 8px;">${file.id}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('img', '#docContentsId').addClass("img-thumbnail");
		var elements = document.querySelectorAll('.img-responsive');
		try {
			Intense(elements);
		} catch (e) {
		}
	});
	function rotationImg() {
		var myDate = new Date();
		$('#currentfileImgId').attr('src', 'text/img/loading2.gif');
		setTimeout(loadrotationImg, 100);
	}
	function loadrotationImg() {
		$('#currentfileImgId').attr('src',
				'${ROTATE90_URL}' + "&time=" + (new Date().getTime()));
	}
</script>