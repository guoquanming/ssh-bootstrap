<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

	 <script type="text/javascript">
            $(function () {
           
            	$("#tishi").hide();
             //$("#arrow").hide();
            
            
             $(".gongneng").hover(
                function () {
                    $(this).addClass("active");
                },
                function () {
                    $(this).removeClass("active")
                })
  
			});
         
           
			$(function(){
				$("#submit_id").click(function(){
					$("form").submit();
				});
				
				$(".denglu").click(function(){
            	var name=$("#user-name").val();
            	var password=$("#user-password").val();
				$.ajax({
					type:"POST",
					url:"mag_login.action",
					data:{"loginName":name,"loginPwd":password},
					success:function(data){
						if("login_error"==data){
							
						}else{
						 /*    $("#arrow").show();
					        $(".dropdown").show(); */
							$("#loginedName").html(data+"<span class='caret'></span>");	
						    $("#motaikuang").modal('hide');
						    $("#btn-log").hide();
						    
						    
						}
					}
				});
				});
			});
		
			$(function(){
				$("#tishi").hide();
			})
	
            
            
            
        </script>	
        <style>
  #mi{
		   	font-family: "楷体";
		   	font-size:  xx-large;
		   	color:#DD5862;
		   }
	 
</style>	
	
		
		<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
 <!--  更好的支持移动设备-->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" id="mi" href="#">弥.</a>
    </div>
  
   
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<li class="gongneng"><a href="mag_list.action">主页</a></li>
        <li class="gongneng"><a href="mag_allList.action">期刊</a></li>
        <li class="gongneng"><a href="/music/page/radio.jsp">电台</a></li>
        
      </ul>
     <!--  <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form> -->
      
      <ul class="nav navbar-nav navbar-right">
           <!-- Button trigger modal -->
       <c:if test="${loginUser.userName==null }"> <li><a href="" data-toggle="modal" data-target=".bs-example-modal-sm"  id="btn-log">注册/登录</a></li></c:if>
   		
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="loginedName">${loginUser.userName}<span class='caret' id="arrow"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="${pageContext.request.contextPath}/mag_listCollec.action?userId="${nowUser.id}><span class="glyphicon glyphicon-user"></span> &nbsp;我的弥音</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-cog"></span> &nbsp;账号设置</a></li>
            <li><a href="mag_logout.action"><span class="glyphicon glyphicon-off"></span> &nbsp;退出</a></li>
            
          </ul>
        </li>
   
      </ul>
      
     
    </div><!-- /.navbar-collapse -->
   
  </div><!-- /.container-fluid -->
</nav>

<!--模态框-->
<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="motaikuang" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">登录/注册</h4>
      </div>
      <div class="modal-body">
      	   <!--
百叶窗效果-->

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          登录
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
      
       </br>
       <s:form action="mag_login.Action" method="post">
    	<input type="text" id="user-name" placeholder="请输入用户名" value="111"/>  <span id="tishi">●用户名可用</span></br></br>
  
      		<input value="111" type="password" id="user-password" placeholder="请输入密码"/>  </br></br>
      		<button type="button" class="btn btn-primary denglu">登录</button>
      </s:form>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          注册
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
       
       </br>
       <s:form action="mag_regist.action"  method="post">
    	<input type="text"  name="userName" id="user-name" placeholder="请输入用户名"/></br></br>
  
      		<input type="text" name="userPassword" id="user-password" placeholder="请输入密码"/></br></br>
      		<button type="button" class="btn btn-primary denglu" id="submit_id">注册</button>
      	</s:form>
      </div>
    </div>
  </div>
  <!--<div class="panel panel-default">
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
  </div>-->
</div>	
      </div>
      <div class="modal-footer">
      <!--  <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>-->
        
      </div>
    </div>
  </div>
</div> 
	
<!--模态框-->