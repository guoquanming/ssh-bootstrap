package com.my.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.my.web.model.CollectMessage;
import com.my.web.model.Magzine;
import com.my.web.model.Music;
import com.my.web.model.PageBean;
import com.my.web.model.UserMessage;
@Repository
public class MagDao extends HibernateDaoSupport{
	
	@Resource
	public void setMySessionFactory(SessionFactory factory){
		super.setSessionFactory(factory);
		Session openSession = factory.openSession();
		
	}
	public List<Magzine> selectNewMag() {
		DetachedCriteria c=DetachedCriteria.forClass(Magzine.class);
		c.addOrder(Order.desc("id"));
		return this.getHibernateTemplate().findByCriteria(c, 0, 4);
	}
	public List<Music> selectNewSong(Long magId) {
//		select * from tbl_music mc join tbl_mag  mg where mg.id=1;
		String hql="from Music mc where mc.mag.id=?";
		return this.getHibernateTemplate().find(hql,magId);
	}
	public Magzine selectMagById(Long magid) {
		// TODO Auto-generated method stub
		String hql="from Magzine where id=?";
		return (Magzine) this.getHibernateTemplate().find(hql,magid).get(0);
	}
	@SuppressWarnings("unchecked")
	public List<Magzine> selectHotMagByHot() {
		
		DetachedCriteria c=DetachedCriteria.forClass(Magzine.class);
		c.add(Restrictions.eq("hot", 1));
		return this.getHibernateTemplate().findByCriteria(c, 0, 4);
	}
	public List<Magzine> selectAllMagList() {
		DetachedCriteria c=DetachedCriteria.forClass(Magzine.class);
		return this.getHibernateTemplate().findByCriteria(c);
	}
	public List<Magzine> selectRadioList(String category) {
		DetachedCriteria c=DetachedCriteria.forClass(Magzine.class);
		c.add(Restrictions.eq("category", category));
		return this.getHibernateTemplate().findByCriteria(c);
	}
	public  List<Music> selectMusic(Long id) {
		String hql="from Music where magId=?";
		return this.getHibernateTemplate().find(hql,id);
	}
	public int selectCount() {
		DetachedCriteria c=DetachedCriteria.forClass(Magzine.class);
		c.setProjection(Projections.rowCount());
		Long i = (Long) this.getHibernateTemplate().findByCriteria(c).get(0);
		int i1 = i.intValue();
		return i1;
	}
	public List<Magzine> selectByPage(PageBean page) {
		DetachedCriteria c=DetachedCriteria.forClass(Magzine.class);
		
		return this.getHibernateTemplate().findByCriteria(c, (page.getPageNum()-1)*page.getPageCount(), page.getPageCount());
	}
	public void addMagAndMusic(List<Music> mcs, Magzine ma) {
		this.getHibernateTemplate().save(ma);
		for (Music music : mcs) {
			this.getHibernateTemplate().save(music);
		}
		
	}
	//注册
	public void saveUser(UserMessage um) {
		
		this.getHibernateTemplate().save(um);
	}
	//登录
	public UserMessage selectUserByNameAndPwd(String loginName, String loginPwd) {
		String hql="from UserMessage where userName=? and userPassword=?";
		List<UserMessage> temp = this.getHibernateTemplate().find(hql,loginName,loginPwd);
		return temp.size()>0?temp.get(0):null;
	}
	
	
	public void saveMag(CollectMessage coll) {
		this.getHibernateTemplate().saveOrUpdate(coll);
	}
	public Magzine findMagById(String magId) {
		Long magId2=Long.parseLong(magId);
		System.out.println(magId2);
		return ((Magzine) this.getHibernateTemplate().find("from Magzine where id = ? ", new Object[]{magId2}).get(0));
	}
	public UserMessage findByNameAndPwd(String loginName, String loginPwd) {
		
		return ((UserMessage) this.getHibernateTemplate().find("from UserMessage where userName = ? and userPassword = ?", new Object[] {loginName,loginPwd}).get(0));
	}
	public CollectMessage findCMByuIdAndmId(String magId, String userId) {
		String sql = "From CollectMessage where userId = ? and magId = ?";
		List<CollectMessage> find = this.getHibernateTemplate().find(sql,new Object[]{userId,magId});
		return (find.size()>0&&find!=null)? find.get(0):null;
	}
	public void cancleColl(CollectMessage collmess) {
		
		this.getHibernateTemplate().delete(collmess);
	}
	public UserMessage findById(int userId) {
		String sql = "FROM UserMessage where id = ?";
		List<UserMessage> find = this.getHibernateTemplate().find(sql, userId);
		return (find.size()>0&&find!=null)? find.get(0):null;
	}
	public boolean findCMByuIdAndmId(String magId, int id) {
		String sql = "From UserMessage u where u.id = ? ";
		int magId1=Integer.parseInt(magId);
		List<UserMessage> find = this.getHibernateTemplate().find(sql, id);
		UserMessage u = find.get(0);
		Set<Magzine> magnzines = u.getMusics();
		for (Magzine magzine : magnzines) {
			if(magzine.getId()==Long.parseLong(magId))
			return false;
		}
		
		return true;
	}
	//收藏
	public void cancleCollect(UserMessage user) {
		
		this.getHibernateTemplate().saveOrUpdate(user);
	}
	public void addCollect(UserMessage user) {
		this.getHibernateTemplate().saveOrUpdate(user);
		
	}
	//推荐
	public List<Magzine> findMagByHos(List<String> category, List<Long> ids) {
		DetachedCriteria dc = DetachedCriteria.forClass(Magzine.class);
		dc.add(Restrictions.in("category", category));
		dc.add(Restrictions.not(Restrictions.in("id", ids)));
		List<Magzine> list = this.getHibernateTemplate().findByCriteria(dc);
		return list;
		
	}
    
}


	
	




