<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1"/>
		<title>弥音</title>
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
		<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
		<script src="/music/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			#kong {
				 
				height: 100px;
			}
			 
			.page-header-content{
				border-left: 2px #DD5862 solid;
				padding-left: 10px;
				font-family: "微软雅黑";
			}
			.main-footer{
				
				width: 70%;
			    margin: 30px auto;
				border: 1px #E7E7E7 solid;
				color: #333333;
			}
			.number{
				color: #DD5862;
			}
		.add-icon{
			width: 100px;
			height: 100px;
		}
		    .add-icon:hover{
		    	opacity: 0.9; 
                color: #fff; 
                background: gray; 
               

		    }
		.container{
		margin-top:70px;
		}
		a:hover{
		text-decoration:none;}
		
		</style>
	</head>
	<body>
		
	<div class="container">
		
		
	<!--头部-->
<%@ include file="page/top.jsp" %>
<!--头部-->

<!--轮播-->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

 <!-- 轮播图片-->
  <div class="carousel-inner" role="listbox">
  	
    <div class="item active">
      <img src="/music/img/lunbo1.jpg"/>
     
    </div>
    
    <div class="item">
      <img src="/music/img/lunbo2.jpg"/>
      
    </div>
    
    <div class="item">
      <img src="/music/img/lunbo3.jpg"/>
   
    </div> 
    
  
  </div>
  <!-- 轮播图片-->

 <!-- 箭头元素-->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
    
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
    
  </a>
</div>
 <!-- 箭头元素-->

<!--轮播-->

<div class="page-header">
  <h3><div class="page-header-content">最新期刊</div></h3>
  </div>



<!-- 生成四个最新期刊 -->
<div class="row">
<s:iterator value="newMagList">
	<a href="mag_showSongs.action?magId=${id}">
	  <div class="col-sm-6 col-md-6 add-style" >
	    <div class="thumbnail " >
	      <img src="${cover}" >
	      <div class="caption">
	       <h5><span class="number">NO.${id}</span> &nbsp;${name}</h5> 
	      </div>
	    </div>
	  </div>
	</a>
</s:iterator> 
 <!-- 生成四个最新期刊 -->
  
</div>




<!--img-->

<div class="page-header">
  <h3><div class="page-header-content">热门推荐</div></h3>
</div>



<div class="row">
<s:iterator value="hotMagList">
	<a href="mag_showSongs.action?magId=${id}">
	  <div class="col-sm-6 col-md-6" >
	    <div class="thumbnail " >
	      <img src="${cover}" >
	      <div class="caption">
	       <h5><span class="number">NO.${num}</span> &nbsp;${name}</h5> 
	      </div>
	    </div>
	  </div>
	</a>
</s:iterator> 
  
  
</div>




   
</div>	<!--container-->


<div id="kong">
	
</div>




		
 <footer class="main-footer text-center">
 
 <div class="col-xs-12">
 	copyright@609295386<br />
 </div>
 	
 	
 </footer>
	

  
		
	
		
	</body>
</html>

