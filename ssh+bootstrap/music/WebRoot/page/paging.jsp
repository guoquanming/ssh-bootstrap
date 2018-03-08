<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	$(function(){
	alert("aa");
		var pageNum = ${page.pageNum};
		var pageTotal = ${page.pageTotal};
		if(pageTotal == 1){
			$("#fir").css("display","none");
			$("#pre").css("display","none");
			$("#next").css("display","none");
			$("#last").css("display","none");
		}else if(pageNum == 1){
			$("#fir").css("display","none");
			$("#pre").css("display","none");
			$("#next").css("display","inline");
			$("#last").css("display","inline");
		}else if(pageNum == pageTotal){
			$("#fir").css("display","inline");
			$("#pre").css("display","inline");
			$("#next").css("display","none");
			$("#last").css("display","none");
		}else{
			$("#fir").css("display","inline");
			$("#pre").css("display","inline");
			$("#next").css("display","inline");
			$("#last").css("display","inline");
		}
		$("#fir").click(function(){
			$("[name='page.pageNum']").val(1);
			$("form:first").submit();
		});
		$("#pre").click(function(){
			$("[name='page.pageNum']").val($("[name='page.pageNum']").val()-1);
			$("form:first").submit();
		});
		$("#next").click(function(){
			$("[name='page.pageNum']").val($("[name='page.pageNum']").val()*1+1);
			$("form:first").submit();
		});
		$("#last").click(function(){
			$("[name='page.pageNum']").val(pageTotal);
			$("form:first").submit();
		});

	});
</script>
<br/>
<s:hidden name="page.pageNum"/>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
	
		<td width="51%">&nbsp;</td>
		<td width="13%">共 ${page.dataTotal}条记录
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
		<td width="12%">当前第<span style="color:red;">${page.pageNum}</span>/${page.pageTotal}页</td>
	</tr>
</table>
