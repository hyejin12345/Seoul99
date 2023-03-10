<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear" style="width:80%;position:relative;left:20px;">
    <h2 class="sectiontitle">글쓰기</h2>
    <div style="height: 5px"></div>
    <div style="height: 550px">
    <form method="post" action="../adminpage/board_insert_ok.do" enctype="multipart/form-data">
    	    <table class="table">
    	<tr>
      <th width=15% class="text-center">이름</th>
      <td width=80% align=left>
        <input type=text name=name size=20 class="input-sm " readonly value="관리자">
      </td>
    </tr>
    	<tr>
    		<th width=20% class="text-center">제목</th>
    		<td width=80% align=left>
    			<input type=text name=title size=60 class="input-sm" required>
    		</td>
    	</tr>
    	<tr>
    		<th width=20% class="text-center">내용</th>
    		<td width=80% align=left>
    			<textarea rows="10" cols="60" name="content"></textarea required>
    		</td>
    	</tr>
    	<tr>
			<th width=20% class="text-center success">첨부파일</th>
				<td width=80% align=left>
					<input type=file name=upload size=20 class="input-sm">
				</td>
			</tr>
    	
    	<tr>
    		<td colspan="2" class="text-center">
    			<input type=submit value="글쓰기" class="btn btn-sm btn-danger">
    			<input type=button value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()">
    		</td>
    	</tr>
    </table>
    </form>
    </div>
  </main>
  </div>
</body>
</html>