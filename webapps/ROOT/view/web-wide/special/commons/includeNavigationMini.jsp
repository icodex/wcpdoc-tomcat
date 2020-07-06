<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 文档中的目录导航 -->
<style>
<!--
.affix {
	top: 54px;
	width: 230px;
}

.wcpdocMinConsole .disable {
	color: #ccc;
}
.right_fbox {
	width: 143px;
	height: 349px;
	position: fixed;
	float: right;
	left: 50%;
	z-index: 999;
	margin-left: 530px;
}
</style>
<div class="right_fbox" id="docContentMenuId" style="z-index: 1000; width: 230px;">
	<div>
		<ul class="wcpdocMinConsole">
			<li class="navigation-max-button">
				<div title="回到顶端" class="topbuttonClass">
					<i class="glyphicon glyphicon-chevron-up"></i>
					<p>顶端</p>
				</div>
			</li>
			<li class="navigation-max-button" id="docselfLi">
				<div id="openDocSelfLink">
					<i class="glyphicon glyphicon-book"></i>
					<p>原文</p>
				</div>
			</li>
			<li class="navigation-max-button" id="menuLi">
				<div id="openDocMenuLink">
					<i class="glyphicon glyphicon-list-alt"></i>
					<p>目录</p>
				</div>
			</li>
			<li class="navigation-max-button">
				<div id="markDocPriceSuperLink">
					<i class="glyphicon glyphicon-star"></i>
					<p>评价</p>
				</div>
			</li>
			<c:if test="${fn:length(RELATIONDOCS)>0}">
				<li class="navigation-max-button">
					<div id="markRelationDocLink" style="height: 78px;">
						<i class="glyphicon glyphicon-link"></i>
						<p>
							关联
							<br />
							知识
						</p>
					</div>
				</li>
			</c:if>
		</ul>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="currentDocMenuWin" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<i class="glyphicon glyphicon-list-alt "></i>
					&nbsp;&nbsp;知识目录
				</h4>
			</div>
			<div class="modal-body">
				<ul id="ContentMenuId" class="doc_vavigat"></ul>
			</div>
		</div>
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
		//$('#docContentMenuId').affix({
		//	offset : {
		//		top : 150,
		//		bottom : 5
		//	}
		//})
		var isMenuAble = false;
		$('h1,h2,h3', '#docContentsId').each(function(i, obj) {
			creatMenus(i, obj);
			$(obj).before("<a name='mark" + i + "'></a>");
			$('#linkmark' + i).bind('click', function() {
				$('html,body').animate({
					scrollTop : $("a[name='mark" + i + "']").offset().top - 100
				}, 500);
			});
			isMenuAble = true;
		});
		if ($.trim($('#ContentMenuId').text()) != null
				&& $.trim($('#ContentMenuId').text()) != "") {
			$('#ContentMenuId').css('height', $(window).height() - 400);
		} else {
			$('#docContentPanelbody').remove();
		}
		$('#ContentMenuId').css('overflow-y', 'auto');
		if (!isMenuAble) {
			$('#docContentMenuId #menuLi').hide();
		}
	}
	$(function() {
		//去顶端
		$('.topbuttonClass').bind('click', function() {
			//window.scrollTo(0, 0);
			$('html,body').animate({
				scrollTop : 0
			}, 500);
		});
		//打开目录
		$('#openDocMenuLink').bind('click', function() {
			$('#currentDocMenuWin').modal({
				keyboard : false
			});
		});

		//打开知识原文
		$('#openDocSelfLink').bind('click', function() {
			window.location = basePath+"webdoc/view/Pub${DOCE.doc.id}.html";
		});

		//关联知识
		$('#markRelationDocLink').bind('click', function() {
			scrollToMarkName("markRelationDoc");
		});
		//知识评价
		$('#markDocPriceSuperLink').bind('click', function() {
			scrollToMarkName("markDocPrice");
		});
		//去底端
		$('#buttombuttonId').bind('click', function() {
			scrollToMarkName("markdocbottom");
		});

		//标签
		$('#markTagListSuperLink').bind('click', function() {
			scrollToMarkName("markdocTag");
		});
		//评论
		$('#markCommentListSuperLink').bind('click', function() {
			scrollToMarkName("markdocMessage");
		});
		//同类知识
		$('#markTypeListSuperLink').bind('click', function() {
			scrollToMarkName("markdocType");
		});
		//推荐知识
		$('#markApplyListSuperLink').bind('click', function() {
			scrollToMarkName("markdocApply");
		});
		//权限定位
		$('#markauthListSuperLink').bind('click', function() {
			scrollToMarkName("markdocauth");
		});
		//附件定位
		$('#markFileListSuperLink').bind('click', function() {
			scrollToMarkName("markdocFile");
		});
		//版本定位
		$('#markVersionListSuperLink').bind('click', function() {
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