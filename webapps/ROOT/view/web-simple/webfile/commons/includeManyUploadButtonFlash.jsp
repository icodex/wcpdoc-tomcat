<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 批量上传附件 -->
<link rel="stylesheet" type="text/css"
	href="text/lib/uploadify/uploadify.css">
<script type="text/javascript"
	src="text/lib/uploadify/jquery.uploadify-3.1.min.js"></script>
<input type="file" name="uploadify" id="uploadify" />
<script type="text/javascript">
	$(function() {
		$("#uploadify")
				.uploadify(
						{
							'auto' : true, // 选择文件后自动上传
							'swf' : 'text/lib/uploadify/uploadify.swf', // 上传flash文件路径
							'uploader' : '<PF:basePath/>actionImg/PubFPupload.do',//后台处理的请求 
							'queueID' : 'fileQueue',//与下面的id对应  文件队列
							'queueSizeLimit' : 999,
							'width' : 113,
							"fileObjName" : "imgFile", // 后台接受参数名称
							"preventCaching" : true, // 设置随机参数，防止缓存
							"progressData" : "percentage", // 显示上传进度百分比
							"removeCompleted" : true, // 上传后是否自动删除记录
							"button_image_url" : "<PF:basePath/>text/lib/uploadify/none.png",
							'fileTypeDesc' : '${filetypestr}', // 支持的文件格式，写filetypeExts该参数必须写
							'fileTypeExts' : '${filetypestrplus}', //控制可上传文件的扩展名，启用本项时需同时声明fileDesc 
							'multi' : true, // 是否支持多文件上传
							"uploadLimit" : 999, // 上传限制
							"onCancel" : function() {
								// 取消上传事件
								alert("删除上传");
							},
							"onQueueComplete" : function(queueData) {
								// 所有文件上传成功后触发
								//alert("全部文件上传成功");
							},
							"onUploadSuccess" : function(file, data, response) {//队列中的每个文件上传完成时触发一次
								var obj = jQuery.parseJSON(data);
								if(obj.error!=0){
									alert(obj.message);
									return;
								}
								//alert(obj.id + file.name);
								$('#fileListId').append(
										'<div id="file_'+obj.id+'">');
								$('#file_' + obj.id)
										.append(
												'<input type="hidden" name="fileId" value="'+obj.id+'" />');
								$('#file_' + obj.id).append(
										'<span>' + file.name + '</span>');
								$('#file_' + obj.id).append('&nbsp;');
								$('#file_' + obj.id).append(
										'<a href="javascript:void(0)" style="color: green;" onclick="removeFile(\''
												+ obj.id + '\');">删除</a>');
								$('#file_' + obj.id).append('&nbsp;&nbsp;');
								$('#file_' + obj.id).append('</div>');
								if (!$('#knowtitleId').val()) {
									$('#knowtitleId').val(
											decodeURIComponent(file.name));
								}
							},
							'buttonText' : 'flash批量上传'
						});
	});
</script>