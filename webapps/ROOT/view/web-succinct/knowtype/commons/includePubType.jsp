<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="wcp-su-out-box">
	<div class="unit">
		<div id="loadingDivId">加载分类中...</div>
		<ul id="docRoottypeUl" class="doctypeUl" style="padding-left: 30px;"></ul>
	</div>
</div>
<script type="text/javascript">
	var type_collapse_level = 3;
</script>
<PF:IfParameterEquals key="config.sys.type.collapse.level" val="1">
	<script type="text/javascript">
		var type_collapse_level = 1;
	</script>
</PF:IfParameterEquals>
<PF:IfParameterEquals key="config.sys.type.collapse.level" val="2">
	<script type="text/javascript">
		var type_collapse_level = 2;
	</script>
</PF:IfParameterEquals>
<PF:IfParameterEquals key="config.sys.type.collapse.level" val="3">
	<script type="text/javascript">
		var type_collapse_level = 3;
	</script>
</PF:IfParameterEquals>
<script type="text/javascript">
	var types;
	$(function() {
		$
				.post(
						'webtype/PubLoadRType.html?typeDomainId=${typedomain.id}',
						{
							typeid : '${typeid}'
						},
						function(flag) {
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
								loadTypes('#docRoottypeUl', "NONE", true, 1);
							}
							$(currentTypes).each(function(i, obj) {
								$('.' + obj.id).click();
								clickOpenTreeFlag(obj.id);
							});
						});
	});
	//点击分类执行的事件
	function clickType(obj) {
		if ($(obj).attr('id')) {
			if ($(obj).hasClass("linklevel1")) {
				window.location = basePath + "webtype/view" + $(obj).attr('id')
						+ "/Pub1.html?typeDomainId=" + $(obj).attr('id');
			} else {
				window.location = basePath + "webtype/view" + $(obj).attr('id')
						+ "/Pub1.html?typeDomainId=${typedomain.id}";
			}
		}
	}
</script>