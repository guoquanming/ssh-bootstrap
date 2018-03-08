package com.my.web.model;

public class CollectMessage {
	private Long id;
	private String userId;//收藏人
	private String magId;
	
	public String getMagId() {
		return magId;
	}
	public void setMagId(String magId) {
		this.magId = magId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
}
