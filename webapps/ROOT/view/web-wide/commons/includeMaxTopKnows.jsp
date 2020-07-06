<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!-- ID,TITLE,DOCDESCRIBE,AUTHOR,PUBTIME,TAGKEY ,IMGID,VISITNUM,PRAISEYES,PRAISENO,HOTNUM,TYPENAME -->
<!-- Carousel
    ================================================== -->
<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel" style="min-height: 350px;">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<c:forEach var="topDoc" items="${topMaxs}" varStatus="varstatus">
			<c:if test="${topDoc.imgurl!=null&&varstatus.index<2}">
				<c:if test="${varstatus.index==0}">
					<li data-target="#carousel-example-generic"
						data-slide-to="${varstatus.index}" class="active"></li>
				</c:if>
				<c:if test="${varstatus.index!=0}">
					<li data-target="#carousel-example-generic"
						data-slide-to="${varstatus.index}"></li>
				</c:if>
			</c:if>
		</c:forEach>
	</ol>
	<div class="carousel-inner" role="listbox">
		<c:set var="indexNum" value="0"></c:set>
		<c:forEach var="topDoc" items="${topMaxs}" varStatus="varstatus">
			<c:if test="${topDoc.imgurl!=null&&indexNum<2}">
				<c:if test="${indexNum==0}">
					<c:set var="activeTag" value="active"></c:set>
				</c:if>
				<c:if test="${indexNum!=0}">
					<c:set var="activeTag" value=" "></c:set>
				</c:if>
				<div class="item ${activeTag}"
					style="height: 350px; background-color: #393d42;">
					<div class="container" style="text-align: right;">
						<img class="navbar-right" style="height: 280px; margin-top: 35px;"
							src="${topDoc.imgurl}" alt="${topDoc.title}">
					</div>
					<div class="carousel-caption"
						style="text-align: left; max-width: 600px;">
						<div style="font-size: 36px;">${topDoc.title}</div>
						<div
							style="font-size: 14px; max-height: 120px; overflow: hidden; text-indent: 2em;">
							<DOC:Describe maxnum="100" text="${topDoc.text}"></DOC:Describe>
						</div>
						<div style="margin: 24px; font-size: 16px;">
							<a target="${config_sys_link_newwindow_target}"
								href="${topDoc.exlink}" class="layer-btn">查看详情</a>
						</div>
					</div>
				</div>
				<c:set var="indexNum" value="${indexNum+1}"></c:set>
			</c:if>
		</c:forEach>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#myCarousel')
				.carousel(
						{
							//控制轮播组件的切换间隔
							interval : <PF:ParameterValue key="config.show.carousel.interval"/>000
						})
	});
</script>