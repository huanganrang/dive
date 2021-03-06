<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveEquip" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%>
<script type="text/javascript">
	var editor;
	$(function() {
		window.setTimeout(function() {
			editor = KindEditor.create('#equipDes', {
				width : '580px',
				height : '300px',
				items : [ 'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste', 'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript', 'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak', 'anchor', 'link', 'unlink' ],
				uploadJson : '${pageContext.request.contextPath}/fileController/upload',
				fileManagerJson : '${pageContext.request.contextPath}/fileController/fileManage',
				allowFileManager : true
			});
		}, 1);
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/diveEquipController/edit',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				} else {
					editor.sync();
					var selColors = $("#selColors").combo('getValues');
					var selSizes = $("#selSizes").combo('getValues');
					if(selColors != '') {
						$("#colors").val(selColors);
						if(selSizes == '') {
							isValid = false;
						}
					} else {
						$("#colors").val('');
					}

					if(selSizes != '') {
						$("#sizes").val(selSizes);
						if(selColors == '') {
							isValid = false;
						}
					} else {
						$("#sizes").val('');
					}
					if (!isValid) {
						parent.$.messager.progress('close');
						alert("所属颜色、所属尺寸需要同时选择！");
					}
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
		
		function ProcessFile() {
			var file = document.getElementById('iconFile').files[0];
			if (file) {
				var reader = new FileReader();
				reader.onload = function ( event ) {
					var txt = event.target.result;
					$('.img-preview').attr('src',txt);
				};
			}
		    reader.readAsDataURL(file);
		}
		$(document).delegate('#iconFile','change',function () {
			ProcessFile();
		});
		
		setTimeout(function(){
			var colors = $("#colors").val(),
				sizes = $("#sizes").val(),
				cr = [], ct = '', sr = [], st = '';
			if(colors != '') {
				var colorArr = colors.split(",");
				$("#selColors").combo('panel').find(".combobox-item").each(function(){
					var v = $(this).attr("value");
					var t = $(this).html();
					if(colorArr.contains(v)) {
						cr.push(v);
						if(ct != '') ct += ',';
						ct += t;
						$(this).addClass('combobox-item-selected');
					}
				});
			}
			$("#selColors").combo('setValues',cr).combo('setText', ct);
			
			if(sizes != '') {
				var sizeArr = sizes.split(",");
				$("#selSizes").combo('panel').find(".combobox-item").each(function(){
					var v = $(this).attr("value");
					var t = $(this).html();
					if(sizeArr.contains(v)) {
						sr.push(v);
						if(st != '') st += ',';
						st += t;
						$(this).addClass('combobox-item-selected');
					}
				});
			}
			$("#selSizes").combo('setValues',sr).combo('setText', st);
		},50);
	});
	
	Array.prototype.contains = function (obj) {  
	    var i = this.length;  
	    while (i-- && i >= 0) {  
	        if (this[i] === obj) {  
	            return true;  
	        }  
	    }  
	    return false;  
	} 
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: auto;">
		<form id="form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value = "${diveEquip.id}"/>
			<table class="table table-hover table-condensed">
				<tr>	
					<th width="8%"><%=TdiveEquip.ALIAS_EQUIP_NAME%></th>	
					<td width="42%">
						<input class="easyui-validatebox span2" name="equipName" type="text" value="${diveEquip.equipName}" data-options="required:true"/>
					</td>
					<th width="8%"><%=TdiveEquip.ALIAS_PRICE%></th>
					<td width="42%">
						<input class="easyui-validatebox span2" name="price" type="text" value="${diveEquip.price}" data-options="required:true"/>
					</td>	
				</tr>	
				<tr>	
					<th><%=TdiveEquip.ALIAS_EQUIP_ICON%></th>	
					<td colspan="3">
						<img class="img-preview" src="${diveEquip.equipIcon}" width="50" height="50"/> 
						<input type="file" id="iconFile" name="equipIconFile">
					</td>
				</tr>	
				<tr>	
					<th><%=TdiveEquip.ALIAS_EQUIP_TYPE%></th>	
					<td>
						<jb:select dataType="ET" name="equipType" value="${diveEquip.equipType}"></jb:select>	
					</td>								
					<th><%=TdiveEquip.ALIAS_EQUIP_BRAND%></th>	
					<td>
						<jb:select dataType="EB" name="equipBrand" value="${diveEquip.equipBrand}"></jb:select>					
					</td>							
				</tr>	
				<tr>	
					<th><%=TdiveEquip.ALIAS_STATUS%></th>	
					<td colspan="3">
						<jb:select dataType="ST" name="status" value="${diveEquip.status}"></jb:select>	
					</td>						
				</tr>
				<tr>	
					<th>所属颜色</th>	
					<td>
						<jb:select dataType="CL" name="selColors" multiple="true"></jb:select>	
						<input type="hidden" name="colors" id="colors" value="${diveEquip.colors}"/>
					</td>
					<th>所属尺寸</th>	
					<td>
						<jb:select dataType="SZ" name="selSizes" multiple="true"></jb:select>	
						<input type="hidden" name="sizes" id="sizes" value="${diveEquip.sizes}"/>
					</td>	
				</tr>		
				<tr>
					<th><%=TdiveEquip.ALIAS_HOT%></th>	
					<td>
						<input class="span2" name="hot" type="text" class="span2"  value="${diveEquip.hot}"/>
					</td>
					<th><%=TdiveEquip.ALIAS_SALE_NUM%></th>	
					<td>
						<input class="span2" name="saleNum" type="text" class="span2"  value="${diveEquip.saleNum}"/>
					</td>	
				</tr>
				<tr>	
					<th><%=TdiveEquip.ALIAS_EQUIP_SUMARY%></th>	
					<td colspan="3">
						<textarea style="width: 500px;" name="equipSumary">${diveEquip.equipSumary}</textarea>
					</td>							
				</tr>	
				<tr>	
					<th><%=TdiveEquip.ALIAS_EQUIP_DES%></th>	
					<td colspan="3">
						<textarea  name="equipDes" id="equipDes" style="height:180px;visibility:hidden;">${diveEquip.equipDes}</textarea>
					</td>						
				</tr>
			</table>				
		</form>
	</div>
</div>