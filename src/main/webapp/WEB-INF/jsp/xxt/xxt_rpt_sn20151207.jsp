<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="xxt_variable_title_header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>家长无忧</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2, user-scalable=yes">
</head>
<body style="background-color: #fff;">
  <div id="page">
    <header class="page-header">
        <h1>推送统计报告</h1>
    </header>
    
    <div class="page-main">
        <article class="analy-item">
        	<section style="padding:2px;">
        		<div style="text-align: right;padding: 5px 10px;"><button id="btn_reflush" onclick="window.location.reload();" style="font-size: 1.1em;width: 4.5em;" >刷新</button></div>
        		<table class="score-table">
                    <caption>幼儿园小班、中班、大班校讯通家长用户<br>家里的“小霸王”出门变胆小，原因在这里</caption>
                    <c:forEach var="item" items="${rpt }" begin="0" end="2">
                    	<tr>
		                	<th style="width: 70%">${item.key }</th>
	                        <td><strong>${item.value }</strong></td>
                    	</tr>
                    </c:forEach>
                </table></br>
        		<table class="score-table">
                    <caption>小学一、二年级<br>让孩子不撒谎的绝妙方法</caption>
                    <c:forEach var="item" items="${rpt }" begin="3" end="4">
                    	<tr>
		                	<th style="width: 70%">${item.key }</th>
	                        <td><strong>${item.value }</strong></td>
                    	</tr>
                    </c:forEach>
                </table></br>
            
                <table class="score-table">
                    <caption>小学三、四、五、六年级<br>教育孩子的五个误区，千万别撞！</caption>
                    <c:forEach var="item" items="${rpt }" begin="5" end="6">
                    	<tr>
		                	<th style="width: 70%">${item.key }</th>
	                        <td><strong>${item.value }</strong></td>
                    	</tr>
                    </c:forEach>
                </table></br>
                
                
                
                
                <table class="score-table">
                    <caption>初一<br>下半学期发力，期中考后家长必做3件事！</caption>
                    <c:forEach var="item" items="${rpt }" begin="7" end="8">
                    	<tr>
		                	<th style="width: 70%">${item.key }</th>
	                        <td><strong>${item.value }</strong></td>
                    	</tr>
                    </c:forEach>
                </table></br>
                
                <table class="score-table">
                    <caption>初二<br>孩子越长大越不愿和父母说心里话的原因</caption>
                    <c:forEach var="item" items="${rpt }" begin="9" end="10">
                    	<tr>
		                	<th style="width: 70%">${item.key }</th>
	                        <td><strong>${item.value }</strong></td>
                    	</tr>
                    </c:forEach>
                </table></br>
                
                
                <table class="score-table">
                    <caption>初三<br>中考六科备考：注重细节， 每科多涨十分！</caption>
                    <c:forEach var="item" items="${rpt }" begin="11" end="12">
                    	<tr>
		                	<th style="width: 70%">${item.key }</th>
	                        <td><strong>${item.value }</strong></td>
                    	</tr>
                    </c:forEach>
                </table></br>
                
                <table class="score-table">
                    <caption>高一<br>详解数学偏科、成绩不理想的真实原因</caption>
                    <c:forEach var="item" items="${rpt }" begin="13" end="14">
                    	<tr>
		                	<th style="width: 70%">${item.key }</th>
	                        <td><strong>${item.value }</strong></td>
                    	</tr>
                    </c:forEach>
                </table></br>
                
                
                <table class="score-table">
                    <caption>高二<br>详解数学偏科、成绩不理想的真实原因</caption>
                    <c:forEach var="item" items="${rpt }" begin="15" end="16">
                    	<tr>
		                	<th style="width: 70%">${item.key }</th>
	                        <td><strong>${item.value }</strong></td>
                    	</tr>
                    </c:forEach>
                </table></br>
                
                <table class="score-table">
                    <caption>高三<br>高三“疲惫期”，成绩原地踏步不等于没进步！</caption>
                    <c:forEach var="item" items="${rpt }" begin="17" end="18">
                    	<tr>
		                	<th style="width: 70%">${item.key }</th>
	                        <td><strong>${item.value }</strong></td>
                    	</tr>
                    </c:forEach>
                </table></br>
                
                
               
                
        	</section>
        </article>
    </div>
    <footer class="page-footer">
	    <div class="copyright">
	        <table>
	            <tr>
	                <td>服务提供：</td>
	                <td><img src="<%=basePath%>/img/i-logo-footer.png" alt="istudy" width="30" height="24"><span>华附在线（爱学网）</span></td>
	            </tr>
	        </table>
	    </div>
	</footer>
</div>
<script type="text/javascript">
var btn_reflush = document.getElementById("btn_reflush");
var total = 5;
btn_reflush.disabled = true;
btn_reflush.innerText = "" + total + ".0";

var handler = setInterval(function(){
	total = Math.round((total - 0.1) * 10) / 10;
	if(total <= 0){
		btn_reflush.disabled = false;
		btn_reflush.innerText = "刷 新";
		clearInterval(handler);
		return;
	}
	var text = total;
	if((text + "").indexOf(".") == -1){
		text = text + ".0";
	}
	btn_reflush.innerText = "" + text;
}, 100);
</script>
</body>
</html>
