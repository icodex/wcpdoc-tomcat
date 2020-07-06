<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript" charset="utf-8"
	src="text/lib/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="text/lib/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8"
	src="text/lib/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8"
	src="text/lib/ueditor/lang/en/en.js"></script>
<link rel="stylesheet"
	href="text/lib/ueditor/themes/default/css/ueditor.css" type="text/css">
<script id="container" type="text/plain"
	style="width: 100%; height: 500px;">${param.text}</script>
<jsp:include
	page="/view/web-simple/know/commons/includeChooseInnerDoc.jsp"></jsp:include>
<input type="hidden" name="text" id="contentId" />
<script type="text/javascript">
	var ue;
	$(function() {
		/**[ [ 'fullscreen', 'source', '|', 'paragraph',
					'fontfamily', 'fontsize', '|', 'undo', 'redo', '|', 'bold',
					'italic', 'underline', 'fontborder', 'strikethrough',
					'superscript', 'subscript', 'removeformat', 'formatmatch',
					'autotypeset', 'pasteplain', '|', 'forecolor', 'backcolor',
					'insertorderedlist', 'insertunorderedlist', 'selectall',
					'cleardoc', '|', 'rowspacingtop', 'rowspacingbottom',
					'lineheight', '|', 'directionalityltr',
					'directionalityrtl', 'indent', '|', 'justifyleft',
					'justifycenter', 'justifyright', 'justifyjustify', '|',
					'touppercase', 'tolowercase', '|', 'link', 'unlink', '|',
					'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
					'simpleupload', 'insertimage', 'insertcode', 'pagebreak',
					'|', 'horizontal', 'date', 'time', 'spechars', '|',
					'inserttable', 'deletetable', 'insertparagraphbeforetable',
					'insertrow', 'deleterow', 'insertcol', 'deletecol',
					'mergecells', 'mergeright', 'mergedown', 'splittocells',
					'splittorows', 'splittocols', 'charts', '|', 'preview',
					'searchreplace', 'drafts' ] ];**/
		ue = UE.getEditor('container', {
			autoHeight : false,
			autoFloatEnabled : false,
			maximumWords : 1000000,
			maxInputCount : 50,
			toolbars : [ [ 'fullscreen', 'source', '|', 'paragraph',
					'fontfamily', 'fontsize', '|', 'undo', 'redo', '|', 'bold',
					'italic', 'underline', 'fontborder', 'strikethrough',
					'superscript', 'subscript', 'removeformat',
					'autotypeset', 'pasteplain', '|', 'forecolor', 'backcolor',
					'insertorderedlist', 'insertunorderedlist', 'selectall',
					'cleardoc', '|', 'rowspacingtop', 'rowspacingbottom',
					'lineheight', '|', 'directionalityltr',
					'directionalityrtl', 'indent', '|', 'justifyleft',
					'justifycenter', 'justifyright', 'justifyjustify', '|',
					'touppercase', 'tolowercase', '|', 'link', 'unlink', '|',
					'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
					'simpleupload', 'insertimage', 'insertcode', 'pagebreak',
					'|', 'horizontal', 'date', 'time', 'spechars', '|',
					'inserttable', 'deletetable', 'insertparagraphbeforetable',
					'insertrow', 'deleterow', 'insertcol', 'deletecol',
					'mergecells', 'mergeright', 'mergedown', 'splittocells',
					'splittorows', 'splittocols', 'charts', '|', 'preview', 'drafts' ] ]
		});
		ue.addListener('contentChange', function(editor) {
			initLeftMenuFromHtml(getEditorcontent());
		});
		ue.addListener('ready', function(editor) {
			ue.focus();
			ue.setContent("", true);
		});

		UE.registerUI('button', function(editor, uiName) {
			//注册按钮执行时的command命令，使用命令默认就会带有回退操作
			editor.registerCommand(uiName, {
				execCommand : function() {
				}
			});
			//创建一个button
			var btn = new UE.ui.Button({
				//按钮的名字
				name : '插入知识',
				//提示
				title : '插入知识',
				//添加额外样式，指定icon图标，这里默认使用一个重复的icon
				cssRules : 'background-position: -400px 80px;',
				//点击时执行的命令
				onclick : function() {
					//这里可以不用执行命令,做你自己的操作也可
					$('#myInnerDocs').modal({
						keyboard : false
					})
				}
			});
			return btn;
		});
	});
	//刷新超文本内容到表单中
	function syncEditorcontent() {
		$('#contentId').val(getEditorcontent());
	}
	//获得超文本内容
	function getEditorcontent() {
		return ue.getContent();
	}
	//获得超文本内容
	function getEditorcontentText() {
		return ue.getContentTxt();
	}
	//设置超文本内容
	function setEditorcontent(text) {
		ue.setContent(text);
	}
	function insertEditorHtml(html){
		UE.getEditor('container').execCommand('insertHtml', html);
	}
</script>