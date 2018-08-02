package com.edu.bigdata.service;

import java.util.List;

import com.edu.bigdata.dao.BigDataDao;
import com.edu.bigdata.entity.VipEntity;

public class BigDataVipService {
	private BigDataDao dao = new BigDataDao();
	
	public List<VipEntity> gVipEntityList(){
		String sql = "select * from vip";
		@SuppressWarnings("unchecked")
		List<VipEntity> list =  (List<VipEntity>) dao.select(sql, VipEntity.class);
		return list;
	}
}
