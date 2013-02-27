package com.wukong.snatch.action;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.opensymphony.xwork2.ActionSupport;
import com.wukong.snatch.dao.OpmlDAO;
import com.wukong.snatch.utils.OPMLParser;
import com.wukong.snatch.utils.Utils;

public class OPMLAction extends ActionSupport implements BaseAction {

	
	
	public String toSnatch() {
	//	String[] opml_urls = Utils.loadLocalOPML();    //��ȥ��TomCat��Ŀ¼����
		String[] opml_urls=new String[]{
			"http://rss.sina.com.cn/sina_news_opml.xml",    //��������
			"http://rss.sina.com.cn/sina_sports_opml.xml",  //��������
			"http://rss.sina.com.cn/sina_blog_opml.xml",    //����Ƶ��
			"http://rss.sina.com.cn/sina_tech_opml.xml",    //�Ƽ�����
			"http://rss.sina.com.cn/sina_finance_opml.xml", //�ƾ�����
			"http://rss.sina.com.cn/sina_jczs_opml.xml",    //��������
			"http://rss.sina.com.cn/sina_eladies_opml.xml", //Ů������
			"http://rss.sina.com.cn/sina_auto_opml.xml",    //��������
			"http://rss.sina.com.cn/sina_ent_opml.xml",     //��������
			"http://rss.sina.com.cn/sina_book_opml.xml",    //��������
			"http://rss.sina.com.cn/sina_edu_opml.xml",     //�Ļ�����
			"http://rss.sina.com.cn/sina_house_opml.xml",   //��������
			"http://rss.sina.com.cn/sina_games_opml.xml",   //��Ϸ����
			"http://rss.sina.com.cn/sina_astro_opml.xml",   //��������
			"http://rss.sina.com.cn/sina_bn_opml.xml",      //��Ƶ����
		};
		if(opml_urls!=null&&opml_urls.length>0){
			for (int i = 0; i < opml_urls.length; i++) {
				final String temp=opml_urls[i];     //    System.out.println("Opml·��="+temp);
				executorService.submit(new Runnable(){

					public void run() {
						// TODO Auto-generated method stub
						List<com.wukong.snatch.pojo.Opml> list = OPMLParser
						.getOPMLList(temp);
						OpmlDAO dao = OpmlDAO.getInstance();
						for (com.wukong.snatch.pojo.Opml o : list) {
							dao.save(o);
						}
					}
					
				});
			}
		}
		
		return SUCCESS;
	}
}
