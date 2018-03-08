package com.my.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.dao.MagDao;
import com.my.web.model.CollectMessage;
import com.my.web.model.Magzine;
import com.my.web.model.Music;
import com.my.web.model.PageBean;
import com.my.web.model.UserMessage;

@Transactional
@Service
public class MagService {
	@Autowired
	private MagDao magDao;
	public List<Magzine> getNew() {
		return magDao.selectNewMag();
	}
	public List<Music> getSongs(Long magid) {
		return magDao.selectNewSong(magid);
	}
	public Magzine getMagById(Long magid) {
		
		return magDao.selectMagById(magid);
	}
	public List<Magzine> gethot() {
		
		return magDao.selectHotMagByHot();
	}
	public List<Magzine> getAll() {
		return magDao.selectAllMagList();
	}
	public List<Magzine> getRadio(String category) {
		return magDao.selectRadioList(category);
	}
	public  List<Music> getMusic(Long id) {
		return magDao.selectMusic(id);
	}
	public int getCount() {
		return magDao.selectCount();
	}
	public List<Magzine> getByPage(PageBean page) {
		return magDao.selectByPage(page);
	}
	public void addMagAndMusic(List<Music> mcs, Magzine ma) {
		magDao.addMagAndMusic(mcs,ma);
		
	}
	public void saveUser(UserMessage um) {
		
		magDao.saveUser(um);
	}
	public UserMessage login(String loginName, String loginPwd) {
		return magDao.selectUserByNameAndPwd(loginName,loginPwd);
	}
	public void saveMag(CollectMessage coll) {
		
		 magDao.saveMag(coll);
	}
	public Magzine findMagById(String magId) {
		
		return magDao.findMagById(magId);
	}
	public  UserMessage findByNameAndPwd(String loginName, String loginPwd) {
		return magDao.findByNameAndPwd(loginName,loginPwd);
	}
	public CollectMessage findCMBymIdAnduId(String magId, String userId) {
		return magDao.findCMByuIdAndmId(magId,userId);
	}
	public void cancleColl(CollectMessage collmess) {
		magDao.cancleColl(collmess);
	}
	public UserMessage findById(int userId) {
		return magDao.findById(userId);
	}
	public boolean findCMBymIdAnduId(String magId, int id) {
		UserMessage user = magDao.findById(id);
		return magDao.findCMByuIdAndmId(magId, id);
	}
	//取消收藏
	public void cancleCollect(String magId, int id) {
		UserMessage user = magDao.findById(id);
		Set<Magzine> musics = user.getMusics();
		/*for (Magzine magzine : musics) {
			if(magzine.getId()==Long.parseLong(magId)){
				musics.remove(magzine);
			}
		}*/
		Iterator<Magzine> iterator = musics.iterator();  
        while(iterator.hasNext()){  
        	Magzine magzine = iterator.next();  
        	if(magzine.getId()==Long.parseLong(magId)){
        		iterator.remove();  
            }  
        }  
		user.setMusics(musics);
		magDao.cancleCollect(user);
	}
	//收藏
	public void addCollect(String magId, int id) {
		UserMessage user = magDao.findById(id);
		Set<Magzine> musics = user.getMusics();
		Magzine magzine = magDao.findMagById(magId);
		musics.add(magzine);
		user.setMusics(musics);
		magDao.addCollect(user);
	}
	//个人推荐
	public List<Magzine> findMagnizeByHos(List<Magzine> list) {
		List<String> category = new ArrayList<String>();
		List<Long> ids = new ArrayList<Long>();
		for(int i = 0; i < list.size();i++){
			ids.add(list.get(i).getId());
			category.add(list.get(i).getCategory());
		}
		
		return  magDao.findMagByHos(category,ids);
	}
	
	
}


