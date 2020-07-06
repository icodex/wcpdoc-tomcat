$(function() {
	$.post('webtype/PubLoadRType.html', {
		typeid : thisTypeid
	}, function(flag) {
		postTypeHandle(flag);
	});
	CheckboxGroupAllCHoose();
	$(".wcp-tag").click(function() {
		clickTagForStyle(this);
		// 设置检索条件为标签
		limitTypeChoose("TAG:", "标签");
		// 检索范围框
		autoChooseTag(true);
	});
	$("#wordInputId").change(function(flag) {
		// 查询框变化
	});
});
// 分类加载完成后的回调方法
function loadedTypesHandle() {
	// 可以在引用页覆盖
}
// 通过标签自动关联
function autoChooseTag(alive) {
	// 检索范围框
	if (alive) {
		$('#limitTypeTitleId').css('color', '#D9534F');
	} else {
		$('#limitTypeTitleId').css('color', '#000000');
	}
}
// 用户点击标签时，同步标签和查询框中关键字
function clickTagForStyle(tagObj) {
	if ($(tagObj).hasClass("label-warning")) {
		$(tagObj).removeClass("label-warning");
		$(tagObj).addClass("label-default");
		// 从关键字中去除标签内容
		var word = $('#wordInputId').val();
		word = word.replace(',' + $(tagObj).text(), "");
		word = word.replace($(tagObj).text(), "");
		$('#wordInputId').val(word);
	} else {
		$(tagObj).removeClass("label-default");
		$(tagObj).addClass("label-warning");
		// 关键字为标签内容
		var texttag = $('#wordInputId').val();
		if (texttag) {
			$('#wordInputId').val(texttag + ',' + $(tagObj).text());
		} else {
			$('#wordInputId').val($(tagObj).text());
		}
	}
}

function postTypeHandle(flag) {
	var typeobj = $.parseJSON(flag);
	// 所有分类数据
	types = typeobj.types;
	var currentTypes = typeobj.typepath;
	if (types.length == 0) {
		// 无分类数据
		$('#loadingDivId').html(
				"<div class='alert alert-warning'>无分类信息<br/>请在后台添加分类!</div>");
	} else {
		// 有分类数据
		// 加载第一层和第二次分类
		loadTypes('#docRoottypeUl', "NONE", true, 1);
	}
	$(currentTypes).each(function(i, obj) {
		$('.doctypeUl .' + obj.id).click();
		clickOpenTreeFlag(obj.id);
	});
	if (isInitChooseAllType) {
		CheckboxTypeAllCHoose();
	}
	LoadTypesTags();
	hideRefrashTagBox();
	// 分类加载完成后的回调方法
	loadedTypesHandle();
}

function loadTypes(jqueryDom, typeid, isLoadsub, currentLeveNum) {
	var opentypes = new Array();
	// 第一层
	var html = new Array();
	$(types)
			.each(
					function(i, obj) {
						if (obj.parentid == typeid) {
							html.push('<li><h5 class="showLableType">');
							// 判断上级是否选中，如果选中子节点也选中
							if ($('#' + typeid).is(':checked')) {
								html
										.push('<input type="checkbox" onclick="clickCheckbox(this)" id="'
												+ obj.id
												+ '" style="margin-right: 8px;" checked>');
							} else {
								html
										.push('<input type="checkbox" onclick="clickCheckbox(this)" id="'
												+ obj.id
												+ '" style="margin-right: 8px;">');
							}
							html.push(obj.name);
							if (obj.num > 0) {
								html.push('<span class="farm_tree_num">',
										obj.num, '</span>');
								// 如果问题数量大于1且配置文件要求显示问答数量
								if (obj.questionnum > 0 && showQuestionNum) {
									html
											.push(
													'&nbsp;/&nbsp;<span class="farm_tree_num">',
													obj.questionnum, '</span>');
								}
							}
							// if(type_collapse_level<=currentLeveNum){
							if (isHaveSubType(obj.id)) {
								html
										.push(
												'&nbsp;<a class="glyphicon glyphicon-chevron-down farm_tree_flag ',
												obj.id,
												'" onclick="clickTreeFlag(this,'
														+ currentLeveNum
														+ ',\'' + obj.id
														+ '\')"></a>');
								if (type_collapse_level > currentLeveNum) {
									opentypes.push(obj.id);
								}
							}
							html.push('</h5><ul id="doc' + obj.id
									+ 'typeUl"></ul></li>');
						}
					});
	$('#loadingDivId').html("");
	$(jqueryDom).html("");
	$(jqueryDom).append(html.join(""));
	// --------------
	$(opentypes).each(function(i, obj) {
		$('.doctypeUl .' + obj).click();
	});
}
// 选择分类节点
function clickCheckbox(obj) {
	if ($(obj).attr("checked")) {
		// 选中,上层li下面所有checkbox全部选中
		$(obj).parent().parent().find('input').attr("checked", true);
		// 点击分类的checkbox后显示刷新标签提示
		showRefrashTagBox();
	} else {
		// 取消，子节点下面所有checkbox全部取消
		$(obj).parent().parent().find('input').attr("checked", false);
		// 取消，所有上层checkbox全部取消
		$.post('webtype/PubLoadAllParentTypes.html', {
			typeids : $(obj).attr('id')
		}, function(flag) {
			$(flag.TAGTYPEIDS).each(function(ti, typeid) {
				$("#" + typeid).attr("checked", false);
			});
			// 点击分类的checkbox后显示刷新标签提示
			showRefrashTagBox();
		}, 'json');
	}
}
// 显示刷新标签按钮
function showRefrashTagBox() {
	if (isAotoLoadTags) {
		$("#tiploadShowBoxId").show();
		LoadTypesTags();
	} else {
		// 点击分类的checkbox后显示刷新标签提示
		$("#refrashShowBoxId").show();
		$("#tageShowBoxId").scrollTop(0);// 滚动到锚点位置
	}
}
// 隐藏刷新标签按钮
function hideRefrashTagBox() {
	// 点击分类的checkbox后显示刷新标签提示
	$("#refrashShowBoxId button").text("分类已更新,请点击刷新标签");
	$("#refrashShowBoxId").hide();
	$("#tiploadShowBoxId").hide();
}
// 选中所有分类
function CheckboxTypeAllCHoose() {
	$('#typeidsbox').find('input').attr("checked", true);
	showRefrashTagBox();
}
// 取消所有分类
function CheckboxTypeAllCancel() {
	$('#typeidsbox').find('input').attr("checked", false);
	showRefrashTagBox();
}
// 选中所有小组
function CheckboxGroupAllCHoose() {
	$('#groupidsbox').find('input').attr("checked", true);
}
// 取消所有小组
function CheckboxGroupAllCancel() {
	$('#groupidsbox').find('input').attr("checked", false);
}
// 折叠所有分类
function CheckboxTypeAllCollapse() {
	$('#typeidsbox .farm_tree_flag').each(function(i, obj) {
		collapseTreeNode(obj);
	});
}
// 选择一个检索范围（图片、知识等）
function resultTypeChoose(type, title) {
	// alert(type+":"+title);
	$("#resultTypeTitleId").text(title);
	$('#resultTypeInputId').val(type);

}
// 选择一个检索条件（标签、标题等）
function limitTypeChoose(type, title) {
	// alert(type+":"+title);
	autoChooseTag(false);
	$("#limitTypeTitleId").text(title);
	$("#limitTypeTag").text(title);
	$('#limitTypeInputId').val(type);
}

// 加载分类的标签(页面初始化时已经全部加载，这里只做显示和隐藏的判断)
function LoadTypesTags() {
	$("#refrashShowBoxId button").text("加载中...");
	var types;
	var num = 0;
	$("#typeidsbox :checked").each(function(i, obj) {
		num++;
		if (types) {
			types = types + "," + $(obj).attr('id');
		} else {
			types = $(obj).attr('id');
		}
	});
	// alert(num);
	$.post('webtype/PubLoadAllTypes.html', {
		typeids : types
	}, function(flag) {
		// alert(flag.TAGTYPEIDSIZE);
		// 迭代标签
		$('.tagLimitUnitBox').each(function(i, obj) {
			LoadTypesTags_tagtype(i, obj, flag);
		});
		hideRefrashTagBox();
	}, 'json');
}
/**
 * 迭代处理标签类别,配合（LoadTypesTags()） i 迭代序号, obj 迭代对象,flag 远程请求回来的分类的全部上级分类
 */
function LoadTypesTags_tagtype(i, obj, flag) {
	// 判断标签中是否包含用户的分类，
	// console.log($(obj).attr("class"));
	var tagIds = $(obj).attr("class");
	var isShow = false;
	// 迭代所有分类，判断用户是否有这个标签的分类
	$(flag.TAGTYPEIDS).each(function(i, typeid) {
		// console.log("用户的分类："+typeid+",标签中是否有这个分类"+tagIds.indexOf(typeid));
		if (tagIds.indexOf(typeid) >= 0) {
			isShow = true;
		}
	});
	if (isShow) {
		// 如果包含就显示
		$(obj).show();
		// 处理类别下的标签
		$(obj).children('.wcp-tag').each(function(tagi, tagobj) {
			LoadTypesTags_tag(tagi, tagobj, flag);
		});
	} else {
		// 如果不包含就隐藏
		$(obj).hide();
	}
}
/**
 * 迭代处理标签tag,配合（LoadTypesTags()） tagi 迭代序号, tagobj 迭代对象,flag 远程请求回来的分类的全部上级分类
 */
function LoadTypesTags_tag(tagi, tagobj, flag) {
	var tIds = $(tagobj).attr("class");
	var isTagShow = false;
	// 迭代所有分类，判断用户是否有这个标签的分类
	$(flag.TAGTYPEIDS).each(function(ti, ttypeid) {
		// console.log("用户的分类："+typeid+",标签中是否有这个分类"+tagIds.indexOf(typeid));
		if (tIds.indexOf(ttypeid) >= 0) {
			isTagShow = true;
			return false;
		}
	});
	if (isTagShow) {
		$(tagobj).show();
	} else {
		$(tagobj).hide();
	}
}
var state_submit_able = true;
$(function() {
	$('#websearchsPubDoId,#websearchsPubDoFootId').bind('click', function() {
		var types, gourps;
		// 拼接知识小组
		$("#groupidsbox :checked").each(function(i, obj) {
			if (gourps) {
				gourps = gourps + "," + $(obj).attr('id');
			} else {
				gourps = $(obj).attr('id');
			}
		});
		// 拼接知识分类
		$("#typeidsbox :checked").each(function(i, obj) {
			if (types) {
				types = types + "," + $(obj).attr('id');
			} else {
				types = $(obj).attr('id');
			}
		});
		// alert(limitTypeInputVal+resultTypeInputVal);
		// $('#resultTypeInputId').val(resultTypeInputVal);
		// $('#limitTypeInputId').val(limitTypeInputVal);
		$('#indexTypesId').val(types);
		$('#indexGroupsId').val(gourps);
		if (state_submit_able) {
			state_submit_able = false;
			if ($('#submitbuttonTextid')) {
				$('#submitbuttonTextid').text('提交中...');
			}
			$('#websearchsPubDoFormId').submit();
		}
	});
});
