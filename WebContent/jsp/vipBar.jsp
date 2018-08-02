<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path=request.getContextPath(); %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柱状图显示</title>
</head>
<script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#vipButton").click(function(){
			//基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
			
			$.ajax({
				type:'post',
				data:'state=vipAjax',
				dataType:'json',
				url:'<%=path%>/VipAjaxServlet',
				success:function(msg){
					console.log(msg.ip);
					
					option = {
						    xAxis: {
						        type: 'category',
						        data: msg.ip
						        //['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
						    },
						    yAxis: {
						        type: 'value'
						    },
						    series: [{
						        data: msg.times,
						        //[120, 200, 150, 80, 70, 101, 130],
						        type: 'bar'
						    }]
						};
					
					// 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
				}
			});			
		});
	});
</script>
<body>
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
	<div id="main" style="width: 3000px;height:600px;"></div>
	<input type="button" value="点我啊" id="vipButton"/>
</body>
</html>