<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--选择文档-->
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false">
		<form id="dom_chooseSearchChoosedoc">
			<table class="editTable">
				<tr>
					<td class="title">标题:</td>
					<td>
						<input name="TITLE:like" type="text">
					</td>
					<td class="title">摘要:</td>
					<td>
						<input name="DOCDESCRIBE:like" type="text">
					</td>
					<td class="title">分类:</td>
					<td>
						<input name="C.NAME:like" type="text">
						<!-- <input id="PARENTTITLE_RULE" type="text" readonly="readonly"
							style="background: #F3F3E8">
						<input id="PARENTID_RULE" name="TYPEID:=" type="hidden"> -->
					</td>
				</tr>
				<tr>
					<td class="title">读权限:</td>
					<td>
						<select name="A.READPOP:=">
							<%-- 
							<option value="">
							</option> --%>
							<option value="1">分类</option>
							<%-- 
							<option value="2">
								小组
							</option>
							<option value="3">
								禁止编辑
							</option> --%>
						</select>
					</td>
					<td class="title">写权限:</td>
					<td>
						<select name="A.WRITEPOP:=">
							<option value=""></option>
							<option value="1">分类</option>
							<option value="2">小组</option>
							<option value="3">禁止编辑</option>
						</select>
					</td>
					<td class="title">状态:</td>
					<td>
						<select name="STATE:=">
							<option value=""></option>
							<option value="1">开放</option>
							<option value="0">禁用</option>
							<option value="2">待审核</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="title" colspan="3">
						<a id="a_search" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
					</td>
					<td colspan="3">
						<a id="a_reset" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">清除条件</a>
						<span style="color: green;font-size: 12px;"> 查询分类下所有阅读权限为分类的知识</span>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table class="easyui-datagrid" id="dom_chooseGridChoosedoc">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="TITLE" data-options="sortable:true" width="40">标题</th>
					<th field="DOMTYPE" data-options="sortable:true" width="20">内容类型</th>
					<th field="DOCDESCRIBE" data-options="sortable:true" width="20">摘要</th>
					<th field="AUTHOR" data-options="sortable:true" width="17">作者</th>
					<th field="PUBTIME" data-options="sortable:true" width="20">发布时间</th>
					<th field="STATE" data-options="sortable:true" width="10">状态</th>
					<th field="READPOP" data-options="sortable:true" width="10">读权限</th>
					<th field="WRITEPOP" data-options="sortable:true" width="10">写权限</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var chooseGridChoosedoc;
	var chooseSearchfarmChoosedoc;
	var toolbar_chooseChoosedoc = [ {
		text : '确认选中',
		iconCls : 'icon-ok',
		handler : function() {
			var selectedArray = $('#dom_chooseGridChoosedoc').datagrid(
					'getSelections');
			if (selectedArray.length > 0) {
				chooseWindowCallBackHandle(selectedArray);
			} else {
				$.messager.alert(MESSAGE_PLAT.PROMPT, MESSAGE_PLAT.CHOOSE_ONE,
						'info');
			}
		}
	} ];
	$(function() {
		chooseGridChoosedoc = $('#dom_chooseGridChoosedoc').datagrid({
			url : 'typetopdoc/docTopChooseDocList.do?typeid=${typeid}',
			fit : true,
			'toolbar' : toolbar_chooseChoosedoc,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			rownumbers : true,
			ctrlSelect : true,
			fitColumns : true
		});
		chooseSearchfarmChoosedoc = $('#dom_chooseSearchChoosedoc').searchForm(
				{
					gridObj : chooseGridChoosedoc
				});
	});
//-->
</script>