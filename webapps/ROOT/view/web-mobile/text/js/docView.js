//知识好评、知识差评、知识内容转义、构造知识卡片、格式化时间

initImgLink();//ipad浏览器不支持light7

var posting = false;
$(document).on("pageInit", "#routers-know-view", function(e) {
	$('video').css("max-width","100%");
	$('img').css("max-width","100%");
	$('table').css("max-width","100%");
	$('pre').css("backgroud-color","#cccccc");
	initTextLink();
	initImgLink();
	initImgStyle();
	initWcpGraph();
});
$(document).on("pageInit", "#routers-file-view", function(e) {
	$('video').css("max-width","100%");
	$('img').css("max-width","100%");
	$('table').css("max-width","100%");
	$('pre').css("backgroud-color","#cccccc");
	initTextLink();
	initImgLink();
	initImgStyle();
});
$(document).on("pageInit", "#routers-qustion-view", function(e) {
	$('video').css("max-width","100%");
	$('img').css("max-width","100%");
	$('table').css("max-width","100%");
	$('pre').css("backgroud-color","#cccccc");
	initTextLink();
	initImgLink();
	initImgStyle();
});
$(document).on("pageInit", "#routers-resource-view", function(e) {
	$('video').css("max-width","100%");
	$('img').css("max-width","100%");
	$('table').css("max-width","100%");
	$('pre').css("backgroud-color","#cccccc");
	initTextLink();
	initImgLink();
	initImgStyle();
});

//初始化超链接为不用路由的类型
function initTextLink(){
	$('.wcp-text a').addClass("external");
}

//初始化图片地址
function initImgLink() {
	$("img.lazy").each(function(i, obj) {
		$(obj).attr('src', $(obj).attr('data-original'));
	});
}

//初始化图片样式
function initImgStyle() {
	$(".wcp-text img").each(function(i, obj) {
		$(obj).removeAttr('height');
		$(obj).removeAttr('width');
		$(obj).removeAttr('style');
	});
}

//提交知识评论
function submitMessage(){
	var text=$('#messageId').val();
	var docid=$('#messageDocId').val();
	if(!text){
		$.toast("请先输入评论!");
		return;
	}
	if (confirm('是否发表改评论?') == true) {
		$.ajax({
			type : "post",
			url : "webdocmessage/ajaxAddmsg.do",
			dataType : "json",
			data : {
				'content' : text,
				'docid' : docid
			},
			async : false,
			success : function(obj) {
				$.router.reloadPage();
			},
			error : function() {
				$.hideIndicator();
				$.toast("操作失败，请先登录系统");
			}
		});
	} else {
		//取消
	} 
}

function searchLucene(){
	//判断是否有关键字searchkey
	var word=$('#searchkey').val();
	if(!word){
		$.toast("请先输入关键字!");
		return;
	}
	//把关键字填充到form中
	$('#wordId').val(word);
	//提交form
	$('#lucenesearchFormId').submit();
}

function PraiseYes(docid) {
	if (posting) {
		return;
	}
	$.showIndicator();
	posting = true;
	$.post('webdoc/PubPraiseYes.do', {
		id : docid
	}, function(flag) {
		$.hideIndicator();
		posting = false;
		if (flag.STATE == '0') {
			$('#praiseyesNumId').text(flag.runinfo.praiseyes);
			$('#praisenoNumId').text(flag.runinfo.praiseno);
		} else {
			alert(flag.MESSAGE);
		}
	}, 'json');
}

function PraiseNo(docid) {
	if (posting) {
		return;
	}
	$.showIndicator();
	posting = true;
	$.post('webdoc/PubPraiseNo.do', {
		id : docid
	}, function(flag) {
		$.hideIndicator();
		posting = false;
		if (flag.STATE == '0') {
			$('#praiseyesNumId').text(flag.runinfo.praiseyes);
			$('#praisenoNumId').text(flag.runinfo.praiseno);
		} else {
			alert(flag.MESSAGE);
		}
	}, 'json');
}
//添加一个知识卡片
function appendDocCard(flag) {
	var html01 = '		<div class="card ">';
	var html02 = '			<div class="card-header no-border">';
	var html03 = '				<div class="facebook-avatar wcp-auther-img">';
	var html04 = '					<img src="'+flag.photourl+'" alt="'+flag.username+'" >';
	var html05 = '				</div>';
	var html06 = '				<div class="facebook-avatar ">';
	var html07 = '					<div class="facebook-name wcp-auther-name" >'+flag.username+'</div>';
	var html08 = '				</div>';
	var html09 = '				<div class="facebook-date wcp-auther-name">';
	var html10 = '					'+dateFtt("yyyy-MM-dd hh:mm", flag.etime);
	var html11 = '				</div>';
	var html12 = '			</div>';
	var html13 = '			<div class="card-header">';
	var html14 = '				<a class="wcp-card-title" href="webdoc/view/Pub'+flag.docid+'.html"><nobr>'+flag.title+'</nobr></a>';
	var html15 = '			</div>';
	var html16 = '			<div class="card-content">';
	var html17 = '				<div class="card-content-inner">';
	var html18 = '					<a href="webdoc/view/Pub'+flag.docid+'.html"> ';
	var html20 = '							<div style="text-align: center;"><img style="max-height: 300px;max-width: 100%;" alt="'+flag.title+'预览图" src="'+flag.imgurl+'"></div>';
	var html22 = '						'+flag.docdescribe.length>100?(flag.docdescribe.substring(0,100)+'...'):flag.docdescribe+'';
	var html23 = '					</a>';
	var html24 = '				</div>';
	var html25 = '			</div>';
	var html26 = '			<div class="card-footer no-border">';
	var html27 = '				<span class="link wcp-type-tip">阅读('+flag.visitnum +') </span> <span class="link wcp-type-tip">评论('+flag.answeringnum +')</span>';
	var html28 = '			</div>';
	var html29 = '		</div>';
	var html = html01 + html02 + html03 + html04 + html05 + html06 + html07
			+ html08 + html09 + html10 + html11 + html12 + html13 + html14
			+ html15 + html16 + html17 + html18
			+ (flag.imgurl ? html20 : '') + html22 + html23 + html24
			+ html25 + html26 + html27 + html28 + html29;
	$('#wcp-doc-list').append(html);
}
//添加一个问答卡片
function appendQuestionCard(flag) {
	var html01 = '          <div class="card">';
	var html02 = '			<div class="card-header no-border">';
	var html03 = '				<div class="facebook-avatar wcp-auther-img">';
	var html04 = '					<img src="view/web-mobile/text/icon/'+(flag.PSTATE==2?'success.png':'help.png')+'" width="32">';
	var html05 = '				</div>';
	var html06 = '				<div class="facebook-avatar ">';
	var html07 = '					<div class="facebook-name wcp-auther-name">'+flag.USERNAME+'</div>';
	var html08 = '				</div>';
	var html09 = '				<div class="facebook-date wcp-auther-name">';
	var html10 = '					'+dateFtt("yyyy-MM-dd hh:mm", flag.PUBTIME);
	var html11 = '				</div>';
	var html12 = '			</div>';
	var html13 = '			<div class="card-header">';
	var html14 = '				<a class="wcp-card-title" href="webquest/fqa/Pub'+flag.QUESTIONID+'.html"><nobr>'+flag.TITLE+'</nobr></a>';
	var html15 = '			</div>';
	var html16 = '			<div class="card-content">';
	var html17 = '				<div class="card-content-inner">';
	var html18 = '					<a href="webquest/fqa/Pub'+flag.QUESTIONID+'.html"> ';
	var html19 = '						'+flag.SHORTDESC;
	var html20 = '					</a>';
	var html21 = '				</div>';
	var html22 = '			</div>';
	var html23 = '			<div class="card-footer no-border">';
	var html24 = '				<span class="link wcp-type-tip">阅读('+flag.VISITNUM+')</span> ';
	var html25 = '				<span class="link wcp-type-tip">回答('+flag.ANSWERS+')</span>';
	var html26 = '			</div>';
	var html27 = '		</div>';
	var html = html01 + html02 + html03 + html04 + html05 + html06 + html07
			+ html08 + html09 + html10 + html11 + html12 + html13 + html14
			+ html15 + html16 + html17 + html18+ html19+ html20+ html21+ html22 + html23 + html24
			+ html25 + html26 + html27;
	$('#wcp-doc-list').append(html);
}
//添加一个全文检索的卡片
function appendSearchCard(flag) {
	var imgurl='';
	var url='';
	if(flag.DOMTYPE=='file'){
		url='webdoc/view/PubFile'+flag.ID+'.html';
		imgurl='view/web-mobile/text/icon/attachment.png';
	}
	if(flag.DOMTYPE=='fqa'){
		url='webquest/fqa/Pub'+flag.ID+'.html';
		imgurl='view/web-mobile/text/icon/help.png';
	}
	if(flag.DOMTYPE!='file'&&flag.DOMTYPE!='fqa'){
		url='webdoc/view/Pub'+flag.ID+'.html';
		imgurl='view/web-mobile/text/icon/form.png';
	}
	var html01 = '      <div class="card ">';
	var html02 = '			<div class="card-header no-border">';
	var html03 = '				<div class="facebook-avatar wcp-auther-img">';
	var html04 = '					<img src="'+imgurl+'" />';
	var html05 = '				</div>';
	var html06 = '				<div class="facebook-avatar ">';
	var html07 = '					<div class="facebook-name wcp-auther-name">'+flag.AUTHOR+'</div>';
	var html08 = '				</div>';
	var html09 = '				<div class="facebook-date wcp-auther-name">';
	var html10 = '					'+dateFtt("yyyy-MM-dd hh:mm", flag.PUBTIME);
	var html11 = '				</div>';
	var html12 = '			</div>';
	var html13 = '			<div class="card-header">';
	var html14 = '				<a class="wcp-card-title" href="'+url+'"><nobr>'+flag.TITLE+'</nobr></a>';
	var html15 = '			</div>';
	var html16 = '			<div class="card-content">';
	var html17 = '				<div class="card-content-inner">';
	var html18 = '					<a href="'+url+'">'+flag.DOCDESCRIBE;//fun:replace(,'[ANSWER]','<span class="text-success">最佳答案</span>')}';
	var html19 = '					</a>';
	var html20 = '				</div>';
	var html21 = '			</div>';
	var html22 = '			<div class="card-footer no-border">';
	var html23 = '				<span class="link wcp-type-tip">'+flag.TYPENAME+'</span>';
	var html24 = '			</div>';
	var html25 = '		</div>';
	var html = html01 + html02 + html03 + html04 + html05 + html06 + html07
			+ html08 + html09 + html10 + html11 + html12 + html13 + html14
			+ html15 + html16 + html17 + html18+ html19+ html20+ html21+ html22 + html23 + html24
			+ html25 ;
	$('#wcp-doc-list').append(html);
}
//格式化时间
function dateFtt(fmt, date14) { //author: meizz   "yyyyMMddhhmmss"
	var o = {
		"M+" : date14.substr(4,2), //月份   
		"d+" : date14.substr(6,2), //日   
		"h+" : date14.substr(8,2), //小时   
		"m+" : date14.substr(10,2), //分   
		"s+" : date14.substr(12,2) //秒   
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (date14.substr(0,4) + "")
				.substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}

//赞同
function approveOf(id) {
	$.showIndicator();
	$.ajax({
		type : "post",
		url : "webdocmessage/approveOf.do?id=" + id,
		dataType : "json",
		async : false,
		success : function(obj) {
			$.hideIndicator();
			$("#approveOf"+id).html(
					"赞" + obj.farmDocmessage.praisnum);
		},
		error : function() {
			$.hideIndicator();
			$.toast("操作失败，请先登录系统");
		}
	});
}

//反对
function oppose(id) {
	$.showIndicator();
	$.ajax({
		type : "post",
		url : "webdocmessage/oppose.do?id=" + id,
		dataType : "json",
		async : false,
		success : function(obj) {
			$.hideIndicator();
			$("#oppose" + id).html("踩" + obj.farmDocmessage.critcismnum);
		},
		error : function() {
			$.hideIndicator();
			$.toast("操作失败，请先登录系统");
		}
	});
}