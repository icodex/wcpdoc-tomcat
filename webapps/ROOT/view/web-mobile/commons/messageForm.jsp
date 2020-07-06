<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="card-footer no-border">
	<a href="javascript:PraiseYes('${DOCE.doc.id}')" class="link external">好评(<span
		id="praiseyesNumId">${doc.runinfo.praiseyes}${DOCE.runinfo.praiseyes}</span>)
	</a> <a href="#" class="link">评论(${doc.runinfo.answeringnum}${DOCE.runinfo.answeringnum})</a>
	<a href="javascript:PraiseNo('${DOCE.doc.id}')" class="link external">差评(<span
		id="praisenoNumId">${doc.runinfo.praiseno}${DOCE.runinfo.praiseno}</span>)
	</a>
</div>
<div class="list-block wcp-message-form">
	<ul>
		<li class="align-top wcp-message-input">
			<div class="item-content">
				<textarea id="messageId" placeholder='请输入评论...'></textarea>
			</div>
		</li>
		<li class="align-top wcp-message-button"><a
			onclick="submitMessage()" class="button button-fill button-big">发表评论</a></li>
	</ul>
</div>
<input type="hidden" id="messageDocId" name="docId"
	value="${DOCE.doc.id}">