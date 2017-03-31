package com.yzq.stp.model;

import java.util.Date;

public class ProAccept {
    private Integer id;

    private Integer projectId;

    private Integer acceptId;

    private Double jingjia;

    private Integer ischeck;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    @Override
	public String toString() {
		return "ProAccept [id=" + id + ", projectId=" + projectId + ", acceptId=" + acceptId + ", jingjia=" + jingjia
				+ ", ischeck=" + ischeck + ", createTime=" + createTime + "]";
	}

	public void setId(Integer id) {
        this.id = id;
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

    public Integer getIscheck() {
        return ischeck;
    }

    public void setIscheck(Integer ischeck) {
        this.ischeck = ischeck;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}