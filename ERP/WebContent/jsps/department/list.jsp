<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<%=request.getContextPath() %>/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			$("form:first").submit();
		});
	});
	function showMsg(msg,uuid){
		//top.document.getElementById("context-msg").style.display = "block";
		top.$('context-msg').style.display = "block";
		top.$('context-msg-text').innerHTML=msg;
		top.$('hid-action').value="<%=request.getContextPath()%>/DeleteDeptByUuid?uuid="+uuid;
		top.lock.show();
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">部门管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="<%=request.getContextPath() %>/FindDeptList" method="post">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="68" height="30">&nbsp;&nbsp;&nbsp;</td>
						<td width="123">&nbsp;</td>
						<td width="62">部门名称:</td>
						<td width="142"><input type="text" size="18" name = "name"/></td>
						<td width="60">电话:</td>
						<td width="149"><input type="text" size="18" name = "tele" /></td>
						<td width="70"><a id="query"> <img
								src="<%=request.getContextPath() %>/images/can_b_01.gif" border="0" /> </a></td>
						<td width="70"><a href="jsps/department/input.jsp"><img
								src="<%=request.getContextPath() %>/images/can_b_02.gif" border="0" /> </a></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(<%=request.getContextPath() %>/images/table_bg.gif) repeat-x;">
						<td width="13%" height="30">编号</td>
						<td width="13%">部门名称</td>
						<td width="16%">电话</td>
						<td width="16%">操作</td>
					</tr>
					<c:forEach items="${list }" var="d">
						<tr align="center" bgcolor="#FFFFFF">
							<td width="13%" height="30">${d.uuid }</td>
							<td>${d.name }</td>
							<td>${d.tele }</td>
							<td>
								<img src="<%=request.getContextPath() %>/images/icon_3.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="<%=request.getContextPath()%>/ToUpdateJspServlet?uuid=${d.uuid}" class="xiu">修改</a>
								</span> 
								<img src="<%=request.getContextPath() %>/images/icon_04.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="javascript:void(0)" class="xiu" onclick="showMsg('是否删除该项数据？当前部门删除后，所有部门内的员工将被删除，同时相关数据也将删除！',${d.uuid})">删除</a>
								</span>
							</td>
						</tr>
					</c:forEach>
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="51%">&nbsp;</td>
						<td width="13%">共24条记录
						<td width="6%">
							<a id="fir" class="sye">首&nbsp;&nbsp;页</a>
						</td>
						<td width="6%">
							<a id="pre" class="sye">上一页</a>
						</td>
						<td width="6%">
							<a id="next" class="sye">下一页</a>
						</td>
						<td width="6%">
							<a id="last" class="sye">末&nbsp;&nbsp;页</a>
						</td>
						<td width="12%">当前第<span style="color:red;">1</span>/3页</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
