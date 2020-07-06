<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<c:if test="${!empty newmsgs}">
	<div class="wcp-su-out-box">
		<div class="unit">
			<div class="title">
				<i class="glyphicon glyphicon-comment"></i> 最新评论
			</div>
		</div>
		<c:forEach items="${newmsgs}" var="node">
			<div class="stream-item unit unit-min link" id="loop-30">
				<div class="media">
					<a class="pull-left hidden-xs"
						href="webuser/PubHome.do?userid=${node.CUSER }"
						title="${node.CUSERNAME}"> <img
						class="img-circle side_unit_author_img" alt="${node.CUSERNAME}"
						style="max-width: 32px; max-height: 32px;" src="${node.IMGURL}">
					</a>
					<div class="media-body">
						<div style="margin-left: 4px;" class="pull-left">
							<div>
								<p class="doc_node_content">
									${node.CONTENT}&nbsp;&nbsp; <a class="tip"
										href="webdocmessage/Pubmsg.do?docid=${node.DOCID}">(${node.DOCTITLE})</a>&nbsp;&nbsp;
									<span style="color: #aaaaaa;"> ${node.CTIME}</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</c:if>