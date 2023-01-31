<%-- 검색결과 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
*{
	margin:0;
	padding:0;
	list-style: none;
	border-collapse: collapse;
	font-size:16px;
	color: black;
}

.container a{
	color:black;
	text-decoration:none;
}
.route{
	/* 페이지 경로 */
	width:100%;
	margin-top:40px;
}
/* 큰 검색창 */
.main_input{
    -webkit-appearance: none;
       -moz-appearance: none;
            appearance: none;
            
  width:600px;
  height:50px;
  z-index:3;
  margin:0;
  padding: 0 30px;
  
/*   position:absolute;
  top:290px;
  left:70px; */
  border: 1px solid lightgray;
  border-radius:4px;
  font-size : 18px;
  color:gray;
}
.main_input:focus{
	outline:none;
	color:black;
}
.main_input:hover{
	outline:none;
	box-shadow:0 0 10px 5px rgb(0,0,0,0.1);
}
/* "검색어"에 대한 검색결과 OO건 */
.search_toptitle{
	width:100%;
	margin:60px 0 30px 0;
	line-height:36px;
	
	/*background:yellow;*/
}
.search_toptitle span{
	color: #004fff;
	font-size: 36px;
}
/* 보기정렬 버튼 */
.view_buttons{
	margin:60px 0 60px 0;
	width:100%;
	display: flex;
    justify-content: space-between;
}
.whitegray_btn{
	width:25%;
	margin: 0 25px 0 0;
}
.whitegray_btn:last-child{
	margin: 0;
}
/* 보기정렬 버튼 클릭됐을 때 파란버튼 되기 */

/* ---------- */


/* 이미지리스트 */
.topText{


}
h3.view_title{
	margin: 60px 0 30px 0;
	width: 85%;
	float:left;
	line-height: 24px;
}
.moreClick{
	margin: 60px 0 30px 0;
	width: 15%;
	float:right;
	line-height: 24px;
	text-align:right;
}
.content_allItem{
 width:100%;
 height:100%;
 clear:both;
}
.content_allItem>.content_item{
 /*width:266px;
 height:245px;*/
 width:204px;
 height:180px;
 float:left;
 margin: 0 30px 30px 0;
 box-shadow : 0 5px 10px 0 rgb(0,0,0,0.2);
 
 position:relative;
}
.content_allItem .content_item:nth-child(5n){
	margin: 0; 
}

.content_allItem .content_item img{
 display:inline-block;
 vertical-align:middle;
 width:100%;
 height:120px;
 object-fit:fit;
 
}
.item_name{
	margin: 12px;
	font-size:16px;
	
	text-align:center;
}
.content_allItem .item_info{
	margin: 0 0 0 20px;
}

.item_info .score,i.fa-star{
	color : #004fff;
	font-weight : bold;
	font-size:14px;
}
.item_info .hit{
	color : gray;
	font-size:14px;
}
/* 페이지 넘버링 */
.pagination{
	width:100%;
	text-align: center;
	
	/* background: lightgray; */
}
.pagination ul{
	/*display:inline-block;*/
	display:inline-block;
	margin: 20px auto;
	text-align:center;
}
.pagination ul li{
	float:left;
	
	display:inline-block;
}
.pagination ul li a{
 	padding: 10px 17px;
    border-radius: 50px;
    display: block;
    
/*  background: yellow;
    border: 1px solid black; */
}
.pagination ul li a:hover{
	background:lightgray;
}
.curpage a{
	color: #004fff;
}

</style>
<script type="text/javascript" src="http://code.jquery.con/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	let searchWord=$('.main_input').attr("placeholder");
	$.ajax({
		type:'post',
		url:'listChange.jsp',
		data:{"searchWord":searchWord,"page":1},
		success:function(result)
		{
			$('#trip_content').html(result);
		},
		error:function(ex)
		{
			alert("와이라노...")
		}
	})	
})
</script>
</head>
<body>
<div class="container">


	<div class="route">
		<a href="">홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		<a href="">검색</a>
	</div>
	
	<%-- 검색어 입력 => 이름, 주소에서 포함여부 확인 --%>
	
	<h1 class="search_toptitle">
		<span class="word">"${searchWord }"</span> 관련 검색결과 <span class="word_count">${allCount }건</span>
	</h1>
	<form method =post action="../main/search.do">
		<input type=text class="main_input" placeholder="${searchWord }" name="searchWord" autocomplete="off">
	</form>
	<div class="view_buttons">
		<button class="whitegray_btn">전체보기</button>
		<button class="whitegray_btn">여행지</button>
		<button class="whitegray_btn">맛집</button>
		<button class="whitegray_btn">커뮤니티</button>
	</div>
	
	
	<%-- 리스트 --%>
	<%-- content_allItem 세로값을 한줄만 보여주는 높이로 하고, 더보기 클릭시 세로값 3줄+페이지 넘버링부분까지 늘리기 --%>
		<%-- 여행지 리스트 --%>
		
		<div class="topText">
	 	<h3 class="view_title">여행지(${tripCount>0?tripCount:0 }건)</h3>
		<c:if test="${tripCount>5 }">
			<%-- <h4><a href="../main/search.do?searchWord=${searchWord }" class="moreClick">전체보기&nbsp;<i class="fa-solid fa-angle-right"></i></a></h4> --%>
		</c:if>
		</div>
		
		
		<div id="trip_content">
	
			<!-- 3*3 정렬 -->
			<div class="content_allItem">
			
			   <c:forEach var="tvo" items="${tlist }" varStatus="s">
				 <div class="content_item">
				    <button class="jjim_btn"><i class="fa-sharp fa-solid fa-heart"></i></button>
				    
				    <a href="../trip/trip_detail.do?tno=${tvo.tno }">
				    <img src="${tvo.image }">
				    <h4 class="item_name">${tvo.name }</h4>
			        
			        </a>
			        
				 </div>
			   </c:forEach>
			   
			</div>
			
 	   	    <div class="pagination">
	   	    	<c:if test="${tripCount>5 }">
		        <ul>
		        	<li><a href="../main/search.do?searchWord=${searchWord }&page=1"><i class="fa-solid fa-angles-left"></i></a></li>
		        	<c:choose>
			          	<c:when test="${t_startpage<=1 }">
			          		<li><a href="../main/search.do?searchWord=${searchWord }&page=1"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
			          	<c:when test="${t_startpage>1 }">
			          		<li><a href="../main/search.do?searchWord=${searchWord }&page=${t_startpage-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
			        	</c:choose>
		        	<c:forEach var="i" begin="${t_startpage }" end="${t_endpage }">
		            	<li ${i==t_curpage?"class=current":"" }><a href="../main/search.do?searchWord=${searchWord }&page=${i }">${i }</a></li>
		        	</c:forEach>
		        	<c:choose>
			        	<c:when test="${t_endpage<t_totalpage }">
			        		<li><a href="../main/search.do?searchWord=${searchWord }&page=${t_endpage+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
			        	</c:when>
			        	<c:when test="${t_endpage==t_totalpage }">
			        		<li><a href="../main/search.do?searchWord=${searchWord }&page=${t_endpage }"><i class="fa-solid fa-angle-right"></i></a></li>
			        	</c:when>
			       	</c:choose>
					<li><a href="../main/search.do?searchWord=${searchWord }&page=${t_totalpage}"><i class="fa-solid fa-angles-right"></i></a></li>		       	
		        </ul>
		        </c:if>
		    </div>
	      
	      
		</div>
		
		<%-- 맛집 리스트 --%>
		<div class="topText">
		<h3 class="view_title">맛집(${foodCount>0?foodCount:0}건)</h3>
		<c:if test="${foodCount>5 }">
			<%-- <h4><a href="../main/search.do?searchWord=${searchWord }" class="moreClick">전체보기&nbsp;<i class="fa-solid fa-angle-right"></i></a></h4> --%>
		</c:if>
		</div>
		<div class="food_content">
	
			<!-- 3*3 정렬 -->
			<div class="content_allItem">
			
			   <c:forEach var="fvo" items="${flist }" varStatus="s">
				 <div class="content_item">
				    <button class="jjim_btn"><i class="fa-sharp fa-solid fa-heart"></i></button>
				    
				    <a href="../food/food_detail.do?fno=${fvo.fno }">
				    <img src="${fvo.poster }">
				    <h4 class="item_name">${fvo.name }</h4>
			        
			        </a>
			        
				 </div>
			   </c:forEach>
			   
			</div>
			
  	   	    <div class="pagination">
	   	    	<c:if test="${foodCount>5 }">
		        <ul>
		        	<li><a href="../main/search.do?searchWord=${searchWord }&page=1"><i class="fa-solid fa-angles-left"></i></a></li>
		        	<c:choose>
			          	<c:when test="${f_startpage<=1 }">
			          		<li><a href="../main/search.do?searchWord=${searchWord }&page=1"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
			          	<c:when test="${f_startpage>1 }">
			          		<li><a href="../main/search.do?searchWord=${searchWord }&page=${f_startpage-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
			        	</c:choose>
		        	<c:forEach var="i" begin="${f_startpage }" end="${f_endpage }">
		            	<li ${i==f_curpage?"class=current":"" }><a href="../main/search.do?searchWord=${searchWord }&page=${i }">${i }</a></li>
		        	</c:forEach>
		        	<c:choose>
			        	<c:when test="${f_endpage<f_totalpage }">
			        		<li><a href="../main/search.do?searchWord=${searchWord }&page=${f_endpage+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
			        	</c:when>
			        	<c:when test="${f_endpage==f_totalpage }">
			        		<li><a href="../main/search.do?searchWord=${searchWord }&page=${f_endpage }"><i class="fa-solid fa-angle-right"></i></a></li>
			        	</c:when>
			       	</c:choose>
					<li><a href="../main/search.do?searchWord=${searchWord }&page=${f_totalpage}"><i class="fa-solid fa-angles-right"></i></a></li>		       	
		        </ul>
		        </c:if>
		    </div>
		    
		    
		    
		</div>
	
		<%-- 커뮤니티 리스트 --%>
		<div class="topText">
		<h3 class="view_title">커뮤니티(${comunityCount>0?comunityCount:0}건)</h3>
		</div>
		<c:if test="${comunityCount>0 }">
			<h4><a href="../main/search.do?searchWord=${searchWord }" class="moreClick">전체보기&nbsp;<i class="fa-solid fa-angle-right"></i></a></h4>
		</c:if>
		
		
		

</div>
</body>
</html>