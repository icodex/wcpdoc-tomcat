<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!-- 文档中的目录导航 -->
<style>
<!--
.affix {
	top: 54px;
	width: 230px;
}

.wcpRelationdocMinConsole {
	margin-left: -40px;
	max-height: 100px; 
	overflow: auto;
}

.wcpRelationdocMinConsole li {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.wcpdocMinConsole {
	margin-left: -30px;
	overflow: auto;
	margin-top: 10px;
}

.wcpdocMinConsole li {
	float: left; /* 往左浮动 */
	margin: 4px;
}

.wcpdocMinConsole .disable{
	 color: #ccc;
}

-->
</style>
<div class="panel panel-default " id="docContentMenuId" style="z-index: 1000; width: 230px;">
	<div class="panel-body" id="docContentTitlelbody">
		<span class="glyphicon glyphicon-list-alt"></span>
		&nbsp;
		<b>目录</b>
		<!-- [ <a id="buttombuttonId">返回底端</a>] -->
		<hr style="margin: 4px;" />
	</div>
	<div class="panel-body" id="docContentPanelbody" style="line-height: 20px; list-style: none; padding: 4px; margin-left: -10px;">
		<ul id="ContentMenuId" class="doc_vavigat"></ul>
	</div>
	<div class="panel-body">
		<c:if test="${fn:length(RELATIONDOCS)>0}">
			<span class="glyphicon glyphicon-link"></span> &nbsp;<b>关联知识</b>
			<hr style="margin: 4px;" />
			<!-- 分类下的知识列表，小的列表页面(缩写) -->
			<ol class="wcpRelationdocMinConsole">
				<c:forEach items="${RELATIONDOCS}" varStatus="status" var="node">
					<li>
						<c:if test="${node.domtype=='1'}">
							<span class="glyphicon glyphicon-file"></span>
						</c:if>
						<c:if test="${node.domtype=='5'}">
							<span class="glyphicon glyphicon-download-alt"></span>
						</c:if>
						<c:if test="${node.domtype=='6'}">
							<span class="glyphicon glyphicon glyphicon-globe"></span>
						</c:if>
						<a href="webdoc/view/Pub${node.id}.html">${node.title}</a>
					</li>
				</c:forEach>
			</ol>
		</c:if>
		<ul class="wcpdocMinConsole">
			<li>
				<a title="回到顶端" class="topbuttonClass">
					<span class="glyphicon glyphicon-chevron-up"></span>
				</a>
			</li>
			<!-- 知識評價-->
			<li>
				<a id="markDocPriceSuperLink" title="知识评价">
					<span class="glyphicon glyphicon-star"></span>
				</a>
			</li>
			<!-- 推荐知识 END-->
			<!-- 标签-->
			<c:if test="${fn:length(DOCE.tags)>0}">
				<li>
					<a id="markTagListSuperLink" title="标签">
						<span class="glyphicon glyphicon-tags"></span>
					</a>
				</li>
			</c:if>
			<c:if test="${fn:length(DOCE.tags)<=0}">
				<li>
					<span title="标签" class="glyphicon glyphicon-tags disable"></span>
				</li>
			</c:if>
			<!-- 标签END-->
			<!-- 评论-->
			<li>
				<a id="markCommentListSuperLink" title="评论">
					<span class="glyphicon glyphicon-comment"></span>
				</a>
			</li>
			<!-- 评论END-->
			<!-- 同类知识
			<c:if test="${TYPEDOCS != null }">
				<li>
					<a id="markTypeListSuperLink" title="同类知识">
						<span class="glyphicon glyphicon-bookmark"></span>
					</a>
				</li>
			</c:if>
			<c:if test="${TYPEDOCS == null }">
				<li>
					<span title="同类知识" class="glyphicon glyphicon-bookmark disable"></span>
				</li>
			</c:if>-->
			<!-- 同类知识END-->
			<!-- 推荐知识-->
			<li>
				<a id="markApplyListSuperLink" title="推荐知识">
					<span class="glyphicon glyphicon-heart"></span>
				</a>
			</li>
			<!-- 推荐知识 END-->
			<DOC:canDelIsShow docId="${DOCE.doc.id}">
			<!-- 权限 -->
			<li>
				<a id="markauthListSuperLink" title="权限信息">
					<span class="glyphicon glyphicon-user"></span>
				</a>
			</li>
			<!-- 权限END -->
			</DOC:canDelIsShow>
			<!-- 文档版本 -->
			<li>
				<a id='markVersionListSuperLink' title="文档版本（${fn:length(VERSIONS)}）">
					<span class="glyphicon glyphicon-dashboard"></span>
				</a>
			</li>
			<!-- 文档版本END -->
			<!-- 附件 -->
			<c:if test="${fn:length(DOCE.files)>0}">
				<li>
					<a id='markFileListSuperLink' title="文档附件（${fn:length(DOCE.files)}）">
						<span class="glyphicon glyphicon-paperclip"></span>
					</a>
				</li>
			</c:if>
			<c:if test="${fn:length(DOCE.files)<=0}">
				<li>
					<span title="文档附件" class="glyphicon glyphicon-paperclip disable"></span>
				</li>
			</c:if>
			<!-- 附件END -->
		</ul>
	</div>
</div>
<script type="text/javascript">
	var n1 = 1;
	var n2 = 1;
	var n3 = 1;
	function creatMenus(i, obj) {
		if ($(obj).get(0).tagName == 'H1') {
			$('#ContentMenuId').append(
					'<li class="doc_vavigat_h1"><a  id="linkmark'
							+ i + '">'
							+ $(obj).text() + '</a></li>');
		}
		if ($(obj).get(0).tagName == 'H2') {
			$('#ContentMenuId').append(
					'<li class="doc_vavigat_h2"><a  id="linkmark'
									+ i + '">'
							+ $(obj).text() + '</a></li>');
		}
		if ($(obj).get(0).tagName == 'H3') {
			$('#ContentMenuId').append(
					'<li class="doc_vavigat_h3"><a  id="linkmark'
									+ i + '">'
							+ $(obj).text() + '</a></li>');
		}
	}
	function initLeftMenu() {
		$('#docContentMenuId').affix({
			offset : {
				top : 50,
				bottom : 5
			}
		})
		$('h1,h2,h3', '#docContentsId').each(function(i, obj) {
			creatMenus(i, obj);
			$(obj).before("<a name='mark" + i + "'></a>");
			$('#linkmark' + i).bind('click', function() {
				$('html,body').animate({
					scrollTop : $("a[name='mark" + i + "']").offset().top - 100
				}, 500);
			});
		});
		if ($.trim($('#ContentMenuId').text()) != null
				&& $.trim($('#ContentMenuId').text()) != "") {
			$('#ContentMenuId').css('height', $(window).height() - 400);
		} else {
			$('#docContentPanelbody').remove();
			$('#docContentTitlelbody').remove();
		}
		$('#ContentMenuId').css('overflow-y', 'auto');
	}
	$(function() {
		//去顶端
		$('.topbuttonClass').bind('click', function() {
			//window.scrollTo(0, 0);
			$('html,body').animate({
				scrollTop : 0
			}, 500);
		});
		//xxx
		$('#markDocPriceSuperLink').bind('click', function() {
			//location.hash = "markFileList";
			scrollToMarkName("markDocPrice");
		});
		//去底端
		$('#buttombuttonId').bind('click', function() {
			//location.hash = "markbuttombutton";
			scrollToMarkName("markbuttombutton");
		});

		//标签
		$('#markTagListSuperLink').bind('click', function() {
			//location.hash = "markbuttombutton";
			scrollToMarkName("markdocTag");
		});
		//评论
		$('#markCommentListSuperLink').bind('click', function() {
			//location.hash = "markbuttombutton";
			scrollToMarkName("markdocMessage");
		});
		//同类知识
		$('#markTypeListSuperLink').bind('click', function() {
			//location.hash = "markbuttombutton";
			scrollToMarkName("markdocType");
		});
		//推荐知识
		$('#markApplyListSuperLink').bind('click', function() {
			//location.hash = "markbuttombutton";
			scrollToMarkName("markdocApply");
		});
		//权限定位
		$('#markauthListSuperLink').bind('click', function() {
			//location.hash = "markbuttombutton";
			scrollToMarkName("markdocauth");
		});
		//附件定位
		$('#markFileListSuperLink').bind('click', function() {
			//location.hash = "markbuttombutton";
			scrollToMarkName("markdocFile");
		});
		//版本定位
		$('#markVersionListSuperLink').bind('click', function() {
			//location.hash = "markVersionList";
			scrollToMarkName("markdocVersions");
		});
		initLeftMenu();
	});
	//滾動到指定位置
	function scrollToMarkName(markName) {
		$('html,body').animate({
			scrollTop : $("a[name='" + markName + "']").offset().top - 50
		}, 0, function() {
			$('html,body').animate({
				scrollTop : $("a[name='" + markName + "']").offset().top - 70
			}, 200);
		});
	}
</script>