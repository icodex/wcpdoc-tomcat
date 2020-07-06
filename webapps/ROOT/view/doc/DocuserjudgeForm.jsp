<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<!--用户自定义评价值表单-->
<div class="easyui-layout" data-options="fit:true">
  <div class="TableTitle" data-options="region:'north',border:false">
    <span class="label label-primary"> 
    <c:if test="${pageset.operateType==1}">新增${JSP_Messager_Title}记录</c:if>
    <c:if test="${pageset.operateType==2}">修改${JSP_Messager_Title}记录</c:if>
    <c:if test="${pageset.operateType==0}">浏览${JSP_Messager_Title}记录</c:if>
    </span>
  </div>
  <div data-options="region:'center'">
    <form id="dom_formDocuserjudge">
      <input type="hidden" id="entity_id" name="id" value="${entity.id}">
      <table class="editTable">
      <tr>
        <td class="title">
        JUDGETIME:
        </td>
        <td colspan="3">
          <input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[8]']"
          id="entity_judgetime" name="judgetime" value="${entity.judgetime}">
        </td>
      </tr>
      <tr>
        <td class="title">
        DOCID:
        </td>
        <td colspan="3">
          <input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[16]']"
          id="entity_docid" name="docid" value="${entity.docid}">
        </td>
      </tr>
      <tr>
        <td class="title">
        USERID:
        </td>
        <td colspan="3">
          <input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[16]']"
          id="entity_userid" name="userid" value="${entity.userid}">
        </td>
      </tr>
      <tr>
        <td class="title">
        JUDGEID:
        </td>
        <td colspan="3">
          <input type="text" style="width: 360px;" class="easyui-validatebox" data-options="required:true,validType:[,'maxLength[16]']"
          id="entity_judgeid" name="judgeid" value="${entity.judgeid}">
        </td>
      </tr>
    </table>
    </form>
  </div>
  <div data-options="region:'south',border:false">
    <div class="div_button" style="text-align: center; padding: 4px;">
      <c:if test="${pageset.operateType==1}">
      <a id="dom_add_entityDocuserjudge" href="javascript:void(0)"  iconCls="icon-save" class="easyui-linkbutton">增加</a>
      </c:if>
      <c:if test="${pageset.operateType==2}">
      <a id="dom_edit_entityDocuserjudge" href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton">修改</a>
      </c:if>
      <a id="dom_cancle_formDocuserjudge" href="javascript:void(0)" iconCls="icon-cancel" class="easyui-linkbutton"   style="color: #000000;">取消</a>
    </div>
  </div>
</div>
<script type="text/javascript">
  var submitAddActionDocuserjudge = 'docuserjudge/add.do';
  var submitEditActionDocuserjudge = 'docuserjudge/edit.do';
  var currentPageTypeDocuserjudge = '${pageset.operateType}';
  var submitFormDocuserjudge;
  $(function() {
    //表单组件对象
    submitFormDocuserjudge = $('#dom_formDocuserjudge').SubmitForm( {
      pageType : currentPageTypeDocuserjudge,
      grid : gridDocuserjudge,
      currentWindowId : 'winDocuserjudge'
    });
    //关闭窗口
    $('#dom_cancle_formDocuserjudge').bind('click', function() {
      $('#winDocuserjudge').window('close');
    });
    //提交新增数据
    $('#dom_add_entityDocuserjudge').bind('click', function() {
      submitFormDocuserjudge.postSubmit(submitAddActionDocuserjudge);
    });
    //提交修改数据
    $('#dom_edit_entityDocuserjudge').bind('click', function() {
      submitFormDocuserjudge.postSubmit(submitEditActionDocuserjudge);
    });
  });
  //-->
</script>