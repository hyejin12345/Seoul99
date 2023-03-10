<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
textarea{
resize: none;
}
h2{
margin:60px 0;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
    <h2 class="sectiontitle">글쓰기</h2>
    <div style="height: 5px"></div>
    <div style="height: 550px">
    <form method="post" action="../board/insert_ok.do" enctype="multipart/form-data">
    	    <table class="table">
    	<!-- <tr>
    		<th width=20% class="text-center">이름</th>
    		<td width=80% align=left>
    		<input type=text name=name size=30 class="input-sm" required>
    		</td>
    		</tr>
    		-->
    	<tr>
    		<th width=20% class="text-center">제목</th>
    		<td width=80% align=left>
    			<input type=text name=title size=60 class="input-sm" required>
    		</td>
    	</tr>
    	<tr>
    		<th width=20% class="text-center">내용</th>
    		<td width=80% align=left>
    			<textarea rows="10" cols="60" name="content" required></textarea>
    		</td>
    	</tr>
    	<tr>
			<th width=20% class="text-center">첨부파일</th>
				<td width=80% align=left>
					<input type=file name=upload size=20 class="input-sm">
				</td>
			</tr>
    	<tr>
    		<th width=20% class="text-center">비밀번호</th>
    		<td width=80% align=left>
    			<input type=password name=pwd size=15 class="input-sm" required>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="text-center">
    			<input type=submit value="글쓰기" class="whitegray_btn">
    			<input type=button value="취소" class="whitegray_btn" onclick="javascript:history.back()">
    		</td>
    	</tr>
    </table>
    </form>
    </div>
  </main>
  </div>
</body>
</html>