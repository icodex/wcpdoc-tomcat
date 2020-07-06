<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<PF:basePath/>" />
<title>图片检索-<PF:ParameterValue key="config.sys.title" /></title>
<meta name="description"
	content='<PF:ParameterValue key="config.sys.mate.description"/>'>
<meta name="keywords"
	content='<PF:ParameterValue key="config.sys.mate.keywords"/>'>
<meta name="author"
	content='<PF:ParameterValue key="config.sys.mate.author"/>'>
<meta name="robots" content="noindex,nofllow">
<jsp:include page="../atext/include-web.jsp"></jsp:include>
<script type="text/javascript" src="text/javascript/wcpTypes.js"></script>
<style type="text/css">
.imgWrap li {
	float: left;
	margin: 10px 10px 0 0;
	list-style: none;
	border-collapse: collapse;
	height: 270px;
	width: 330px;
}

.imgWrap .imgLink {
	width: 330px;
	height: 250px;
	display: table-cell; /*图片容器以表格的单元格形式显示*/
	text-align: center; /* 实现水平居中 */
	vertical-align: middle; /*实现垂直居中*/
	overflow: hidden;
	border: none;
	background-color: #cccccc;
}


.imgWrap img {
	vertical-align: middle; /*图片垂直居中*/
	max-height: 250px;
	max-width: 330px;
}
/*文字样式*/
.imgWrap li p {        
  color: transparent;        
  background: transparent;        
  text-align: center;        
  text-transform: uppercase;        
  position: absolute;        
  width: 330px;
  height: 40px;
  -webkit-transition: all 1s ease;        
  -moz-transition: all 1s ease;        
  -o-transition: all 1s ease;        
  -ms-transition: all 1s ease;        
  transition: all 1s ease;    
  overflow: hidden;    
}        
.imgWrap li p a{        
  color: transparent;        
}             
.imgWrap li:hover p {        
  color: white;        
  background: #000; /*fallback for old browsers*/        
  background: rgba(0,0,0,0.7);        
}
.imgWrap li:hover p a{        
  color: white;        
}
.imgWrap li .docTitle {        
  color: white;        
  background: #000; /*fallback for old browsers*/        
  background: rgba(0,0,0,0.7);    
  text-align: center;
  overflow: hidden;
  white-space: nowrap;    
}
.imgWrap li .docTitle a{        
  color: white;        
}
</style>
</head>
<body>
	<jsp:include page="../commons/head.jsp"></jsp:include>
	<jsp:include page="../commons/superContent.jsp"></jsp:include>
	<div class="containerbox">
		<div class="container ">
			<div class="row column_box">
				<div class="col-lg-3">
					<div class="column_box">
						<img class=" center-block"
							src="<PF:basePath/>actionImg/PubHomelogo.do" alt="wcp"
							style="max-width: 128px;" />
					</div>
				</div>
				<div class="col-lg-6">
					<div class="row">
						<div class="col-sm-12 column_box">
							<jsp:include page="commons/includeSearchForm.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<div class="col-lg-3"></div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default" style="margin-top: 60px;">
						<div class="panel-body">
							<div class="row ">
								<div class="col-sm-12" style="margin: 16px;margin-top: 4px;">
									<span class="glyphicon glyphicon-fire  column_title">&nbsp;在含有图片的${result.totalSize}条知识中检索图片，用时${result.runtime}毫秒
									</span>
									<div class="btn-group btn-group-sm pull-right" role="group" aria-label="..." style="margin-top: -6px;margin-right: 16px;">
										<button onclick="turnSearchType('list')"  title="列表模式" type="button" class="btn btn-default">
										<!-- <span style="font-size: 16px;">图片</span> -->
										<img alt="" src="text/img/list32.png" style="height: 16px; width: 16px;">
									</button>
									<button onclick="turnSearchType('img')" title="图片模式" type="button" class="btn btn-default active">
										<!-- <span style="font-size: 16px;">图片</span> -->
										<img alt="" src="text/img/grid32.png" style="height: 16px; width: 16px;">
									</button>
									</div>
								</div>
							</div>
							<hr style="margin-left: -16px; margin-right: -16px;" />
							<div class="row">
								<div class="col-sm-12">
									<div>
										<ul class="imgWrap clearfix" id="searchImgBoxId">
										</ul>
									</div>
									<hr style="margin-left: -16px; margin-right: -16px;" />
									<div style="text-align: center;">
									  <button id="loadImgButtonId" type="button" class="btn btn-default" style="width: 250px;">加载更多图片~</button>
									  <span id="loadImgMessageId">更多图片加载中~</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="commons/includeSearchProLimitCache.jsp"></jsp:include>
	<jsp:include page="../commons/footServer.jsp"></jsp:include>
	<jsp:include page="../commons/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	var type='${type}';//normal,pro
	//全部知识
	var jsondata = $.parseJSON('${resultJson}');
	//当前处理的知识
	var currentIndex = 0;
	//每次最多加载多少图片
	var oneLoadNum = 20;
	//本轮加载多少图片
	var loadingNum = 0;
	//当一共加载多少图片
	var tatleLogingNum=0;
	//每行显示多少张图片，超出的隐藏，凑够整行才显示
	var lineImgNum=3;
	
	var loadingKnow = 1;
	$(function() {
		console.log("知识供检索出：" + jsondata.length + "条")
		loadImgs();
		$('#loadImgButtonId').click(function(){
			loadImgs();
		});
	});
	//加载知识图片
	function loadImgs() {
		$('#loadImgButtonId').hide();
		$('#loadImgMessageId').show();
		//存在图片
		if (jsondata[currentIndex]) {
			loadRemoteImgs(jsondata[currentIndex].DOCID,jsondata[currentIndex].DOMTYPE);
			currentIndex++;
		}else{
			$('#loadImgButtonId').hide();
			$('#loadImgMessageId').hide();
			$(".searchResultImgUnit").show();
		}
	}
	//加载远程图片
	function loadRemoteImgs(docid,doctype) {
		console.log("正在加载知识第：" + loadingKnow + "/" + jsondata.length + "条")
		loadingKnow++;
		$.post('websearch/PubfindImgs.do',{'docid' : docid,'doctype':doctype},function(flag) {
			$(flag).each(function(i, obj) {
				console.log("加载完成图片第："+ loadingNum + "/"+ oneLoadNum + "条")
				//隐藏层的语法，需要时可以使用
				var hideDivHtml='<p><a target="${config_sys_link_newwindow_target}" href="webdoc/view/Pub'+obj.DOCID+'.html">'+obj.DOCTITLE+'<a/></p>';
				var fileUrl="";
				var docUrl='webdoc/view/Pub'+obj.DOCID+'.html';
				if(obj.FILEID){
					fileUrl='webdoc/view/PubFile'+obj.FILEID+'.html';
				}else{
					fileUrl=docUrl;
				}
				$('#searchImgBoxId').append(
						'<li class="searchResultImgUnit">'+
						'<a target="${config_sys_link_newwindow_target}" class="imgLink" href="'+
						fileUrl+
						'" class="imgBox"><span></span><img src="'
						+obj.MINURL+'" alt="" /></a><div class="docTitle"><a target="${config_sys_link_newwindow_target}" href="'+docUrl+'">'+obj.DOCTITLE+'</a></div></li>');
				loadingNum++;
				tatleLogingNum++;
			});
			if (loadingNum < oneLoadNum) {
				//继续加载图片
				loadImgs();
			} else {
				loadingNum = 0;
				$('#loadImgButtonId').show();
				$('#loadImgMessageId').hide();
				clearImg();
			}
		}, 'json');
	}
	//清理超出整行的图片，等下次再加载时恢复显示上次隐藏的图片
	function clearImg(){
		var needHidenNum= tatleLogingNum%lineImgNum;
		$(".searchResultImgUnit").show();
		for(var i=1;i<=needHidenNum;i++){
			$(".searchResultImgUnit").eq(-i).hide();
		}
	}
</script>
</html>