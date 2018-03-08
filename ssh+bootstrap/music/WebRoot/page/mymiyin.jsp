<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
			/* $(function(){
				$('#myTab a').click(function (e) {
  				e.preventDefault()
  				$(this).tab('show')
			})
			}) */
			$(function(){
				var flag=${flag};
				if(flag==0){
					$("#col").addClass("active");
				}else {
					$("#tuijian").addClass("active");
				}
				
			});
		</script>
		
		
		<style type="text/css">
		
			.page-header-content{
				border-left: 2px #DD5862 solid;
				padding-left: 10px;
				font-family: "微软雅黑";
			}
			a:hover{
		text-decoration:none;}
		.container{
			margin-top:50px;
			}
			.xuanxiang{
			
			color:#DD5862;
			}
		</style>
		
	</head>
	<body>
		
		
		<div class="container">
		
		<!--导航-->
	<%@ include file="top.jsp" %>
<!--导航-->	
			
			<div class="page-header">
  <h3><div class="page-header-content">${loginUser.userName}的弥音</div></h3>
  </div>
			
			 <!--标签页效果-->
<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li  id="col"  role="presentation" ><a href="mag_listCollec.action" class="xuanxiang">我的收藏</a></li>
    <li  id="tuijian" role="presentation" ><a href="mag_tuijian.action" class="xuanxiang">个人推荐</a></li>
    <!--<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>-->
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    </br>
    <div class="row">
    
  <s:iterator value="listMusic"> 
  <div class="col-sm-1 col-md-3">
    <a href="mag_showSongs.action?magId=${id}" class="thumbnail">
      <img src="${cover}" alt="...">
    <div class="caption">
	       <h5><span class="number">NO.${num}</span> ${name}</h5> 
	      </div>
    </a>
  </div>
  </s:iterator> 
   <s:iterator value="listMg"> 
  <div class="col-sm-1 col-md-3">
    <a href="mag_showSongs.action?magId=${id}" class="thumbnail">
      <img src="${cover}" alt="...">
    <div class="caption">
	       <h5><span class="number">NO.${num}</span>${name}</h5> 
	      </div>
    </a>
  </div>
  </s:iterator> 
   
  
  
  ...
</div>
    	
    	
    	
    </div>
    
   
  <div role="tabpanel" class="tab-pane" id="profile">
 </br>
     <div class="row">
     <s:iterator value="listMg"> 
  <div class="col-sm-1 col-md-3">
    <a href="mag_showSongs.action?magId=${id}" class="thumbnail">
      <img src="${cover}" alt="...">
    <div class="caption">
	       <h5><span class="number">NO.${num}</span>${name}</h5> 
	      </div>
    </a>
  </div>
  </s:iterator> 
  ...
</div>
    	
    </div>
    <div role="tabpanel" class="tab-pane" id="messages">...</div>
    <div role="tabpanel" class="tab-pane" id="settings">...</div>
  </div>

</div>
  </div>
</div>
				
				
			
		</div>
	</body>
</html>
