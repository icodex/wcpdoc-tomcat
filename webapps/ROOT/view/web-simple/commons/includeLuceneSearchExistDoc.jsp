<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="form-group taglistBox" id="existKnowtip"
	style="display: none; border: 1px dashed #d9534f; background-color: #f8e7e8; color: #d9534f;">
<!-- 
<script type="text/javascript">
需要传入下面参数，一个是输入框id，另一个是查询的文档类型,一个是类型名称
var loadExisSearchConfig={inputId:"fqatitleId",domType:"fqa",typeTitle:"问题"};
</script>
 -->
<script type="text/javascript">
	var lastVarTitle;
	$(function(){
		$('#'+loadExisSearchConfig.inputId).bind('input propertychange', function() {
			//1.判断输入框是否改变
			if(lastVarTitle==$('#'+loadExisSearchConfig.inputId).val()){
				return;
			}
			loadExistKnow();
		}); 
	});
	loadExistKnow();
	function loadExistKnow(){
		lastVarTitle=$('#'+loadExisSearchConfig.inputId).val();
		//2.如果改变提交查询，检索类似的标题
		$.post('websearch/search.do',{word:lastVarTitle,type:loadExisSearchConfig.domType},function(flag){
			var htmlstar='<span style="font-weight: bold;">已经存在的'+loadExisSearchConfig.typeTitle+'：</span>';
			var htmlcontent='';
			$(flag.result).each(function(i,obj){
				//4.填充已经存在的知识到显示界面
				htmlcontent=htmlcontent+'<span class="label label-warning">'+obj.TITLE+'</span> ';
			});
			//3.判断返回值是否存在
			if(htmlcontent.length>2){
				$('#existKnowtip').show();
				$('#existKnowtipBox').html(htmlstar+htmlcontent);
			}else{
				$('#existKnowtip').hide(); 
			}
		},"json");
	}
	</script>
	<div id="existKnowtipBox">
	</div>
</div>