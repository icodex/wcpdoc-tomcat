<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<div class="card">
	<div class="card-content">
		<c:if test="${type!=null}">
			<div class="card-content-inner wcp-bottom-clear">
				当前分类:
				<c:forEach items="${typepath}" var="node">
					<c:if test="${param.type==1}">
						/<a href="webtype/view${node.id}/Pub1.html" class="external">${node.name}</a>
					</c:if>
					<c:if test="${param.type==2}">
						/<a href="webquest/view${node.id}/Pub1.html" class="external">${node.name}</a>
					</c:if>
				</c:forEach>
			</div>
			<hr />
			<div class="card-content-inner wcp-top-clear">
				<c:forEach var="node" items="${typesons}">
					<c:if test="${node.parentid==typeid}">
						<!-- 分类链接 -->
						<c:if test="${param.type==1}">
							<a class="external" href="webtype/view${node.id}/Pub1.html">
								${node.name}</a>
						</c:if>
						<c:if test="${param.type==2}">
							<a class="external" href="webquest/view${node.id}/Pub1.html">
								${node.name}</a>
						</c:if>
						<!-- 分类下数量 -->
						<c:if test="${param.type==1}">
							<c:if test="${node.num>0}">
								<span class="wcp-type-tip">${node.num}</span>
							</c:if>
						</c:if>
						<c:if test="${param.type==2}">
							<c:if test="${node.questionnum>0}">
								<span class="wcp-type-tip">${node.questionnum}</span>
							</c:if>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${type==null}">
			<div class="card-content-inner ">
				<c:forEach var="node" items="${typesons}">
					<c:if test="${node.parentid==typeid}">
						<!-- 分类链接 -->
						<c:if test="${param.type==1}">
							<a class="external" href="webtype/view${node.id}/Pub1.html">
								${node.name}</a>
						</c:if>
						<c:if test="${param.type==2}">
							<a class="external" href="webquest/view${node.id}/Pub1.html">
								${node.name}</a>
						</c:if>
						<!-- 分类下数量 -->
						<c:if test="${param.type==1}">
							<c:if test="${node.num>0}">
								<span class="wcp-type-tip">${node.num}</span>
							</c:if>
						</c:if>
						<c:if test="${param.type==2}">
							<c:if test="${node.questionnum>0}">
								<span class="wcp-type-tip">${node.questionnum}</span>
							</c:if>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
	</div>
</div>