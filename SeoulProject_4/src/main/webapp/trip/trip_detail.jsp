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
/*  .container{
	width:1200px;
}  */
.container a{
	color:black;
	text-decoration:none;
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
.top_section{
	position:relative;
	margin:60px 0 15px 0;
	
	background:lightblue;
}
.trip_name{
	margin:0 50px 0 0;
	line-height:36px;
	display:inline;
	float:left;
	/*background:yellow;*/
}

.share_btn{
	-webkit-appearance: none;
	-moz-appearance: none;
	 appearance:none;
	 
	width : 40px;
	height : 40px;
	        
	/* 버튼 색상 */
	background : white;
	border : 1px solid lightgray;
	border-radius : 50%;
	

}
.jjim_btn{
	position:inherit;  /* 원래 적용된 position 빼기 */
	
	width : 40px;
	height : 40px;
	border : 1px solid lightgray;

}
.item_info{
	margin : 15px 0 0 0;
	
	/*background:pink;*/
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
.intro_section{
	margin:0;
	width:100%;
	height:500px;
}
.intro_section img{
	margin:0;
	width:60%;
	height:100%;
	background:lightgray;
	float:left;
}
.trip_about{
	margin:0;
	width:40%;
	height:100%;
	background:pink;
	float:right;
}
.recent_review{
	width:100%;
	height:200px;
	background:yellow;
	clear:both;
}
.goodpoint_section{
	width:100%;
	height:300px;
	background:lightblue;
}
.tripmap_section{
	width:100%;
	height:450px;
	background:gray;
}
.trip_review{
	width:100%;
	height:600px;
	background:yellow;
}
.trip_map{
	width:60%;
	height:100%;
	background:lightgray;
	float:left;
}
.trip_nearby{
	width:40%;
	height:100%;
	background:pink;
	float:right;
}
</style>
</head>
<body>
<div class="container">


	
		<!-- 여행지명 / 평점 / 조회수 / 공유 / 찜버튼 -->

		
		<div class="route">
			<a href="">홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
			<a href="">여행지</a>
		</div>
		<div class="top_section">
			<h1 class="trip_name">여행지명</h1>
			<div class="top_buttons">
				<button class="share_btn"><i class="fa-solid fa-arrow-up-from-bracket"></i></button>
				<button class="jjim_btn"><i class="fa-sharp fa-solid fa-heart"></i></button>
			</div>
			<div class="item_info">
				<span class="score"><i class="fa-solid fa-star"></i>4.6</span><span class="hit">(652건)&nbsp;&nbsp;&nbsp;&nbsp;조회수 256</span> 
			</div>
		</div>

		<!-- 사진 / 소개 -->
		<div class="intro_section">
			<img src="">
			<div class="trip_about"></div>
		</div>
		<div class="recent_review">
		최근 리뷰
			<div>
				<!-- forEach 돌려서 최근 리뷰 3개 가져오기 -->
				<h3></h3>
				<span>유저명</span>
				<span>★4/5</span>
				<span>본문내용 중략...</span>
			</div>
		</div>
		<div class="goodpoint_section">이런 점이 좋았어요</div>
		<div class="trip_location">위치</div>
		<div class="tripmap_section">
			<div class="trip_map">지도</div>
			<div class="trip_nearby">근처 추천</div>
		</div>
		
		<!-- 여행지 리뷰 -->
		<!-- .jsp가 맞는지 ${tripReview_jsp}가 맞는지 확인하기 -->
		
		

	
</div>
</body>
</html>