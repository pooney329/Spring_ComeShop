package com.example.Computer.model.freeboard.dto;

import java.util.Date;

public class FreeReplyDTO {
	
	
	private Integer frno; 
	private Integer fbno;
	private String replytext;
	private String replyer;
	private String uname;
	private Date regdate;
	private Date updatedate;
	private String secret_reply;
	private String writer;
	private int fgroup;
	private int fstep;
	private int findent;
	
	public int getFgroup() {
		return fgroup;
	}
	public void setFgroup(int fgroup) {
		this.fgroup = fgroup;
	}
	public int getFstep() {
		return fstep;
	}
	public void setFstep(int fstep) {
		this.fstep = fstep;
	}
	
	public int getFindent() {
		return findent;
	}
	public void setFindent(int findent) {
		this.findent = findent;
	}
	public Integer getFrno() {
		return frno;
	}
	public void setFrno(Integer frno) {
		this.frno = frno;
	}
	public Integer getFbno() {
		return fbno;
	}
	public void setFbno(Integer fbno) {
		this.fbno = fbno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getSecret_reply() {
		return secret_reply;
	}
	public void setSecret_reply(String secret_reply) {
		this.secret_reply = secret_reply;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	

}
