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
                <h4>ȸ������</h4>
               <!-- <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div> SNS �α��� ���� ��ũ �ּ�-->
                <span>ȸ������ ������ �Է��� �ּ���</span>
                <input type="text" placeholder="�̸�" />
                <input type="text" placeholder="ID" /> <!-- ���̵� �ߺ� üũ -->
                <input type="password" placeholder="Password" /> <!-- ��й�ȣ üũ -->
                <input type="tel" placeholder="��ȭ��ȣ" />
                <input type="date" name="�������">
                <input type="radio" name="����" value="����" value="����">
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
                </div>  SNS �α��� ���� ��ũ �ּ�-->
                <span style="margin-top: 4px">����99���� ���̵�� <br>��� ���񽺸� �̿��� �� �־��.</span>
                <input type="email" placeholder="Email" />
                <input type="password" placeholder="Password" />
                <div style="float: left;">
	                <a href="#" class="find" >���̵�/��й�ȣ ã��</a> <!-- ���̵� ��й�ȣ ã�� ��ũ -->
	                <a href="#" class="signgo">&nbsp;&nbsp;|&nbsp;&nbsp;ȸ������</a> <!-- ���̵� ��й�ȣ ã�� ��ũ -->
                </div>
                <button>�α���</button>
            </form>
        </div>
        <<div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h2>����99���࿡ ���Ű��� <br>ȯ���մϴ�!</h2>
                    <p>����99������ �̿��Ϸ��� <br>�α����� �ʿ��մϴ�!</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h2>����99���࿡ ���Ű��� <br>ȯ���մϴ�!</h2>
                    <p>����99������ �̿��ϰ� �ʹٸ� <br>ȸ�������� ���ּ���!</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
<script src="../member/member.js"></script>
</body>
</html>