package com.wukong.snatch.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.faces.application.Application;

public class Utils {
	
	public static String[] loadLocalOPML() {
		final String FLAG="!!!!!!!!!!";
		StringBuffer sb=null;
		try {
			String rootPath=URLDecoder.decode(getRootPath(), "utf-8"); // System.out.println("·��="+URLDecoder.decode(rootPath,"utf-8"));
			BufferedReader br = new BufferedReader(new InputStreamReader(
					new FileInputStream(new File(rootPath))));
			String line="";
			sb=new StringBuffer();
			while((line=br.readLine())!=null){
				sb.append(line+FLAG);	
			}
			
			line=sb.substring(0, sb.length()-FLAG.length()).toString();  
			if(line.contains(FLAG)){
				return line.split(FLAG);  
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * OPML�ļ�·��������Ŀ��Ŀ¼��,��ͬ��·�����ַ���"!!!!!!!!!!"���
	 * @return
	 */
	public static String getRootPath() {
		// ��Ϊ����Ϊ"Application"�����" Application.class"һ�����ҵ�
		String result = Application.class.getResource("Application.class")
				.toString();
		int index = result.indexOf("WEB-INF");
		if (index == -1) {
			index = result.indexOf("bin");
		}
		result = result.substring(0, index);
		if (result.startsWith("jar")) {
			// ��class�ļ���jar�ļ���ʱ������"jar:file:/F:/ ..."����·��
			result = result.substring(10);
		} else if (result.startsWith("file")) {
			// ��class�ļ���class�ļ���ʱ������"file:/F:/ ..."����·��
			result = result.substring(6);
		}
		if (result.endsWith("/"))
			result = result.substring(0, result.length() - 1);// ����������"/"
		return result+File.separator+"opml_urls.txt";
	}
	
	public static String extractKeyWordFromUrl(String url){
		int pre="http://rss.sina.com.cn/".length();
		String path=url.substring(pre);
		return path.substring(0, path.lastIndexOf("."));
	}
}
