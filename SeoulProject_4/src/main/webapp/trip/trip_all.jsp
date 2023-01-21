<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

*{
	margin:0;
	padding:0;
	list-style: none;
	border-collapse: collapse;
	text-decoration: none;
	color: black;
}
.container{
	width:1200px;
	margin:0 auto;
}
.route{
	padding: 20px 0;
	width:100%;
	background:skyblue;
}
.trip_toptitle{
	width:100%;
	height:120px;
	background:yellow;
}
.filterbar{
	width:100%;
	height:50px;
}
.container .trip_side{
	position:relative;
	width:20%;
	height:800px;
	background:pink;
	float:left;
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
	height:800px;
	background:lightgray;
	float:right;
}
.content_item{
	width:30%;
	height:200px;
	background:gray;
}

/* ------- */
div.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  width: 180px;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: auto;
  background:skyblue;
}

div.desc {
  padding: 15px;
  text-align: center;
}
</style>
</head>
<body>
<div class="container">


		<div class="route">
		 <a>홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		 <a>여행지</a>
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
			<h3 class="content_title">서울 인기명소</h3>
			<!-- 3*3 정렬 -->
			

	  <!-- <div class="content_item">
			   <img class="item_img" src="">
			   <div class="item_info">
			       <span class="score"><i class="fa-solid fa-star"></i>4.6</span><span class="hit">(652건)&nbsp;&nbsp;&nbsp;&nbsp;조회수 362</span>
			   </div>
			</div> -->
		</div>
		
		
</div>
<script type="text/javascript">
</script>

</body>
</html>