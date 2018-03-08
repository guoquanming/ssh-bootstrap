package com.my.web.model;

import java.util.HashSet;
import java.util.Set;

public class UserMessage {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String userName;
	private String userPassword;
	private Set<Magzine> musics = new HashSet<Magzine>();
	public Set<Magzine> getMusics() {
		return musics;
	}
	public void setMusics(Set<Magzine> musics) {
		this.musics = musics;
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

}
