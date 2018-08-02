package com.edu.bigdata.entity;

public class VipEntity {
	private String ip;
	private String times;
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return ip + " "+ times;
	}
}