<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>后台</title>
			<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		
		
		<script type="text/javascript">
			$(function(){
				$("#submitId").click(function(){
					$("form:first").submit();
				});
			});
		</script>
		
	
		<style type="text/css">
			.post-up{
				width: 100px;
			}
			.page-header-content{
				border-left: 2px darkred solid;
				padding-left: 10px;
				font-family: "微软雅黑";
			}
			a:hover{
		text-decoration:none;
		}
		</style>
		
		
	</head>
	<body>
		
		<div class="container">
			
	
		
		
	<div class="page-header ">
	  <div class="page-header-content ">
		<h3>后台管理-期刊发表</h3> ${requestScope.message}
	  </div>
	</div>
	    
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         添加期刊
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
    	    
	<s:form action="mag_maAdd.action"  method="post">
	
	<table class="table">
	<caption> 
   <th>期刊封面</th>
   <th>期刊名称</th>
  <th>分类</th>
  <th>期刊介绍</th>
   </caption>
   
	<tr>
     <td><input type="text" name="ma.cover" id="music-photo-lianjie" placeholder="请输入期刊封面的链接"/></td>
    <td><input type="text" name="ma.name" id="music-lianjie" placeholder="请输入期刊的名称"/></td>
    <td><select name="ma.category">
			<option></option>
			<option>工作</option>
			<option>上网</option>
			<option>失恋</option>
			<option>放松</option>
			<option>阅读</option>
			<option>睡眠</option>
			<option>驾驶</option>
			<option>运动</option>
			<option>养心</option>
			<option>派对</option>
			<option>熬夜</option>
			<option>起床</option>
			
		</select></td>
    <td> <textarea name="ma.desc" rows="10" cols="30">12312321312</textarea> </td>
    <td></td>
		
		
	</tr>
</table>
       
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          歌曲添加
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
      

	

<table class="table table-striped table-border">

	
<caption> 
  <th>序号</th>
  <th>歌曲链接</th>
  <th>歌曲名字</th>
  <th>歌手</th>
  <th>所属唱片</th>
</caption>

<c:forEach begin="0" end="9" step="1" varStatus="s">
	<tr >
		<td>${s.index+1}</td>	
		<td><input type="text" name="mcsurls" id="music-lianjie" placeholder="请输入歌曲的链接地址"/></td>
		<td><input type="text" name="mcsnames"id="music-name" placeholder="请输入歌曲的名字"/></td>
		<td><input type="text" name="mcsauthors" id="music-name" placeholder="请输入歌手的名字"/></td>
		<td><input type="text" name="mcsalbums"id="music-name" placeholder="请输入歌曲所属的唱片"/></td>
	
	</tr>
</c:forEach>
</table>
</s:form>


       </div>
    </div>
  </div>
<!--   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Collapsible Group Item #3
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div> -->
</div>
    
<p><button type="button" class="btn btn-primary" id="submitId">发表</button></p>




		
		
</div>
		
	</body>
</html>
