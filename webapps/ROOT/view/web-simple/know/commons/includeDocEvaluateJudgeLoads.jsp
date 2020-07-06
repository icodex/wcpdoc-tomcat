<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<c:forEach items="${judges }" var="node">
	<!-- Split button -->
	<div class="btn-group">
		<button type="button" class="btn btn-default btn-sm typeJudgeButton" id="${node.judge.id}">
			<i class="glyphicon glyphicon-thumbs-up "></i>
			&nbsp;${node.judge.judgetitle}(${node.num})
		</button>
		<c:if test="${!empty node.users}">
			<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="caret"></span>
				<span class="sr-only">Toggle Dropdown</span>
			</button>
			<div class="dropdown-menu wcp-userjudge-users">
				<c:forEach items="${node.users}" var="judgeUser">
					<img class="img-rounded" title="${judgeUser.name}" src="<DOC:ImgUrl isPhoto="true" isMini="true" fileid="${judgeUser.imgid}"/>" />
				</c:forEach>
			</div>
		</c:if>
	</div>
</c:forEach>
<script type="text/javascript">
	$('.typeJudgeButton').click(function() {
		$.post('webjudge/PubJudgePraise.do', {
			docId : '${docId}',
			judgeId : $(this).attr('id')
		}, function(flag) {
			if (flag.STATE == '0') {
				loadTypeJudge();
			} else {
				alert(flag.MESSAGE);
			}
		}, 'json');
	});
</script>
