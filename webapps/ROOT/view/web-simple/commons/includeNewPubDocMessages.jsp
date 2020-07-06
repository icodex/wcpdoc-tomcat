<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<style>
<!--
.doc_node_content a {
	font-size: 12px;
}
-->
</style>
<div class="widget-box shadow-box">
	<div class="title">
		<h3>
			<i class="glyphicon glyphicon-comment"></i> 最新评论
		</h3>
	</div>
	<c:forEach items="${newmsgs}" var="node">
		<div class="title">
			<div class="stream-item" id="loop-30">
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
								<p class="doc_node_content" style="font-size: 12px;">
									<a class="pull-left hidden-xs" style="font-weight: bold;"
										href="webuser/PubHome.do?userid=${node.CUSER }"
										title="${node.CUSERNAME}"> ${node.CUSERNAME}&nbsp;&nbsp; </a>:${node.CONTENT}&nbsp;&nbsp;
									<a class="tip" href="webdocmessage/Pubmsg.do?docid=${node.DOCID}">(${node.DOCTITLE})</a>&nbsp;&nbsp;发布于
									${node.CTIME} <a
										href="webdocmessage/Pubmsg.do?docid=${node.DOCID}">
										<i class="glyphicon glyphicon-hand-up"></i>${node.PRAISNUM } <i
										class="glyphicon glyphicon-comment"></i>${node.REPLYNUM }</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
