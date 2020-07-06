<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 附件批量上传组件 -->
<textarea name="text" id="contentId" style="height: 50px; width: 100%;">${fn:replace(fn:replace(param.text,'&lt;', '&amp;lt;'),'&gt;', '&amp;gt;')}</textarea>
<script type="text/javascript">
	var editor;
	$(function() {
		editor = KindEditor.create('textarea[id="contentId"]', {
			resizeType : 1,
			afterChange : function() {
			},
			cssPath : '<PF:basePath/>text/lib/kindeditor/editInner.css',
			uploadJson : basePath + 'actionImg/PubFPuploadMedia.do',
			formatUploadUrl : false,
			allowPreviewEmoticons : false,
			allowImageRemote : true,
			allowImageUpload : true,
			items : [ 'source', 'fullscreen', '|','fontsize',
					'forecolor', 'bold', 'italic', 'underline',
					'strikethrough', 'removeformat', '|', 'justifyleft',
					'justifycenter','insertorderedlist',
					'insertunorderedlist', '|', 'formatblock',
					'table', 'hr','|', 'link',
					'code' ],
			afterCreate : function() {
				var doc = this.edit.doc;
				var cmd = this.edit.cmd;
				$(doc.body).bind('paste', function(ev) {
					var $this = $(this);
					var dataItem = ev.originalEvent.clipboardData.items[0];
					if (dataItem) {
						var file = dataItem.getAsFile();
						if (file) {
							//暂时不处理，文件上传
							return false;
						}
					}
				});
			}
		});
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
</script>