package com.wukong.t4.admin.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wukong.t4.common.DBToolkit;
import com.wukong.t4.common.DESUtils;

public class LoginAction extends ActionSupport {
	public static final String key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCAAzp8YDDp7y3OmWeoobO6YuR3DF1gougKsY3RulBwlTQqQz5HuqxgkDDVNUFlfExWMe5mEr0qdZ1n/vLepLcT6thAHRadi+CfhypT10B0HDblyB7W6OIREZEQErrOSLcc9Knjn3tL41yxemVp0XK0C3MG6q1ikwWQXNLW6nPXaQIDAQAB";
	public static String secretKeys;
	public String userName;
	public String userPassword;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String execute(){
//		
//		if(input == null || "".equals(input)){
//			return "error";
//		}
//		String key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCAAzp8YDDp7y3OmWeoobO6YuR3DF1gougKsY3RulBwlTQqQz5HuqxgkDDVNUFlfExWMe5mEr0qdZ1n/vLepLcT6thAHRadi+CfhypT10B0HDblyB7W6OIREZEQErrOSLcc9Knjn3tL41yxemVp0XK0C3MG6q1ikwWQXNLW6nPXaQIDAQAB";
//		
//		DESUtils crypt = new DESUtils(key);
//		try {
//			input =  crypt.decrypt(input);
//		} catch (Exception e) {
//			System.out.println("2");
//			e.printStackTrace();
//			return "error";
//		}
//		String[] userInfo = input.split("&");
//		if(userInfo==null||userInfo.length<3){
//			return "error";
//		}
//		String username =userInfo[0];
//		String password = userInfo[1];
//		String service = userInfo[2];
//		String path = WebUtil.getBasePath();
//		String localPower="";
//		boolean flag=false;
//	    Properties props = new Properties();
//	    try {
//			props.load(DBToolkit.class.getResourceAsStream("/properties/t4-configuration.properties"));
//			localPower = (props.getProperty("power"));
//		} catch (IOException e2) {
//			// TODO Auto-generated catch block
//			e2.printStackTrace();
//		}
		
		Connection conn  = DBToolkit.getConnection();
		StringBuffer sql = new StringBuffer("select * from users where name = '");
		sql.append(userName).append("' and password = '").append(userPassword).append("'");
		ResultSet rs = DBToolkit.executeQuery(conn, sql.toString());
		try {
			if(rs.next()){
//				String powers = rs.getString("power");
//				String power[] = powers.split(",");
//				for(int i = 0 ; i < power.length ; i ++){
//					if(power[i].equals("-1")){
//						flag=true;
//					}else if(power[i].equals(localPower)){
//						flag=true;
//					}
//					
//				}
				DESUtils crypt=new DESUtils(key);
				try {
					secretKeys = URLEncoder.encode(crypt.encrypt(rs.getString("name")+"&"+rs.getString("password")+"&sms"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Map<String, Object> session=(Map<String, Object>) ActionContext.getContext().getSession();
				session.put("userName", rs.getString("username"));
//				session.put("userSecretKeys", secretKeys);
	//			System.out.println("”√ªß√˚="+userName+", √‹¬Î="+userPassword);
			}else{
				return "loginerror";
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		DBToolkit.closeConnection(conn, null, rs);
		return "LoginSuccess";
	}
}
