<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--友情链接表单-->
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<div class="tableTitle_msg">${MESSAGE}</div>
		<div class="tableTitle_tag">
			<c:if test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if>
			<c:if test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</div>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formWeburl">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<table class="editTable">
				<tr>
					<td class="title">名称:</td>
					<td><input type="text" style="width: 120px;"
						class="easyui-validatebox"
						data-options="required:true,validType:[,'maxLength[32]']"
						id="entity_webname" name="webname" value="${entity.webname}">
					</td>
					<td class="title">排序</td>
					<td><input class="easyui-numberspinner" style="width: 120px;"
						name="sort" value="${entity.sort}" required="required"
						data-options="min:1,max:100,editable:false"></td>
				</tr>
				<tr>
					<td class="title">URL:</td>
					<td colspan="3"><textarea rows="2" style="width: 360px;"
							class="easyui-validatebox"
							data-options="required:true,validType:[,'maxLength[256]']"
							id="entity_url" name="url">${entity.url}</textarea></td>
				</tr>
				<tr>
					<td class="title">连接类型:</td>
					<td ><select name="type" val="${entity.type}" id="entity_type"
						data-options="required:true">
							<option value="1">底部总是显示</option>
							<option value="2">底部登录后显示</option>
							<option value="3">顶部总是显示</option>
							<option value="4">顶部折叠显示</option>
							<option value="5">登录后菜单显示</option>
					</select></td>
					<td class="title">提交类型:</td>
					<td ><select name="method" val="${entity.method}" id="entity_method"
						data-options="required:true">
							<option value="1">get</option>
							<option value="2">post</option>
					</select></td>
				</tr>
				<tr>
					<td class="title">图标:</td>
					<td colspan="3"><c:if test="${pageset.operateType !=0}">
							<input type="button" id="uploadButton" value="上传预览图" />
							<script type="text/javascript">
								$(function() {
									var uploadbutton;
									uploadbutton = KindEditor
											.uploadbutton({
												button : KindEditor('#uploadButton')[0],
												fieldName : 'imgFile',
												url : 'actionImg/PubFPuploadImg.do',
												afterUpload : function(data) {
													if (data.error === 0) {
														$("#entity_fileid")
																.val(data.id);
														$("#imgFileboxId")
																.html(
																		"<a  target='_blank'  href='" + data.url+ "'>下载</a>");
														$("#imgFileboxId")
																.show();
													} else {
														if (data.message) {
															alert(data.message);
														} else {
															alert('请检查文件格式');
														}
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
						</c:if> <span id="imgFileboxId"> <c:if test="${imgUrl!=null}">
								<a target='_blank' href='${imgUrl}'>下载</a>
								<a href='javascript:void(0);' onclick="delImg()">删除</a>
							</c:if>
					</span> <input type="hidden" id="entity_fileid" name="fileid"
						value="${entity.fileid}"></td>
				</tr>
				<tr id="paraFomr1">
					<td class="title">参数变量名:</td>
					<td colspan="3"><textarea rows="1" style="width: 360px;"
							class="easyui-validatebox"
							data-options="validType:['maxLength[256]','varkeys']"
							id="entity_vars" name="vars">${entity.vars}</textarea><br/>
							<span style="color: green;">英文变量名，多个变量名间用逗号分隔,参数将通过form表单提交</span>
							</td>
				</tr>
				<tr id="paraFomr2">
					<td class="title">参数名称:</td>
					<td colspan="3"><textarea rows="1" style="width: 360px;"
							class="easyui-validatebox"
							data-options="validType:['maxLength[1024]']"
							id="entity_titles" name="titles">${entity.titles}</textarea><br/>
							<span style="color: green;">中文名称，多个名称间用逗号分隔,并且与参数变量名一一对应</span></td>
				</tr>
				<tr id="paraFomr3">
					<td class="title">js脚本:</td>
					<td colspan="3"><textarea rows="4" style="width: 360px;"
							class="easyui-validatebox"
							data-options="validType:['maxLength[65535]']"
							id="entity_jscript" name="jscript">${entity.jscript}</textarea><br/>
							<span style="color: green;">将在页面提交前执行，返回return false;即可中断页面提交</span></td>
				</tr>
				<tr id="paraFomr4">
					<td class="title">url预处理类:</td>
					<td colspan="3"><textarea rows="1" style="width: 360px;"
							class="easyui-validatebox"
							data-options="validType:['maxLength[512]']"
							id="entity_handleimpl" name="handleimpl">${entity.handleimpl}</textarea><br/>
							<span style="color: green;">必须实现接口com.farm.doc.inter.WebUrlHandle,入参有用户信息和webUrl信息,URL提交前执行</span></td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<c:if test="${pageset.operateType==1}">
				<a id="dom_add_entityWeburl" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">增加</a>
			</c:if>
			<c:if test="${pageset.operateType==2}">
				<a id="dom_edit_entityWeburl" href="javascript:void(0)"
					iconCls="icon-save" class="easyui-linkbutton">修改</a>
			</c:if>
			<a id="dom_cancle_formWeburl" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionWeburl = 'weburl/add.do';
	var submitEditActionWeburl = 'weburl/edit.do';
	var currentPageTypeWeburl = '${pageset.operateType}';
	var submitFormWeburl;
	$(function() {
		//表单组件对象
		submitFormWeburl = $('#dom_formWeburl').SubmitForm({
			pageType : currentPageTypeWeburl,
			grid : gridWeburl,
			currentWindowId : 'winWeburl'
		});
		//关闭窗口
		$('#dom_cancle_formWeburl').bind('click', function() {
			$('#winWeburl').window('close');
		});
		//提交新增数据
		$('#dom_add_entityWeburl').bind('click', function() {
			submitFormWeburl.postSubmit(submitAddActionWeburl);
		});
		//提交修改数据
		$('#dom_edit_entityWeburl').bind('click', function() {
			submitFormWeburl.postSubmit(submitEditActionWeburl);
		});
		$("#entity_type").change( function() {
			// 类型改变，如果是登录后显示菜单就显示参数表单
			initParaForm($("#entity_type").val())
		});
		initParaForm($("#entity_type").val());
	});
	function initParaForm(val){
		if(val=='5'){
			$('#paraFomr1').show();
			$('#paraFomr2').show();
			$('#paraFomr3').show();
			$('#paraFomr4').show();
		}else{
			$('#paraFomr1').hide();
			$('#paraFomr2').hide();
			$('#paraFomr3').hide();
			$('#paraFomr4').hide();
		}
	}
	function delImg() {
		$.messager.confirm(MESSAGE_PLAT.PROMPT, "确定删除?", function(r) {
			if (r) {
				$.post("weburl/delImg.do", {
					imgid : "${entity.fileid}"
				}, function(obj) {
					if (obj.STATE == 0) {
						$("#entity_fileid").val("");
						$("#imgFileboxId").hide();
					} else {
						$.messager.alert(MESSAGE_PLAT.ERROR, obj.MESSAGE,
								'error');
					}
				}, "json");
			}
		});
	}
//-->
</script>