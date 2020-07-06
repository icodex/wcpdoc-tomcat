<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.farm.web.constant.FarmConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/view/conf/farmtag.tld" prefix="PF"%>
<%@ taglib uri="/view/conf/farmdoc.tld" prefix="DOC"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<base href="<PF:basePath/>" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            html,body{
                height:100%;
                width:100%;
                padding:0;
                margin:0;
            }
            #preview{
                width:100%;
                height:100%;
                padding:0;
                margin:0;
            }
            #preview *{font-family:sans-serif;font-size:16px;}
        </style>
        <script type="text/javascript" src="text/lib/ueditor/dialogs/internal.js"></script>
        <script src="text/lib/ueditor/ueditor.parse.js"></script>
        <title></title>
    </head>
    <body class="view">
        <div id="preview" style="margin:8px">

        </div>
    </body>
    <script>
        document.getElementById('preview').innerHTML = editor.getContent();
        uParse('#preview',{
            rootPath : '../../',
            chartContainerHeight:500
        })
        dialog.oncancel = function(){
            document.getElementById('preview').innerHTML = '';
        }
    </script>
</html>