 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
		<title>电台</title>
		
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
		<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
		<script src="/music/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
		
			
		.container{
		margin:40px auto;
		}
		a:hover{
		text-decoration:none;}
		
		#kong{
		margin-top:30px;
		}
		.page-header-content{
				border-left: 2px #DD5862 solid;
				padding-left: 10px;
				font-family: "微软雅黑";
			}
		</style>
		<script type="text/javascript">
  var i=1;
$(function(){
var audio = document.getElementById("audio1"); 
audio.loop = false;
 /*  //  src="${allMusicList[0].url}"  */
 var  i = 1;
audio.addEventListener("ended", function () {  
    alert("over");
    var url = "${urls[2]}";
    alert(url);
    alert(i);
  
   i++;
  $("#audio1").attr("src",url);
  
    
}, true); 


})
		 


		</script>
		
	</head>
	<body>
	
		<div class="container">
			
		<!--导航条-->
		<%@ include file="top.jsp" %>
		<!--导航条-->
		 
		
		<div class="page-header">
  <h3><div class="page-header-content">弥音电台</div></h3>
  </div>	  
		 	
		 <div class="col-sm-2 col-md-2">
 </div>
		 <div class="col-sm-8 col-md-8">
		 	<!--播放器-->
		
	
		  <div class="radio-player">
		 		<audio id="audio1" src="${urls[0]}" controls="controls" loop="0" autoplay="autoplay"></audio>
		 </div>
		   
		
		<!--播放器-->
		
		
	<div id="kong">
		
	</div>	
		
		
		<!--标签-->
		
			
		
<div class="row text-center">

<a href="mag_radio.action?category=工作">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>工作</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=上网">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>上网</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=失恋">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>失恋</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=放松">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>放松</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=阅读">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>阅读</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=睡眠">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>睡眠</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=驾驶">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>驾驶</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=运动">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>运动</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=养心">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>养心</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=派对">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>派对</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=熬夜">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>熬夜</h5>
      </div>
    </div>
  </div>
</a>

<a href="mag_radio.action?category=起床">
  <div class="col-xs-4 col-md-3" >
    <div class="thumbnail">
      <div class="caption">
       <h5>起床</h5>
      </div>
    </div>
  </div>
</a>




</div>
		
	
		<!--标签-->
		 
		 
		 
		 
		 
 </div>
		
		 <div class="col-sm-2 col-md-2">
 </div>
		
	
			
		</div><!--container-->
		
		
		
		
		
	</body>
</html>
