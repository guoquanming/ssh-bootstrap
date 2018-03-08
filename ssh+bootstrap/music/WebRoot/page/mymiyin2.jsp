<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
</head>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<body>
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

</body>
</html>
