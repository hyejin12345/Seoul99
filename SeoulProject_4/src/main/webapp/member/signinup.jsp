<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../member/member.css">

<style type="text/css">
</style>
</head>
<body>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="#">
                <h4>회원가입</h4>
               <!-- <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div> SNS 로그인 연결 링크 주석-->
                <span>회원가입 정보를 입력해 주세요</span>
                <input type="text" placeholder="이름" />
                <input type="text" placeholder="ID" /> <!-- 아이디 중복 체크 -->
                <input type="password" placeholder="Password" /> <!-- 비밀번호 체크 -->
                <input type="tel" placeholder="전화번호" />
                <input type="date" name="생년월일">
                <input type="radio" name="성별" value="남자" value="여자">
                <button>Sign Up</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="#">
                <img src="../member/logo.png" class="loginimg" style="margin-top: -10px;margin-left: 13px;">
                <!-- <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>  SNS 로그인 연결 링크 주석-->
                <span style="margin-top: 4px">서울99여행 아이디로 <br>모든 서비스를 이용할 수 있어요.</span>
                <input type="email" placeholder="Email" />
                <input type="password" placeholder="Password" />
                <div style="float: left;">
	                <a href="#" class="find" >아이디/비밀번호 찾기</a> <!-- 아이디 비밀번호 찾기 링크 -->
	                <a href="#" class="signgo">&nbsp;&nbsp;|&nbsp;&nbsp;회원가입</a> <!-- 아이디 비밀번호 찾기 링크 -->
                </div>
                <button>로그인</button>
            </form>
        </div>
        <<div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h2>서울99여행에 오신것을 <br>환영합니다!</h2>
                    <p>서울99여행을 이용하려면 <br>로그인이 필요합니다!</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h2>서울99여행에 오신것을 <br>환영합니다!</h2>
                    <p>서울99여행을 이용하고 싶다면 <br>회원가입을 해주세요!</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
<script src="../member/member.js"></script>
</body>
</html>