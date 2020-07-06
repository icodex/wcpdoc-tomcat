<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--选择文档-->
<div style="margin: 4px;">
	<div style="text-align: center;">
		<a id="doctypeChooseTreeOpenAll" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" iconCls="icon-sitemap">全部展开</a>
	</div>
	<hr />
	<ul id="doctypeTreeNodeDomTree"></ul>
</div>
<script type="text/javascript">
	$(function() {
		$('#doctypeChooseTreeOpenAll').bind('click', function() {
			$('#doctypeTreeNodeDomTree').tree('expandAll');
		});
		$('#doctypeTreeNodeDomTree').tree({
			url : 'doctype/FarmDoctypeLoadTreeNode.do',
			onSelect : function(node) {
				chooseWindowCallBackHandle(node);
			},
			loadFilter : function(data, parent) {
				return data.treeNodes;
			}
		});
	});
</script>







<!--1.在调用JSP页面，中粘贴下面js中的一段（绑定到按钮事件，或通过方法打开窗口） 
//---------------------------使用下面的（绑定到按钮事件）----------------------------------------------------- 
<a id="buttonChoosedocChoose" href="javascript:void(0)" class="easyui-linkbutton" style="color: #000000;">选择</a>
<script type="text/javascript">
  $(function() {
    //打开选择分类
		$('#buttonChooseType').bindChooseWindow('buttonChooseTypeWin', {
			width : 300,
			height : 400,
			modal : true,
			url : 'doctype/chooseTypeTreeBase.do',
			title : '选择分类',
			callback : function(rows) {
				$("#entity_hide_appkey").val(rows.id);
				$("#entity_appkey_title").val(rows.text);
			}
		});
  });
</script>
//----------------------或----使用下面的（窗口中打开）----------------------------------------------------- 
chooseWindowCallBackHandle = function(row) {
    $("#chooseChoosedocWin").window('close');  
};
$.farm.openWindow( {
  id : 'chooseChoosedocWin',
  width : 600,
  height : 300,
  modal : true,
  url : 'admin/ChoosedocChooseGridPage.do',
  title : '选择文档'
});
 -->





<!--2.粘贴到Action中的java方法
@RequestMapping("/ChoosedocChooseQuery")
@ResponseBody
public Map<String, Object> ChoosedocChooseQuery(DataQuery query,
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
@RequestMapping("/ChoosedocChooseGridPage")
	public ModelAndView ChoosedocChooseGridPage(HttpSession session) {
		return ViewMode.getInstance().returnModelAndView("device/ChoosedeviceChooseGridWin");
	}
-->