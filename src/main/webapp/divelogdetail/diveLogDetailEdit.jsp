<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveLogDetail" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%> 
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/diveLogDetailController/edit',
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
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post">
				<input type="hidden" name="id" value = "${diveLogDetail.id}"/>
			<table class="table table-hover table-condensed">
				<tr>	
					<th><%=TdiveLogDetail.ALIAS_LOG_ID%></th>	
					<td>
											<input class="span2" name="logId" type="text" value="${diveLogDetail.logId}"/>
					</td>							
					<th><%=TdiveLogDetail.ALIAS_SUMARY%></th>	
					<td>
											<input class="span2" name="sumary" type="text" value="${diveLogDetail.sumary}"/>
					</td>							
			</tr>	
				<tr>	
					<th><%=TdiveLogDetail.ALIAS_FILE_SRC%></th>	
					<td>
											<input class="span2" name="fileSrc" type="text" value="${diveLogDetail.fileSrc}"/>
					</td>							
					<th><%=TdiveLogDetail.ALIAS_LG_X%></th>	
					<td>
											<input class="span2" name="lgX" type="text" value="${diveLogDetail.lgX}"/>
					</td>							
			</tr>	
				<tr>	
					<th><%=TdiveLogDetail.ALIAS_LG_Y%></th>	
					<td>
											<input class="span2" name="lgY" type="text" value="${diveLogDetail.lgY}"/>
					</td>							
					<th><%=TdiveLogDetail.ALIAS_ADDTIME%></th>	
					<td>
					<input class="span2" name="addtime" type="text" onclick="WdatePicker({dateFmt:'<%=TdiveLogDetail.FORMAT_ADDTIME%>'})"   maxlength="0" value="${diveLogDetail.addtime}"/>
					</td>							
			</tr>	
			</table>				
		</form>
	</div>
</div>