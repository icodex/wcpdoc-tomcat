<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>${DOCE.doc.title}-分享链接-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content="${DOCE.doc.docdescribe}" />
<meta name="author" content="${DOCE.doc.author}">
<meta name="keywords" content="${DOCE.doc.tagkey}">
<meta name="robots" content="index,fllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script charset="utf-8" src="<PF:basePath/>text/lib/super-validate/validate.js"></script>
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
-->
</style>
</head>
<c:set var="typeid" value="${DOCE.type.id}" scope="request"></c:set>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top " role="navigation" style="margin: 0px;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="color: #ffffff; font-weight: bold; padding: 5px;cursor: default;">
					<img src="<PF:basePath/>actionImg/Publogo.do" height="40" alt="WCP" align="middle" />
					<PF:ParameterValue key="config.sys.title" />
				</a>
			</div>
		</div>
	</div>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-10 clear-both">
					<div class="panel panel-default view-left-content">
						<div class="panel-body">
							<!-- 知识正文 -->
							<jsp:include page="../know/commons/doc.jsp"></jsp:include></div>
					</div>
					<div style="margin-top: 20px;"></div>
				</div>
				<div class="col-md-2  visible-lg visible-md">
					<div style="margin-left: -13px;">
						<div id="docContentMenuId" style="z-index: 1000; width: 230px;">
							<div>
								<ul class="wcpdocMinConsole">

									<li class="navigation-max-button">
										<div title="回到顶端" class="topbuttonClass">
											<i class="glyphicon glyphicon-chevron-up"></i>
											<p>顶端</p>
										</div>
									</li>
									<li class="navigation-max-button" id="menuLi">
										<div id="openDocMenuLink">
											<i class="glyphicon glyphicon-list-alt"></i>
											<p>目录</p>
										</div>
									</li>
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
					</div>
				</div>
			</div>
			<div class="row column_box">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<a name="markdocbottom"></a>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
	<jsp:include page="/view/web-simple/know/editor/includeHighlighter.jsp"></jsp:include>
	<script charset="utf-8" src="<PF:basePath/>text/lib/echarts/echarts.all.2.2.7.js"></script>
</body>
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
		$(".btn-group").hide();
		$(".towcodeTooltipfalg").hide();
		$('.currentVersion .inner-img').unbind()
		$("img.lazy").lazyload({
			effect : "fadeIn"
		});
		$(".doc-conentinfo").hide();
		$(".badge").hide();
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
</html>