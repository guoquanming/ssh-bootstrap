package com.my.web.model;

public class Music {
	private Long id;
	private String name;
	private String url;
	private String author;
	private String album;
	
	private Magzine mag;
	
	public Magzine getMag() {
		return mag;
	}
	public void setMag(Magzine mag) {
		this.mag = mag;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	
}
