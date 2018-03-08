package com.my.web.model;


import java.util.List;

/**
 * 分页模型类
 * @author Administrator
 * @param <T>
 *
 */
public class PageBean<T> {
	//当前页码
	private int pageNum;
	//每页显示数据条数
	private int pageCount=10;
	//数据总条数
	private int dataTotal;
	//总页数
	private int pageTotal;
	
	
	//查询出的数据存放在list集合中
	private List<T> list;


	

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getDataTotal() {
		return dataTotal;
	}

	public void setDataTotal(int dataTotal) {
		this.dataTotal = dataTotal;
	}

	public int getPageTotal() {
		return pageTotal=(dataTotal+pageCount-1)/pageCount;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
}
