<%@page import="java.util.Map"%>
<%@page import="com.farm.wda.inter.WdaAppInter"%>
<%@page import="com.farm.wda.util.AppConfig"%>
<%@page import="java.io.File"%>
<%@page import="com.farm.wda.Beanfactory"%>
<%@ page language="java" pageEncoding="utf-8"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=AppConfig.getString("config.web.title")%></title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<%
	WdaAppInter wad = Beanfactory.getWdaAppImpl();
%>
<style>
<!--
td {
	max-width: 200px;
	font-size: 12px;
	word-wrap: break-word;
}

.mini {
	max-width: 200px;
	font-size: 8px;
	word-wrap: break-word;
}
-->
</style>
<%
	//登录成功就跳转到管理页面
	Object loginkey = session.getAttribute("admin");
	if (loginkey == null || !(Boolean) loginkey) {
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		String newLocn = "login.jsp";
		response.setHeader("Location", newLocn);
	}
%>
<body style="background-color: #8a8a8a;">
	<jsp:include page="/commons/head.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body text-center">
						<img alt="type" style="margin: auto;" class="img-responsive"
							src="img/type.png">
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body text-center">
						<a href="generateForm.jsp">提交测试数据</a>&nbsp;&nbsp;
						<a href="viewForm.jsp">查看测试数据</a>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">配置信息</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								loginkey=<%=session.getAttribute("admin")%> <span style="color: green;">(管理员登陆状态)</span> <br /> 
								config.openoffice.port=<%=AppConfig.getString("config.openoffice.port")%><span style="color: green;">(openoffice接口端口号)</span><br />
								config.rmi.port=<%=AppConfig.getString("config.rmi.port")%><span style="color: green;">(对外RMI端口号)</span><br />
								config.file.dir.path=<%=AppConfig.getString("config.file.dir.path")%><span style="color: green;">(临时文件暂存地址)</span><br />
								config.web.title=<%=AppConfig.getString("config.web.title")%><span style="color: green;">(标题)</span><br />
								<hr/>
								config.server.os.cmd.encode=<%=AppConfig.getString("config.server.os.cmd.encode")%><span style="color: green;">(cmd命令行字符编码)</span><br />
								config.server.openoffice.start.cmd=<%=AppConfig.getString("config.server.openoffice.start.cmd")%><span style="color: green;">(openoffice启动命令)</span><br />
								config.server.openoffice.kill.cmd=<%=AppConfig.getString("config.server.openoffice.kill.cmd")%><span style="color: green;">(openoffice关闭命令)</span><br />
								<hr/>
								config.wcp.rmi.able=<%=AppConfig.getString("config.wcp.rmi.able")%><span style="color: green;">(是否WCP接口[全文索引回调,预览文件转换日志写入])</span><br />
								config.wcp.rmi.url=<%=AppConfig.getString("config.wcp.rmi.url")%><span style="color: green;">(WCP的RMI服务地址)</span><br />
								<hr/>
								config.server.swftools.dir=<%=AppConfig.getString("config.server.swftools.dir")%><span style="color: green;">(pdf转swf工具安装目录)</span><br />
								config.server.swftools.langdir=<%=AppConfig.getString("config.server.swftools.langdir")%><span style="color: green;">(pdf转swf工具语言包目录，默认为NONE)</span><br />
								<hr/>
								转换配置文件:<a href="xmlConfig.jsp">查看文件</a>
							</div>
						</div>
						<hr/>
						<div class="row">
							<div class="col-md-12">
							绝对路径：
							<%
    String path=application.getRealPath(request.getRequestURI());
    String dir=new java.io.File(path).getParentFile().getParent();
    out.println(dir+"\\text");
%> 
							</div>
						</div>
					</div>
					<div class="panel-heading">当前服务状态</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								openoffice服务状态(是否启动)：
								<%
									if (!Beanfactory.isStartByOpenofficeServer()) {
								%>
								未启动<a class="btn btn-primary btn-xs" href="startOpenOffice.jsp"
									role="button">启动</a>
								<%
									} else {
								%>
								已启动<a class="btn btn-primary btn-xs" href="startOpenOffice.jsp"
									role="button">重启</a>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<div class="panel-heading">任务队列信息</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<table class="table table-bordered">
									<tr>
										<th>信息</th>
										<th>类型转换</th>
										<th>key</th>
										<th>目标路径</th>
										<th>状态</th>
										<th>入队时间</th>
										<th>转换开始时间</th>
									</tr>
									<%
										for (Map node : wad.getTasksinfo()) {
									%>
									<tr>
										<td><%=node.get("INFO")%></td>
										<td><%=node.get("TYPENAME")%> <b>to</b> <%=node.get("TARGETTYPE")%></td>
										<td class="mini"><%=node.get("AUTHID")%></td>
										<td class="mini"><%=node.get("PATH")%></td>
										<td><%=node.get("STATE")%></td>
										<td><%=node.get("CTIME")%></td>
										<td><%=node.get("STIME")%></td>
									</tr>
									<%
										}
									%><tr>
										<th colspan="8">任务 数量：<%=wad.getTasksinfo().size()%></th>
									</tr>
									<tr>
										<th colspan="8" align="center" style="text-align: center;"><a href="cancel.jsp"
											class="btn btn-danger">注销</a></th>
									</tr> 
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div  style="background-color: #ffffff;"> 
		<div class="panel-body text-center">
			<div>
				<b>WDA文件预览系统</b> - 当前版本：V<%=AppConfig.getString("config.sys.version")%></div>
		</div>
	</div>
</body>

</html>