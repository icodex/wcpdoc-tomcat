<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-search-kindeditor.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-draft-kindeditor.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-file-kindeditor.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-relation-kindeditor.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/echarts/echarts.all.2.2.7.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-multiimage-kindeditor.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/htmltags.js"></script>
<!-- 附件批量上传组件 -->
<script src="view/web-simple/demo/lib/fileUpload/jquery.ui.widget.js"></script>
<script src="view/web-simple/demo/lib/fileUpload/jquery.iframe-transport.js"></script>
<script src="view/web-simple/demo/lib/fileUpload/jquery.fileupload.js"></script>
<link href="view/web-simple/demo/lib/fileUpload/jquery.fileupload.css" rel="stylesheet">
<!-- 附件批量上传组件 -->
<textarea name="text" id="contentId" style="height: 470px; width: 100%;">${fn:replace(fn:replace(param.text,'&lt;', '&amp;lt;'),'&gt;', '&amp;gt;')}</textarea>
<script type="text/javascript">
	var editor;
	$(function() {
		editor = KindEditor.create('textarea[id="contentId"]', {
			resizeType : 1,
			afterChange : function() {
				//生成导航目录
				initLeftMenuFromHtml(this.html());
			},
			cssPath : '<PF:basePath/>text/lib/kindeditor/editInner.css',
			uploadJson : basePath + 'actionImg/PubFPuploadMedia.do',
			formatUploadUrl : false,
			allowPreviewEmoticons : false,
			allowImageRemote : true,
			allowImageUpload : true,
			items : [ 'fontsize',
					'forecolor', 'bold', 'italic', 'underline','|', 'removeformat', 'justifyleft',
					'justifycenter','insertorderedlist',
					'insertunorderedlist', 'formatblock',
					'table', 'hr', 'link',
					'${config_kindeditor_media_able=="true"?"media":"|"}',
					'code', 'wcpimgs', 'wcpdraft', 'wcpknow','wcpfile','${config_show_knowgraph=="true"?"wcprelation":"|"}','source'],  
			afterCreate : function() { 
				//粘贴的文件直接上传到后台
				pasteImgHandle(this,basePath + 'actionImg/PubUpBase64File.do');
				//禁止粘贴图片等文件:pasteNotAble(this.edit);
			}, 
			htmlTags:htmlTagsVar  
		});
		//加载草稿箱
		runAotoSubmitDraft(600);
	});
	//刷新超文本内容到表单中
	function syncEditorcontent() {
		editor.sync();
	}
	//获得潮文本内容
	function getEditorcontent() {
		return editor.html();
	}
	//获得潮文本内容
	function getEditorcontentText() {
		return editor.text();
	}
	//设置超文本内容
	function setEditorcontent(text) {
		editor.html(text);
	}
	
	//禁止kindeditor中粘贴文件
	function pasteNotAble(edit){
		var doc = edit.doc; 
		var cmd = edit.cmd;
		$(doc.body).bind('paste',function(ev){
		    var $this    = $(this);
		    var dataItem =  ev.originalEvent.clipboardData.items[0];
		    if(dataItem){
		       var file     = dataItem.getAsFile();
		      if(file){
		   	   //暂时不处理，文件上传
		  	   return false;
		     } 
		   }
		});
	}
</script>