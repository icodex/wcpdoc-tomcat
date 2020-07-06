<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<style>
<!--
.showLableType1 .linkTitle {
	color: #b2b1b1;
	cursor: default;
}
.showLableType1 .linkTitle:HOVER {
	text-decoration:none;
}
.farm_tree_flag {
	cursor: pointer;
}
-->
</style>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">选择知识分类</h4>
			</div>
			<div class="modal-body"  id="treeChooseTypeBoxId">
				<div id="loadingDivId">加载分类中...</div>
				<ul id="docRoottypeUl"  class="doctypeUl" style="max-height: 400px; overflow: auto;"></ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<script type="text/javascript">
var type_collapse_level=3;
</script>
<PF:IfParameterEquals key="config.sys.type.collapse.level" val="1">
<script type="text/javascript">
var type_collapse_level=1;
</script>
</PF:IfParameterEquals>
<PF:IfParameterEquals key="config.sys.type.collapse.level" val="2">
<script type="text/javascript">
var type_collapse_level=2;
</script>
</PF:IfParameterEquals>
<PF:IfParameterEquals key="config.sys.type.collapse.level" val="3">
<script type="text/javascript">
var type_collapse_level=3;
</script>
</PF:IfParameterEquals>
<script type="text/javascript">
	$(function() {
		$.post('webtype/PubLoadWType.do',{typeid:'${doc.type.id}${doce.type.id}'}, function(flag) {
			var typeobj=$.parseJSON(flag);
			//所有分类数据
			types=typeobj.types;
			var currentTypes=typeobj.typepath;
			if(types.length==0){
				//无分类数据
				$('#loadingDivId').html("<div class='alert alert-warning'>无分类信息<br/>请在后台添加分类!</div>");
			}else{
				//有分类数据
				//加载第一层和第二次分类
				loadTypes('#docRoottypeUl',"NONE",true,1);
			}
			$(currentTypes).each(function(i,obj){
				$('.'+obj.id).click();
				clickOpenTreeFlag(obj.id);
			});
		});
	});
	
	//点击分类执行的事件
	function clickType(obj,type){
		if(type!=3){
			return;
		}
		if ($(obj).attr('id')) {
			$('#knowtypeId').val($(obj).attr('id'));
			$('#knowtypeTitleId').val($(obj).text());
			$('#myModal').modal('hide');
			try{
				typeInputUpdate();
			}catch(e){
				//无实现回调函数
			}
		}
	}
</script>