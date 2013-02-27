<%@page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
<head>
<title>唔箜后台</title>
<%@include file="/include/lib.jsp"%>
  
<script src="<s:url value="/js/plugins/jquery.easyInsert.js"/>" type="text/javascript"></script>

<script src="http://code.jquery.com/jquery.js"></script>

<style type="text/css">
.mytb{margin-top: 3px;z-index: 10000;}
/* 列表table */
table.listTable{width:100%;border:1px solid black;margin-top: 5px;border-top-width: 0px; }
table.listTable td{ padding:5px 10px 0 15px; text-align:left; border-top:1px solid black; background:#FFFFFF;border-left-width: 0px;border-right-width: 0px;}

</style>
<script type="text/javascript">
	
	$(function() {
		var result='${result}';
		if(result!=""&&result=="1"){
			//jAlert('success', '操作已成功!', '操作提示');
			
			$("#smsTaskForm").attr("action", "<%=request.getContextPath()%>/smsManage/smsTaskList.do?method=query");
			$("#smsTaskForm").submit();
		}
		$.formValidator.initConfig({formid:"smsTaskForm",onerror:function(msg){jAlert('error', msg, '错误提示！');}});
		$("#sendTitle").formValidator({empty:false,onshow:"下发语不能为空",onempty:"下发语不能为空"}).inputValidator({min:1,onerror:"下发语不能为空"}).regexValidator({regexp:"^[\\S]\.*$",onerror:"下发语不正确"});;
		$("#sendOUrl").formValidator({onshow:"URL必须以 http:// 或者 https:// 开始 "}).regexValidator({regexp:"^\(http|https):\/\/(\\S)+$",onerror:"url不正确"});
		
		$("#method1").click( function () { 
			   $("#purl").show();
			   $("#purl_bt").show();
			   $("#sendOUrl").val("");
			   $("#sendOUrl").attr("disabled",false); 
			   $("#sendOUrl").formValidator({onshow:"URL必须以 http:// 或者 https:// 开始 "}).regexValidator({regexp:"^\(http|https):\/\/(\\S)+$",onerror:"url不正确"});
		});
		$("#method0").click( function () { 
			  // $("#purl").hide();
			   //$("#purl_bt").hide();
			 //  $("#sendOUrl").val("http://wukong.com");
			   $("#sendOUrl").formValidator({onshow:"URL必须以 http:// 或者 https:// 开始 "}).regexValidator({regexp:"^$|^\(http|https):\/\/(\\S)+$",onerror:"url不正确"});
			   //$("#sendOUrl").attr("disabled",true); 
		});
		
		$("#itType").click( function () { 
			   $("#itDiv").toggle(1000);
		});
		
		$("#filePath").change(function(){
			$("#numDiv").html("");
			var fp=$("#filePath").val();
			if(typeof(fp) == "undefined" || $.trim(fp)=="")
				return;
			$.getJSON(
					'<s:url value="/smsManage/getFileList.do"/>', 
					{ "filePath":fp,"isVip":<s:property value="isVip"/>},
					function(data){
						if(data==null)
							return;
						var numHtm="";
						$.each(data,function(idx,item){ 
							numHtm = numHtm + "<span style='width:250px;display:inline-block;'><input name='numFiles' value='"+item.name+"' type='checkbox'>"+item.name+"("+item.linenum+")</span>";
						});
						$("#numDiv").html(numHtm);			
					}
				);
		});
		
		$("#taskBtn").click(function(){
			$("#taskDiv").html("");
			var btd = $("#btDate").val();
			if(typeof(btd) == "undefined" || $.trim(btd)=="")
				return;
			$.getJSON(
					'<s:url value="/smsManage/getTaskList.do"/>', 
					{ "btDate":btd },
					function(data){
						if(data==null)
							return;
						zhankai();
						var taskHtm="<table class='listTable' cellSpacing='0' cellPadding='0'><tr><td>选择</td><td>标题</td><td>号码包</td><td>描述</td></tr>";
						$.each(data,function(idx,item){ 
							taskHtm = taskHtm + "<tr><td><input type='checkbox' value='"+item.excfile+"' name='qcFiles' checked='checked'/></td><td>"+item.sendTitle+"</td><td>"+item.srcfile+"</td><td>"+item.content+"</td></tr>";
						});
						taskHtm=taskHtm+"</table>";
						$("#taskDiv").html(taskHtm);			
					}
				);
		});
		
 		$("#button_submit").click(function(){
			if(!checkNumF())
			{
				jAlert('error', '请选择号码包！', '错误提示！');
				return;
			}
			if(!checkIt())
			{
				jAlert('error', '请正确填写下发时间段！', '错误提示！');
				return;
			}
			var jump31597 = $("#tofns").val();
			var jumpMP = $("#MP").val();
			var myappgo = $("#myappgoH").val();
			if(myappgo==1){
				$("#jump").val("2")
			}else{
				if(jump31597==0&&jumpMP==0){
					$("#jump").val("0")
				}else if(jump31597==0&&jumpMP==1){
					$("#jump").val("4")
				}else if(jump31597==1&&jumpMP==0){
					$("#jump").val("1")
				}else if(jump31597==1&&jumpMP==1){
					$("#jump").val("3")
				}
			}
			$("#smsTaskForm").submit();
		});
		
		//$("#bnShouqi").click(function(){
		//	var bnShouqi = document.getElementById("#div_shouqi");
		//	alert(bnShouqi.innerHTML);
		//	bnShowqi.disabled="true";
		//	alert("11");
		//}
		//);
 		
 		$("#demo2").easyinsert({
 			name: ["intervlTimes"],
 			type: ["wk"]
 		});
		
	});
	function checkNumF(){
		var flag = false;
		var nf = $("input[name=numFiles]:checkbox");
		if(typeof(nf) == "undefined"||nf.length==0){
			return flag;
		}
		$("input[name=numFiles]:checkbox").each(function () { 
			if ($(this).attr("checked")==true) { 
				flag=true;				
			} 
		});
		return flag;
	}
	function checkIt(){
		var flag = true;
		if($("input[name=itType]:checkbox").attr("checked")==true){
			$("input[name=intervlTimes]:text").each(function () { 
				if ($(this).attr("value")=="") { 
					flag=false;				
				} 
			});
		}
		return flag;
	}
	function checkSetTime(divId,flag){
	    if(1 == flag){
	        document.getElementById(divId).style.display='block';
	        $("#sendTime").attr("disabled",false); 
	    }else{
	        document.getElementById(divId).style.display='none';
	        $("#sendTime").attr("disabled",true); 
	    }

	}
	
	function shouqi(){
		//$("#taskDiv").hide();
		document.getElementById("taskDiv").style.display="none";
	}
	function zhankai(){
		document.getElementById("taskDiv").style.display="block";
	}
	
	function  set31597(value){
		$("#tofns").val(value);
	}
	
	function  setMP(value){
		$("#MP").val(value);
	}
	
	function setMyappgo(value){
		var myappgo = document.getElementById("myappgo").checked;
		if(myappgo){
			$("#myappgoH").val("1");
			$("#jump0").attr("disabled",true); 
			$("#jump1").attr("disabled",true); 
			$("#MP0").attr("disabled",true); 
			$("#MP1").attr("disabled",true); 
		}else{
			$("#myappgoH").val("0");
			$("#jump0").attr("disabled",false); 
			$("#jump1").attr("disabled",false); 
			$("#MP0").attr("disabled",false); 
			$("#MP1").attr("disabled",false); 
		}
	}
	
	function checkAllNum(obj){
		var numFiles = document.getElementsByName("numFiles");
		var length = numFiles.length;
		if(obj.checked){
			for(var i =0 ; i < length ; i++){
				numFiles[i].checked = true;
			}
		}else{
			for(var i =0 ; i < length ; i++){
				numFiles[i].checked = false;
			}
		}
		//numFiles
	}
	function reverseAllNum(obj){
		var numFiles = document.getElementsByName("numFiles");
		var length = numFiles.length;
		for(var i =0 ; i < length ; i++){
			if(numFiles[i].checked){
				numFiles[i].checked = false;
			}else{
				numFiles[i].checked = true;
			}
			
		}
		//numFiles
	}
</script>

<script type="text/javascript">
	$(document).ready(function(){
		window.onmessage=function(event){
			console.log(event.data);
			var message=event.data;
			var title=$("#sendTitle");
			var url=$("#sendOUrl");
				title.val(message.title);
				url.val(message.url);
		};
	});
</script>

</head>
-->
<head>
<title>唔箜后台</title>
<script src="http://code.jquery.com/jquery.js"></script>

<style type="text/css">
.mytb{margin-top: 3px;z-index: 10000;}
/* 列表table */
table.listTable{width:100%;border:1px solid black;margin-top: 5px;border-top-width: 0px; }
table.listTable td{ padding:5px 10px 0 15px; text-align:left; border-top:1px solid black; background:#FFFFFF;border-left-width: 0px;border-right-width: 0px;}

</style>
<script type="text/javascript">
			$(document).ready(function(){
				window.onmessage = function(event) {
    				console.log(event.data);
    				var message=event.data;
    				var title=$("#sendTitle");
    				var url=$("#sendOUrl");
    					title.val(message.title);
    					url.val(message.url);
				};
			});
</script>
</head>
<body>
	<jsp:include page="/include/headerSMS.jsp"/>
	<jsp:include page="/include/smsli.jsp"/>
	<br>
	<s:form action="/smsManage/saveSmsTask.do" id="smsTaskForm" name="smsTaskForm" method="post">
		
		<s:if test="isVip==1">
		   <span style="margin-left:8px;color:#2EA8C0;FONT-SIZE: 12pt">VIP任务不进行白名单过滤，存在业务风险，请谨慎！</span>
		</s:if>		
		<span id="infols"></span>
		<table width="100%" class="infoForm">
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			<tr>
				<td class="tdL">选择文件：</td>
				<td class="tdR">
					<select name="filePath" id="filePath" class="input_text_2">
						<option></option>
					    <s:iterator value="directoryList" id="dls" >
							<option value="<s:property value="#dls.name"/>"><s:property value="#dls.name"/></option>
						</s:iterator>         
					</select> 
					<span style="margin-left:3px;color:#FF7F00;">(选择文件夹)</span>
					全选<input type="checkbox" name="numFile" id="checkAll" onclick="checkAllNum(this)">
					反选<input type="checkbox" name="numFileReverse" id="reverseAll" onclick="reverseAllNum(this)">
					<div id="numDiv"></div>
					<div id="numFileTip" style="width:250px;"></div>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			<tr>
				<td class="tdL">去重任务：</td>
				<td class="tdR">
					 <input type="text" class="input_text_2" name="btDate" id="btDate" value='<s:date name="btDate" format="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly"/>&nbsp;&nbsp;
					 <input type="button" value="查询任务" id="taskBtn"/><a href="#" id="bnShouqi" onclick="shouqi()">收起</a>&nbsp;&nbsp;&nbsp;<a href="#" id="bnShouqi" onclick="zhankai()">展开</a><font color="red">（*注：不点查询任务不与其他任务去重）</font>
					 <span style="margin-left:3px;color:#FF7F00;">(选择日期查询任务)</span>
					 <div id="taskDiv"></div>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			<tr>
				<td class="tdL">下发时间：</td>
				<td class="tdR">
					<input type="radio" name="smsTask.sendTimeType" id="send_status0" value="0" onclick="javascript:checkSetTime('timediv',0);" checked="checked"/>立即下发&nbsp;&nbsp;
					<input type="radio" name="smsTask.sendTimeType" id="send_status1" value="1" onclick="javascript:checkSetTime('timediv',1);"/>定时下发&nbsp;&nbsp;
					<input type="radio" name="smsTask.sendTimeType" id="send_status2" value="2" onclick="javascript:checkSetTime('timediv',0);"/>稍后指定&nbsp;&nbsp;
						        <div style="display:none;padding:6px 0 2px 20px;" id="timediv">
								        开始时间：<input type="text" name="smsTask.sendTime" id="sendTime" value="<s:date name="btDate" format="yyyy-MM-dd HH:mm:00"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00',minDate:'<s:date name="btDate" format="yyyy-MM-dd HH:mm:00"/>',isShowClear:false,readOnly:true})"/> 
					        	</div>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM"></td>
			</tr>
			<tr>
				<td class="tdL">下发语：</td>
				<td class="tdR">
					<!-- <input class="input_text_1" name="smsTask.sendTitle" id="sendTitle1" maxlength="100" type="text"/> -->
					<textarea name="smsTask.sendTitle" id="sendTitle" cols='78' rows='3' onkeyup="value=value.replace(/[\r\n]/g,'')"></textarea> <span style="margin-left:3px;color:#FF7F00;">请不要输入回车！</span>
					        	<div id="sendTitleTip"></div>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			<tr id="purl">
				<td class="tdL">下发URL：</td>
				<td class="tdR">
 					<input class="input_text_1" name="smsTask.sendOUrl" id="sendOUrl" value="" type="text"/>
					<div id="sendOUrlTip"></div>
				</td>
			</tr>
			<tr id="purl_bt">
				<td class="tdL">&nbsp;</td>
				<td class="tdM"></td>
			</tr>
			
			<tr>
				<td class="tdL">描述：</td>
				<td class="tdR">
					<input class="input_text_1" name="smsTask.content" value="" type="text"/>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM"></td>
			</tr>
			<tr>
				<td class="tdL">优先级：</td>
				<td class="tdR">
					<select name="smsTask.priority">
					                <option value="0">0</option>
					                <option value="1">1</option>
					                <option value="2">2</option>
					                <option value="3">3</option>
					                <option value="4">4</option>
					                <option value="5">5</option>
					                <option value="6">6</option>
					                <option value="7">7</option>
					                <option value="8">8</option>
					                <option value="9">9</option>
					            </select>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			
			<tr>
				<td class="tdL">方式：</td>
				<td class="tdR">	
					<label style="width:100px;display:inline-block;"><input type="radio" name="smsTask.method" id="method0" value="0"/>短信</label>
					            <input type="radio" name="smsTask.method" id="method1" value="1" checked="checked" />push
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdM">&nbsp;</td>
			</tr>
			
			<s:if test="isVip==1">
			<s:hidden name="smsTask.vip" value="1"></s:hidden>
			<s:hidden name="smsTask.blackFilter" value="0"></s:hidden>
			</s:if>		
			
			<tr>
				<td class="tdL">是否保留长标题：</td>
				<td class="tdR">
				<input type="radio" name="smsTask.longTitle" id="longTitle" value="0" checked="checked"/>否&nbsp;&nbsp;
				<input type="radio" name="smsTask.longTitle" id="longTitle" value="1"/>是
					 <span style="margin-left:6px;color:#FF7F00;">保留长标题将不对标题截断，否则下发标题会根据一条短信的长度适合截断!</span>
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">myappgo：</td>
				<td class="tdR">
					<input type="checkbox" name="myappgo" id="myappgo" value="2"  onclick="setMyappgo('2')"/>myappgo&nbsp;&nbsp;
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">跳出31597：</td>
				<td class="tdR">
					 <input type="radio" name="jump" id="jump0" value="0" checked="checked" onclick="set31597('0')"/>否&nbsp;&nbsp;
					 <input type="radio" name="jump" id="jump1" value="1"  onclick="set31597('1')"/>是&nbsp;&nbsp;
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">进入微门户：</td>
				<td class="tdR">
					 <input type="radio" name="MP" id="MP0" value="0" checked="checked" onclick="setMP('0')"/>否&nbsp;&nbsp;
					 <input type="radio" name="MP" id="MP1" value="1"  onclick="setMP('1')"/>是&nbsp;&nbsp;
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">去重规则：</td>
				<td class="tdR">
					<input type="radio" name="smsTask.qcType" id="qcType7" value="7" checked="checked"/>完全去重&nbsp;&nbsp;
					<input type="radio" name="smsTask.qcType" id="qcType6" value="6" />仅和预置列表去重&nbsp;&nbsp;
					<input type="radio" name="smsTask.qcType" id="qcType5" value="5" />仅和已发去重&nbsp;&nbsp;
					<input type="radio" name="smsTask.qcType" id="qcType0" value="0" />不去重&nbsp;&nbsp;
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL">下发时间段：</td>
				<td class="tdR">
				 <input type="checkbox" name="itType" id="itType" value="1"/>
				 <span style="margin-left:6px;color:#FF7F00;">勾选自定义下发时间段，否则采用默认时间段!</span>
				<div id="itDiv" style="display:none; ">
					<ul id="demo2"></ul>
					<a href="#">+ 添加</a>
				</div>
				</td>
			</tr>			
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
				</td>
			</tr>
			<tr>
				<td class="tdL"></td>
				<td class="tdR">
					<input type="hidden" value="<s:property value="isVip"/>" name="isVip"/>
					<input type="hidden" value="0" name="tofns" id="tofns"/>
					<input type="hidden" value="0" name="myappgoH" id="myappgoH"/>
					<input type="hidden" value="0" name="MP" id="MP"/>、
					<input type="hidden" value="" name="smsTask.jump" id="jump"/>
					<input type="button" name="button_submit" id="button_submit" value="提交"/>
				</td>
			</tr>
			<tr>
				<td class="tdL">&nbsp;</td>
				<td class="tdR">&nbsp;</td>
			</tr>
		</table>
	</s:form>
	</body>
	<script type="text/javascript">
	
	
	</script>
</html>
