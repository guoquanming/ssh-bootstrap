package com.my.web.model;

import java.util.HashSet;
import java.util.Set;

public class Magzine {
	private Long id;
	private String name;
	private String num;
	private String cover;
	private String descri;
	private String category;
	private Set<CollectMessage> messages = new HashSet<CollectMessage>();
	private Set<UserMessage> users = new HashSet<UserMessage>();
	
	public Set<UserMessage> getUsers() {
		return users;
	}
	public void setUsers(Set<UserMessage> users) {
		this.users = users;
	}
	public Set<CollectMessage> getMessages() {
		return messages;
	}
	public void setMessages(Set<CollectMessage> messages) {
		this.messages = messages;
	}
	//热门推荐，0是非热门，1是热门
	private Integer hot;
	
	private Set<Music> musics;
	
	
	public Integer getHot() {
		return hot;
	}
	public void setHot(Integer hot) {
		this.hot = hot;
	}
	public Set<Music> getMusics() {
		return musics;
	}
	public void setMusics(Set<Music> musics) {
		this.musics = musics;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getDescri() {
		return descri;
	}
	public void setDescri(String descri) {
		this.descri = descri;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
}
