package com.my.web.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.my.service.MagService;
import com.my.web.model.CollectMessage;
import com.my.web.model.Magzine;
import com.my.web.model.Music;
import com.my.web.model.PageBean;
import com.my.web.model.UserMessage;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class MagAction extends ActionSupport{
	@Autowired 
	MagService magService;
	public String userId;
	public PageBean<Magzine> page=new PageBean<Magzine>();
	
	public String list(){
		//查询四条最新期刊数据填充到首页
		
		
		List<Magzine> newMagList=magService.getNew();
		ActionContext.getContext().put("newMagList", newMagList);
		//查询四条热门期刊数据填充到首页
		List<Magzine> hotMagList=magService.gethot();
		ActionContext.getContext().put("hotMagList", hotMagList);
		return "list";
	}
	
	public String showSongs(){
		//填充player页面
		String magId = ServletActionContext.getRequest().getParameter("magId");
		Long magid=new Long(magId);
		List<Music> newMusicList=magService.getSongs(magid);
		ActionContext.getContext().put("newMusicList", newMusicList);
		
		Magzine mag=magService.getMagById(magid);
		ActionContext.getContext().put("mag", mag);
		return "player";
		}
	
	public String allList(){
		//查询所有期刊数据填充到杂志页面
		page.setDataTotal(magService.getCount());
		if(page.getPageNum()==0){
			page.setPageNum(1);
		}else{
			page.setPageNum(page.getPageNum()+1);
		}
		List<Magzine> allMagList=magService.getByPage(page);
		page.setList(allMagList);
		System.out.println(page.getPageNum());
		ActionContext.getContext().put("page", page);
		return "allList";
	}
	public String category;
	public String radio() throws UnsupportedEncodingException{
		//查询radio分类信息填充到电台页面
		
		category=new String(category.getBytes("iso-8859-1"),"utf-8");
		List<Magzine> magList=magService.getRadio(category);
		List<Music> allMusicList=new ArrayList<Music>();
		List<String> urls = new ArrayList<String>();
		for(int i = 0 ; i < magList.size() ; i ++){
			
			List<Music> musicList =magService.getMusic(magList.get(i).getId());
			for (Music music : musicList) {
				urls.add(music.getUrl());
				
			}
			
		}
		Object[] urlss =  urls.toArray();
		System.out.println(urls.size()+"---------------------------");
		
		/*for (Magzine magzine : magList) {
			System.out.println(musicList.get(0).getUrl());
			for (Music music : musicList) {
				allMusicList.add(music);
				
			}
		}*/
			/*List<Music> musicList =magService.getMusic(iterator.next().getId());
			System.out.println(musicList.get(0).getUrl());
		*/
		ActionContext.getContext().put("urls", urlss);
		return "radio";
	}
	public Magzine ma=new Magzine();
	public String[] mcsnames=new String[10];
	public String[] mcsurls=new String[10];
	public String[] mcsauthors=new String[10];
	public String[] mcsalbums=new String[10];
	public String maAdd() throws UnsupportedEncodingException{
		ma.setCategory(new String(ma.getCategory().getBytes("iso-8859-1"),"utf-8"));
		List<Music> mcs=new ArrayList<Music>(10);
		for(int i=0;i<10;i++){
			Music m=new Music();
			m.setUrl(mcsurls[i]);
			m.setName(mcsnames[i]);
			m.setAuthor(mcsauthors[i]);
			m.setAlbum(mcsalbums[i]);
			m.setMag(ma);
			mcs.add(m);
		}
		magService.addMagAndMusic(mcs,ma);
		ServletActionContext.getRequest().setAttribute("message","添加成功！");
//		ActionContext.getContext().put("message","添加成功!");
		return "maAdd";
	}
	//用户注册
	public String userName;
	public String userPassword;
	 public String regist(){
		UserMessage um=new UserMessage();
        System.out.println(userName+"dsf "+userPassword);
        um.setUserName(userName);
        um.setUserPassword(userPassword);
        magService.saveUser(um);
		return "to_main";
	}
	 
	 
	 //用户登录
	public String loginName;
	public String loginPwd;
	 public String login() throws IOException{
		 UserMessage loginUser=magService.login(loginName,loginPwd);
		 UserMessage nowUser = magService.findByNameAndPwd(loginName,loginPwd);
		 if(loginUser==null){
			 ServletActionContext.getResponse().getWriter().write("login_error");
		 }else{
			 ActionContext.getContext().getSession().put("loginUser", loginUser);
			 ActionContext.getContext().getSession().put("nowUser", nowUser);
			 //ServletActionContext.getRequest().getSession().invalidate();注销方法
			 ServletActionContext.getResponse().getWriter().write(loginUser.getUserName());
		 }
		 return null;
	 }
	 public String listCollec(){
		 UserMessage user = magService.findById(((UserMessage)ServletActionContext.getRequest().getSession().getAttribute("nowUser")).getId());
		 if(user!=null){
			 Set<Magzine> musics = user.getMusics();
			 List<Magzine> listMusic = new ArrayList<Magzine>(musics);
			 ActionContext.getContext().put("listMusic", listMusic);
			 int flag=0;
			 ActionContext.getContext().put("flag", flag);	 
		 }
		 return "collectList";
	 }
	 //注销
	 public String logout(){
		 ServletActionContext.getRequest().getSession().invalidate();
		 return "to_main";
	 }
	 
	 
	//收藏功能的实现
	public String magId;
	 public void coll() throws Exception{
		 //先获取查看是否存在该选项
		 ServletActionContext.getResponse().setContentType("text/html:charset=UTF-8");
		 UserMessage user = magService.findById(((UserMessage)ServletActionContext.getRequest().getSession().getAttribute("nowUser")).getId());
		 boolean flag= magService.findCMBymIdAnduId(magId, user.getId());
		 if(!flag){
			 System.out.println("");
			 magService.cancleCollect(magId,user.getId());
			 ServletActionContext.getResponse().getWriter().write("no");
		 }else{
			 magService.addCollect(magId,user.getId());
			 ServletActionContext.getResponse().getWriter().write("yes");
		 }
		 /*CollectMessage findCMBymIdAnduId = magService.findCMBymIdAnduId(magId, userId);
		 if(findCMBymIdAnduId!=null){
			 magService.cancleColl(findCMBymIdAnduId);
			 ServletActionContext.getResponse().getWriter().write("收藏已取消");
			 return;
		 }
		 CollectMessage collmess = new CollectMessage();
		 collmess.setMagId(magId);
		 collmess.setUserId(userId);
		 magService.saveMag(collmess);
		 ServletActionContext.getResponse().getWriter().write("收藏成功");*/
	 }
	 
	 //推荐功能的实现
	 public String tuijian(){
		 UserMessage user = magService.findById(((UserMessage)ServletActionContext.getRequest().getSession().getAttribute("nowUser")).getId());
		 Set<Magzine> musics = user.getMusics();
		 List<Magzine> list = new ArrayList<Magzine>(musics);
		 List<Magzine> listMg=magService.findMagnizeByHos(list);
		 System.out.println(listMg.get(0).getCategory()+"========================");
		 ActionContext.getContext().put("listMg", listMg);
		 int flag=1;
		 ActionContext.getContext().put("flag", flag);
		 return "tuijian";
	 }
	 
		public MagService getMagService() {
			return magService;
		}

		public void setMagService(MagService magService) {
			this.magService = magService;
		}

		public PageBean<Magzine> getPage() {
			return page;
		}

		public void setPage(PageBean<Magzine> page) {
			this.page = page;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public Magzine getMa() {
			return ma;
		}

		public void setMa(Magzine ma) {
			this.ma = ma;
		}

		public String[] getMcsnames() {
			return mcsnames;
		}

		public void setMcsnames(String[] mcsnames) {
			this.mcsnames = mcsnames;
		}

		public String[] getMcsurls() {
			return mcsurls;
		}

		public void setMcsurls(String[] mcsurls) {
			this.mcsurls = mcsurls;
		}

		public String[] getMcsauthors() {
			return mcsauthors;
		}

		public void setMcsauthors(String[] mcsauthors) {
			this.mcsauthors = mcsauthors;
		}

		public String[] getMcsalbums() {
			return mcsalbums;
		}

		public void setMcsalbums(String[] mcsalbums) {
			this.mcsalbums = mcsalbums;
		}

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

		public String getLoginName() {
			return loginName;
		}

		public void setLoginName(String loginName) {
			this.loginName = loginName;
		}

		public String getLoginPwd() {
			return loginPwd;
		}

		public void setLoginPwd(String loginPwd) {
			this.loginPwd = loginPwd;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getMagId() {
			return magId;
		}

		public void setMagId(String magId) {
			this.magId = magId;
		}
}

