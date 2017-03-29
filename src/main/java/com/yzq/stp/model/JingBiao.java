package com.yzq.stp.model;

import java.util.Date;

public class JingBiao {
	private String name;

	private String email;

	private String mobile;

	private String skill;

	private String realName;

	// 报价

	private Integer projectId;

	private Integer acceptId;

	private Double jingjia;

	private Date createTime;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getAcceptId() {
		return acceptId;
	}

	public void setAcceptId(Integer acceptId) {
		this.acceptId = acceptId;
	}

	public Double getJingjia() {
		return jingjia;
	}

	public void setJingjia(Double jingjia) {
		this.jingjia = jingjia;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "JingBiao [name=" + name + ", email=" + email + ", mobile=" + mobile + ", skill=" + skill + ", realName="
				+ realName + ", projectId=" + projectId + ", acceptId=" + acceptId + ", jingjia=" + jingjia
				+ ", createTime=" + createTime + "]";
	}

}
