<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<style>
.wcp_pkm_userinfos {
	border-bottom: 1px solid #ccc;
}

.wcp_pkm_userphoto {
	float: left;
	width: 80px;
	height: 80px;
}

.wcp_pkm_info {
	float: left;
	clear: right;
	padding-left: 20px;
	max-width: 170px;
}

.wcp_pkm_title {
	font-weight: 700;
}

.typeSort {
	font-size: 12px;
	color: #fff;
	margin-left: 20px;
	width: 20px;
	overflow: hidden;
	display: none;
}

.farm_tree_flag {
	margin-left: 8px;
}

.linklevel1 {
	font-weight: 700;
	font-size: 17px;
	border-left: 8px solid #d9534f;
	padding-left: 4px;
	border-left: 8px solid #d9534f;
}

.linklevel2 {
	font-weight: 700;
	font-size: 14px;
	border-left: 4px solid #cccccc;
	padding-left: 4px;
}
</style>
<!-- Modal -->
<div class="modal fade" id="ChooseTypeWin" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">选择分类</h4>
			</div>
			<div class="modal-body" style="padding-bottom: 4px;">
				<div id="loadingDivId">加载分类中...</div>
				<ul id="docRoottypeUl" class="doctypeUl"></ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var type_collapse_level = 6;
	//说明：多选用户后的回调方法为chooseUseridsBackHandle(userids)
	$(function() {
		$.post('webspecialType/loadType.do', {
			typeid : '${typeid}',
			specialId : '${specialId}'
		}, function(flag) {
			var typeobj = $.parseJSON(flag);
			if (typeobj.STATE == '1') {
				alert(typeobj.MESSAGE);
				return;
			}
			loadPrivateTypes(flag);
			$('#00000000000000000000000000000000').css("border-left-color", "#d9534f");
		});
	});
	function loadPrivateTypes(flag) {
		var typeobj = $.parseJSON(flag);
		//所有分类数据
		types = typeobj.types;
		var currentTypes = typeobj.typepath;
		if (types.length == 0) {
			//无分类数据
			$('#loadingDivId')
					.html(
							"<div class='alert alert-warning'>无分类信息<br/>请在后台添加分类!</div>");
		} else {
			//有分类数据
			//加载第一层和第二次分类
			loadTypes('#docRoottypeUl', "00000000000000000000000000000000", true, 1);
		}
		$(currentTypes).each(function(i, obj) {
			$('.' + obj.id).click();
			clickOpenTreeFlag(obj.id);
		});
	}
</script>