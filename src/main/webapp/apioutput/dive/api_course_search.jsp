<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.controller.BaseController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String url = request.getContextPath()+"/api/apiCourseController/search";
%>
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	$(function() {
	 	parent.$.messager.progress('close');
		$('#course_search_Form').form({
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
				$("#course_search_result").text(result);
			}
		});
	});
</script>

	<div class="easyui-layout" data-options="fit:true">

		<div data-options="region:'center'">
			<form id="course_search_Form" action="" method="post">
				<table align="center" width="90%" class="tablex">
					<tr>
						<td align="right" style="width: 80px;"><label>url：</label></td>
						<td><%=url%></td>
					</tr>
					<tr>
						<td align="right" style="width: 180px;"><label>tokenId(token值)：
						<td><input name="tokenId" type="text" class="span2"  value="<%=BaseController.DEFAULT_TOKEN%>"/></td>
					</tr>
					<tr>
						<td align="right" style="width: 180px;"><label>title(搜索值)：</label></td>
						<td><input name="title" type="text" class="span2" value="" />(按名称模糊搜索)</td>
					</tr>
					<tr>
						<td align="right" style="width: 180px;"><label>page(第几页)：</label></td>
						<td><input name="page" type="text" class="span2" value="1" /></td>
					</tr>

					<tr>
						<td align="right" style="width: 180px;"><label>rows(每页数)：</label></td>
						<td><input name="rows" type="text" class="span2" value="10" /></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="button"
							value="提交" onclick="javascript:$('#course_search_Form').submit();" /></td>
					</tr>
				</table>
			</form>
			<label>结果：视频列表结果集，查看基础数据接口</label>
			<div id="course_search_result"></div>
			<div>
				结果说明：1、json格式<br /> 2、success:true 成功<br /> 3、obj:数组格式<br />


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
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                title
            </td>
            <td style="border-top:none;border-left:none">
                varchar
            </td>
            <td style="border-top:none;border-left:none" x:num="">
                128
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                名称
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                courseType
            </td>
            <td style="border-top:none;border-left:none">
                varchar
            </td>
            <td style="border-top:none;border-left:none" x:num="">
                4
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                分类
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                icon
            </td>
            <td style="border-top:none;border-left:none">
                longtext
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                图片
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                price
            </td>
            <td style="border-top:none;border-left:none">
                float
            </td>
            <td style="border-top:none;border-left:none" x:num="">
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                价格
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                content
            </td>
            <td style="border-top:none;border-left:none">
                longtext
            </td>
            <td style="border-top:none;border-left:none" x:num="">
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                内容
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                introduce
            </td>
            <td style="border-top:none;border-left:none">
                longtext
            </td>
            <td style="border-top:none;border-left:none" x:num="">
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                介绍
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                filePath
            </td>
            <td style="border-top:none;border-left:none">
                varchar
            </td>
            <td style="border-top:none;border-left:none" x:num="">
            	128
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                视频地址
            </td>
        </tr>
        <tr height="19" style="height:19px">
            <td height="19" style="border-top-style: none;">
                status
            </td>
            <td style="border-top:none;border-left:none">
                varchar
            </td>
            <td style="border-top:none;border-left:none" x:num="">
                4
            </td>
            <td style="border-top:none;border-left:none"></td>
            <td style="border-top:none;border-left:none">
                状态（上架，下架）
            </td>
        </tr>
        <tr height="19" style="height:14.25pt">
            <td height="14" class="xl23" style="">
                commentNum
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td class="xl23" width="117">
                评论数
            </td>
        </tr>
        <tr height="19" style="height:14.25pt">
            <td height="14" class="xl23" style="">
                praiseNum
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td class="xl23" width="117">
                赞数
            </td>
        </tr>
        <tr height="19" style="height:14.25pt">
            <td height="14" class="xl23" style="">
                collectNum
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td class="xl23" width="117">
                收藏数
            </td>
        </tr>
    </tbody>
</table>

			</div>
		</div>
	</div>
</body>
</html>