<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울99여행</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">

*{
	margin:0;
	padding:0;
	list-style: none;
	border-collapse: collapse;
	text-decoration: none;
	font-size:16px;
	color: black;
}
.container{
	width:1200px;
}
.route{
	/* 페이지 경로 */
	width:100%;
	margin-top:40px;
	
	/*background:lightblue;*/
}
.route a{
	color:black;
}
.trip_toptitle{
	width:100%;
	margin:60px 0;
	line-height:36px;
	
	/*background:yellow;*/
}
.filterbar{
	width:100%;
	margin-bottom:30px;
	
	/*background:lightblue;*/
}
.container .trip_side{
	position:relative;
	width:20%;
	height:800px;
	float:left;
	
	/*background:pink;*/
}
.trip_category{
	position:absolute;
}
.trip_score{
	position:absolute;
	top:30%;
}
.trip_content{
	width:80%;
	float:right;
	
	/* background:lightgray; */
}
.content_title{
	margin:0 0 30px 0;
}

/* 이미지리스트 */


.content_item{
 width:100%;
 height:100%;
 clear:both;
}
.content_item>div{
 width:270px;
 height:270px;
 float:left;
 margin: 15px 30px 15px 0;
 box-shadow : 0 5px 10px 0 rgb(0,0,0,0.2);
 
 position:relative;
/*
 line-height:270px;
 text-align:center;
*/
}
.content_item div:nth-child(3n){
/*margin: 15px 0;*/
}

.content_item div img{
 display:inline-block;
 vertical-align:middle;
 width:100%;
 height:180px;
 object-fit:fit;
 
}


.item_name{
	margin: 20px 20px 10px 20px;
}
div.item_info{
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
.content_item a{
	margin:0; padding:0;
	color:black;
	text-decoration:none;
}
</style>
</head>
<body>
<div class="container">


		<div class="route">
		 <a href="">홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		 <a href="">여행지</a>
		</div>
		
		
		<h1 class="trip_toptitle">서울의 모든 여행지</h1>
		<div class="filterbar">
		지역필터
		</div>
		<div class="trip_side">

		  <div class="trip_category">
		  여행지 카테고리
		    <ul>
		      <li>명소</li>
		      <li>자연</li>
		      <li>즐길거리</li>
		      <li>쇼핑</li>
		    </ul>
		  </div>
		  <div class="trip_score">
		  여행지 평가
		  	<ul>
		      <li>좋아요</li>
		      <li>보통이에요</li>
		      <li>아쉬워요</li>
		    </ul>
		  </div>
		</div>
		<div class="trip_content">
			<h3 class="content_title">${content_title }</h3>
			<!-- 3*3 정렬 -->
		
			<div class="content_item">
			   <c:forEach var="vo" items="${list }">
			 	 
				 <div>
				    <button class="jjim_btn"><i class="fa-sharp fa-solid fa-heart"></i></button>
				    
				    <a href="../trip/trip_detail.do?tno=${vo.tno }">
				    <img src="${vo.image }">
				    <h4 class="item_name">${vo.name }</h4>
			        <div class="item_info">
			            <span class="score"><i class="fa-solid fa-star"></i>4.6</span><span class="hit">(652건)&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${vo.hit}</span> 
			        </div>
			        </a>
			        
				 </div>
				 
			   </c:forEach>
			</div>
			
 		      <div class="pagination">
		        <ul>
		         <c:if test="${startPage>1 }">
		          <li><a href="../trip/trip_all.do?page=${startPage-1 }&tcno=${tcno}">&laquo; Previous</a></li>
		         </c:if>
		          <c:forEach var="i" begin="${startPage }" end="${endPage }">
		            <li ${i==curpage?"class=current":"" }><a href="../trip/trip_all.do?page=${i }&tcno=${tcno}">${i }</a></li>
		          </c:forEach>
		         <c:if test="${endPage<totalpage }">
		          <li><a href="../trip/trip_all.do?page=${endPage+1 }&tcno=${tcno}">Next &raquo;</a></li>
		         </c:if>
		        </ul>
		      </div>
	
		</div>
		
		
</div>
<script type="text/javascript">
</script>

</body>
</html>