<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/wda.tld" prefix="WDA"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 批量上传附件 -->
<script src="view/web-simple/demo/lib/fileUpload/jquery.ui.widget.js"></script>
<script
	src="view/web-simple/demo/lib/fileUpload/jquery.iframe-transport.js"></script>
<script src="view/web-simple/demo/lib/fileUpload/jquery.fileupload.js"></script>
<link href="view/web-simple/demo/lib/fileUpload/jquery.fileupload.css"
	rel="stylesheet">
<style>
<!--
.bar {
	height: 18px;
	background: green;
}

.presessInfor {
	color: #428bca;
	margin: 4px;
}

.WfsUploadDropBox {
	
}

.WfsUploadDropBox.active {
	background-color: #e1edf3;
}
</style>
<span class="presessInfor" id="html5uploadProsess"></span>
<span class="btn btn-info fileinput-button"> <span>批量上传文件</span>
	<input id="fileupload" type="file" name="imgFile" multiple>
</span>
<script type="text/javascript">
	//单个文件大小
	var maxSize = parseInt("${config_doc_upload_length_max}");
	var maxSizeTitle = (maxSize / 1024 / 1024).toFixed(2);
	//单次上传文件数量
	var maxFileNum = 10;
	var allUploadFilesize = 0;
	$(function() {
		$('#fileupload').fileupload(
				{
					url : "actionImg/PubFPupload.do",
					dataType : 'json',
					change : function(e, data) {
						//校验大小
						return updateFileValidate(data.files);
					},
					done : function(e, data) {
						var url = data.result.url;
						//添加页面文件元素
						uploadFileSuccessHandle(data.result.id,
								data.result.fileName, data.result.error,
								data.result.message);
					},
					progressall : function(e, data) {
						var progress = parseInt(data.loaded / data.total * 100,
								10);
						//显示进度
						showUploadProcess(true, "数据上传", progress);
						if (progress >= 100 && allUploadFilesize > 0) {
							//显示远程服务器端处理进度
							initLoadRemoteProcess(true);
						}
					}
				});
	});
	//上传文件成功
	function uploadFileSuccessHandle(id, fileName, error, message) {
		//总的未上传完成的文件
		allUploadFilesize--;
		if (allUploadFilesize <= 0) {
			//全部传完，关闭远程进度加载函数和进度显示
			initLoadRemoteProcess(false);
			showUploadProcess(false);
		}
		if (error != 0) {
			Modal.alert({
				msg : message,
				title : '错误',
				btnok : '确定',
				btncl : '取消'
			});
			return;
		}
		if (!$('#knowtitleId').val()) {
			//如果知识没有标题，就把文件名称作为标题
			$('#knowtitleId').val(decodeURIComponent(fileName));
			try {
				if (typeof loadExistKnow === "function") { //FunName为函数名称
					loadExistKnow();
				}
			} catch (e) {
				console.log("function loadExistKnow() run error!");
			}
		}
		//加载页面文件元素
		addFileNode('actionImg/PubIcon.do?id=' + id,
				decodeURIComponent(fileName), id);
	}
	//加载上传进度isShow，是否显示进度信息title进度标题, process进度值百分比
	function showUploadProcess(isShow, title, process) {
		if (!isShow) {
			//隐藏进度
			$('#html5uploadProsess').hide();
			return;
		} else {
			if (process) {
				//显示进度
				$('#html5uploadProsess').show();
				$('#html5uploadProsess').text(title + process + '%...');
				if (process >= 100 && allUploadFilesize <= 0) {
					//完成后隐藏进度
					$('#html5uploadProsess').hide();
				}
			} else {
				//只显示标题
				$('#html5uploadProsess').show();
				$('#html5uploadProsess').text(title);
			}
		}
	}
	//是否继续加载远程进度
	var isLoadRemotProecess = false;
	//检查远程进度state：是否加载远程进度
	function initLoadRemoteProcess(state) {
		if (!state) {
			isLoadRemotProecess = false;
			showUploadProcess(false);
		} else {
			if (!isLoadRemotProecess) {
				isLoadRemotProecess = true;
				showUploadProcess(true, '等待数据处理...');
				doloadRemoteProcess();
			}
		}
	}
	//加载远程进度
	function doloadRemoteProcess() {
		$.post("actionImg/PubUploadProcess.do", {}, function(flag) {
			if (flag.STATE == 0) {
				showUploadProcess(true, '数据处理', flag.process);
				if (isLoadRemotProecess) {
					setTimeout("doloadRemoteProcess()", 1000); //延迟1秒	
				}
			} else {
				alert(flag.MESSAGE);
			}
		}, 'json');
	}
	function addFileNode(imgUrl, fileName, fileId) {
		$('.blocktip-title').hide();
		var html = '<div class="col-md-4 file-block-box"   id="file_'+fileId+'">';
		html = html + '		<div class="stream-item" >';
		html = html + '				<div class="media">';
		html = html + '					<div class="pull-left">';
		html = html + '						<img  alt="'+fileName+'" src="'+imgUrl+'">';
		html = html + '					</div>';
		html = html + '					<div class="media-body" >';
		html = html + '							<i onclick="removeFile(\'' + fileId
				+ '\');" class="glyphicon glyphicon-remove pull-right" ></i>';
		html = html + '						<div class="file-title" >' + fileName + '</div>';
		html = html + '					</div>';
		html = html + '				</div>';
		html = html + '		</div>';
		html = html
				+ '<input type="hidden" name="fileId" value="'+fileId+'" /></div>';
		$('#fileListId').append(html);
	}

	//检查上传文件，返回值为是否允许上传
	function updateFileValidate(files) {
		if (files.length > maxFileNum) {
			alert("单次上传文件数量不能大于" + maxFileNum + "个!");
			return false;
		}
		var isOK = true;
		$(files).each(function(i, obj) {
			if (obj.size > maxSize) {
				alert("文件" + obj.name + "超大,请检查文件大小不能大于" + maxSizeTitle + "m");
				isOK = false;
			}
		});
		if (isOK) {
			//增加需要上传的文件数量
			allUploadFilesize = allUploadFilesize + files.length;
		}
		return isOK;
	}
</script>
<script>
	$(function() {
		//避免拖拽事件传递到外层
		$('body').bind('drop', function(ev) {
			ev.stopPropagation();
			ev.preventDefault();
		});
		//初始化拖拽组件
		initDropBox();
	});
	//初始化拖拽框
	function initDropBox() {
		var uploadDrop = document.getElementById('fileUploadDropBoxId');
		uploadDrop.addEventListener('dragover', function(event) {
			$('.WfsUploadDropBox').addClass("active");
			//拖进来
			event.preventDefault();
		});
		uploadDrop.addEventListener('dragenter', function(event) {
			event.preventDefault();
		});
		uploadDrop.addEventListener('dragleave', function(event) {
			$('.WfsUploadDropBox').removeClass("active");
			//移出去
			event.preventDefault();
		});
		uploadDrop.addEventListener('drop', function(event) {
			//完成拖拽并释放再组件内
			$('.WfsUploadDropBox').removeClass("active");
			event.preventDefault();
			var fileList = Array.from(event.dataTransfer.files);
			//校验附件
			var uploadAble = updateFileValidate(fileList);
			if (uploadAble) {
				//所有文件总大小
				var allDropfilesize = 0;
				//存放每个文件已经上传打大小，配合总大小计算上传进度
				var fileUploadeds = new Array(fileList.length);
				$(fileList).each(function(i, obj) {
					//计算总大小
					allDropfilesize = allDropfilesize + obj.size;
				});
				for (var i = 0; i < fileList.length; i++) {
					sendFileByXHR('actionImg/PubFPupload.do', fileList[i],
							fileList, allDropfilesize, fileUploadeds, i);
				}
			}
		});
	}
	//上传拖拽文件
	//url 上传地址, fielObj当前文件, fileList总文件列表, allfilesize总文件大小, fileUploadedArray存放所有文件已上传大小的数组, i当前文件下标
	function sendFileByXHR(url, fielObj, fileList, allfilesize,
			fileUploadedArray, i) {
		var xhr = new XMLHttpRequest();
		xhr.upload.onprogress = function(event) {
			try {
				fileUploadedArray[i] = event.loaded;
				//当前已经上传总大小
				var alled = 0;
				for (var n = 0; n < fileUploadedArray.length; n++) {
					alled = alled + fileUploadedArray[n];
				}
				var progress = parseInt(alled / allfilesize * 100, 10);
				showUploadProcess(true, "数据上传", progress);
				if (progress >= 100 && allUploadFilesize > 0) {
					initLoadRemoteProcess(true);
				}
			} catch (e) {
				console.log(e);
			}
		}
		xhr.onreadystatechange = function() {
			if (xhr.status === 200 && xhr.readyState === 4) {
				//上传成功
				var jsonObject = JSON.parse(xhr.responseText, null);
				uploadFileSuccessHandle(jsonObject.id, jsonObject.fileName,
						jsonObject.error, jsonObject.message);
			}
		}
		xhr.onabort = function(event) {
			//终止
			console.log('abort');
		}
		xhr.onerror = function(event) {
			console.log('error');
			showErrorMessage('xhr.onerror-error');
		}
		var data = new FormData();
		data.append("imgFile", fielObj);
		xhr.open('POST', url, true);
		xhr.send(data);
	}
</script>