<%-- 검색결과 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
/* .container{
	width:1200px;
	padding: 0 15px;
} */
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
.content_item{
	width:280px;
	height:280px;
	clear:both;
	background:yellow;
}
.content_item>div{
	width:100%;
	height:100%;
	float:left;
	margin: 0 30px 30px 0;
	box-shadow : 0 5px 10px 0 rgb(0,0,0,0.2);
	 
	position:relative;
	background:lightblue;
}
.content_item div:nth-child(3n){
/* margin: 0 0 30px 0; */
}

.content_item div img{
 display:inline-block;
 vertical-align:middle;
 width:100%;
 height:200px;
 object-fit:fit;
 
}
.item_name{
	margin: 20px 20px 10px 20px;
}
.content_item .item_info{
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
}
/* 페이지 넘버링 */
.pagination{

	margin: 20px auto;
	display:block;
	text-align: center;
	
	/* background: lightgray; */
}
.pagination ul{
	display:inline-block;
	margin: 0;
	
	text-align:center;
}
.pagination ul li{
	width:16px;
	height:16px;
	margin: 16px;
	float:left;
	
	display:inline-block;
}
.pagination ul li a{
	width:10px;
	height:10px;
	margin:16px;
	display:block;
}

</style>
</head>
<body>
<div class="container">


	<div class="route">
		<a href="">홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		<a href="">검색</a>
	</div>
	
	<%-- 검색어 입력 => 이름, 주소에서 포함여부 확인 --%>
	<h1 class="search_toptitle">
		<span class="word">"검색어"</span> 관련 검색결과 <span class="word_count">OO건</span>
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
		<div class="trip_content">
	
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
			
  	      <%-- <div class="pagination">
	        <ul>
	        	<c:choose>
		          	<c:when test="${startpage<=1 }">
		          		<li><a href="../trip/trip_all.do?tcno=${tcno }&page=1"><i class="fa-solid fa-angle-left"></i></a></li>
		          	</c:when>
		          	<c:when test="${startpage>1 }">
		          		<li><a href="../trip/trip_all.do?tcno=${tcno }&page=${startpage-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
		          	</c:when>
		        	</c:choose>
	        	<c:forEach var="i" begin="${startpage }" end="${endpage }">
	            	<li ${i==curpage?"class=current":"" }><a href="../trip/trip_all.do?tcno=${tcno }&page=${i }">${i }</a></li>
	        	</c:forEach>
	        	<c:if test="${endpage<totalpage }">
	        		<li><a href="../trip/trip_all.do?tcno=${tcno }&page=${endpage+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
	        	</c:if>
	        </ul>
	      </div> --%>
	      
	      
		</div>
		
		
</div>	
</body>
</html>