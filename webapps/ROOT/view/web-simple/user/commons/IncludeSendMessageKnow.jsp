<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<div class="stream-list p-stream">
	<div class="stream-item" id="loop-30">
		<div class="media">
			<a class="pull-left hidden-xs hidden-sm"
				href="webuser/PubHome.do?userid=${doc.doc.cuser }"
				style="max-width: 200px; text-align: center;" title="${doc.doc.title}">
				<img class="img-circle side_unit_author_img" alt="${doc.doc.cusername}"
				src="<PF:basePath/>${doc.photoUrl }"> <br /> <span
				class="side_unit_info">${doc.doc.cusername}</span>
			</a>
			<c:if test="${doc.imgUrl!=null}">
				<div class="pull-right hidden-xs "
					style="overflow: hidden; max-width: 45%;">
					<img style="height: 120px;" alt="${doc.doc.title}预览图"
						src="<PF:basePath/>${doc.imgUrl}">
				</div>
			</c:if>
			<div class="media-body">
				<div style="margin-left: 4px;" class="pull-left">
					<div class="doc_node_title_box">
						<a class="pull-left hidden-md hidden-lg"
							href="webuser/PubHome.do?userid=${doc.doc.cuser}"> <span
							class="side_unit_info">${doc.doc.cusername}:&nbsp;</span>
						</a><a target="${config_sys_link_newwindow_target}"  class="doc_node_title" href="webdoc/view/Pub${doc.doc.id}.html">${doc.doc.title}
							<jsp:include page="/view/web-simple/commons/includeKnowIcon.jsp">
								<jsp:param value="${doc.doc.domtype}" name="domtype" />
							</jsp:include>
						</a>
					</div>
					<c:if test="${doc.doc.docdescribe!=null&&doc.doc.docdescribe!=''}">
						<div>
							<p class="doc_node_content">
								<DOC:Describe maxnum="170" text="${doc.doc.docdescribe}"></DOC:Describe>
							</p>
						</div>
					</c:if>
					<div class="side_unit_info side_unit_info_left_box">${doc.type.name}
						(<i class="glyphicon glyphicon-hand-up"></i>${doc.runinfo.visitnum} <i
							class="glyphicon glyphicon-comment"></i>${doc.runinfo.answeringnum})
						<PF:FormatTime date="${doc.doc.pubtime}"
							yyyyMMddHHmmss="yyyy-MM-dd HH:mm" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>