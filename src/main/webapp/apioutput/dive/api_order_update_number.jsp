<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.controller.BaseController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String url = request.getContextPath()+"/api/apiOrderController/editNumber";
%>
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	$(function() {
	 	parent.$.messager.progress('close');
		$('#update_number_Form').form({
			url : '<%=url%>',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				$("#update_number_result").text(result);
			}
		});
	});
</script>

	<div class="easyui-layout" data-options="fit:true">

		<div data-options="region:'center'">
			<form id="update_number_Form" action="">
				<table align="center" width="90%" class="tablex">
					<tr>
						<td align="right" style="width: 80px;"><label>url：</label></td>
						<td><%=url%></td>
					</tr>
					<tr>
						<td align="right" style="width: 180px;"><label>tokenId(token值)：</label>
						<td><input name="tokenId" type="text" class="span2"  value="<%=BaseController.DEFAULT_TOKEN%>"/></td>
					</tr>
					<tr>
						<td align="right" style="width: 180px;"><label>id(购物车ID)：</label></td>
						<td><input name="id" type="text" class="span2" value="" /></td>
					</tr>
					<tr>
						<td align="right" style="width: 180px;"><label>number(数量)：</label></td>
						<td><input name="number" type="text" class="span2" value="2" /></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="button"
							value="提交" onclick="javascript:$('#update_number_Form').submit();" /></td>
					</tr>
				</table>
			</form>
			<label>结果：</label>
			<div id="update_number_result"></div>
			<div>
				结果说明：1、json格式<br /> 2、success:true 成功<br />

			</div>
		</div>
	</div>
</body>
</html>