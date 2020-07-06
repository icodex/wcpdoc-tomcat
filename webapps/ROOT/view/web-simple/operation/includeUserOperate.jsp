<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<c:if test="${self}">
	<div class="btn-group-vertical btn-group-sm" role="group"
		aria-label="..." style="width: 150px;">
		<button type="button" class="btn btn-primary" onclick="toUserEdit()">
			<span class="glyphicon glyphicon-edit"></span> 修改信息
		</button>
		<button type="button" class="btn btn-primary"
			onclick="toUserPwdEdit()">
			<span class="glyphicon glyphicon-lock"></span> 修改密码
		</button>
		<a href="resume/view.do?userid=${userid}" class="btn btn-primary"><span
			class="glyphicon glyphicon-list-alt"></span> 个人档案</a> <a
			href="webuser/webUrlSeting.do" class="btn btn-primary"><span
			class="glyphicon glyphicon-cog"></span> 高级设置</a>
	</div>
	<script type="text/javascript">
		function toUserEdit() {
			window.location.href = basePath + "webuser/edit.do";
		}
		function toUserPwdEdit() {
			window.location.href = basePath + "webuser/editCurrentUserPwd.do";
		}
	</script>
</c:if>
<div class="btn-group-vertical btn-group-sm" role="group"
	aria-label="..." style="width: 150px; margin-top: 8px;">
	<c:if test="${user.type!='4'}">
		<c:if test="${type=='know'}">
			<a href="webuser/PubHome.do?type=know&userid=${userid}"
				class="btn btn-info"><span class="glyphicon glyphicon-book"></span>
				文档知识</a>
		</c:if>
		<c:if test="${type!='know'}">
			<a href="webuser/PubHome.do?type=know&userid=${userid}"
				class="btn btn-default"><span class="glyphicon glyphicon-book"></span>
				文档知识</a>
		</c:if>
		<c:if test="${type=='file'}">
			<a href="webuser/PubHome.do?type=file&userid=${userid}"
				class="btn btn-info"><span class="glyphicon glyphicon-paperclip"></span>
				资源知识</a>
		</c:if>
		<c:if test="${type!='file'}">
			<a href="webuser/PubHome.do?type=file&userid=${userid}"
				class="btn btn-default"><span
				class="glyphicon glyphicon-paperclip"></span> 资源知识</a>
		</c:if>
	</c:if>
	<c:if test="${type=='usercomment'}">
		<c:if test="${self}">
			<a href="webuser/PubHome.do?type=usercomment&userid=${userid}"
				class="btn btn-info"><span class="glyphicon glyphicon-comment"></span>
				知识评论</a>
		</c:if>
	</c:if>
	<c:if test="${type!='usercomment'}">
		<c:if test="${self}">
			<a href="webuser/PubHome.do?type=usercomment&userid=${userid}"
				class="btn btn-default"><span
				class="glyphicon glyphicon-comment"></span> 知识评论</a>
		</c:if>
	</c:if>
</div>

<div class="btn-group-vertical btn-group-sm" role="group"
	aria-label="..." style="width: 150px; margin-top: 8px;">
	<c:if test="${type=='comment'}">
		<a href="webuser/PubHome.do?type=comment&userid=${userid}"
			class="btn btn-info"><span class="glyphicon glyphicon-comment"></span>
			我的留言</a>
	</c:if>
	<c:if test="${type!='comment'}">
		<a href="webuser/PubHome.do?type=comment&userid=${userid}"
			class="btn btn-default"><span class="glyphicon glyphicon-comment"></span>
			我的留言</a>
	</c:if>
	<c:if test="${type=='usermessage'}">
		<c:if test="${self}">
			<a href="webuser/PubHome.do?type=usermessage&userid=${userid}"
				class="btn btn-info"><span class="glyphicon glyphicon-envelope"></span>
				我的消息</a>
		</c:if>
	</c:if>
	<c:if test="${type!='usermessage'}">
		<c:if test="${self}">
			<a href="webuser/PubHome.do?type=usermessage&userid=${userid}"
				class="btn btn-default"><span
				class="glyphicon glyphicon-envelope"></span> 我的消息</a>
		</c:if>
	</c:if>
	<c:if test="${type=='sharelink'}">
		<c:if test="${self}">
			<a href="webuser/PubHome.do?type=sharelink&userid=${userid}"
				class="btn btn-info"><span class="glyphicon glyphicon-link"></span>
				 链接分享</a>
		</c:if>
	</c:if>
	<c:if test="${type!='sharelink'}">
		<c:if test="${self}">
			<a href="webuser/PubHome.do?type=sharelink&userid=${userid}"
				class="btn btn-default"><span class="glyphicon glyphicon-link"></span> 链接分享</a> 
		</c:if>
	</c:if>
	<c:if test="${type=='enjoy'}">
		<c:if test="${self}">
			<a href="webuser/PubHome.do?type=enjoy&userid=${userid}"
				class="btn btn-info"><span class="glyphicon glyphicon-star"></span>
				关注收藏</a>
		</c:if>
	</c:if>
	<c:if test="${type!='enjoy'}">
		<c:if test="${self}">
			<a href="webuser/PubHome.do?type=enjoy&userid=${userid}"
				class="btn btn-default"><span class="glyphicon glyphicon-star"></span>
				关注收藏</a>
		</c:if>
	</c:if>
</div>