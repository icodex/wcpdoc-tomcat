<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<style>
<!--
#usersResultBoxId td {
	cursor: pointer;
}
-->
</style>
<!-- Modal -->
<div class="modal fade" id="ChooseUserWin" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">选择用户</h4>
			</div>
			<div class="modal-body" style="padding-bottom: 4px;">
				<div class="input-group">
					<input type="text" class="form-control" id="searchWordId"
						placeholder="输入用户名称或组织机构名称"> <span class="input-group-btn">
						<button id="searchUserButtonId" class="btn btn-default"
							type="button">
							<i class="glyphicon glyphicon-search"></i>查询
						</button>
					</span>
				</div>
				<hr />
				<!-- /input-group -->
				<table class="table table-striped" style="margin-bottom: 0px;">
					<thead>
						<tr>
							<th>#</th>
							<th>姓名</th>
							<th>组织机构</th>
						</tr>
					</thead>
					<tbody id="usersResultBoxId">
						<!-- 用户结果集合的展示位置 -->
					</tbody>
				</table>
				<nav aria-label="Page navigation" style="text-align: center;">
					<ul id="resultPageCtrlId" class="pagination"
						style="margin: auto; margin-top: 4px; margin-bottom: 4px;">
					</ul>
				</nav>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button id="chooseedUserButtonId" type="button"
					class="btn btn-primary">确认选中</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//说明：多选用户后的回调方法为chooseUseridsBackHandle(userids)
	$(function() {
		//加载查询用户
		loadUsers("1");
		//点击条件查询按钮
		$('#searchUserButtonId').bind('click', function() {
			loadUsers('1');
		});
		//点击确认选中按钮
		$('#chooseedUserButtonId').bind('click', function() {
			chooseedUsers();
		});
	});
	//确认并执行所有用户选中方法
	function chooseedUsers() {
		var userids;
		$("#usersResultBoxId input:checkbox:checked").each(function(i, obj) {
			if (userids) {
				userids = userids + "," + $(obj).attr('id');
			} else {
				userids = $(obj).attr('id');
			}
		});
		if (userids) {
			try {
				chooseUseridsBackHandle(userids);
			} catch (e) {
				alert("请实现方法：chooseUseridsBackHandle(userids)");
			}
		} else {
			alert('请先点击用户复选框，选中用户后进行确认!');
		}
	}
	//加载用户
	function loadUsers(pageNum) {
		$.post('webuser/loadTypeReadUsers.do', {
			word : $('#searchWordId').val(),
			page : pageNum,
			typeId : '${doce.type.id}'
		}, function(flag) {
			loadPage(flag.start, flag.end, pageNum);
			loadData(flag.list);
		}, 'json');
	}
	//加载数据到表格中
	function loadData(datas) {
		$('#usersResultBoxId').html('');
		$(datas)
				.each(
						function(i, obj) {
							var tr = '<tr id="'+obj.USERID+'tr">'
									+ '<th  scope="row"><input id="'+obj.USERID+'" type="checkbox" /></th>'
									+ '<td onclick="clickUserTr(\''
									+ obj.USERID + '\');">' + obj.USERNAME
									+ '</td>' + '<td onclick="clickUserTr(\''
									+ obj.USERID + '\');">' + obj.ORGNAME
									+ '</td>' + '</tr>';
							$('#usersResultBoxId').append(tr);
						});
	}
	//用户翻页
	function loadPage(start, end, cpage) {
		$('#resultPageCtrlId').html('');
		for (n = start; n <= end; n++) {
			if (n == cpage) {
				$('#resultPageCtrlId')
						.append(
								'<li class="active" ><a href="javascript:loadUsers('
										+ n + ')" title="' + n + '">' + n
										+ '</a></li>');
			} else {
				$('#resultPageCtrlId').append(
						'<li ><a href="javascript:loadUsers(' + n
								+ ')" title="' + n + '">' + n + '</a></li>');
			}
		}
	}
	//点击表格选择用户
	function clickUserTr(userid) {
		if ($('#' + userid).prop("checked")) {
			$('#' + userid).attr("checked", false);
		} else {
			$('#' + userid).attr("checked", true);
		}
	}
</script>
