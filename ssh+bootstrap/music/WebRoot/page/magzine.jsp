<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1"/>
		<title>期刊</title>
		
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
		<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
		<script src="/music/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		
	<%-- 	<script type="text/javascript">
			$(function(){
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
			/* $("[name='page.pageNum']").val(2); */
			alert($("[name='page.pageNum']").val());
			$("form:first").submit();
		});
		$("#last").click(function(){
			$("[name='page.pageNum']").val(pageTotal);
			$("form:first").submit();
		});

	});
</script> --%>
		
		<style type="text/css">
			
			
			.number{
				color: #ac0101;
			}
			a:hover{
		text-decoration:none;
		}
		.page-header-content{
				border-left: 2px darkred solid;
				padding-left: 10px;
				font-family: "微软雅黑";
			}
		</style>
		
		
		
		
		
	</head>
	<body>
		<div class="container">
			<!--导航-->
	<%@ include file="top.jsp" %>
<!--导航-->


<div class="page-header text-center">
		
	<%-- <nav>
  <ul class="pagination ">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
     <li><a>···</a> </li>
    <li><a href="#">100</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav> --%>
	</div>	
	
	<div class="page-header">
  <h3><div class="page-header-content">所有期刊</div></h3>
  </div>
	
<!--	所有期刊-->
	
<div class="row">
	<s:iterator value="page.list">
	<a href="mag_showSongs.action?magId=${id}">
  <div class="col-sm-4 col-md-3 ">
    <div class="thumbnail">
      <img src="${cover}" >
      <div class="caption">
       <h5><span class="number">NO.${num} </span> &nbsp; ${name}</h5>
      </div>
    </div>
  </div>
  </a>
  
  </s:iterator>
 </div>
<!--	所有期刊-->
	
	
	<%-- <div class="page-header">
		
	
	</div>
	<div class="text-center">
		
	<s:form action="mag_allList" method="post">
	<s:textfield name="page.pageNum"/>
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
	
	</s:form> --%>
<nav class="text-center">
  <ul class="pagination ">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a>···</a> </li>
    <li><a href="#">100</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>

	
			
		</div><!--container-->
		
		<!--footer-->
 
 
		
		<!--footer-->
		
		
	</body>
</html>


