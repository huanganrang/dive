<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveCertificateAuthority"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');		
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table class="table table-hover table-condensed">
			<tr>
				<th><%=TdiveCertificateAuthority.ALIAS_ORG_CODE%></th>
				<td>${diveCertificateAuthority.orgCode}</td>
				<th><%=TdiveCertificateAuthority.ALIAS_LEVEL_CODE%></th>
				<td>${diveCertificateAuthority.levelCode}</td>
			</tr>
			<tr>
				<th><%=TdiveCertificateAuthority.ALIAS_AUTH_DATE%></th>
				<td>${diveCertificateAuthority.authDate}</td>
				<th><%=TdiveCertificateAuthority.ALIAS_REVERSE_SIDE%></th>
				<td>${diveCertificateAuthority.reverseSide}</td>
			</tr>
			<tr>
				<th><%=TdiveCertificateAuthority.ALIAS_RIGHT_SIDE%></th>
				<td>${diveCertificateAuthority.rightSide}</td>
				<th><%=TdiveCertificateAuthority.ALIAS_AUDIT_DATE%></th>
				<td>${diveCertificateAuthority.auditDate}</td>
			</tr>
			<tr>
				<th><%=TdiveCertificateAuthority.ALIAS_STATUS%></th>
				<td>${diveCertificateAuthority.status}</td>
				<th><%=TdiveCertificateAuthority.ALIAS_ADDTIME%></th>
				<td>${diveCertificateAuthority.addtime}</td>
			</tr>
		</table>
	</div>
</div>