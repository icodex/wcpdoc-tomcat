<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<c:forEach var="message" items="${docmessage.resultList}"
	varStatus="status">
	<div class="card">
		<div class="card-content">
			<div class="card-content-inner">
				<div class="row">
					<div class="col-20">
						<img src="<PF:basePath/>${message.IMGURL}"
							style="width: 100%; max-height: 200px; max-width: 200px;">
					</div>
					<div class="col-80">
						<div class="row">
							<div class="col-60 wcp-message-author">${message.CUSERNAME}</div>
							<div class="col-20 wcp-message-author">
								<a href="javascript:approveOf('${message.ID}')"
									id="approveOf${message.ID}" class="link external">赞${message.PRAISNUM}</a>
							</div>
							<div class="col-20 wcp-message-author">
								<a href="javascript:oppose('${message.ID}')"
									id="oppose${message.ID}" class="link external">踩${message.CRITCISMNUM}</a>
							</div>
						</div>
						<div class="row">
							<div class="col-100 wcp-message-text">${message.CONTENT}</div>
						</div>
						<div class="row">
							<div class="col-100 wcp-message-time">${message.CTIME}</div>
						</div>
						<c:forEach var="replay" items="${message.replys }">
							<hr style="margin-top: 8px; margin-bottom: 8px;" />
							<div class="row">
								<div class="col-40 wcp-message-time">${replay.CUSERNAME }</div>
								<div class="col-60 wcp-message-time">
									<PF:FormatTime date="${replay.CTIME}"
										yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
								</div>
							</div>
							<div class="row">
								<div class="col-100 wcp-message-text">${replay.CONTENT }</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
<c:if test="${fun:length(docmessage.resultList)>=40}">
	<div class="content-block-title">最多显示前50条评论</div>
</c:if>
