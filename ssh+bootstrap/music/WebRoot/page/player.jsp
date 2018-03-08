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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>播放</title>
		
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
		<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
		<script src="/music/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		
		<style type="text/css">
			
				.header-div{
				width:50px; 
				height:50px; 
				background-color:#DD5862; 
				border-radius:50px;
				float: left;
				margin-top: -15px;
			}
			.header{
				height:30px; 
				line-height:50px; 
				display:block; 
				color:white; 
				text-align:center;
				
			}
			.header-name{
				margin-top: 40px;
			}
			.edit-message{
				float: right;
				margin-top: -10px;
				
			}
			.play-message{
				height: 250px;
				text-align: center;
				padding-top: 100px;
			}
			.container{
			margin-top:50px;
			}
			.header-name{
			margin-left:60px;
			
			}
			.touming{
		
			background: rgba(255,204,51, 0);
		   border:0px;

			}
			a:hover{
		text-decoration:none;}
		
		.play-message{
		color:#DD5862;
		}
		.xiaoyuandian{
		color:#DD5862;
		}
		.gequming{
		color:#777777;
		}
		a:visited{
		background-color:red;
		}
		.kong{
		margin-top:30px;
		}	
		#empty-heart{
		color:black;
		}
		
		</style>
		
		<script type="text/javascript">
		
			 $(function(){
			
			})
				/* $("#AAA").click(function(){
					alert("aa");
				$("#name").html("歌曲名："+name);
				$("#author").html("歌手："+author);
				$("#album").html("专辑："+album);
				$("#player source").attr("src",url);
				}); */
			function playSong(name,author,album,url){
				$("#name").html("歌曲名："+name);
				$("#author").html("歌手："+author);
				$("#album").html("专辑："+album);
				$("#player1 audio").attr("src",url);
				
			}
			//
			 function aa(){
			 	
			 	
			 	
			 	var timestamp=new Date().getTime();
				 $("#empty-heart").toggleClass("glyphicon glyphicon-wrench");
		          name=${nowUser.id};
                  var num=${mag.num};
					$.ajax({
						type:"POST",
						url:"mag_coll.action",
						data:{"magId":num,"userId":name,"number":timestamp},
						
						success:function(data){
							if(data=='no'){
						
								
							}else{
							
							}
						}
					
					});//ajax
			 	
			 }   
		</script>
	</head>
	
	
	
	<body>
	<div class="container">
	<!--导航-->
	
		<%@ include file="top.jsp" %>
	 	<!--导航-->



 <div class="content">

   
 

 	

 <div class="row">
 	
 <div class="col-sm-2 col-md-2">
 </div>

<!--  播放-->
<div class="col-sm-8 col-md-8">

 <div class="page-header">
	<div class="header-div">
		<span id="magId" class="header">${mag.num}</span> 
	</div>
	<div class="header-name">
		<h3>${mag.name}</h3>
<div class="edit-message" >
      
     
   <%-- <a href="#" class="gequming">${loginUser.userName}</a> --%>
   <a href="#" ><span class="glyphicon glyphicon-heart-empty" id="empty-heart" onclick="aa()"></span></a>
 <a ><script type="text/javascript">
(function(){
var p = {
url:location.href,
showcount:'0',/*是否显示分享总数,显示：'1'，不显示：'0' */
desc:'好听的音乐，都来听一下吧！',/*默认分享理由(可选)*/
summary:'NO.${mag.num}-${mag.name}',/*分享摘要(可选)*/
title:'弥音',/*分享标题(可选)*/
site:'弥音',/*分享来源 如：腾讯网(可选)*/
pics:'${mag.cover}', /*分享图片的路径(可选)*/
style:'203',
width:22,
height:22
};
var s = [];
for(var i in p){
s.push(i + '=' + encodeURIComponent(p[i]||''));
}
document.write(['<a version="1.0" class="" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?',s.join('&'),'" target="_blank"><span class="glyphicon glyphicon-share-alt" style="color: #DD5862;"></span></a>'].join(''));
})();
</script>
<script src="http://qzonestyle.gtimg.cn/qzone/app/qzlike/qzopensl.js#jsdate=20111201" charset="utf-8"></script>	
</a> 
   </div>
		
		
		
   </div>

 </div>
 
 <div class="col-sm-2 col-md-2">
 </div>
 <div class="col-sm-8 col-md-8">
 
 
  <div class="col-sm-12 col-md-12 thumbnail" style="background-image:url('${mag.cover}');  background-size:100% 100%;">
    <div class="thumbnail touming" >
 		
 	
 		<div class="play-message">
 			<p id="name">歌曲名：${newMusicList[0].name}</p>
 			<p  id="author">歌手：${newMusicList[0].author}</p>
 			<p id="album">专辑：${newMusicList[0].album}</p>
 			
 		</div> 
    </div>
   
  </div>
   <div class="caption">
 		<div class="player" id="player1">
 			<audio controls="controls" loop="1" autoplay="autoplay" src="${newMusicList[0].url}"  type="audio/mp3"> 
 			
 			</audio>
 		</div>
 		</div>
 		
 	
 
  <div class="col-sm-12 col-md-12 kong" >
    
      
      <div class="caption">
      <s:iterator value="#newMusicList">
      	 <a href="javascript:void(0)" onclick="playSong('${name}','${author}','${album}','${url}')"><p class="gequming"><span class="xiaoyuandian">●</span>&nbsp; ${name}</p></a>
      </s:iterator>
      </div>
    
  </div>
  </div>
 
 
 
 </div>
 <div class="col-sm-2 col-md-2">
 </div>
 
 
 
 
 
 </div>



 
 
 
<div class="col-sm-2 col-md-2">
 </div>
 


  
  
  

 </div><!--row-->
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
<%--  <div class="page-header">
	
		<h4>相似期刊</h4>

  </div>
 
<div class="row">
	
	<a href="play.html">
  <div class="col-sm-6 col-md-3 ">
    <div class="thumbnail">
      <img src="img/期刊1.jpg" alt="...">
      <div class="caption">
       <h5><span class="number">NO.1</span> &nbsp; hello world</h5>
      </div>
    </div>
  </div>
  </a>
  
  
  <a href="play.html">
  <div class="col-sm-6 col-md-3 ">
    <div class="thumbnail">
      <img src="img/期刊3.jpg" alt="...">
      <div class="caption">
       <h5><span class="number">NO.1</span> &nbsp; hello world</h5>
      </div>
    </div>
  </div>
  </a>
  
  <a href="play.html">
  <div class="col-sm-6 col-md-3 ">
    <div class="thumbnail">
      <img src="img/期刊3.jpg" alt="...">
      <div class="caption">
       <h5><span class="number">NO.1</span> &nbsp; hello world</h5>
      </div>
    </div>
  </div>
  </a>
  
  <a href="play.html">
  <div class="col-sm-6 col-md-3 ">
    <div class="thumbnail">
      <img src="img/期刊1.jpg" alt="...">
      <div class="caption">
       <h5><span class="number">NO.1</span> &nbsp; hello world</h5>
      </div>
    </div>
  </div>
  </a>
  
  </div>

 <!--留言板-->
 <!--留言板-->

 --%>
</div><!--content-->
 
 
 
 
 
 
 
 
</div><!--container-->

          
           	
           	
           	
           			
           
        
           	
          
 
 



           	
           	
           	
           	
           	
           	
           	
           	
		
		
	</body>
</html>


