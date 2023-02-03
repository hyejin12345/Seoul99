<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
#tt{
  color:black;
  
}
</style>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.del').click(function(){
		let no=$(this).attr("data-no");
		$.ajax({
			type:'post',
			url:'../adminpage/notice_delete.do',
			data:{"no":no},
			success:function(result)
			{
				reload()
			}
		})
	})
})
</script> -->
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
  <h2 class="sectiontitle text-left">공지사항</h2>
  <div style="height: 5px"></div>
  <div style="height: 550px">
  <table class="table">
    <tr class="text-right">
      <td>
        <a href="../adminpage/notice_insert.do" class="btn btn-sm btn-danger">공지등록</a>
      </td>
    </tr>
  </table>
  <table class="table">
    <tr>
      <th width=10% class="text-center">구분</th>
      <th width=40% class="text-center">제목</th>
      <th width=10% class="text-center">이름</th>
      <th width=15% class="text-center">작성일</th>
      <th width=10% class="text-center">조회수</th>
      <th width=15% class="text-center"></th>
    </tr>
    <%--
       for(FreeBoardVO vo:request.getAttribute("list"))
    --%>
    <c:forEach var="vo" items="${list }"><%-- request.setAttribute("list",list) => request.getAttribute("list") ${list} --%>
      <tr>
        <td width="10%" class="text-center">${vo.prefix}</td><%-- vo.getNo() = {} getXxx() --%>
        <td width="40%">
         <a href="../notice/ad_detail.do?nno=${vo.nno }" id="tt">${vo.title}</a>&nbsp;
         <c:if test="${vo.dbday==today }">
           <sup><img src="../img/new.gif"></sup>
         </c:if>
        </td>
        <td width="10%" class="text-center">${vo.name }</td>
        <td width="15%" class="text-center">${vo.dbday }</td>
        <td width="10%" class="text-center">${vo.hit }</td>
        <td width="15%" class="text-center">
          <a href="../adminpage/notice_update.do?nno=${vo.nno }" class="btn btn-xs btn-success">수정</a>
          <a href="../adminpage/notice_delete.do?nno=${vo.nno }" class="btn btn-xs btn-info">삭제</span>
        </td>
      </tr>
    </c:forEach>
  </table>
  </div>
  <table class="table">
    <tr>
      <td class="text-center">
       <a href="../notice/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
        ${curpage } page / ${totalpage } pages
       <a href="../notice/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
      </td>
    </tr>
  </table>
  </main>
</div>

</body>
</html>