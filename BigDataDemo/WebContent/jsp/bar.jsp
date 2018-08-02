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
				url:'<%=path%>/VipAjaxServletBar',
				success:function(msg){
					console.log(msg.xAxisData);
					
					option = {
						    title: {
						        text: 'IP上网次数统计（单位:次）',
						        subtext: 'From WXKJ',
						        sublink: 'http://www.weixin-sx.com/'
						    },
						    tooltip : {
						        trigger: 'axis',
						        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
						            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						        },
						        formatter: function (params) {
						            var tar = params[1];
						            return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;
						        }
						    },
						    grid: {
						        left: '3%',
						        right: '4%',
						        bottom: '3%',
						        containLabel: true
						    },
						    xAxis: {
						        type : 'category',
						        splitLine: {show:false},
						        data : msg.ip
						    },
						    yAxis: {
						        type : 'value'
						    },
						    series: [
						        {
						            name: '辅助',
						            type: 'bar',
						            stack:  '总量',
						            itemStyle: {
						                normal: {
						                    barBorderColor: 'rgba(0,0,0,0)',
						                    color: 'rgba(0,0,0,0)'
						                },
						                emphasis: {
						                    barBorderColor: 'rgba(0,0,0,0)',
						                    color: 'rgba(0,0,0,0)'
						                }
						            },
						            data: msg.value0
						            	//[0, 0, 0, 0, 0, 0]
						        },
						        {
						            name: '上网次数',
						            type: 'bar',
						            stack: '总量',
						            label: {
						                normal: {
						                    show: true,
						                    position: 'inside'
						                }
						            },
						            data:msg.times
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
	<div id="main" style="width: 1000px;height:600px;"></div>
	<input type="button" value="点我啊" id="vipButton"/>
</body>
</html>