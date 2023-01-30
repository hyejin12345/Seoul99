<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울99여행</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">

#header{
  overflow: visible;
  /*position: relative;*/
  background-color: #fff;
  
  /**/
  position:fixed;
  top:0;
  width:100%;
  height:100px;
  z-index:500;
}
#header .container{
	width:1200px;
	height:100%;
}

#header .row{
	box-shadow : 0px 10px 10px -10px rgba(0,0,0,0.2);
	height:100%;
}
#logoNsearch{
	position:relative;
}
#logoNsearch a{
	margin:0; padding:0;
}
.search {
  position: relative;
  width: 260px;
  height: 36px;
  float:left;
  margin:32px 32px 32px 0px;
}

.search input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 4px;
  padding: 10px 45px 10px 15px;
  font-size: 14px;
  float:left;
  color:gray;

  position:absolute;
  height:100%;
}

.search input:focus{
  color: black;
}

.search img {
  position : absolute;
  width: 18px;
  top: 9px;
  left: 225px;
}
/* #test{
	display:flex;
	align-items:center;
} */

#join_bg{
	width:80px;
	height:40px;
	border: 1px solid #004fff;
	border-radius:50px;
	
	display:inline;
	position:absolute;
	top:30px;
	right:8px;
	z-index:-1;
}
#login_bg{
width:80px;
height:40px;
background:#004fff;
border-radius:50px;

display:inline;
position:absolute;
top:30px;
right:15px;
z-index:-1;
}

.sub-menu li span{
	font-size: 13px;
    line-height: 50px;
    padding: 0 20px;
    cursor:pointer;
}
.sub-menu li span:hover{
	color:#004fff;
}
ul li .fa-solid{
	font-size:20px;
}
</style>
</head>
<body>

   <div class="wrap">
      <header id="header">
         <div class="container">
            <div class="row">
               <div>
                  <button id="primary-nav-button" type="button">Menu</button>
                  <div id="logoNsearch">
	                  <a href="../main/main.do" style="float:left;">
	                     <div class="logo">
	                        <img id="logo" src="../img/header_logo.png">
	                     </div>
	                  </a>
	
					  <div class="search">
					    <form method =post action="../main/search.do">
							<input type="text" placeholder="검색어를 입력하세요." name="searchWord" autocomplete="off">
							<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
						</form>
					  </div>
                  </div>
                  <nav id="primary-nav" class="dropdown cf" style="float:right">
                     <ul class="dropdown menu" >
                        <li class='active'><a href="../main/main.do">홈</a></li>
                        <li><a href="../trip/trip_all.do?tcno=1">여행지</a>
                           <ul class="sub-menu">
                              <li><a href="../trip/trip_all.do?tcno=1">명소</a></li>
                              <li><a href="../trip/trip_all.do?tcno=2">자연</a></li>
                              <li><a href="../trip/trip_all.do?tcno=3">즐길거리</a></li>
                              <li><a href="../trip/trip_all.do?tcno=4">쇼핑</a></li>
                           </ul></li>
                        <li><a href="#">맛집</a>
                           <ul class="sub-menu">
                              <li><a href="#">서울 맛집 검색</a></li>
                              <li><a href="#">맛집예약</a></li>

                           </ul></li>
                        <li><a href="#">커뮤니티</a>
                           <ul class="sub-menu">
                              <li><a href="../board/list.do">자유게시판</a></li>
                              <li><a href="#">공지사항</a></li>
                              <li><a href="#">문의게시판</a></li>
                           </ul>
                        </li>
                         <li class='active'>
                        	<a href="#" id="join" style="color:#004fff">회원가입
                        		<div class='active' id="join_bg"></div>
                        	</a>
                        </li>
                        <li class='active'>
                        	<a href="#" id="login_btn" style="color:white;">로그인
                        		<div class='active' id="login_bg"></div>
                        	</a>
                        </li>
                        
                        <!-- 마이페이지 -->
<!--                    <li><a href="#"><i class="fa-solid fa-user"></a></i>
                        	<ul class="sub-menu">
                        		<li><span>마이페이지</span></li>
                        		<li><span>로그아웃</span></li>
                        	</ul>
                        </li>   -->
                        
                        
                     </ul>
                  </nav>
                  <!-- / #primary-nav -->
               </div>
            </div>
         </div>
      </header>
   </div>

</body>
</html>