<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">

.search {
  position: relative;
  width: 200px;
  float:left;
}

input {
  width: 130%;
  border: 1px solid #bbb;
  border-radius: 8px;
  margin:25px;
  padding: 15px 12px;
  font-size: 14px;
  float:left;
}

div.search img {
  position : absolute;
  width: 18px;
  top: 15px;
  left: 230px;
  margin: 28px;
  cursor:pointer;
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
                  <a href="index.html" style="float:left;"><div class="logo">
                        <img src="img/logo1.PNG">
                     </div></a>

						<div class="search">
						  <input type="text" placeholder="검색어를 입력하세요.">
						  <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
						</div>
                  
                  <nav id="primary-nav" class="dropdown cf" style="float:right">
                     <ul class="dropdown menu" >
                        <li class='active'><a href="#">홈</a></li>
                        <li><a href="#">여행지</a>
                           <ul class="sub-menu">
                              <li><a href="#">명소</a></li>
                              <li><a href="#">자연</a></li>
                              <li><a href="#">즐길거리</a></li>
                              <li><a href="#">쇼핑</a></li>
                           </ul></li>
                        <li><a href="#">맛집</a>
                           <ul class="sub-menu">
                              <li><a href="#">맛집리스트</a></li>
                              <li><a href="#">맛집예약</a></li>

                           </ul></li>
                        <li><a href="#">커뮤니티</a>
                           <ul class="sub-menu">
                              <li><a href="#">자유게시판</a></li>
                              <li><a href="#">공지사항</a></li>
                              <li><a href="#">문의게시판</a></li>

                           </ul></li>
                           <li class='active'><a href="#">로그인</a></li>
                           <li class='active'><a href="#">회원가입</a></li>
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