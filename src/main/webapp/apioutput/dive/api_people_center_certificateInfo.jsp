<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$(function() {
	 	parent.$.messager.progress('close');
		$('#certificateInfo_Form').form({
			url : '${pageContext.request.contextPath}/api/apiAccountController/certificateInfo',
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
				$("#certificateInfo_result").text(result);
			}
		});
	});
</script>

	<div class="easyui-layout" data-options="fit:true">
		
		<div data-options="region:'center'">
			<form id="certificateInfo_Form" action="">
				<table align="center" width="90%" class="tablex">
					<tr>
						<td align="right" style="width: 80px;"><label>url：</label></td>
						<td>${pageContext.request.contextPath}/api/apiAccountController/certificateInfo</td>
					</tr>
					
					<tr>
						<td align="right" style="width: 180px;"><label>tokenId(token值)：</label></td>
						<td><input name="tokenId" type="text" class="span2" value=""/></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="button"
							value="提交" onclick="javascript:$('#certificateInfo_Form').submit();" /></td>
					</tr>
				</table>
			</form>
			<label>接口说明：潜水认证，查看基础数据接口</label>
			<label>结果：</label>
			<div id="certificateInfo_result"></div>
			<div>
				结果说明：1、json格式<br />
				<table x:str="" cellpadding="0" cellspacing="0" width="601">
    <colgroup>
        <col width="192" style=";width:192px"/>
        <col width="117" style=";width:117px"/>
        <col width="72" span="2" style="width:72px"/>
        <col width="148" style=";width:148px"/>
    </colgroup>
    <tbody>
    	<tr height="19" style="height:19px" class="firstRow">
            <td height="19" width="192" style="">
                id
            </td>
            <td width="117" style="border-left-style: none;">
                varchar
            </td>
            <td width="72" style="border-left-style: none;" x:num="">
                36
            </td>
            <td width="72" style="border-left-style: none;">
                PK
            </td>
            <td width="148" style="border-left-style: none;">
                主键
            </td>
        </tr>
        <tr height="19" style="height:19px" class="firstRow">
            <td height="19" width="192" style="">
                orgCode
            </td>
            <td width="117" style="border-left-style: none;">
                varchar
            </td>
            <td width="72" style="border-left-style: none;" x:num="">
                4
            </td>
            <td width="72" style="border-left-style: none;">
                
            </td>
            <td width="148" style="border-left-style: none;">
                认证机构代码(参考基础数据OS)
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                levelCode
            </td>
            <td style="border-top:none;border-left:none">
                varchar
            </td>
            <td style="border-top:none;border-left:none" x:num="">
                4
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                认证等级代码（参考基础数据LV）
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                authDate
            </td>
            <td style="border-top:none;border-left:none">
                date
            </td>
            <td style="border-top:none;border-left:none" x:num="">
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                发证日期
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                rightSide
            </td>
            <td style="border-top:none;border-left:none">
                varchar
            </td>
            <td style="border-top:none;border-left:none">
            	128
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                潜水证正面照地址
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                reverseSide
            </td>
            <td style="border-top:none;border-left:none">
                varchar
            </td>
            <td style="border-top:none;border-left:none">
            	128
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                潜水证反面照地址
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                status
            </td>
            <td style="border-top:none;border-left:none">
                varchar
            </td>
            <td style="border-top:none;border-left:none">
            	4
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                审核状态
            </td>
        </tr>
    </tbody>
</table>




			</div>
		</div>
	</div>
</body>
</html>