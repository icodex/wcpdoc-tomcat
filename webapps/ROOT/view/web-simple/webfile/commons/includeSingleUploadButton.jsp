<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<PF:IfParameterEquals key="config.show.uploadbutton.legacy" val="true">
<input type="button" class="btn btn-info btn-xs center-block"
	style="padding: 0px; padding-bottom: 8px;" id="uploadButton"
	value="上传资源" />
<!-- 单个文件上传 -->
<script type="text/javascript">
	KindEditor
			.ready(function(K) {
				var uploadbutton = K
						.uploadbutton({
							button : K('#uploadButton')[0],
							fieldName : 'imgFile',
							url : basePath + 'actionImg/PubFPupload.do',
							afterUpload : function(data) {
								if (data.error === 0) {
									$('#fileListId').append(
											'<div id="file_'+data.id+'">');
									$('#file_' + data.id)
											.append(
													'<input type="hidden" name="fileId" value="'+data.id+'" />');
									$('#file_' + data.id)
											.append(
													'<span>'
															+ decodeURIComponent(data.fileName)
															+ '</span>');
									$('#file_' + data.id).append('&nbsp;');
									$('#file_' + data.id).append(
											'<a href="javascript:void(0)" style="color: green;" onclick="removeFile(\''
													+ data.id + '\');">删除</a>');
									$('#file_' + data.id)
											.append('&nbsp;&nbsp;');
									$('#file_' + data.id).append('</div>');
									if (!$('#knowtitleId').val()) {
										$('#knowtitleId')
												.val(
														decodeURIComponent(data.fileName));
									}
								} else {
									alert(data.message);
								}
							},
							afterError : function(str) {
								alert('自定义错误信息: ' + str);
							}
						});
				uploadbutton.fileBox.change(function(e) {
					uploadbutton.submit();
				});
			});
</script>
</PF:IfParameterEquals>