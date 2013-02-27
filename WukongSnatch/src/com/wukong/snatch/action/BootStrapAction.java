package com.wukong.snatch.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wukong.snatch.dao.OpmlDAO;
import com.wukong.snatch.pojo.Opml;

public class BootStrapAction extends ActionSupport{

	private Opml opml;
	private List<com.wukong.snatch.pojo.Opml> opmls;
	private Map<String, Object> request;
	private String flag;

	public Opml getOpml() {
		return opml;
	}

	public void setOpml(Opml opml) {
		this.opml = opml;
	}
//	public List<com.wukong.snatch.pojo.Opml> getAll() {
//		return opmls;
//	}
//
//	public void setAll(List<com.wukong.snatch.pojo.Opml> opmls) {
//		this.opmls = opmls;
//	}
	public List<com.wukong.snatch.pojo.Opml> getOpmls() {
		return opmls;
	}

	public void setOpmls(List<com.wukong.snatch.pojo.Opml> opmls) {
		this.opmls = opmls;
	}
	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		flag="dddda1235656";
		return SUCCESS;
	}
	
	public String toAll(){
		OpmlDAO dao=new OpmlDAO();
		opmls=dao.findAll(); // System.out.println("OpmlNumber==:"+opmls.size());
//		HttpServletRequest request=ServletActionContext.getRequest();
//		request.setAttribute("allOpmls", opmls);
		return opmls.size()>0?"toAllOpmls":ERROR;
	}

	public String delete(){
		OpmlDAO dao=new OpmlDAO();
		Opml o=dao.findById(opml.getOpmlId());
		if(o==null){
			return "error";
		}else{
			dao.delete(o);
			return "toAllOpmls";
		}
	}
	
	/**
	 * 查询详情
	 */
	@SuppressWarnings("unchecked")
	public String detail() {
		request = (Map<String, Object>) ActionContext.getContext().get(
				"request");
		OpmlDAO dao=new OpmlDAO();
		String result=null;
		Opml o=dao.findById(opml.getOpmlId());
		
		request.put("o", o);
		if(flag.equals("detail")){
			result="detail";
		}else if(flag.equals("update")){
			result="update";
		}
		return result;
	}
	public String update(){
		OpmlDAO dao=new OpmlDAO();
		//dao.
		dao.save(opml);
		return "toList";
	}
}
