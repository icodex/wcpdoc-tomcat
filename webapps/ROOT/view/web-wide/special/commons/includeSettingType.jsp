<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
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
	color: #ccc;
	margin-left: 20px;
}

.farm_tree_flag {
	margin-left: 8px;
}

.linklevel1 {
	font-weight: 700;
	border-left: 8px solid #d9534f;
	padding-left: 4px;
}

.linklevel2 {
	font-weight: 700;
	border-left: 4px solid #cccccc;
	padding-left: 4px;
}
</style>

<div class="panel panel-default">
	<div class="alert alert-warning" style="margin-bottom: 0px;">
		<p class="bg-warning">
			提示：点击分类&nbsp;<i class="glyphicon glyphicon-hand-down"></i>&nbsp;后展示操作选项.<b>分类超出3级后将不被显示</b>
		</p>
	</div>
	<div class="panel-body" style="margin-bottom: 40px;">
		<div id="loadingDivId">加载分类中...</div>
		<ul id="docRoottypeUl" class="doctypeUl"></ul>
	</div>
</div>

<div class="modal fade bs-example-modal-sm" id="SettingTypeMenusId"
	tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="panel panel-default" style="margin-bottom: 0px;">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						操作: <span style="font-weight: 700;font-size: 14px;" id="opTitleId"></span>
					</h4>
				</div>
				<div class="panel-body" style="text-align: center;">
					<div class="btn-group-vertical" role="group"
						style="width: 300px; margin: auto;">
						<button type="button" class="btn btn-default"
							onclick="addSubNode()">
							<i class="glyphicon glyphicon-plus"></i> 添加子分类
						</button>
						<button type="button" class="btn btn-default"
							id="editNodeButtonId" onclick="editNode()">
							<i class="glyphicon glyphicon-pencil"></i> 编辑此分类
						</button>
						<button type="button" class="btn btn-default"
							id="moveNodeButtonId" onclick="moveNode()">
							<i class="glyphicon glyphicon-random"></i> 移动此分类
						</button>
						<button type="button" class="btn btn-danger" id="delNodeButtonId"
							onclick="delNode()">
							<i class="glyphicon glyphicon-trash"></i> 删除此分类
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var type_collapse_level = 6;
	var types;
	var currentTypeId, currentTypeTitle;
	$(function() {
		$.post('webspecialType/loadType.do', {
			typeid : '${typeid}',
			specialId : '${special.id}'
		}, function(flag) {
			var typeobj = $.parseJSON(flag);
			if (typeobj.STATE == '1') {
				alert(typeobj.MESSAGE);
				return;
			}
			loadPrivateTypes(flag);
			$('#00000000000000000000000000000000').css("border-left-color",
					"#d9534f");
		});
	});

	//添加子节点
	function addSubNode() {
		window.location = "<PF:basePath/>webspecialType/typeAdd.do?specialId=${special.id}&typeid="
				+ currentTypeId;
		//alert(currentTypeTitle + "添加子节点");
	}
	//修改节点
	function editNode() {
		window.location = "<PF:basePath/>webspecialType/typeEdit.do?specialId=${special.id}&typeid="
				+ currentTypeId;
		//alert(currentTypeTitle + "修改节点");
	}
	//移动节点
	function moveNode() {
		window.location = "<PF:basePath/>webspecialType/typeMove.do?specialId=${special.id}&typeid="
				+ currentTypeId;
		//alert(currentTypeTitle + "移动节点");
	}
	//删除节点
	function delNode() {
		if (confirm("删除后无法恢复，确定删除吗？")) {
			window.location = "<PF:basePath/>webspecialType/typeDel.do?specialId=${special.id}&typeid="
					+ currentTypeId;
		}
		//alert(currentTypeTitle + "删除节点");
	}
	//初始化菜单
	function initMenu() {
		//如果id是0000000...就隐藏（编辑/移动/删除按钮）
		if (currentTypeId == 'NONE') {
			$('#editNodeButtonId').hide();
			$('#moveNodeButtonId').hide();
			$('#delNodeButtonId').hide();
		} else {
			$('#editNodeButtonId').show();
			$('#moveNodeButtonId').show();
			$('#delNodeButtonId').show();
		}
	}

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
			loadTypes('#docRoottypeUl', "00000000000000000000000000000000",
					true, 1);
		}
		$(currentTypes).each(function(i, obj) {
			$('.' + obj.id).click();
			clickOpenTreeFlag(obj.id);
		});
	}

	//点击分类执行的事件
	function clickType(obj) {
		if ($(obj).attr('id')) {
			currentTypeId = $(obj).attr('id');
			currentTypeTitle = $(obj).text();
			initMenu();
			$('#opTitleId').html(($(obj).html()));
			$('#SettingTypeMenusId').modal('show');
		}
	}
</script>