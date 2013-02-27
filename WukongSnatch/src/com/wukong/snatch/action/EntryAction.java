package com.wukong.snatch.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.faces.application.Application;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wukong.snatch.dao.EntryDAO;
import com.wukong.snatch.dao.OpmlDAO;
import com.wukong.snatch.pojo.Entry;
import com.wukong.snatch.pojo.Opml;
import com.wukong.snatch.utils.EntryLoader;
import com.wukong.snatch.utils.Utils;
import com.wukong.t4.admin.action.LoginAction;

public class EntryAction extends ActionSupport implements BaseAction {
	
	private HttpServletRequest mRequest;
	private Entry entry;
	private List<Entry> entries;
	private String flag;
	private String property;
	private Map<String, Object> request;
	static{
		ActionContext.getContext().getSession().put("userSecretKeys", LoginAction.secretKeys);
		System.out.println("KeyKeyKey="+LoginAction.secretKeys);
	}
	
	public Entry getEntry() {
		return entry;
	}

	public void setEntry(Entry entry) {
		this.entry = entry;
	}

	public List<Entry> getEntries() {
		return entries;
	}

	public void setEntries(List<Entry> entries) {
		this.entries = entries;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getProperty(){
		return property;
	}
	
	public void setProperty(String property){
		this.property=property;
	}
	
	@SuppressWarnings("unchecked")
	public String toSnatch(){
		final EntryDAO dao=EntryDAO.getInstance();
		List allOpmls=OpmlDAO.getInstance().findAll();
	//	System.out.println("执行到这来了11111");  System.out.println(allOpmls.size());
	//	System.out.println("RootPath=="+Utils.getRootPath());
		for(int i=0;i<allOpmls.size();i++){
			final com.wukong.snatch.pojo.Opml o=(Opml) allOpmls.get(i);
			executorService.submit(new Runnable(){

				public void run() {
					// TODO Auto-generated method stub
					List<Entry> list=EntryLoader.getEntryList(o.getOpmlOutlineXmlUrl());
					for(Entry entry:list){
						dao.save(entry);
					}
				}
				
			});
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String toCategory(){
		//String url=	(String) ActionContext.getContext().getSession().get("url");
	//	System.out.println(url+"*******###");
		System.out.println("这里标志Flag="+flag);
		try {
			System.out.println("转码后="+new String(flag.getBytes("ISO-8859-1"),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request=(Map<String, Object>) ActionContext.getContext().get("request");
		entries=EntryDAO.getInstance().getEntryListByProperty("entryCategory", flag, null, null);
		//已经根据entry_category  进行过分类了    只需要按照like   sql进行查询即可
		request.put("entries", entries);
		return "toTargetEntries";
	}
	
	@SuppressWarnings("unchecked")
	public String toSearch(){
		if(property==null||property.trim().length()==0){
			return "NoKeywords";
		}
		mRequest=ServletActionContext.getRequest();
		String seleFieldValue=mRequest.getParameter("optionsRadios");
		
		String timePicker1=mRequest.getParameter("timePicker1");
		String timePicker2=mRequest.getParameter("timePicker2");
		
//		if(timePicker1==null){
//			System.out.println("null null null");
//		}
		
//		System.out.println("单选框optionsRadios有木有传过来=="+seleFieldValue);
//		try {
//			System.out.println("本色之="+property);
//			System.out.println("关键字重编码1后是:"
//					+ new String(property.getBytes("GBK"), Charset.forName("GB2312")));
////			System.out.println("关键字重编码2后是:"
////					+ new String(property.getBytes("UTF-8"), Charset.forName("GBK")));
////			System.out.println("关键字重编码2后是:"
////					+ new String(property.getBytes("GBK"), Charset.forName("UTF-8")));
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		request=(Map<String, Object>)ActionContext.getContext().get("request");
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(timePicker1.length()==0&&timePicker2.length()==0){
			System.out.println("没有选择 起始和终结时间----查所有的");
			entries=EntryDAO.getInstance().getEntryListByProperty(seleFieldValue , property, null, null);
		}else if(timePicker1.length()==0&&timePicker2.length()>0){
			try {
				Date seleDate=format.parse(timePicker2);
				Date currDate=new Date();
				if(seleDate.before(currDate)){
					entries=EntryDAO.getInstance().getEntryListByProperty(seleFieldValue, property, timePicker2, format.format(currDate));
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(timePicker1.length()>0&&timePicker2.length()==0){
			try {
				Date seleDate=format.parse(timePicker1);
				Date currDate=new Date();
				if(seleDate.before(currDate)){
					entries=EntryDAO.getInstance().getEntryListByProperty(seleFieldValue, property, timePicker1, format.format(currDate));
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				Date seleDate1=format.parse(timePicker1);
				Date seleDate2=format.parse(timePicker2);
				System.out.println(333);
				if(seleDate1.before(seleDate2)){
					entries=EntryDAO.getInstance().getEntryListByProperty(seleFieldValue, property, timePicker1, timePicker2);
				}else{
					entries=EntryDAO.getInstance().getEntryListByProperty(seleFieldValue, property, timePicker2, timePicker1);
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		request.put("entries", entries);
		return "toTargetEntries";
	}
}
