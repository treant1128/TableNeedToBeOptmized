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
	
		function buildCal(){ //��ȡ��¼����ʱ��
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
				alert("��ѡ���ʱ������!'); 
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
          <a class="brand" href="#">��Ѷ�·�</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              	��ӭ��&lt; <a href="#" class="navbar-link">${sessionScope.userName }</a>&gt;!
            </p>
            <ul class="nav">
              <li class="active"><a href="#">��ҳ</a></li>
              <li><a href="#about">����</a></li>
              <li><a href="#contact">��ϵ</a></li>
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
              <li class="nav-header">���Ż���</li>
              <li class="active"><a href="#">�ȵ�۽�</a></li>
              <li><a href="#">�����ȵ�</a></li>
              <li><a href="#">���һ��</a></li>
              <li><a href="#">����&raquo;</a></li>
              <li class="nav-header">�Ż���վ</li>
              <li><a href="#">����</a></li>
              <li class="active"><a href="#">�ٶ�</a></li>
              <li><a href="#">��Ѷ</a></li>
              <li><a href="#">�Ѻ�</a></li>
              <li><a href="#">����</a></li>
              <li><a href="#">����&raquo;</a></li>
              -->
              <li class="nav-header">Ƶ���б�</li>
              <li><a href="javascript:selectCategory('news society')">��������</a></li>
              <li><a href="javascript:selectCategory('sports')">��������</a></li>
              <li><a href="javascript:selectCategory('blog')">����Ƶ��</a></li>
              <li><a href="javascript:selectCategory('tech')">�Ƽ�����</a></li>
              <li><a href="javascript:selectCategory('finance')">�ƾ�����</a></li>
              <li><a href="javascript:selectCategory('jczs')">��������</a></li>
              <li><a href="javascript:selectCategory('eladies')">Ů������</a></li>
              <li><a href="javascript:selectCategory('auto')">��������</a></li>
              <li><a href="javascript:selectCategory('ent')">��������</a></li>
              <li><a href="javascript:selectCategory('book')">��������</a></li>
              <li><a href="javascript:selectCategory('edu')">�Ļ�����</a></li>
              <li><a href="javascript:selectCategory('house')">��������</a></li>
              <li><a href="javascript:selectCategory('games')">��Ϸ����</a></li>
              <li><a href="javascript:selectCategory('astro')">��������</a></li>
              <li><a href="javascript:selectCategory('bn')">��Ƶ����</a></li>
    <!--           <li><a href="javascript:selectCategory('���Ĳ�������')">���Բ���</a></li>   -->
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span10">
        
         
        
          <div class="hero-unit">
            <h1>ý�廯��Ѷƽ̨</h1>
            <!--  
            <p>www.wukong.com ��Ӫ��֮�������ߺ���Դ�ϵľ�����Խ��Խ���ң�����Ѵ󲿷���Դ��Ԥ��Ͷ�������罨����ն˲����ϣ�������ɱ��Խ���Ӫ����Դ���޵������...</p>
            -->
            <div class="row-fluid">
       			 <div class="span6">
            		<p><a href="snatchOPML!toSnatch" class="btn btn-primary btn-large">�����Ŀ¼Opml����������&raquo;</a></p>
            	</div>
            	<div class="span6">
            		<p><a href="snatchEntry!toSnatch" class="btn btn-primary btn-large">����Opml��������Entry &raquo;</a></p>
            	</div>
            </div>
            <div class="row-fluid">
            	<div class="span6">
            		<h3>�Զ�ץȡʱ��������</h3>
            		<select name="filePath" id="filePath" class="input_text_1">
							<option value="0">�ֶ�ץȡ</option>
							<option value="1">1Сʱ</option>
							<option value="3">3Сʱ</option>
							<option value="6">6Сʱ</option>
							<option value="12">12Сʱ</option>
							<option value="24">24Сʱ</option>
					</select> 
            	
            	</div>
            	
            	<div class="span6">
            		<h3>�Զ�����ʱ��������</h3>
            		<select name="filePath" id="filePath" class="input_text_2">
							<option value="0">�Ӳ�����</option>
							<option value="1">1��</option>
							<option value="3">3��</option>
							<option value="7">7��</option>
							<option value="30">30��</option>
							<option value="100">100��</option>
					</select> 
            	
            	</div>
            </div>
          
         
          <div class="container" >
		      
		     <h3>��������...</h3>
		     
		     <form action="snatchEntry!toSearch" class="form-search" method="post" name="submitForm">
			     <label class="radio">
	  				<input type="radio" name="optionsRadios" id="optionsRadios1" checked value="entryTitle" >
	 				������
				  </label>
				 <label class="radio">
	  				<input type="radio" name="optionsRadios" id="optionsRadios2" value="entryDescription" >
					������
				  </label>
				
				<p>
				<label for="keyWords">������ؼ���&gt;&gt;</label>
				<input type="text" id="keyWords" class="input-medium search-query"  name="property" >
				<font color="#ff0099" size="25">&emsp;&emsp;����ؼ������ÿո�ֿ�</font>
				</p>
<!--  				
 				<a href="#" onclick="testRadio()">����һ��</a>
--> 			<p>
				<h4>�����ѡ��ʱ�����Ĭ�ϲ�ѯ���з��������ļ�¼</h4>
				<h4>���ֻѡ��һ��ʱ�����Ĭ����ϵͳ��ǰʱ����Ϊ��һʱ���</h4>
				
				<label for="startTimePicker">��ѡ����ʼʱ���&gt;&gt;</label>	
				<input type="Text" name="timePicker1" id="startTimePicker" readonly="readonly" maxlength="25" size="25"/>
				<img src="images2/cal.gif" 
				onClick="javascript:NewCssCal('startTimePicker', 'yyyyMMdd', 'arrow', true, '24', true)"
				style="cursor:pointer" alt="���ѡ������" />
				</p>
				<p>
				<label for="endTimePicker">��ѡ����ֹʱ���&gt;&gt;</label>	
				<input type="Text" name="timePicker2" id="endTimePicker" readonly="readonly" maxlength="25" size="25"/>
				<img src="images2/cal.gif" 
				onClick="javascript:NewCssCal('endTimePicker', 'yyyyMMdd', 'arrow', true, '24', true)"
				style="cursor:pointer" alt="���ѡ������"/>
				</p>
				<p><a target="innerFrame"><button type="submit" class="btn btn-primary" >��ʼ����</button></a>
				<input type="reset" class="btn btn-danger" value="�� ��"></p>
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
