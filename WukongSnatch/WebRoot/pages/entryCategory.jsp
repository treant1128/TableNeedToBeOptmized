<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>悟空新闻系统</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <STYLE type="text/css"></STYLE>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery.js"></script>
	<style type="text/css">

body {
padding-top: 10px;
padding-bottom: 40px;
padding-left:10px;
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

#myModal{

	width:1000px;
	height: 800px;
	margin:0px 0px 0px -450px;
}
#myModal .modal-body{

	max-height: 980px;
}
#addTaskFrame{

	margin-left: 10px;
	margin-right: 10px;
	width: 900px;
	height: 700px;
}
</style>
   	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
//		function deleteItem(id){
//			if(window.confirm("确定要删除吗?")){
//			//	window.location.href="bootStrapAction!delete?opml.opmlId="+id;
//			}
//		}

		$(document).ready(function(){
			var sendBtn=$(".btn");
			
			$(".newsUrl").each(function(){
				//console.log($(this));
				var myself=$(this);
				var content=myself.html();
					content=content.replace("http://go.rss.sina.com.cn/redirect.php?url=","");
				myself.html(content);
			});
			
			sendBtn.click(function(){
				var myself=$(this);
				var tr=myself.parent().parent();
				var title=tr.find(".newsTitle");
				var title_content="";
				var url=tr.find(".newsUrl");
				var url_href="";
				
				var message={};
				
				if(tr[0].nodeName=="TR"){
					if(title.length>0){
						title_content=title[0].innerText;
					}else{
						title_content="错误,未找到合适的新闻标题";
					}
					
					if(url.length>0){
						url_href=url.attr("href");
					}else{
						url_href="地址错误";
					}
				}else{
					title_content="未知错误";
					url_href="未知错误";
				}
				message.title=title_content;
				message.url=url_href;
			  window.frames[0].postMessage(message, '*');
			});		
		
		});

		function detailItem(id){
			window.location.href="bootStrapAction!detail?opml.opmlId="+id+"&flag=detail";
		}
		function updateItem(id){
			window.location.href="bootStrapAction!detail?opml.opmlId="+id+"&flag=update";
		}
	</script>
	<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
  </head>
  
  <body>
  <%java.text.SimpleDateFormat formater=new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); %>
  
  <!-- 
	  <div class="pagination pagination-large">
		  <ul>
		    <li><a href="#">Prev</a></li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li><a href="#">Next</a></li>
		  </ul>
	</div>
 -->	

	<!--  
  	<table border="1" bordercolor="#ff0099">
  		<tr>
  			<td><h3>EntryId</h3></td>
  			<td><h3>EntryTitle</h3></td>
  			<td><h3>EntryLink</h3></td>
  			<td><h3>EntryAuthor</h3></td>
  			<td><h3>EntryPubDate</h3></td>
  			<td><h3>EntryDescription</h3></td>
  			<td><h3>Operation</h3></td>
  		</tr>  
   	<s:iterator var="element" value="entries">
   		<tr>
  			<td><a href="javascript:detailItem(<s:property value="#element.entryId"/>)"><s:property value="#element.entryId"/></a></td>
  			<td><s:property value="#element.entryTitle"/></td>
  			<td><a href=<s:property value="#element.entryLink"/>><s:property value="#element.entryLink"/></a></td>
  			<td><s:property value="#element.entryAuthor"/></td>
  			<td><s:property value="#element.entryPubDate"/></td>
  			<td><s:property value="#element.entryDescription"/></td>
  			<td>
  				<button onclick="javascript:updateItem(<s:property value="#element.entryId"/>)" 
  				class="btn btn-primary" type="button">下发Sms</button>
  			</td>
  		</tr>
   	</s:iterator>
   	
   	</table>
 -->  	
   	
   	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<table class="table table-hover">
						<thead>
							<tr>
					  			<td align="center" valign="middle"><h3>编号</h3></td>
					  			<td><h3>标 题</h3></td>
					  			<td><h3>链 接</h3></td>
					  			<td><h3>来 自</h3></td>
					  			<td><h3>时 间</h3></td>
					  			<td><h3>内 容</h3></td>
							</tr>
						</thead>
						<tbody>
						<tr>

  						</tr>  
  						 	<s:iterator var="element" value="entries">
						   		<tr>
						  			<td valign="middle"><s:property value="#element.entryId"/></a></td>
						  			<td class="newsTitle"><s:property value="#element.entryTitle"/></td>
						  			<td>
						  				<a class="newsUrl" target="_blank" href=<s:property value="#element.entryLink"/>>
						  					<s:property value="#element.entryLink"/>
						  				</a>
						  			</td>
						  			<td><s:property value="#element.entryAuthor"/></td>
						  			<td><s:property value="#element.entryPubDate"/></td>
						  			
						  			<td>
						  			<!--  
						  				<a href="javascript:deleteItem(<s:property value="#element.entryId"/>)">Unknown</a>
						  			-->
						  			<!--  
						  				<button onclick="javascript:updateItem(<s:property value="#element.entryId"/>)" 
						  				class="btn btn-primary" type="button">下发Sms</button>
						  			-->
						  				<a href="#myModal" role="button" class="btn" data-toggle="modal">下发</a>
						  			</td>
						  		</tr>
   							</s:iterator>
   							</tbody>
					</table>				
				</div>
			</div>
		</div>   	
   	</div>
   	
   	
   	<!-- Modal -->
   	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   		<div class="modal-header">
   			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
   			<h3 id="myModalLabel">信息下发</h3>
   		</div>
   		<div class="modal-body">
   			<iframe id="addTaskFrame" frameBorder="0" width="100%" height="100%" src="http://112.231.65.68/sdlt/login.do?input=3ph%2F2vayE7nK5gK338FM4DlhutGqcfdy"></iframe>
   		</div>
   	</div>

   	
    </body>
</html>
