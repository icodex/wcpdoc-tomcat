<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--拷贝属性到当前分类下-->
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false">
		<form id="dom_chooseSearchCopytocurrent">
			<table class="editTable">
				<tr>
					<td class="title">分类名称:</td>
					<td>
						<input name="B.NAME:like" type="text" style="width: 120px;">
					</td>
					<td class="title">属性代码:</td>
					<td>
						<input name="FIELDCODE:like" type="text" style="width: 120px;">
					</td>
					<td class="title">属性名称:</td>
					<td>
						<input name="FIELDTITLE:like" type="text" style="width: 120px;">
					</td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="6">
						<a id="a_search" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
						<a id="a_reset" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">清除条件</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table class="easyui-datagrid" id="dom_chooseGridCopytocurrent">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="SORTNUM" data-options="sortable:true" width="20">排序</th>
					<th field="FIELDTITLE" data-options="sortable:true" width="60">属性名称</th>
					<th field="FIELDCODE" data-options="sortable:true" width="60">属性代码</th>
					<th field="VALIDATES" data-options="sortable:true" width="60">验证规则</th>
					<th field="INPUTTYPE" data-options="sortable:true" width="60">表单类型</th>
					<th field="TYPENAME" data-options="sortable:true" width="60">所属分类</th>
					<th field="REQUIRED" data-options="sortable:true" width="20">必填</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	var chooseGridCopytocurrent;
	var chooseSearchfarmCopytocurrent;
	var toolbar_chooseCopytocurrent = [ {
		text : '复制到当前分类',
		iconCls : 'icon-ok',
		handler : function() {
			var selectedArray = $('#dom_chooseGridCopytocurrent').datagrid(
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
		chooseGridCopytocurrent = $('#dom_chooseGridCopytocurrent').datagrid({
			url : 'typefield/CopytocurrentChooseQuery.do',
			fit : true,
			'toolbar' : toolbar_chooseCopytocurrent,
			pagination : true,
			closable : true,
			checkOnSelect : true,
			striped : true,
			rownumbers : true,
			ctrlSelect : true,
			fitColumns : true
		});
		chooseSearchfarmCopytocurrent = $('#dom_chooseSearchCopytocurrent')
				.searchForm({
					gridObj : chooseGridCopytocurrent
				});
	});
//-->
</script>







<!--1.在调用JSP页面，中粘贴下面js中的一段（绑定到按钮事件，或通过方法打开窗口） 
//---------------------------使用下面的（绑定到按钮事件）----------------------------------------------------- 
<a id="buttonCopytocurrentChoose" href="javascript:void(0)" class="easyui-linkbutton" style="color: #000000;">选择</a>
<script type="text/javascript">
  $(function() {
    $('#buttonCopytocurrentChoose').bindChooseWindow('chooseCopytocurrentWin', {
      width : 600,
      height : 300,
      modal : true,
      url : 'admin/CopytocurrentChooseGridPage.do',
      title : '拷贝属性到当前分类下',
      callback : function(rows) {
        //$('#NAME_like').val(rows[0].NAME);
      }
    });
  });
</script>
//----------------------或----使用下面的（窗口中打开）----------------------------------------------------- 
chooseWindowCallBackHandle = function(row) {
    $("#chooseCopytocurrentWin").window('close');  
};
$.farm.openWindow( {
  id : 'chooseCopytocurrentWin',
  width : 600,
  height : 300,
  modal : true,
  url : 'admin/CopytocurrentChooseGridPage.do',
  title : '拷贝属性到当前分类下'
});
 -->





<!--2.粘贴到Action中的java方法
@RequestMapping("/CopytocurrentChooseQuery")
@ResponseBody
public Map<String, Object> CopytocurrentChooseQuery(DataQuery query,
		HttpServletRequest request) {
	try {
		query = EasyUiUtils.formatGridQuery(request, query);
		DataResult result = //////;
		return ViewMode.getInstance()
				.putAttrs(EasyUiUtils.formatGridData(result))
				.returnObjMode();
	} catch (Exception e) {
		log.error(e.getMessage());
		return ViewMode.getInstance().setError(e.getMessage())
				.returnObjMode();
	}
}
@RequestMapping("/CopytocurrentChooseGridPage")
	public ModelAndView CopytocurrentChooseGridPage(HttpSession session) {
		return ViewMode.getInstance().returnModelAndView("device/ChoosedeviceChooseGridWin");
	}
-->