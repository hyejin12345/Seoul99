<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table>thead>tr>th,.table>tbody>tr>th,.table>tfoot>tr>th,
.table>thead>tr>td, .table>tbody>tr>td,.table>tfoot>tr>td
{
	padding:2px;
}
.days{
	cursor:pointer;
}
.days b{
}
.cal{
	width:25px;
	
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){

 	$('.days').hover(function(){
		$(this).css("color","#004fff")
	},function(){
		$(this).css("color","black")
	}) 
	
	$('.days').click(function(){
		let year=$(this).attr("data-year");
		let month=$(this).attr("data-month");
		let day=$(this).text();
	    $('#r_day').text(year+"년도 "+month+"월 "+day+"일")
	})
	
})
</script>
</head>
<body>
  <table class="table">
    <tr>
      <td class="text-center"><h3>${year }년 ${month }월</h3></td>
    </tr>
  </table>
  <div style="height:5px"></div>
  <c:set var="week" value="${week }"/>
  <%-- int week=3 --%>
  <table class="table">
    <tr>
      <c:forEach var="w" items="${strWeek }">
        <th class="text-center cal" height="35">${w }</th>
      </c:forEach>
    </tr>
    <c:forEach var="i" begin="1" end="${lastday }">
      <!-- 칸 간격 띄우기 -->
      <c:if test="${i==1 }">  
        <tr>
          <!-- 공백으로 들어가는 칸 -->
          <c:forEach var="j" begin="1" end="${week }">
            <td class="text-center cal" height="35"></td>
          </c:forEach>
      </c:if>
      <td class="days text-center cal ${i==day?'danger':'' }" height="35" data-year="${year }" data-month="${month }">${i }</td>
      <c:set var="week" value="${week+1 }"/> <%-- week++ --%>
      <c:if test="${week>6 }">
        <c:set var="week" value="0"/> <%-- week=0 --%>
        </tr>
        <tr>
      </c:if>
    </c:forEach>
    </tr>
  </table>
</body>
</html>