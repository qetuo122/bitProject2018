package com.homework;

class User {
	String name;
	String id;
	String pwd; 
	String privateNum;
	String homeNum;
	String home;
	String job;
	String hobby; 
	String self;
	
	User(){}
	
	User(String name,String id,String pwd,String privateNum,String homeNum,String home,String job,String hobby,String self){
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.privateNum = privateNum;
		this.homeNum = homeNum;
		this.home = home;
		this.job = job;
		this.hobby = hobby;
		this.self = self;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPrivateNum() {
		return privateNum;
	}
	public void setPrivateNum(String privateNum) {
		this.privateNum = privateNum;
	}
	public String getHomeNum() {
		return homeNum;
	}
	public void setHomeNum(String homeNum) {
		this.homeNum = homeNum;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getSelf() {
		return self;
	}
	public void setSelf(String self) {
		this.self = self;
	}
}

