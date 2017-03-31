package com.yzq.stp.model;

import java.util.Date;

public class Project {

	@Override
	public String toString() {
		return "Project [id=" + id + ", sendId=" + sendId + ", title=" + title + ", yusuan=" + yusuan + ", sendName="
				+ sendName + ", mobile=" + mobile + ", qq=" + qq + ", email=" + email + ", fileUrl=" + fileUrl
				+ ", checkCode=" + checkCode + ", type=" + type + ", zhouqi=" + zhouqi + ", createTime=" + createTime
				+ ", desc=" + desc + "]";
	}

	private Integer id;

	private Integer sendId;

	private String title;

	private String yusuan;

	private String sendName;

	private String mobile;

	private String qq;

	private String email;

	private String fileUrl;

	private Integer checkCode;

	private String type;

	private String zhouqi;

	private Date createTime;

	private String desc;

	public String getZhouqi() {
		return zhouqi;
	}

	public void setZhouqi(String zhouqi) {
		this.zhouqi = zhouqi;
	}

	public Project() {
		// 为了查询传送条件的时候不0
		this.sendId = -999;
		this.checkCode = -999;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSendId() {
		return sendId;
	}

	public void setSendId(Integer sendId) {
		this.sendId = sendId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getYusuan() {
		return yusuan;
	}

	public void setYusuan(String yusuan) {
		this.yusuan = yusuan == null ? null : yusuan.trim();
	}

	public String getSendName() {
		return sendName;
	}

	public void setSendName(String sendName) {
		this.sendName = sendName == null ? null : sendName.trim();
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile == null ? null : mobile.trim();
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq == null ? null : qq.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl == null ? null : fileUrl.trim();
	}

	public Integer getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(Integer checkCode) {
		this.checkCode = checkCode;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc == null ? null : desc.trim();
	}
}