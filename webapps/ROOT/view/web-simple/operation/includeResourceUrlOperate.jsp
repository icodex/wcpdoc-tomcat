<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!-- 如果是内容类型等于4小组首页，则在此处不提供任何操作功能 -->
<c:if test="${DOCE.doc.domtype!='4'}">
	<c:if test="${DOCE.doc.state=='2'||DOCE.doc.state=='3'}">
		<div class="alert alert-danger" role="alert">
			<span class=" glyphicon glyphicon-info-sign">[未审核,该文档未经过必要的审核请谨慎参考]</span>
		</div>
	</c:if>
	<div style="padding: 2px;" class="visible-lg visible-md">
		<div class="btn-group wcp-doc-operate" role="group" aria-label="...">
			<c:if test="${USEROBJ!=null}">
				<c:if test="${ISENJOY}">
					<button type="button" id="disEnjoyId"
						class="btn btn-default  btn-xs">
						<span class="glyphicon glyphicon-star"></span> &nbsp;取消关注
					</button>
				</c:if>
				<c:if test="${!ISENJOY}">
					<button type="button" id="enjoyId" class="btn btn-default  btn-xs">
						<span class="glyphicon glyphicon-star-empty"></span> &nbsp;关注
					</button>
				</c:if>
				<c:if test="${USEROBJ.type!='4'}">
					<DOC:canWriteIsShow docId="${DOCE.doc.id}">
						<div class="btn-group btn-group-xs" role="group">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<span class="glyphicon glyphicon-cog"></span> &nbsp;编辑知识 <span
									class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a id="editTopButtonId"> <span
										class="glyphicon glyphicon-edit"></span> &nbsp;更新知识
								</a></li>
								<DOC:canDelIsShow docId="${DOCE.doc.id}">
									<li>
										<hr />
									</li>
									<li><a id="editImgTopButtonId"> <span
											class="glyphicon glyphicon-picture"></span> &nbsp;设置预览图
									</a></li>
									<li><a id="editTypeAndTagButtonId"> <span
											class="glyphicon glyphicon-tag"></span> &nbsp;修改分类/标签
									</a></li>
									<li><a id="editDocdescribeButtonId"> <span
											class="glyphicon glyphicon-font"></span> &nbsp;修改知识摘要
									</a></li>
									<li>
										<hr />
									</li>
									<li><a id="downLoadToKnowButtonId"> <span
											class="glyphicon glyphicon-circle-arrow-down"></span>
											&nbsp;转为文档知识
									</a></li>
								</DOC:canDelIsShow>
								<li><a id="editRelationKnowButtonId"> <span
										class="glyphicon glyphicon-link"></span> &nbsp;设置关联知识
								</a></li>
								<DOC:canDelIsShow docId="${DOCE.doc.id}">
									<li>
										<hr />
									</li>
									<li><a id="publickButtonId"> <span
											class="glyphicon glyphicon-plane"></span> &nbsp;公开
									</a></li>
									<li><a id="delTopButtonId"> <span
											class="glyphicon glyphicon-envelope"></span> &nbsp;删除
									</a></li>
								</DOC:canDelIsShow>
							</ul>
						</div>
					</DOC:canWriteIsShow>
				</c:if>
				<button type="button" id="sendButtonId"
					class="btn btn-default  btn-xs">
					<span class="glyphicon glyphicon-send"></span> &nbsp;站内推送
				</button>
			</c:if>
			<c:if test="${USEROBJ==null}">
				<button type="button" class="btn btn-default btn-xs"
					disabled="disabled">
					<span class="glyphicon glyphicon-star"></span> &nbsp;登录后关注
				</button>
			</c:if>
		</div>
		<div class="pull-right">
			&nbsp; <span class="badge" title="访问量"> <span
				class="glyphicon glyphicon-hand-up"></span>
				&nbsp;${DOCE.runinfo.visitnum}
			</span> &nbsp; <img class="towcodeTooltipfalg" src="text/img/towcode24.png" />
		</div>
		<div class="pull-right">
			&nbsp; <a href="webdocmessage/Pubmsg.do?docid=${DOCE.doc.id}"> <span
				class="badge" title="评论"> <span
					class="glyphicon glyphicon-comment"></span>
					&nbsp;${DOCE.runinfo.answeringnum}
			</span>
			</a>
		</div>
	</div>
</c:if>
<script type="text/javascript">
	$(function() {
		$('#editTopButtonId').bind(
				'click',
				function() {
					window.location = basePath
							+ 'resourceUrl/edit.do?docid=${DOCE.doc.id}';
				});
		$('#editImgTopButtonId').bind(
				'click',
				function() {
					window.location = basePath
							+ 'webdoc/editImg.do?docid=${DOCE.doc.id}';
				});
		$('#editRelationKnowButtonId').bind(
				'click',
				function() {
					window.location = basePath
							+ 'webdoc/editRelationDoc.do?docid=${DOCE.doc.id}';
				});
		$('#downLoadToKnowButtonId')
				.bind(
						'click',
						function() {
							window.location = basePath
									+ 'resourceUrl/downLoadToKnow.do?docid=${DOCE.doc.id}';
						});
		//设置知识分类和标签
		$('#editTypeAndTagButtonId').bind(
				'click',
				function() {
					window.location = basePath
							+ 'webdoc/editTypeTag.do?docid=${DOCE.doc.id}';
				});
		//设置知识摘要
		$('#editDocdescribeButtonId').bind(
				'click',
				function() {
					window.location = basePath
							+ 'webdoc/editDocdescribe.do?docid=${DOCE.doc.id}';
				});
		//设置自定義權限
		$('#setDocPopButtonId').bind(
				'click',
				function() {
					window.location = basePath
							+ 'webdoc/editDocPop.do?docid=${DOCE.doc.id}';
				});
		$('#delTopButtonId').bind(
				'click',
				function() {
					if (confirm("删除后该知识将无法恢复，确定要删除吗？")) {
						window.location = basePath
								+ 'webdoc/FLDelKnow.do?id=${DOCE.doc.id}';
					}
				});
		$('#publickButtonId').bind(
				'click',
				function() {
					if (confirm("是否要将该文档开放阅读和编辑权限到分类下，同时如果是小组文档将删除小组所有权？")) {
						window.location = basePath
								+ 'webdoc/FLflyKnow.do?id=${DOCE.doc.id}';
					}
				});
		$('#sendButtonId')
				.bind(
						'click',
						function() {
							window.location = basePath
									+ 'webusermessage/FLmanySendKnow.do?id=${DOCE.doc.id}&type=know';
						});
		//关注
		$('#enjoyId')
				.live(
						'click',
						function() {
							$
									.post(
											'webdoc/enjoy.do?id=${DOCE.doc.id}',
											function(flag) {
												if (flag.commitType == '0') {
													alert('关注成功');
													var buttonStr = '<button type="button" id="disEnjoyId" class="btn btn-default  btn-xs"><span class="glyphicon glyphicon-star"></span>&nbsp;取消关注</button>';
													$('#enjoyId').before(
															buttonStr);
													$('#enjoyId').remove();
												} else {
													alert('关注失败');
												}
											}, 'json');
						});
		//取消关注
		$('#disEnjoyId')
				.live(
						'click',
						function() {
							$
									.post(
											'webdoc/FLunEnjoy.do?id=${DOCE.doc.id}',
											function(flag) {
												if (flag.commitType == '0') {
													alert('取消关注成功');
													var buttonStr = '<button type="button" id="enjoyId" class="btn btn-default  btn-xs"><span class="glyphicon glyphicon-star-empty"></span>&nbsp;关注</button>';
													$('#disEnjoyId').before(
															buttonStr);
													$('#disEnjoyId').remove();
												} else {
													alert('取消关注失败');
												}
											}, 'json');
						});
	});
</script>