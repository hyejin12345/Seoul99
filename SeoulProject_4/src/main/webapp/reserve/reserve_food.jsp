<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	/* 추가 : 미리불러오기*/
 	$.ajax({
		type:'post',
		url:'../reserve/reserve_date.do',
		success:function(result)
		{
			$('#select_date').html(result)
		}
	})
	
	$('.trs').hover(function(){
		$(this).css("background","#ededed")
	},function(){
		$(this).css('background',"white")
	})
	$('.trs').click(function(){
		let img=$(this).attr("data-img")
		let name=$(this).attr("data-name");
		$('#food_img').attr("src",img)
		$('#food_name').text(name)
		
		$.ajax({
			type:'post',
			url:'../reserve/reserve_date.do',
			success:function(response)
			{
				$('#select_date').html(response)
			}
		})
	})
	
	
})
</script>
</head>
<body>


  <table class="table here">
	  <c:forEach var="vo" items="${list }">
	     <tr class="trs" data-img="${vo.poster }" data-name="${vo.name }" style="border-bottom:1px solid lightgray;">
	      <td class="text-left" style="padding:10px;width:25%;">
	        <img src="${vo.poster }" style="width:90%;height:90%">
	      </td>
	      <td style="padding:10px;width:60%;">${vo.name }</td>
	     </tr>
	  </c:forEach>
  </table>
  
  
</body>
</html>