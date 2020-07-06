<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>${DOCE.doc.title}-<PF:ParameterValue
		key="config.sys.title" /></title>
<meta name="description" content="${DOCE.doc.docdescribe}" />
<meta name="author" content="${DOCE.doc.author}">
<meta name="keywords" content="${DOCE.doc.tagkey}">
<meta name="robots" content="index,fllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8"
	src="<PF:basePath/>text/lib/html-pdf/html2canvas.js"></script>
<script charset="utf-8"
	src="<PF:basePath/>text/lib/html-pdf/jsPdf.debug.js"></script>
</head>
<c:set var="typeid" value="${DOCE.type.id}" scope="request"></c:set>
<body style="background-color: #ffffff;">
	<!-- class="navbar navbar-default|navbar-inverse" -->
	<style>
<!--
.imgMenuIcon {
	width: 16px;
	height: 16px;
	margin-right: 4px;
	margin-left: -2px;
	margin-top: -2px;
}

body {
	word-wrap: break-word;
	background-color: #ffffff;
	word-wrap: break-word;
	font-size: 14px;
	font-family: "PingFangSC", "helvetica neue", "hiragino sans gb", "arial",
		"microsoft yahei ui", "microsoft yahei", "simsun", "sans-serif";
}
-->
</style>
	<div class="navbar navbar-inverse navbar-fixed-top " role="navigation"
		style="margin: 0px;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand"
					style="color: #ffffff; font-weight: bold; padding: 5px;"
					href="<DOC:defaultIndexPage/>"> <img
					src="<PF:basePath/>actionImg/Publogo.do" height="40" alt="WCP"
					align="middle" />
				</a>
			</div>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<div class="containerbox" style="background-color: #ffffff;">
		<div class="container " style="background-color: #ffffff;">
			<div class="row" style="margin-top: 70px;">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">下载文档知识为PDF</h3>
					</div>
					<div class="panel-body">
						<div style="margin: 20px;">
							<b>注意：本功能属于测试功能，效果有待完善，后期有可能删除本功能或进一步优化</b><br />
							1.请使用火狐或者谷歌浏览器.<br />2.请将浏览器最大化后执行下载功能.<br />
							2.如果pdf页面尾部有多个空白页是正常情况 .<br /> <br />
						</div>
						<div style="margin: auto;max-width: 400px;">
							<div class="btn-group btn-group-justified" role="group"
								aria-label="...">
								<div class="btn-group" role="group" >  
									<button id="renderPdf" type="button" class="btn btn-primary">
										<i class=" glyphicon glyphicon-circle-arrow-down "></i>&nbsp;点击下載PDF文件
									</button>
								</div>
								<div class="btn-group" role="group">
									<a href="webdoc/view/Pub${DOCE.doc.id}.html" type="button"
										class="btn btn-default"> 返回知识 </a>
								</div>
							</div>
						</div>
					</div> 
				</div>
			</div>
			<div class="row" style="margin-top: 70px; text-align: center;">
				<div style="max-width: 960px; margin: auto; text-align: left;">
					<div class="col-md-12" style="background-color: #ffffff;"
						id="PdfPrintContentBoxId">
						<!-- 展示知识内容 -->
						<div class="row ">
							<div class="col-md-12">
								<div class="doc_title">${DOCE.doc.title}</div>
								<div class="doc-conentinfo">
									<c:if test="${DOCE.doc.source!=null}">
										<div>
											<b>来源:</b>${DOCE.doc.source}
										</div>
									</c:if>
									作者: ${DOCE.doc.author} 于
									<PF:FormatTime date="${DOCE.doc.pubtime}"
										yyyyMMddHHmmss="yyyy年MM月dd日" />
									<b>发布在分类</b>
									<c:forEach var="node" items="${DOCE.currenttypes}"
										varStatus="status">/${node.name}</c:forEach>
									<b>下,并于</b>
									<PF:FormatTime date="${DOCE.texts.ctime}"
										yyyyMMddHHmmss="yyyy年MM月dd日" />
									<b>编辑</b>
									<jsp:include page="commons/includeTagInfo.jsp"></jsp:include>
									<c:if test="${DOCE.doc.describetype=='2'}">
										<div class="wcp-doc-describe">${DOCE.doc.docdescribe}</div>
									</c:if>
								</div>
							</div>
						</div>
						<div class="row" style="margin-left: -18px; margin-right: -18px;">
							<!-- 当前版本就是待审核版本，或者知识非审核状态 -->
							<c:if
								test="${DOCE.texts.id==DOCE.auditTemp.id||DOCE.auditTemp==null}">
								<div class="col-md-12" id="docContentsId">
									<!-- 自定义表单展示 -->
									<c:if test="${!empty DOCE.fieldForm.fields}">
										<jsp:include page="commons/includeTypeFormView.jsp"></jsp:include>
									</c:if>
									<hr
										style="clear: both; margin-bottom: 20px; border-top: dashed 1px #ddd;" />
									<div class="ke-content currentVersion">
										<DOC:InitHtmlContentTag html="${DOCE.texts.text}"></DOC:InitHtmlContentTag>
									</div>
									<c:if test="${DOCE.imgUrl!=null }">
										<hr style="clear: both;" />
										<div style="padding-top: 16px;">
											<img src="${DOCE.imgUrl}" alt="预览图"
												class="img-thumbnail center-block doc-contentimg" />
										</div>
									</c:if>
								</div>
							</c:if>
							<!-- 知识当前版本和审核版本不同，且，审核版本存在(文章是待审核状态) -->
							<c:if
								test="${DOCE.texts.id!=DOCE.auditTemp.id&&DOCE.auditTemp!=null}">
								<div class="col-md-12" id="docContentsId">
									<div>
										<ul class="nav nav-tabs" role="tablist">
											<li role="presentation" class="active"><a
												href="#profile" aria-controls="profile" role="tab"
												data-toggle="tab" style="text-decoration: none;"> 待审核版本：
													<PF:FormatTime date="${DOCE.auditTemp.ctime}"
														yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
											</a></li>
											<li role="presentation"><a href="#home"
												aria-controls="home" role="tab" data-toggle="tab"
												style="text-decoration: none;"> 当前版本： <PF:FormatTime
														date="${DOCE.texts.ctime}"
														yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
											</a></li>
										</ul>
										<!-- Tab panes -->
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane active" id="profile">
												<div class="panel panel-default" style="border-top: 0px;">
													<div class="panel-body">
														<div class="alert alert-warning" role="alert">${DOCE.auditTemp.pcontent}</div>
														<!-- 自定义表单展示 -->
														<c:if test="${!empty DOCE.auditFieldForm.fields}">
															<jsp:include page="commons/includeTypeFormViewTemp.jsp"></jsp:include>
														</c:if>
														<hr
															style="clear: both; margin-bottom: 20px; border-top: dashed 1px #ddd;" />
														<div class="ke-content">
															<DOC:InitHtmlContentTag html="${DOCE.auditTemp.text}"></DOC:InitHtmlContentTag>
														</div>
													</div>
												</div>
											</div>
											<div role="tabpanel" class="tab-pane" id="home">
												<div class="panel panel-default" style="border-top: 0px;">
													<div class="panel-body">
														<div class="alert alert-info" role="alert">${DOCE.texts.pcontent}</div>
														<!-- 自定义表单展示 -->
														<c:if test="${!empty DOCE.fieldForm.fields}">
															<jsp:include page="commons/includeTypeFormView.jsp"></jsp:include>
														</c:if>
														<hr
															style="clear: both; margin-bottom: 20px; border-top: dashed 1px #ddd;" />
														<div class="ke-content">
															<DOC:InitHtmlContentTag html="${DOCE.texts.text}"></DOC:InitHtmlContentTag>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="text-align: center;">
		<PF:ParameterValue key="config.sys.foot" />
		-V
		<PF:ParameterValue key="config.sys.version" />
	</div>
</body>
<script type="text/javascript" charset="utf-8">
var isDowned=false;
	$(function() {
		$('img').each(function(i,obj){
			var src=$(obj).attr('data-original');		
			$(obj).attr('src',src);
		});
		var downPdf = document.getElementById("renderPdf");
		downPdf.onclick = function() {
			if(isDowned&&!confirm('已经下载，是否再次下载?')){
				return;
			}
			html2canvas($("#PdfPrintContentBoxId"), {
				onrendered : function(canvas) {

					var contentWidth = canvas.width;
					var contentHeight = canvas.height;

					//一页pdf显示html页面生成的canvas高度;
					var pageHeight = contentWidth / 595.28 * 841.89;
					//未生成pdf的html页面高度
					var leftHeight = contentHeight;
					//pdf页面偏移
					var position = 0;
					//a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
					var imgWidth = 555.28;
					var imgHeight = 555.28 / contentWidth * contentHeight;

					var pageData = canvas.toDataURL('image/jpeg', 1.0);
					var pdf = new jsPDF('', 'pt', 'a4');
					//有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
					//当内容未超过pdf一页显示的范围，无需分页
					if (leftHeight < pageHeight) {
						pdf.addImage(pageData, 'JPEG', 20, 0, imgWidth,
								imgHeight);
					} else {
						while (leftHeight > 0) {
							pdf.addImage(pageData, 'JPEG', 20, position,
									imgWidth, imgHeight)
							leftHeight -= pageHeight;
							position -= 841.89;
							//避免添加空白页
							if (leftHeight > 0) {
								pdf.addPage();
							}
						}
					}

					pdf.save('${DOCE.doc.title}.pdf');
					isDowned=true;
				}
			})
		}
	});
</script>
</html>