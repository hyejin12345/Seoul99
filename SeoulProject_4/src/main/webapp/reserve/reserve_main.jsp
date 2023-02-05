<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.allTopTitle{
	margin: 60px 0 30px 0;
	text-align: center;
}
h3{
	margin:0;	
}
h3.subtitle{
	margin: 0 0 10px 0;
	height:36px;
	line-height:36px;
	background:#004fff;
	color:white;
	font-size:16px;
/* 	border-bottom:3px solid #004fff;
	color: #004fff; */
}
.table>thead>tr>th,.table>tbody>tr>th,.table>tfoot>tr>th,
.table>thead>tr>td, .table>tbody>tr>td,.table>tfoot>tr>td
{
	border:0;
}
caption{
	padding: 0;
}
.text_btn{
    padding: 0;
    width: 25%;
    font-size: 14px;
    text-align: center;
    border: 0;
    border-right: 1px solid #004fff;
    border-radius: 0;
    cursor:pointer;
}
.text_btn:last-child{
	border-right:0;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'POST',
		url:'../reserve/food_list.do',
		data:{"fd":'한식'},
		success:function(response)
		{
			$('#food_list').html(response); // JSON (스프링)
		}
	})
	
 	$('.foods').click(function(){
		let fd=$(this).text();
		$.ajax({
			type:'POST',
			url:'../reserve/food_list.do',
			data:{"fd":fd},
			success:function(response)
			{
				$('#food_list').html(response); // JSON (스프링)
			}
		})
	}) 
	

	
})
</script>
</head>
<body>
<div class="container">


   <div style="height: 60px"></div>
   <table class="table" style="width: 100%;height: 700px">
     <tr>
       <td style="width:200px;height:500px;">
         <table class="table">
           <caption><h3 class="text-center subtitle">맛집 선택</h3></caption>
           <tr style="border-bottom:3px solid #004fff">
            <td style="display:flex;justify-content:space-evenly;padding: 8px 8px 16px 8px;">
             <span class="text_btn foods" >한식</span>
             <span class="text_btn foods" >양식</span>
             <span class="text_btn foods" >중식</span>
             <span class="text_btn foods" >일식</span>
             <span class="text_btn foods" >기타</span>
            </td>
           </tr>
           <tr>
             <td>
              <div id="food_list" style="height:450px;overflow-y:scroll">
                
              </div>
             </td>
           </tr>
         </table>
       </td>
       <td width=40% height="500">
         <table class="table">
           <caption><h3 class="text-center subtitle">예약일 선택</h3></caption>
           <tr>
             <td>
               <div id=select_date></div>
             </td>
           </tr>
         </table>
       </td>
       <td width=30% rowspan="2" height="700">
         <table class="table">
           <caption><h3 class="text-center subtitle">예약 정보</h3></caption>
           <tr>
             <td class="text-center" colspan=2>
                 <img id="food_img" src="def.png" style="width:250px;height:250px;background:#ededed;" >
             </td>
           </tr>
           <tr>
             <th class="text-center" width=30%>맛집명</th>
             <td class="text-left" colspan=2>
               <span id="food_name" style="color:#004fff">(선택전)</span>
             </td>
           </tr>
           <tr>
             <th class="text-center" width=30%>예약일</th>
             <td width=70%><span id="r_day" style="color:#004fff">(선택전)</span></td>
           </tr>
         </table>
       </td>
     </tr>
     <tr>
       <td class="default" width="35%" height="200">
         <table class="table">
           <caption><h3 class="text-center subtitle">시간 선택</h3></caption>
         </table>
       </td>
       <td class="warning" width="35%" height="200">
         <table class="table">
           <caption><h3 class="text-center subtitle">인원 선택</h3></caption>
         </table>
       </td>
     </tr>
   </table>
   
   
</div>
</body>
</html>