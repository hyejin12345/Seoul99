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
::placeholder {
  color: #004fff;
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

.pagination{

	margin: 0 35px 0 0;
	display:block;
	text-align: center;
	
	/* background: lightgray; */
}
.pagination ul{
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
    color:black;
    
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
</head>
<body>
<div class="container">
 <header class="heading">
   <form method=post action="../food/food_location.do" class="inline">
     
     <%-- 쌤이 빼라함...ㅋㅋ  아 예..네네... (나중에 정리) --%>
    <div class="col-sm-2">
           <select id="id_searchType" name="searchType" class="form-control input-sm">
             <option value="T">추천검색어</option>
             <option value="W">인기검색어</option>
             <option value="C">최근검색어</option>
           </select>
        </div>
        
        <%-- 검색창 다시 넘 허접함 --%>
         <div class="col-sm=2">
          <input type="text" name="ss" class="input-sm" size=30 value="${ss}" placeholder="이곳에서 서울의 맛집을 찾아보세요!♡">
          <input type=submit value="검색">
         
        </div>
        
		    
   </form>
  </header>
  


		<!-- <div class="route">
		 <a href="">홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		 <a href="">맛집</a>
		</div> -->
		
		
		<h1 class="trip_toptitle">서울의 모든 맛집</h1>
		<div class="filterbar">
		지역필터
		</div>
		<div class="trip_side">

		  <div class="trip_category">
		  맛집 분류
		    <ul>
		      <li>편의기능</li>
		      <li>방문목적</li>
		      <li>분위기</li>
		      <li></li>
		    </ul>
		  </div>
		  <div class="trip_score">
		  맛집 평가 필터
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
				    
				    <a href="../food/food_detail.do?fno=${vo.fno }">
				    <img src="${vo.poster }">
				    <h4 class="item_name">${vo.name }</h4>
			        <div class="item_info">
			            <span class="score"><i class="fa-solid fa-star"></i>4.6</span><span class="hit">(652건)&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${vo.hit}</span> 
			        </div>
			        </a>
			        
				 </div>
				 
			   </c:forEach>
			   
		
			   </div>
			     <div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
  </div>


			   
			   <%-- 페이지 나누기 --%>
		<div class="pagination">
		        <ul>
		        	<li><a href="../food/food_location.do?fno=${fno }&page=1"><i class="fa-solid fa-angles-left"></i></a></li>
		        	<c:choose>
			          	<c:when test="${startpage<=1 }">
			          		<li><a href="../food/food_location.do?fno=${fno }&page=1"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
			          	<c:when test="${startpage>1 }">
			          		<li><a href="../food/food_location.do?fno=${fno }&page=${startpage-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
		        	</c:choose>
		        	<c:forEach var="i" begin="${startpage }" end="${endpage }">
		            	<li ${i==curpage?"class=curpage":"" }><a href="../food/food_location.do?fno=${fno }&page=${i }">${i }</a></li>
		        	</c:forEach>
		        	<c:choose>
		        		<c:when test="${endpage<totalpage }">
		        			<li><a href="../food/food_location.do?fno=${fno }&page=${endpage+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
		        		</c:when>
		        		<c:when test="${endpage==totalpage }">
		        			<li><a href="../food/food_location.do?fno=${fno }&page=${endpage }"><i class="fa-solid fa-angle-right"></i></a></li>
		        		</c:when>
		        	</c:choose>
		        	<li><a href="../food/food_location.do?fno=${fno }&page=${totalpage}"><i class="fa-solid fa-angles-right"></i></a></li>
		        </ul>
		      </div>
			</div>
			   
		
</div>
<script type="text/javascript">
</script>

</body>
</html>