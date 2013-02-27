<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="GBK">
    <title>Bootstrap, from Twitter</title>
    
    
    <script language="javascript" type="text/javascript">
    	function testRadio(){
    		for(i=0;i<document.submitForm.optionsRadios.length;i++){
    			if(document.submitForm.optionsRadios[i].checked){
    				str=document.submitForm.optionsRadios[i].value;
    			}
    		}
    		confirm(str);
    		location.href="snatchEntry!toSearch?flag="+str;
    	}
    </script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
	<script type="text/javascript" >
		function selectCategory(url){
			window.location.href="snatchEntry!toCategory?flag="+url;
		}
	</script>   
	
	<script language="javascript" src="datetimepicker_css.js"></script>
	
 <!--	
	<script language="javascript" src="datetimepicker_css.js">
	
		function buildCal(){ //获取登录名和时间
			alert("here");
			parent.document.forms["0"].elements["oplogSearch.opname"].value
			=document.forms["0"].elements["oplogSearch.opname"].value;
			parent.document.forms["0"].elements["oplogSearch.dateBegin"].value
			=document.forms["0"].elements["oplogSearch.dateBegin"].value;
			parent.document.forms["0"].elements["oplogSearch.dateEnd"].value
			=document.forms["0"].elements["oplogSearch.dateEnd"].value;
			parent.document.forms["0"].submit();
			parent.document.getElementById('divWindow').style.display="none"; 
			return false;
		}

		function comparePair(){ 
			var begin,end;
			begin = document.forms["0"].elements["oplogSearch.dateBegin"].value;
			end = document.forms["0"].elements["oplogSearch.dateEnd"].value;
			if(begin > end && end != ""){
				alert("您选择的时间有误!'); 
				return false; 
			}
			return true;
		}

	</script>
-->
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">资讯下发</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              	欢迎您&lt; <a href="#" class="navbar-link">${sessionScope.userName }</a>&gt;!
            </p>
            <ul class="nav">
              <li class="active"><a href="#">主页</a></li>
              <li><a href="#about">关于</a></li>
              <li><a href="#contact">联系</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span2">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
            <!--  
              <li class="nav-header">热门话题</li>
              <li class="active"><a href="#">热点聚焦</a></li>
              <li><a href="#">今日热点</a></li>
              <li><a href="#">最近一周</a></li>
              <li><a href="#">更多&raquo;</a></li>
              <li class="nav-header">门户网站</li>
              <li><a href="#">新浪</a></li>
              <li class="active"><a href="#">百度</a></li>
              <li><a href="#">腾讯</a></li>
              <li><a href="#">搜狐</a></li>
              <li><a href="#">网易</a></li>
              <li><a href="#">更多&raquo;</a></li>
              -->
              <li class="nav-header">频道列表</li>
              <li><a href="javascript:selectCategory('news society')">新闻中心</a></li>
              <li><a href="javascript:selectCategory('sports')">体育新闻</a></li>
              <li><a href="javascript:selectCategory('blog')">博客频道</a></li>
              <li><a href="javascript:selectCategory('tech')">科技新闻</a></li>
              <li><a href="javascript:selectCategory('finance')">财经新闻</a></li>
              <li><a href="javascript:selectCategory('jczs')">军事新闻</a></li>
              <li><a href="javascript:selectCategory('eladies')">女性新闻</a></li>
              <li><a href="javascript:selectCategory('auto')">汽车新闻</a></li>
              <li><a href="javascript:selectCategory('ent')">娱乐新闻</a></li>
              <li><a href="javascript:selectCategory('book')">读书新闻</a></li>
              <li><a href="javascript:selectCategory('edu')">文化教育</a></li>
              <li><a href="javascript:selectCategory('house')">房产新闻</a></li>
              <li><a href="javascript:selectCategory('games')">游戏新闻</a></li>
              <li><a href="javascript:selectCategory('astro')">星座新闻</a></li>
              <li><a href="javascript:selectCategory('bn')">视频新闻</a></li>
    <!--           <li><a href="javascript:selectCategory('中文参数测试')">测试测试</a></li>   -->
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span10">
        
         
        
          <div class="hero-unit">
            <h1>媒体化资讯平台</h1>
            <!--  
            <p>www.wukong.com 运营商之间在政策和资源上的竞争将越来越激烈，将会把大部分资源和预算投放在网络建设和终端补贴上，在整体成本吃紧、营销资源有限的情况下...</p>
            -->
            <div class="row-fluid">
       			 <div class="span6">
            		<p><a href="snatchOPML!toSnatch" class="btn btn-primary btn-large">导入根目录Opml并下载所有&raquo;</a></p>
            	</div>
            	<div class="span6">
            		<p><a href="snatchEntry!toSnatch" class="btn btn-primary btn-large">根据Opml加载所有Entry &raquo;</a></p>
            	</div>
            </div>
            <div class="row-fluid">
            	<div class="span6">
            		<h3>自动抓取时间间隔设置</h3>
            		<select name="filePath" id="filePath" class="input_text_1">
							<option value="0">手动抓取</option>
							<option value="1">1小时</option>
							<option value="3">3小时</option>
							<option value="6">6小时</option>
							<option value="12">12小时</option>
							<option value="24">24小时</option>
					</select> 
            	
            	</div>
            	
            	<div class="span6">
            		<h3>自动清理时间间隔设置</h3>
            		<select name="filePath" id="filePath" class="input_text_2">
							<option value="0">从不清理</option>
							<option value="1">1天</option>
							<option value="3">3天</option>
							<option value="7">7天</option>
							<option value="30">30天</option>
							<option value="100">100天</option>
					</select> 
            	
            	</div>
            </div>
          
         
          <div class="container" >
		      
		     <h3>条件搜索...</h3>
		     
		     <form action="snatchEntry!toSearch" class="form-search" method="post" name="submitForm">
			     <label class="radio">
	  				<input type="radio" name="optionsRadios" id="optionsRadios1" checked value="entryTitle" >
	 				按标题
				  </label>
				 <label class="radio">
	  				<input type="radio" name="optionsRadios" id="optionsRadios2" value="entryDescription" >
					按内容
				  </label>
				
				<p>
				<label for="keyWords">请输入关键字&gt;&gt;</label>
				<input type="text" id="keyWords" class="input-medium search-query"  name="property" >
				<font color="#ff0099" size="25">&emsp;&emsp;多个关键字请用空格分开</font>
				</p>
<!--  				
 				<a href="#" onclick="testRadio()">测试一下</a>
--> 			<p>
				<h4>如果不选择时间点则默认查询所有符合条件的记录</h4>
				<h4>如果只选择一个时间点则默认以系统当前时间作为另一时间点</h4>
				
				<label for="startTimePicker">请选择起始时间点&gt;&gt;</label>	
				<input type="Text" name="timePicker1" id="startTimePicker" readonly="readonly" maxlength="25" size="25"/>
				<img src="images2/cal.gif" 
				onClick="javascript:NewCssCal('startTimePicker', 'yyyyMMdd', 'arrow', true, '24', true)"
				style="cursor:pointer" alt="点击选择日期" />
				</p>
				<p>
				<label for="endTimePicker">请选择终止时间点&gt;&gt;</label>	
				<input type="Text" name="timePicker2" id="endTimePicker" readonly="readonly" maxlength="25" size="25"/>
				<img src="images2/cal.gif" 
				onClick="javascript:NewCssCal('endTimePicker', 'yyyyMMdd', 'arrow', true, '24', true)"
				style="cursor:pointer" alt="点击选择日期"/>
				</p>
				<p><a target="innerFrame"><button type="submit" class="btn btn-primary" >开始搜索</button></a>
				<input type="reset" class="btn btn-danger" value="重 置"></p>
			 </form>
				

   		 </div> <!-- /container -->
<!--    		 
   		   <iframe name="innerFrame" width="100%" height="500" frameborder=1 src="http://www.ifeng.com"></iframe>
-->        
        </div><!--/span-->
      </div><!--/row-->
  
     
          
      <hr>

      <footer>
        <p>&copy; Company 2013</p>
      </footer>

    </div><!--/.fluid-container-->
  	<footer>
		<div>A project by <a href="http://www.rainforestnet.com">Rainforest Software Solution</a>.
		copyrights &copy; 2010-2013 Rainforest Software Solution. All rights reserved.</div>
	</footer>
  </body>
</html>
