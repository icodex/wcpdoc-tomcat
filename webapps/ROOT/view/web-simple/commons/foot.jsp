<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<div class="foot">
	<PF:ParameterValue key="config.sys.foot" />
	-
	<PF:ParameterValue key="config.sys.version" />
	-
	<a style="color: #ffffff;text-decoration: underline;" href="http://www.wcpdoc.com" target="blank_">免费版</a>
</div> 
<script type="text/javascript">
	$(function() {
		$(window).resize(function() {
			$('.containerbox').css('min-height', $(window).height() - 170);
		});
		$('.containerbox').css('min-height', $(window).height() - 170);
	});
</script>