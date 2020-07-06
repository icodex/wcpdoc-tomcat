<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--文档表单-->
<style>
<!--
.doc_content img {
	max-width: 500px;
}

.doc_content {
	padding: 8px;
}

.deleteSupera {
	color: red;
	cursor: pointer;
	margin-left: 4px;
	white-space: nowrap;
}

.docfileTempUnit {
	padding: 4px;
	border-bottom: 1px solid #ccc;
}

.filesbox {
	width: 200px;
}
-->
</style>
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
		<div id="tt" class="easyui-tabs" data-options="fit:true,border:false">
			<div title="导出" style="padding: 5px;">
				1.当前查询到知识<span style="color: red;">${result.totalSize}</span>条,继续点击导出按钮可将数据导出到服务器目录<span
					style="color: red;">${exportPath}</span>下 <br />
				2.${exportPath}目录下可能有历史数据会影响导出结果，如需要请事先清空该目录。
				<hr style="margin: 8px;" />
				<div style="text-align: center;">
					<a id="ClearDirTodobtn" class="easyui-linkbutton"
						data-options="iconCls:''">1.清空导出目录</a>
					<!-- 分隔 -->
					<br /> <br />
					<!-- 分隔 -->
					<a id="exportTodobtn" class="easyui-linkbutton"
						data-options="iconCls:''">2.批量导出到服务器磁盘</a>
					<div id="exportStatId"
						style="margin: 8px; color: green; font-weight: 700;"></div>
				</div>
			</div>
			<div title="导入" style="padding: 5px;">
				1.当前导入目录为<span style="color: red;">${importPath}</span>,请将由本系统批量导出的知识文件夹放入该目录中。
				<br /> 2.导入目录中的分类将被自动创建到知识库中。 <br /> 3.导入目录中的知识将被自动创建到知识库中。
				<hr style="margin: 8px;" />
				<div style="text-align: center;">
					<a id="ImportDocReadbtn" class="easyui-linkbutton"
						data-options="iconCls:''">1.分析导入信息</a>
					<!-- 分隔 -->
					<br /> <br />
					<!-- 分隔 -->
					<a id="ImportDocTodobtn" class="easyui-linkbutton"
						data-options='onClick:ImportDocTodofunc'>2.导入目录中所有知识</a>
					<div id="importStatId"
						style="margin: 8px; color: green; font-weight: 700;"></div>
				</div>
			</div>
		</div>
	</div>
	<div data-options="region:'south',border:false">
		<div class="div_button" style="text-align: center; padding: 4px;">
			<a id="dom_cancle_ExportAndImport" href="javascript:void(0)"
				iconCls="icon-cancel" class="easyui-linkbutton"
				style="color: #000000;">关闭窗口</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var submitAddActionFarmdoc = 'doc/add.do';
	var submitEditActionFarmdoc = 'doc/edit.do';
	var currentPageTypeFarmdoc = '${pageset.operateType }';
	var submitFormFarmdoc;
	var editor;
	$(function() {
		//关闭窗口
		$('#dom_cancle_ExportAndImport').bind('click', function() {
			$('#winExportAndImport').window('close');
		});
		/**-------------------导入---------------------**/
		//启动导入预分析
		$('#ImportDocReadbtn').bind('click', function() {
			$('#importStatId').text("正在执行分析任务...");
			$.post('doc/importRead.do', {}, function(flag) {
				loadImportStat();
			}, 'json');
		});
		/**--------------------导出---------------------**/
		//启动导出任务
		$('#exportTodobtn').bind('click', function() {
			$('#importStatId').text("正在执行导出任务...");
			$.post('doc/exportTodo.do', {
				ruleText : '${ruleText}'
			}, function(flag) {
				loadexportStat();
			}, 'json');
		});
		//清除导出目录
		$('#ClearDirTodobtn').bind('click', function() {
			$('#exportStatId').text("正在清空导出目录...");
			$.post('doc/clearExportDir.do', {}, function(flag) {
				if (flag.STATE == '0') {
					$('#exportStatId').text("清理成功");
					alert('清理成功!');
				} else {
					$('#exportStatId').text('清理失败!' + flag.MESSAGE);
					alert('清理失败!' + flag.MESSAGE);
				}
			}, 'json');
		});
		loadexportStat();
		loadImportStat();
	});
	//启动导入任务
	function ImportDocTodofunc() {
		if (!confirm("知识导入操作无法回退，请确认已经做好数据备份并且确定要进行导入操作?") == true) {
			return;
		}
		$('#importStatId').text("正在执行导入任务...");
		$.post('doc/importTodo.do', {}, function(flag) {
			loadImportStat();
		}, 'json');
	}
	//加载导入状态
	function loadImportStat() {
		$.post('doc/importStat.do', {}, function(flag) {
			if (flag.state.state == 0) {
				$('#importStatId').text(
						"导入操作..." + flag.state.processNum + "/"
								+ flag.state.maxNum);
				setTimeout(loadImportStat(), 500);
			} else {
				if (flag.state.state == 1) {
					$('#importStatId').text("任务完成");
					$('#ImportDocTodobtn').linkbutton('disable');
				}
				if (flag.state.state == 2) {
					$('#importStatId').text(
							"准备就绪:" + flag.state.processNum + "/"
									+ flag.state.maxNum);
					$('#ImportDocTodobtn').linkbutton('enable');
				}
				if (flag.state.state == -1) {
					$('#importStatId').text("等待开始");
					$('#ImportDocTodobtn').linkbutton('disable');
				}
				if (flag.state.state == -2) {
					$('#importStatId').text("系统错误：" + flag.state.message);
					$('#ImportDocTodobtn').linkbutton('disable');
				}
			}
		}, 'json');
	}
	//加载导出状态
	function loadexportStat() {
		$.post('doc/exportStat.do', {}, function(flag) {
			if (flag.state.state == 0) {
				$('#exportStatId').text(
						"导出中..." + flag.state.processNum + "/"
								+ flag.state.maxNum);
				setTimeout(loadexportStat(), 500);
			} else {
				if (flag.state.state == 1) {
					$('#exportStatId').text("任务完成");
				}
				if (flag.state.state == -1) {
					$('#exportStatId').text("等待开始");
				}
				if (flag.state.state == -2) {
					$('#exportStatId').text("系统错误：" + flag.state.message);
				}
			}
		}, 'json');
	}
//-->
</script>