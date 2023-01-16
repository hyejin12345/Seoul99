/*

명소, 자연 하나씩 데이터수집하고,
카테고리 번호는 직접 지정해주기

TNO     NOT NULL NUMBER        
TCNO             NUMBER        
NAME    NOT NULL VARCHAR2(100) 
IMAGE            VARCHAR2(1500) 
CONTENT          CLOB          
ADDR    NOT NULL VARCHAR2(300) 
HIT              NUMBER        
JJIM             NUMBER        
TLIKE            NUMBER  


*/

package com.sist.service;

import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.*;


public class TripDataCollectionService {

	public static void main(String[] args) {
		TripDataCollectionService tcs=new TripDataCollectionService();
		
		//tcs.landmarkDetailData();  //01.12 실행완료
		//tcs.natureDetailData();	 //01.12 실행완료
		//tcs.entertainmentDetailData(); // 01.12 실행완료
		//tcs.shoppingDetailData(); // 01.12 실행완료
		//tcs.FestivalDetailData(); //01.12 실행완료
	}
	
	//명소
	public void landmarkDetailData() //카테고리
	{
		TripDAO dao=new TripDAO();
		try
		{
			//확인용
//			Document doc=Jsoup.connect("https://korean.visitseoul.net/attractions?curPage="+2).get();
//				//System.out.println(doc.toString());
//			Elements link=doc.select("div.article-list-slide li.item a"); //a의 attr "href"
//			//Document doc2=Jsoup.connect("https://korean.visitseoul.net"+link.get(0).attr("href")).get();
//				//System.out.println("https://korean.visitseoul.net"+link.get(0).attr("href"));
//			Elements name=doc.select("div.infor-element-inner span:eq(0)");
//			doc=Jsoup.connect("https://korean.visitseoul.net"+link.get(0).attr("href")).get();
//				//System.out.println(name.get(0).text());
//				//System.out.println(name.get(1).text());
//				//System.out.println(name.get(2).text());
//			Elements addr=doc.select("div.detail-map-infor:eq(1) dl dd"); //addr.get(0)이 주소값
//				//System.out.println(addr.get(0).text());
			

			for(int i=1; i<=36; i++) //카테고리
			{

				//명소 N페이지 접속
				TripVO vo=new TripVO();
				Document doc=Jsoup.connect("https://korean.visitseoul.net/attractions?curPage="+i).get(); //카테고리
				//명소 N페이지에 보여지는 상세보기 링크들을 link에 저장
				Elements link=doc.select("div.article-list-slide li.item a"); //a의 attr "href"

				//아래를 for문으로 link.size()만큼 반복
					//상세보기 페이지에 접속
					//이름 : section.infor-element h3.textcenter
					//이미지 : div.wide-slide-element div.item 의 0번째
					//소개 : div.text-area
					//주소값 : div.detail-map-infor:eq(1) dl dd 의 0번째 
				
				System.out.println(i+"page");
				for(int j=0;j<link.size();j++) //8
				{
					try
					{
						doc=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
						Element name=doc.selectFirst("section.infor-element h3.textcenter");
						
						Elements imgs=doc.select("div.wide-slide-element div.item");
						String image="";
						for(int k=0;k<imgs.size();k++)
						{
							image+="https://korean.visitseoul.net"+imgs.get(k).attr("style")+"^";
						}
						image=image.substring(0,image.lastIndexOf("^"));
						image=image.replace("background-image:url('", "")
						           .replace("');", "");
						
						Element content=doc.selectFirst("div.text-area");
						
						Elements addrs=doc.select("div.detail-map-infor:eq(1) dl dd");
						String a=addrs.get(0).text();
						String addr=a.substring(a.indexOf("서울"));
						
						System.out.println(name.text());
						System.out.println(image);
						System.out.println(content.text());
						System.out.println(addr);
						System.out.println("");
						
						vo.setName(name.text());
						vo.setImage(image);
						vo.setContent(content.text());
						vo.setAddr(addr);
						dao.landmarkDetailInsert(vo); //카테고리
						
					}catch(Exception ex)
					{
						ex.printStackTrace();
					}
					
				}
				System.out.println("----------------------------------");

			}
				
		
		}catch(Exception ex) {}
	}
	
	//자연
	public void natureDetailData() //카테고리
	{
		TripDAO dao=new TripDAO();
		try
		{

			for(int i=1; i<=15; i++) //카테고리
			{

				TripVO vo=new TripVO();
				Document doc=Jsoup.connect("https://korean.visitseoul.net/nature?curPage="+i).get(); //카테고리

				Elements link=doc.select("div.article-list-slide li.item a");

				System.out.println(i+"page");
				for(int j=0;j<link.size();j++)
				{
					try
					{
						doc=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
						Element name=doc.selectFirst("section.infor-element h3.textcenter");
						Elements imgs=doc.select("div.wide-slide-element div.item");
						String image="";
						for(int k=0;k<imgs.size();k++)
						{
							image+="https://korean.visitseoul.net"+imgs.get(k).attr("style")+"^";
						}
						image=image.substring(0,image.lastIndexOf("^"));
						image=image.replace("background-image:url('", "")
						           .replace("');", "");
						
						Element content=doc.selectFirst("div.text-area");
						Elements addrs=doc.select("div.detail-map-infor:eq(1) dl dd");
						String a=addrs.get(0).text();
						String addr=a.substring(a.indexOf("서울"));
			
						System.out.println(name.text());
						System.out.println(image);
						System.out.println(content.text());
						System.out.println(addr);
						System.out.println("");
						
						vo.setName(name.text());
						vo.setImage(image);
						vo.setContent(content.text());
						vo.setAddr(addr);
						dao.natureDetailInsert(vo); //카테고리
						
					}catch(Exception ex)
					{ 
						ex.printStackTrace();
					}
					
				}
				System.out.println("----------------------------------");

			}
				
		}catch(Exception ex) {}
	}

	//즐길거리
	public void entertainmentDetailData() //카테고리
	{
		TripDAO dao=new TripDAO();
		try
		{

			for(int i=1; i<=26; i++) //카테고리
			{

				TripVO vo=new TripVO();
				Document doc=Jsoup.connect("https://korean.visitseoul.net/entertainment?curPage="+i).get(); //카테고리

				Elements link=doc.select("div.article-list-slide li.item a");

				System.out.println(i+"page");
				for(int j=0;j<link.size();j++)
				{
					try
					{
						doc=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
						Element name=doc.selectFirst("section.infor-element h3.textcenter");
						Elements imgs=doc.select("div.wide-slide-element div.item");
						String image="";
						for(int k=0;k<imgs.size();k++)
						{
							image+="https://korean.visitseoul.net"+imgs.get(k).attr("style")+"^";
						}
						image=image.substring(0,image.lastIndexOf("^"));
						image=image.replace("background-image:url('", "")
						           .replace("');", "");
						
						Element content=doc.selectFirst("div.text-area");
						Elements addrs=doc.select("div.detail-map-infor:eq(1) dl dd");
						String a=addrs.get(0).text();
						String addr=a.substring(a.indexOf("서울"));
			
						System.out.println(name.text());
						System.out.println(image);
						System.out.println(content.text());
						System.out.println(addr);
						System.out.println("");
						
						vo.setName(name.text());
						vo.setImage(image);
						vo.setContent(content.text());
						vo.setAddr(addr);
						dao.entertainmentDetailInsert(vo); //카테고리
						
					}catch(Exception ex)
					{ 
						ex.printStackTrace();
					}
					
				}
				System.out.println("----------------------------------");

			}
				
		}catch(Exception ex) {}
	}
	
	//쇼핑
	public void shoppingDetailData() //카테고리
	{
		TripDAO dao=new TripDAO();
		try
		{

			for(int i=1; i<=21; i++) //카테고리
			{

				TripVO vo=new TripVO();
				Document doc=Jsoup.connect("https://korean.visitseoul.net/shopping?curPage="+i).get(); //카테고리

				Elements link=doc.select("div.article-list-slide li.item a");

				System.out.println(i+"page");
				for(int j=0;j<link.size();j++)
				{
					try
					{
						doc=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
						Element name=doc.selectFirst("section.infor-element h3.textcenter");
						Elements imgs=doc.select("div.wide-slide-element div.item");
						String image="";
						for(int k=0;k<imgs.size();k++)
						{
							image+="https://korean.visitseoul.net"+imgs.get(k).attr("style")+"^";
						}
						image=image.substring(0,image.lastIndexOf("^"));
						image=image.replace("background-image:url('", "")
						           .replace("');", "");
						
						Element content=doc.selectFirst("div.text-area");
						Elements addrs=doc.select("div.detail-map-infor:eq(1) dl dd");
						String a=addrs.get(0).text();
						String addr=a.substring(a.indexOf("서울"));
			
						System.out.println(name.text());
						System.out.println(image);
						System.out.println(content.text());
						System.out.println(addr);
						System.out.println("");
						
						vo.setName(name.text());
						vo.setImage(image);
						vo.setContent(content.text());
						vo.setAddr(addr);
						dao.shoppingDetailInsert(vo); //카테고리

					}catch(Exception ex)
					{ 
						ex.printStackTrace();
					}
					
				}
				System.out.println("----------------------------------");

			}
				
		}catch(Exception ex) {}
	}
	
	//행사
	public void FestivalDetailData() //카테고리
	{
		TripDAO dao=new TripDAO();
		try
		{

	
				FestivalVO vo=new FestivalVO();
				Document doc=Jsoup.connect("https://korean.visitseoul.net/events").get(); //카테고리

				Elements link=doc.select("div.article-list-slide li.item a");

				
				for(int j=0;j<link.size();j++)
				{
					try
					{
						doc=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
						Element name=doc.selectFirst("section.infor-element h3.textcenter");
						Elements imgs=doc.select("div.wide-slide-element div.item");
						String image="";
						for(int k=0;k<imgs.size();k++)
						{
							image+="https://korean.visitseoul.net"+imgs.get(k).attr("style")+"^";
						}
						image=image.substring(0,image.lastIndexOf("^"));
						image=image.replace("background-image:url('", "")
						           .replace("');", "");
						
						Element content=doc.selectFirst("div.text-area");
						Element period=doc.selectFirst("div.detial-cont-element dl:eq(0) dd");
						Element web=doc.selectFirst("div.detial-cont-element dl a");
						
						Elements addrs=doc.select("div.detail-map-infor:eq(1) dl dd");
						String a=addrs.get(0).text();
						String addr=a.substring(a.indexOf("서울"));
						
						System.out.println(name.text());
						System.out.println(image);
						System.out.println(content.text());
						System.out.println(period.text());
						System.out.println(web.attr("href"));
						System.out.println(addr);
						System.out.println("");
						
						vo.setName(name.text());
						vo.setImage(image);
						vo.setContent(content.text());
						vo.setPeriod(period.text());
						vo.setWeb(web.attr("href"));
						vo.setAddr(addr);
						dao.festivalDetailInsert(vo); //카테고리
						
					}catch(Exception ex)
					{ 
						ex.printStackTrace();
					}
					
				}

		}catch(Exception ex) {}
	}
}
