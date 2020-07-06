<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<script type="text/javascript" src="text/javascript/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	var basePath = '<PF:basePath/>';
	var baseUrl = basePath;
	$.config = {
		autoInit : false,
		router : true
	}
</script>
<script charset="utf-8" src="<PF:basePath/>text/lib/echarts/echarts.all.2.2.7.js"></script>
<script charset="utf-8" src="<PF:basePath/>text/lib/kindeditor/wcpplug/wcp-relation-viewer.js"></script>
<script type="text/javascript">
	//覆盖wcp-relation-viewer.js文件中知识图谱中的知识点url打开方法，
	function openPointKnow(urlid) {
	}
</script>
<script type='text/javascript' src='view/web-mobile/text/light7/light7.min.js' charset='utf-8'></script>