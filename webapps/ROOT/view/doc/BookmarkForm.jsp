<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--订阅收藏表单-->
<style>
<!--
#entity_td_appkey .easyui-linkbutton {
	padding: 4px;
	padding-top: 2px;
	height: 26px;
}
-->
</style>
<div class="easyui-layout" data-options="fit:true">
	<div class="TableTitle" data-options="region:'north',border:false">
		<span class="label label-primary"> <c:if
				test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if> <c:if
				test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
		</span>
	</div>
	<div data-options="region:'center'">
		<form id="dom_formBookmark">
			<input type="hidden" id="entity_id" name="id" value="${entity.id}">
			<table class="editTable">
				<tr>
					<td class="title">收藏类型:</td>
					<td><select name="type" style="width: 120px;"
						id="entity_knowtype" val="${entity.type}">
							<option value="1">知识</option>
							<option value="3">分类</option>
					</select></td>
					<td class="title">收藏对象:</td>
					<td id="entity_td_appkey">
						<!--  -->
						<input type="hidden" name="appid" id="entity_hide_appkey" > 
						<!--  -->
						<input type="text" id="entity_appkey_title" style="width: 120px;" class="easyui-validatebox" name="appname"
						 readonly="readonly"> 
						<!--  -->
						<input title="知识" id="buttonChoosedoc" type="button" value="选择" class="easyui-linkbutton" />  
						<input title="分类" id="buttonChooseType" type="button" value="选择" class="easyui-linkbutton" /> 
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<a id="dom_add_entityBookmark" href="javascript:void(0)"
				iconCls="icon-save" class="easyui-linkbutton">增加</a> <a
				id="dom_cancle_formBookmark" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionBookmark = 'farmdocenjoy/add.do';
	var submitEditActionBookmark = 'farmdocenjoy/edit.do';
	var currentPageTypeBookmark = '${pageset.operateType}';
	var submitFormBookmark;
	$(function() {
		//表单组件对象
		submitFormBookmark = $('#dom_formBookmark').SubmitForm({
			pageType : currentPageTypeBookmark,
			grid : gridBookmark,
			currentWindowId : 'winBookmark'
		});
		//关闭窗口
		$('#dom_cancle_formBookmark').bind('click', function() {
			$('#winBookmark').window('close');
		});
		//提交新增数据
		$('#dom_add_entityBookmark').bind('click', function() {
			submitFormBookmark.postSubmit(submitAddActionBookmark);
		});
		//打开选择知识
		$('#buttonChoosedoc').bindChooseWindow('chooseChoosedocWin', {
			width : 800,
			height : 400,
			modal : true,
			url : 'farmtop/toDocTopChooseDoc.do',
			title : '选择文档',
			callback : function(rows) {
				$("#entity_hide_appkey").val(rows[0].ID);
				$("#entity_appkey_title").val(rows[0].TITLE);
			}
		});
		//打开选择分类
		$('#buttonChooseType').bindChooseWindow('buttonChooseTypeWin', {
			width : 300,
			height : 400,
			modal : true,
			url : 'doctype/chooseTypeTreeBase.do',
			title : '选择分类',
			callback : function(rows) {
				if(rows.id=='NONE'){
					alert('不能选择该节点!');
				}else{
					$("#entity_hide_appkey").val(rows.id);
					$("#entity_appkey_title").val(rows.text);
				}
			}
		});
		initAppkeyTypeShow();
		$("#entity_knowtype").change(function() {
			$('#entity_searckKey').val("");
			$('#entity_appkey_title').val("");
			initAppkeyTypeShow();
		});
		$("#entity_name").change(function() {
			if ($('#entity_knowtype').val() == '5') {
				$('#entity_searckKey').val($("#entity_name").val());
				submitFormGridkpoint.validate();
			}
		});
	});
	//設置各种选择按钮的显示隐藏
	function initAppkeyTypeShow() {
		//entity_appkey_title,entity_hide_appkey,
		//1.知识、2.問答、3.分类
		var type = $("#entity_knowtype").val();
		$('#entity_td_appkey').children("input").hide();
		if (type == '1') {
			$('#buttonChoosedoc').show();
		}
		if (type == '2') {
			$('#buttonQuestionChoose').show();
		}
		if (type == '3') {
			$('#buttonChooseType').show();
		}
		$('#entity_appkey_title').show();
		$('#entity_searckKey').validatebox({
			required : false
		});
		$('#entity_appkey_title').validatebox({
			required : true
		});
	}
//-->
</script>