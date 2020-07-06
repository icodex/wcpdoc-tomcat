<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!-- ID,TITLE,DOCDESCRIBE,AUTHOR,PUBTIME,TAGKEY ,IMGID,VISITNUM,PRAISEYES,PRAISENO,HOTNUM,TYPENAME -->
<!-- Carousel
    ================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel" style="min-height: 350px;">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<c:forEach var="topDoc" items="${topMaxs}" varStatus="varstatus">
			<c:if test="${topDoc.imgurl!=null&&varstatus.index<10}">
				<c:if test="${varstatus.index==0}">
					<li data-target="#myCarousel" data-slide-to="${varstatus.index}"
						class="active"></li>
				</c:if>
				<c:if test="${varstatus.index!=0}">
					<li data-target="#myCarousel" data-slide-to="${varstatus.index}"></li>
				</c:if>
			</c:if>
		</c:forEach>
	</ol>
	<div class="carousel-inner" role="listbox">
		<c:set var="indexNum" value="0"></c:set>
		<c:forEach var="topDoc" items="${topMaxs}" varStatus="varstatus">
			<c:if test="${topDoc.imgurl!=null&&indexNum<10}">
				<c:if test="${indexNum==0}">
					<c:set var="active" value="active"></c:set>
				</c:if>
				<c:if test="${indexNum!=0}">
					<c:set var="active" value=" "></c:set>
				</c:if>
				<div class="item ${active}">
					<PF:IfParameterEquals key="config.show.maxtop.text" val="true">
						<img class="first-slide effect-img" style="width: 100%; max-height: 350px;"
							src="${topDoc.imgurl}" alt="${topDoc.title}">
						<div class="container">
							<div class="carousel-caption">
								<h1>${topDoc.title}</h1>
								<p>${topDoc.text }</p>
								<p>
									<a class="btn btn-sm btn-danger"  target="${config_sys_link_newwindow_target}" 
										href="${topDoc.exlink}" role="button">查看详情</a>
								</p>
							</div>
						</div>
					</PF:IfParameterEquals>
					<PF:IfParameterNoEquals key="config.show.maxtop.text" val="true">
						<a target="${config_sys_link_newwindow_target}"
							href="${topDoc.exlink}" role="button"><img
							class="first-slide effect-img" style="width: 100%; max-height: 350px;"
							src="${topDoc.imgurl}" alt="${topDoc.title}"></a>
					</PF:IfParameterNoEquals>
				</div>
				<c:set var="indexNum" value="${indexNum+1}"></c:set>
			</c:if>
		</c:forEach>
	</div>
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>
<script type="text/javascript">
$(function(){
	$('#myCarousel').carousel({
		//控制轮播组件的切换间隔
		interval: <PF:ParameterValue key="config.show.carousel.interval"/>000
	})
});
</script>