$(function() {
	$('.wdahtmlbox img').attr('height', '');
	document.oncontextmenu = function() {
		return false;
	}
	document.onkeydown = function(e) {
		var ev = e || window.event;// 获取event对象
		if (ev.ctrlKey && ev.keyCode == 67) {
			return false;
		}
	}
	document.body.oncopy = function() {
		return false;
	}
	// 不建议连选中文本都不行
	document.onselectstart = function() {
		 return false;
	}
});
