<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path=request.getContextPath(); %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>饼状图显示</title>
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
					console.log(msg.ip[0]);
					
					option = {
						    title: {
						        text: 'IP上网次数统计',
						        subtext: '大数据处理',
						        left: 'center'
						    },
						    tooltip : {
						        trigger: 'item',
						        formatter: "{a} <br/>{b} : {c} ({d}%)"
						    },
						    legend: {
						        bottom: 10,
						        left: 'center',
						        data: msg.ip
						        	
						    },
						    series : [
						        {
						            type: 'pie',
						            radius : '65%',
						            center: ['50%', '50%'],
						            selectedMode: 'single',
						            data:[
						                {
						                    value:msg.times[0],
						                    name: msg.ip[0],
						                    label: {
						                        normal: {
						                        
						                            backgroundColor: '#eee',
						                            borderColor: '#777',
						                            borderWidth: 1,
						                            borderRadius: 4,
						                            rich: {
						                                title: {
						                                    color: '#eee',
						                                    align: 'center'
						                                },
						                                abg: {
						                                    backgroundColor: '#333',
						                                    width: '100%',
						                                    align: 'right',
						                                    height: 25,
						                                    borderRadius: [4, 4, 0, 0]
						                                },
						                                
						                                weatherHead: {
						                                    color: '#333',
						                                    height: 24,
						                                    align: 'left'
						                                },
						                                hr: {
						                                    borderColor: '#777',
						                                    width: '100%',
						                                    borderWidth: 0.5,
						                                    height: 0
						                                },
						                                value: {
						                                    width: 20,
						                                    padding: [0, 20, 0, 30],
						                                    align: 'left'
						                                },
						                                valueHead: {
						                                    color: '#333',
						                                    width: 20,
						                                    padding: [0, 20, 0, 30],
						                                    align: 'center'
						                                },
						                                rate: {
						                                    width: 40,
						                                    align: 'right',
						                                    padding: [0, 10, 0, 0]
						                                },
						                                rateHead: {
						                                    color: '#333',
						                                    width: 40,
						                                    align: 'center',
						                                    padding: [0, 10, 0, 0]
						                                }
						                            }
						                        }
						                    }
						                },
						                //for(int i=1;i<=20;i++){
						               // 	{value:msg.times[i], name: msg.ip[i]},
						                //}
						                
						                {value:msg.times[1], name: msg.ip[1]},
						                {value:msg.times[2], name: msg.ip[2]},
						                {value:msg.times[3], name: msg.ip[3]},
						                {value:msg.times[4], name: msg.ip[4]},
						                {value:msg.times[5], name: msg.ip[5]},
						                {value:msg.times[6], name: msg.ip[6]},
						                {value:msg.times[7], name: msg.ip[7]},
						                {value:msg.times[8], name: msg.ip[8]},
						                {value:msg.times[9], name: msg.ip[9]},
						                {value:msg.times[10], name: msg.ip[10]},
						                {value:msg.times[11], name: msg.ip[11]},
						                {value:msg.times[12], name: msg.ip[12]},
						                {value:msg.times[13], name: msg.ip[13]},
						                {value:msg.times[14], name: msg.ip[14]},
						                {value:msg.times[15], name: msg.ip[15]},
						                {value:msg.times[16], name: msg.ip[16]},
						                {value:msg.times[17], name: msg.ip[17]},
						                {value:msg.times[18], name: msg.ip[18]},
						                {value:msg.times[19], name: msg.ip[19]},
						                {value:msg.times[20], name: msg.ip[20]},
						            ],
						            itemStyle: {
						                emphasis: {
						                    shadowBlur: 10,
						                    shadowOffsetX: 0,
						                    shadowColor: 'rgba(0, 0, 0, 0.5)'
						                }
						            }
						        }
						    ]
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
	<div id="main" style="width: 1000px;height:1200px;"></div>
	<input type="button" value="点我啊" id="vipButton"/>
</body>
</html>