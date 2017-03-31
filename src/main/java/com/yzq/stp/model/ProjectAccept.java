package com.yzq.stp.model;

import java.util.Date;

public class ProjectAccept {
	private int projectId;

	private int jingjia;

	private Integer sendId;

	private Integer ischeck;

	@Override
	public String toString() {
		return "ProjectAccept [projectId=" + projectId + ", jingjia=" + jingjia + ", sendId=" + sendId + ", ischeck="
				+ ischeck + ", title=" + title + ", yusuan=" + yusuan + ", sendName=" + sendName + ", mobile=" + mobile
				+ ", qq=" + qq + ", email=" + email + ", fileUrl=" + fileUrl + ", checkCode=" + checkCode + ", type="
				+ type + ", createTime=" + createTime + ", desc=" + desc + "]";
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public int getJingjia() {
		return jingjia;
	}

	public void setJingjia(int jingjia) {
		this.jingjia = jingjia;
	}

	public Integer getSendId() {
		return sendId;
	}

	public void setSendId(Integer sendId) {
		this.sendId = sendId;
	}

	public Integer getIscheck() {
		return ischeck;
	}

	public void setIscheck(Integer ischeck) {
		this.ischeck = ischeck;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getYusuan() {
		return yusuan;
	}

	public void setYusuan(String yusuan) {
		this.yusuan = yusuan;
	}

	public String getSendName() {
		return sendName;
	}

	public void setSendName(String sendName) {
		this.sendName = sendName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
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
		this.type = type;
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
		this.desc = desc;
	}

	private String title;

	private String yusuan;

	private String sendName;

	private String mobile;

	private String qq;

	private String email;

	private String fileUrl;

	private Integer checkCode;

	private String type;

	private Date createTime;

	private String desc;

}
