package com.edu.bigdata.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.bigdata.dao.BigDataDao;
import com.edu.bigdata.entity.VipEntity;
import com.edu.bigdata.service.BigDataVipService;

import net.sf.json.JSONObject;

public class VipAjaxServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String state = request.getParameter("state");
		if(state.equals("vipAjax")) {
			this.vipEchartsAjax(request,response);
		}
	}

	@SuppressWarnings("unchecked")
	private void vipEchartsAjax(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			BigDataDao dao = new BigDataDao();
			BigDataVipService service = new BigDataVipService();		
			List<VipEntity> list=new ArrayList<VipEntity>();
			
			String[] ip = new String[20];
			int[] times = new int[20];
			
			list = service.gVipEntityList();
			for(int i=0;i<list.size();i++){
				VipEntity vipEntity = list.get(i);
				ip[i] = vipEntity.getIp();
				times[i] = Integer.parseInt(vipEntity.getTimes());
			}
			
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("ip", ip);
			jsonObject.put("times", times);
			
			out.println(jsonObject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
