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
	//	String[] opml_urls = Utils.loadLocalOPML();    //不去从TomCat根目录加载
		String[] opml_urls=new String[]{
			"http://rss.sina.com.cn/sina_news_opml.xml",    //新闻中心
			"http://rss.sina.com.cn/sina_sports_opml.xml",  //体育新闻
			"http://rss.sina.com.cn/sina_blog_opml.xml",    //博客频道
			"http://rss.sina.com.cn/sina_tech_opml.xml",    //科技新闻
			"http://rss.sina.com.cn/sina_finance_opml.xml", //财经新闻
			"http://rss.sina.com.cn/sina_jczs_opml.xml",    //军事新闻
			"http://rss.sina.com.cn/sina_eladies_opml.xml", //女性新闻
			"http://rss.sina.com.cn/sina_auto_opml.xml",    //汽车新闻
			"http://rss.sina.com.cn/sina_ent_opml.xml",     //娱乐新闻
			"http://rss.sina.com.cn/sina_book_opml.xml",    //读书新闻
			"http://rss.sina.com.cn/sina_edu_opml.xml",     //文化教育
			"http://rss.sina.com.cn/sina_house_opml.xml",   //房产新闻
			"http://rss.sina.com.cn/sina_games_opml.xml",   //游戏新闻
			"http://rss.sina.com.cn/sina_astro_opml.xml",   //星座新闻
			"http://rss.sina.com.cn/sina_bn_opml.xml",      //视频新闻
		};
		if(opml_urls!=null&&opml_urls.length>0){
			for (int i = 0; i < opml_urls.length; i++) {
				final String temp=opml_urls[i];     //    System.out.println("Opml路径="+temp);
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
