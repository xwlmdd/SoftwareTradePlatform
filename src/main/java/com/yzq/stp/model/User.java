package com.yzq.stp.model;

public class User {
    @Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", mobile=" + mobile
				+ ", type=" + type + ", skill=" + skill + ", pic=" + pic + ", address=" + address + ", realName="
				+ realName + ", qq=" + qq + ", jishu=" + jishu + ", introduce=" + introduce + "]";
	}

	private Integer id;

    private String name;

    private String pwd;

    private String email;

    private String mobile;

    private Integer type;

    private String skill;

    private String pic;

    private String address;

    private String realName;

    private String qq;

    private String jishu;

    private String introduce;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill == null ? null : skill.trim();
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getJishu() {
        return jishu;
    }

    public void setJishu(String jishu) {
        this.jishu = jishu == null ? null : jishu.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }
}