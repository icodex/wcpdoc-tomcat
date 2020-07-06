<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!-- DOCID,title,DOCDESCRIBE,AUTHOR,PUBTIME,TAGKEY
	 *         ,IMGID,VISITNUM,PRAISEYES,PRAISENO,HOTNUM,EVALUATE,ANSWERINGNUM,
	 *         TYPENAME -->
<div class="row ">
	<div class="col-sm-12">
		<div style="margin-bottom: 16px;">
			<span class="glyphicon glyphicon-fire  column_title">&nbsp;检索到${result.totalSize}条结果,用时${result.runtime}毫秒 </span>
			<c:if test="${resultType!='fqa'}">
				<div class="btn-group btn-group-sm pull-right" role="group" aria-label="..." style="margin-top: -6px;">
					<button onclick="turnSearchType('list')" title="列表模式" type="button" class="btn btn-default active">
						<!-- <span style="font-size: 16px;">图片</span> -->
						<img alt="" src="text/img/list32.png" style="height: 16px; width: 16px;">
					</button>
					<button onclick="turnSearchType('img')" title="图片模式" type="button" class="btn btn-default ">
						<!-- <span style="font-size: 16px;">图片</span> -->
						<img alt="" src="text/img/grid32.png" style="height: 16px; width: 16px;">
					</button>
				</div>
			</c:if>
		</div>
	</div>
</div>
<hr style="margin-left: -16px; margin-right: -16px;" />
<div class="row">
	<div class="col-sm-12">
		<c:forEach items="${result.resultList}" var="node">
			<div class="col-sm-12 doc_node">
				<div class="media">
					<c:if test="${node.IMGURL!=null}">
						<div class="pull-right hidden-xs doc-brief-imgbox">
							<div class="effect-img-box" style="width: 100%; overflow: hidden;">
								<img class="effect-img" alt="${node.TITLE}预览图" src="<PF:basePath/>${node.IMGURL}">
							</div>
						</div>
					</c:if>
					<div class="media-body">
						<div style="margin-left: 4px;" class="pull-left">
							<div class="doc_node_title_box">
								<c:if test="${node.DOMTYPE=='file'}">
									<a class="doc_node_title_min" target="${config_sys_link_newwindow_target}" href="webdoc/view/PubFile${node.ID}.html">
										<span class="glyphicon glyphicon-paperclip"></span>
										${node.TITLE}
									</a>
								</c:if>
								<c:if test="${node.DOMTYPE=='fqa'}">
									<a class="doc_node_title_min" target="${config_sys_link_newwindow_target}" href="webquest/fqa/Pub${node.ID}.html">
										<span class="glyphicon glyphicon-question-sign"></span>
										${node.TITLE}
									</a>
								</c:if>
								<c:if test="${node.DOMTYPE!='file'&&node.DOMTYPE!='fqa'}">
									<a class="doc_node_title_min" target="${config_sys_link_newwindow_target}" href="webdoc/view/Pub${node.ID}.html">
										<jsp:include page="../../commons/includeKnowIcon.jsp">
											<jsp:param value="${node.DOMTYPE}" name="domtype" />
										</jsp:include>
										${node.TITLE}
									</a>
								</c:if>
							</div>
							<div class="doc_node_content_box">
								<c:if test="${node.DOCPOPIS==null||(node.DOCPOPIS!='1'&&node.DOCPOPIS!='3')}">
									<p class="doc_node_content">	<c:if test="${node.DOMTYPE=='fqa'}">
										<c:if test="${node.STATE=='2'}">
											<span class="label label-success">完成</span>
										</c:if>
									</c:if>${fun:replace(node.DOCDESCRIBE,'[ANSWER]','<span class="text-success">最佳答案</span>')}</p>
								</c:if>
								<c:if test="${node.DOCPOPIS=='1'||node.DOCPOPIS=='3'}">
									<span style="color: #8c6d3b;" > 
											[该知识已定义阅读权限,请点击进入访问...]</span> 
								</c:if>
							</div>
							<div class="side_unit_info side_unit_info_left_box">
								<c:if test="${empty node.USERID||node.USERID==' '}">
									<!-- 匿名提问 -->
									<span title="" class="side_unit_info">${node.AUTHOR}</span>
								</c:if>
								<c:if test="${!empty node.USERID&&node.USERID!=' '}">
									<!-- 实名 -->
									<a target="${config_sys_link_newwindow_target}" href="webuser/PubHome.do?userid=${node.USERID}" title="${node.AUTHOR}">
										<span title="" class="side_unit_info">${node.AUTHOR}</span>
									</a>
								</c:if>
								<c:if test="${node.DOMTYPE=='file'}">
									<a target="${config_sys_link_newwindow_target}" href="webdoc/view/Pub${node.DOCID}.html">访问该知识</a>
								</c:if>
								<c:if test="${node.DOMTYPE!='file'}">
									<a target="${config_sys_link_newwindow_target}" href="webtype/view${node.TYPEID}/Pub1.html">${node.TYPENAME}</a>
								</c:if>
								<PF:FormatTime date="${node.PUBTIME}" yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
							</div>
							<br />
							<c:if test="${fun:length(node.TAGKEY)>0}">
								<div class="row">
									<div class="col-md-12 text-left">
										<c:forEach items="${node.TAGKEY}" var="node">
											<c:if test="${!node['ISMARK']}">
												<span class="label label-default tagsearch" style="cursor: pointer;" title="${node['TEXT']}">${node['TEXT']}</span>
											</c:if>
											<c:if test="${node['ISMARK']}">
												<span class="label label-danger tagsearch" style="cursor: pointer;" title="${node['TEXT']}">${node['TEXT']}</span>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<hr class="hr_split" />
			</div>
		</c:forEach>
	</div>
</div>
<c:if test="${fun:length(result.resultList) > 0}">
	<div class="row">
		<div class="col-xs-12">
			<ul class="pagination pagination-sm">
				<c:forEach var="page" begin="${result.startPage}" end="${result.endPage}" step="1">
					<c:if test="${page==result.currentPage}">
						<li class="active">
							<a>${page} </a>
						</li>
					</c:if>
					<c:if test="${page!=result.currentPage}">
						<li>
							<a onclick="SearchFormGo(${page})">${page}</a>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</c:if>
<script src="view/web-style/text/wcp-photoImgs.js"></script>
<script type="text/javascript">
	var type='${type}';//normal,pro
	$(function() {
		//标签
		$('.tagsearch').bind('click', function() {
			luceneSearch('TAG:' + $(this).text());
		});
		//格式化知识图片
		initPhotoImgsSize('.effect-img-box');
		$(window).resize(function() {
			initPhotoImgsSize('.effect-img-box');
		});
		$(".effect-img").load(function() {
			initPhotoImgSize($(this).parents('.effect-img-box'));
		});
	});
	//翻页执行的方法
	function SearchFormGo(num){
		if(type=="normal"){
			//普通检索
			$('#pagenumInputId').val(num);
			$('#websearchpubdoId').submit();
		}
	}
</script>
<jsp:include page="includeSearchProLimitCache.jsp"></jsp:include>