<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>测试环境-
	<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description" content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords" content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author" content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="index,follow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
</head>
<body>
	<!-- /.carousel -->
	<div class="containerbox">
		<div class="container" style="min-height: 500px; margin-top: 50px;">
			<div style="margin-top: 8px;"></div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">测试面板</div>
						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked">
								<li role="presentation" class="active">
									<a href="demo/sycnEkcaDomain.do">同步EKCA初始化数据（已经同步过数据的系统慎用）</a>
								</li>
								<li role="presentation" class="active">
									<a href="demo/PubFileUpload.do">文件上传组件</a>
								</li>
								<li role="presentation" class="active">
									<a href="demo/PubInfo.do">当前浏览器信息</a>
								</li>
								<li role="presentation" class="active">
									<a href="demo/Pubimgs.do">图片文件缩放和旋转</a>
								</li>
								<li role="presentation" class="active">
									<a href="demo/PubUedit.do">Ueditor編輯器</a>
								</li>
								<li role="presentation" class="active">
									<a href="demo/PubkindEditor.do">KindEditor編輯器</a>
								</li>
								<li role="presentation" class="active">
									<a href="demo/PubvideoPlay.do">视频播放测试</a>
								</li>
								<li role="presentation" class="active" id="InitTypePop">
									<a>检查和初始化分类权限(升级到版本v4.0.0时才执行，如果v4.0.0以上执行会丢失部分权限)</a>
								</li>
								<li role="presentation" class="active">
									<a href="demo/PubWdaInfo.do">WDA接口调试信息</a>
								</li>
								<li role="presentation" class="active">
									<a href="home/info.html">查看系統授權信息</a>
								</li>
								<li role="presentation" class="active">
									<a href="demo/autoIframe.do">測試自動iframe</a>
								</li>
								<li role="presentation" class="active">
									<a href="style/Pubphoto.do">站酷風格首頁</a>
								</li>
								<li role="presentation" class="active">
									<a href="querycenter/userquery.do">用户检索中心</a>
								</li>
								<li role="presentation" class="active">
									<a href="demo/autoSyncEnjoyPage.do">同步用户关注收藏订阅数据</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#InitTypePop').click(function() {
				if (confirm("该操作有一定风险是否继续执行？")) {
					$('#InitTypePop').addClass("disabled");
					$('#InitTypePop').text("提交中...");
					window.location = basePath + "demo/initTypePop.do";
				}
			});
		});
	</script>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
</body>
</html>