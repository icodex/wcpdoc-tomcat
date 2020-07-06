<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="card">
	<div class="card-header">待回答问题:</div>
	<div class="card-content">
		<div class="list-block media-list">
			<ul>
				<c:forEach items="${hotQuestion.resultList}" varStatus="status"
					var="node">
					<li class="item-content">
						<div class="item-media">
							<img src="view/web-mobile/text/icon/help.png" width="32">
						</div>
						<div class="item-inner" style="overflow: hidden;">
							<div class="item-title-row wcp-message-author">
								<div class="item-title" style="padding-right: 4px;">
									<a href="webquest/fqa/Pub${node.ID}.html">${node.TITLE}</a>
								</div>
							</div>
							<div class="item-subtitle">
								<PF:FormatTime date="${node.PUBTIME}"
									yyyyMMddHHmmss="yyyy-MM-dd" />
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>