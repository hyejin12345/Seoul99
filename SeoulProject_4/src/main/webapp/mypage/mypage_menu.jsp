<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

<div id="menu">
			<a href="" title="Dashboard" ><i class="icon-eye-close"></i><span> 
			개인 정보</span></a>
			<a href="#" title="News" class="submenu" name="up-sub"><i class="icon-edit"></i><span> 정보 수정</span></a>
    <div id="up-sub" style="display: none;">
					<a href="../mypage/join_update.do" title=""><i class="icon-user"></i><span>  
					회원 정보/수정</span></a>
					<a href="#" title="Photo Gallery"><i class="icon-unlock"></i><span>  
					비밀번호 변경</span></a>
      <a href="../mypage/join_delete.do" title="Photo Gallery"><i class="icon-zoom-out"></i><span>  
					회원 탈퇴</span></a>
				</div>
			<a href="" title="Pages" class="submenu" name="page-sub"><i class="icon-file-alt"></i><span> 커뮤니티 수정</span></a>
    <div id="page-sub" style="display: none;">
					<a href="" title="Video Gallery"><i class="icon-comments"></i><span>  
					묻고 답하기</span></a>
					<a href="" title="Photo Gallery"><i class="icon-picture"></i><span>  
					자유게시판</span></a>
				</div>
			<a href="" title="Media" class="submenu" name="media-sub"><i class="icon-wrench"></i><span>  
			서비스 수정</span></a>
			<!-- Media Sub Menu -->
				<div id="media-sub" style="display: none;">
					<a href="../mypage/trip_jjim_list.do" title="Video Gallery"><i class="icon-heart"></i><span>  
					여행지 찜</span></a>
					<a href="../mypage/food_jjim_list.do" title=""><i class="icon-heart"></i><span>  
					맛집 찜</span></a>
          <a href="" title="Photo Gallery"><i class="icon-food"></i><span>  
					예약</span></a>
				</div>
    
			<!-- Media Sub Menu -->
			
	</div>

</body>
</html>