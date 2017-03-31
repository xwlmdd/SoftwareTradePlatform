package com.yzq.stp.model;

import java.util.Date;

public class Comment {
    private Integer id;

    private String projectTitle;

    private Integer projectId;

    private Integer acceptId;

    private Integer quality;

    private Integer speed;

    private Integer zhuanye;

    private Integer fuwu;

    private String comment;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectTitle() {
        return projectTitle;
    }

    public void setProjectTitle(String projectTitle) {
        this.projectTitle = projectTitle == null ? null : projectTitle.trim();
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

    public Integer getQuality() {
        return quality;
    }

    public void setQuality(Integer quality) {
        this.quality = quality;
    }

    public Integer getSpeed() {
        return speed;
    }

    public void setSpeed(Integer speed) {
        this.speed = speed;
    }

    public Integer getZhuanye() {
        return zhuanye;
    }

    public void setZhuanye(Integer zhuanye) {
        this.zhuanye = zhuanye;
    }

    public Integer getFuwu() {
        return fuwu;
    }

    public void setFuwu(Integer fuwu) {
        this.fuwu = fuwu;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}