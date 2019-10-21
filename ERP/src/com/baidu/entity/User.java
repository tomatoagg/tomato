package com.baidu.entity;

public class User {

	Integer uuid;
	
	String userName;
	
	String pwd;
	
	String name;

	public Integer getUuid() {
		return uuid;
	}

	public void setUuid(Integer uuid) {
		this.uuid = uuid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "User [uuid=" + uuid + ", userName=" + userName + ", pwd=" + pwd + ", name=" + name + "]";
	}
	
	
	
}
