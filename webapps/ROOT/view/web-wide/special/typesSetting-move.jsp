<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>私有分类设置-
	<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords" content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author" content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../text/include-web.jsp"></jsp:include>
<script type="text/javascript" src="text/javascript/wcpTypes.js"></script>
</head>
<style>
.wcp_pkm_userinfos {
	border-bottom: 1px solid #ccc;
}

.wcp_pkm_userphoto {
	float: left;
	width: 80px;
	height: 80px;
}

.wcp_pkm_info {
	float: left;
	clear: right;
	padding-left: 20px;
	max-width: 170px;
}

.wcp_pkm_title {
	font-weight: 700;
}

.typeSort {
	font-size: 12px;
	color: #ccc;
	margin-left: 20px;
}
</style>
<body>
	<jsp:include page="../../web-simple/commons/head.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/superContent.jsp"></jsp:include>
	<div class="containerbox wcp-zebra-3">
		<div class="container ">
			<div class="row">
				<div class="col-sm-12" style="height: 50px; padding-top: 20px;">
					<span class="glyphicon glyphicon-fire column_title">
						<a style="color: #d9534f" href="userkm/view/pub.do">私有知识库</a>
						/私有分类移动:
					</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-body" style="border-bottom: 1px dashed #ccc;">
							<b style="font-size: 16px;">
								在下面分类中选择目标分类，分类
								<span style="color: #D9534F;">${type.name}</span>
								将移动到该节点下:
							</b>
							<p></p>
						</div>
						<div class="panel-body" style="margin-bottom: 40px;">
							<div id="loadingDivId">加载分类中...</div>
							<ul id="docRoottypeUl" class="doctypeUl"></ul>
						</div>
					</div>
					<div>
						<a class="btn btn-default" href="webspecialType/typeSettings.do?specialId=${special.id}"> 返回 </a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../web-simple/commons/footServer.jsp"></jsp:include>
	<jsp:include page="../../web-simple/commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	var type_collapse_level = 6;
	var types;
	$(function() {
		$.post('webspecialType/loadType.html', {
			typeid : '${typeid}',
			specialId : '${special.id}'
		}, function(flag) {
			loadPrivateTypes(flag);
			//找到当前分类的上级的li，进行隐藏
			$('#${type.id}').closest("li").hide(); 
		});
	});
	function loadPrivateTypes(flag) {
		var typeobj = $.parseJSON(flag);
		//所有分类数据
		types = typeobj.types;
		var currentTypes = typeobj.typepath;
		if (types.length == 0) {
			//无分类数据
			$('#loadingDivId')
					.html(
							"<div class='alert alert-warning'>无分类信息<br/>请在后台添加分类!</div>");
		} else {
			//有分类数据
			//加载第一层和第二次分类
			loadTypes('#docRoottypeUl', "NONE", true, 1);
		}
		$(currentTypes).each(function(i, obj) {
			$('.' + obj.id).click();
			clickOpenTreeFlag(obj.id);
		});
	}

	//点击分类执行的事件
	function clickType(obj) {
		if ($(obj).attr('id')) {
			if (confirm("确定移动该分类吗？")) {
				window.location = "<PF:basePath/>webspecialType/typeMoveSubmit.do?specialId=${special.id}&typeid=${type.id}&otypeid=" + $(obj).attr('id');
			}
		}
	}
</script>
</html>