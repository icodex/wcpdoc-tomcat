<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="btn-group hidden-xs hidden-sm hidden-md wcp-knowtype-right-operator" >
	<c:if test="${typedomain==null&&typeid!=null&&typeid!='NONE'}">
		<a href="webtype/view${typeid}/Pub.html?typeDomainId=${typeid}"
			title="进入分类域:只看该分类" type="button" class="btn btn-default btn-sm">
			<i style="color: #666;" class="glyphicon glyphicon-log-in"></i>&nbsp;
		</a>
	</c:if>
	<c:if test="${typedomain!=null&&typeid!=null&&typeid!='NONE'}">
		<a href="webtype/view${typeid}/Pub.html" title="退出分类域:看所有分类"
			type="button" class="btn btn-default btn-sm"> <i
			style="color: #666;" class="glyphicon glyphicon-log-out"></i>&nbsp;
		</a>
	</c:if>
	<PF:IfParameterEquals key="config.able.booktype" val="true">
		<c:if test="${typeid!=null&&typeid!='NONE'&&isEnjoy!=null}">
			<a id="enjoyTypeButtonId" style="display: none;" title="关注分类"
				type="button" class="btn btn-default btn-sm"> <i
				style="color: #666;" class="glyphicon glyphicon-star-empty"></i>&nbsp;关注
			</a>
			<a id="unenjoyTypeButtonId" style="display: none;" title="取消关注"
				type="button" class="btn btn-default btn-sm"> <i
				style="color: #666;" class="glyphicon glyphicon-star"></i>&nbsp;取消关注
			</a>
		</c:if>
	</PF:IfParameterEquals>
	<div class="btn-group btn-group-sm" role="group">
		<button title="排序类型" type="button"
			class="btn btn-default dropdown-toggle" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false">
			排序:
			<c:if test="${sortkey=='UPD'}">&nbsp;更新时间&nbsp;</c:if>
			<c:if test="${sortkey=='VIS'}">&nbsp;阅读量&nbsp;</c:if>
			<c:if test="${sortkey=='EVA'}">&nbsp;评价&nbsp;</c:if>
			<span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			<c:if test="${sortkey!='UPD'}">
				<li><a
					href="webtype/view${typeid}/Pub.html?sortkey=UPD&typeDomainId=${typedomain.id}"
					style="font-size: 12px;"> <i style="color: #666;"
						class="glyphicon glyphicon-dashboard"></i> &nbsp;更新时间
				</a></li>
			</c:if>
			<c:if test="${sortkey!='VIS'}">
				<li><a
					href="webtype/view${typeid}/Pub.html?sortkey=VIS&typeDomainId=${typedomain.id}"
					style="font-size: 12px;"> <i style="color: #666;"
						class="glyphicon glyphicon-hand-up"></i> &nbsp;阅读量
				</a></li>
			</c:if>
			<c:if test="${sortkey!='EVA'}">
				<li><a
					href="webtype/view${typeid}/Pub.html?sortkey=EVA&typeDomainId=${typedomain.id}"
					style="font-size: 12px;"> <i style="color: #666;"
						class="glyphicon glyphicon-star"></i> &nbsp;评价
				</a></li>
			</c:if>
		</ul>
	</div>
	<!-- 排序方式(正序|逆序) -->
	<c:if test="${'ASC'!=sorttype}">
		<a
			href="webtype/view${typeid}/Pub.html?sorttype=ASC&typeDomainId=${typedomain.id}"
			title="降序" type="button" class="btn btn-default btn-sm"> <i
			style="color: #666;"
			class="glyphicon glyphicon-sort-by-attributes-alt"></i>
		</a>
	</c:if>
	<c:if test="${'ASC'==sorttype}">
		<a
			href="webtype/view${typeid}/Pub.html?sorttype=DESC&typeDomainId=${typedomain.id}"
			title="升序" type="button" class="btn btn-default btn-sm"> <i
			style="color: #666;" class="glyphicon glyphicon-sort-by-attributes"></i>
		</a>
	</c:if>

	<!-- 展示方式（列表|網格|mim表格） -->
	<c:if test="${param.showType=='grid'}">
		<a class="btn btn-default btn-sm active" title="网格模式"
			style="cursor: default;"> <img alt="" src="text/img/grid32.png"
			style="height: 16px; width: 16px;">
		</a>
	</c:if>
	<c:if test="${param.showType!='grid'}">
		<a
			href="webtype/view${typeid}/Pub.html?showType=grid&typeDomainId=${typedomain.id}"
			class="btn btn-default btn-sm " title="网格模式"> <img alt=""
			src="text/img/grid32.png" style="height: 16px; width: 16px;">
		</a>
	</c:if>
	<c:if test="${param.showType=='list'}">
		<a class="btn btn-default btn-sm active" title="列表模式"
			style="cursor: default;"> <img alt="" src="text/img/list32.png"
			style="height: 16px; width: 16px;">
		</a>
	</c:if>
	<c:if test="${param.showType!='list'}">
		<a
			href="webtype/view${typeid}/Pub.html?showType=list&typeDomainId=${typedomain.id}"
			class="btn btn-default btn-sm " title="列表模式"> <img alt=""
			src="text/img/list32.png" style="height: 16px; width: 16px;">
		</a>
	</c:if>
	<c:if test="${param.showType=='minlist'}">
		<a class="btn btn-default btn-sm active" title="mini模式"
			style="cursor: default;"> <img alt=""
			src="text/img/minlist32.png" style="height: 16px; width: 16px;">
		</a>
	</c:if>
	<c:if test="${param.showType!='minlist'}">
		<a
			href="webtype/view${typeid}/Pub.html?showType=minlist&typeDomainId=${typedomain.id}"
			class="btn btn-default btn-sm " title="mini模式"> <img alt=""
			src="text/img/minlist32.png" style="height: 16px; width: 16px;">
		</a>
	</c:if>
	<c:if test="${typeid!=null&&typeid!='NONE'&&isEnjoy!=null}">
		<script type="text/javascript">
			$(function() {
				initEnjoyButton('${isEnjoy}'.toLowerCase() == 'true');
				$('#enjoyTypeButtonId').on("click", function() {
					enjoyTypeFun();
				});
				$('#unenjoyTypeButtonId').on("click", function() {
					unEnjoyTypeFun();
				});
			});
			function enjoyTypeFun() {
				$.post('webtype/enjoy.do', {
					typeid : '${typeid}'
				}, function(flag) {
					if (flag.commitType == '0') {
						initEnjoyButton(flag.isenjoy);
					} else {
						alert(flag.MESSAGE);
					}
				}, 'json');

			}
			function unEnjoyTypeFun() {
				$.post('webtype/unEnjoy.do', {
					typeid : '${typeid}'
				}, function(flag) {
					if (flag.commitType == '0') {
						initEnjoyButton(flag.isenjoy);
					} else {
						alert(flag.MESSAGE);
					}
				}, 'json');
			}
			//初始化关注按钮状态
			function initEnjoyButton(isEnjoy) {
				if (isEnjoy) {
					$('#enjoyTypeButtonId').hide();
					$('#unenjoyTypeButtonId').show();
				} else {
					$('#enjoyTypeButtonId').show();
					$('#unenjoyTypeButtonId').hide();
				}
			}
		</script>
	</c:if>
</div>