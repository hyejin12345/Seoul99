<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울99여행</title>
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
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
<div class="container">
   <div class="row">
            <table class="table">
     <tr>
       <c:forTokens items="${vo.poster }" delims="^" var="image">
       <td>
        <img src="${image }" style="width: 1200px" class="img-rounded"></td>
       </c:forTokens>
              <td class="text-center">
               <img src="${image }" style="width:1200px">
              </td>
       
     </tr>
   </table>
   </div>
   <div style="height: 10px"></div>
   <div class="row">
    <div class="col-sm-7">
      <table class="table">
       <tr>
        <td colspan="2">
          <h3>${vo.name }&nbsp;<span style="color:orange">${vo.score }</span></h3>
        </td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">주소</span></th>
         <td width="85%">${addr1 }<br>
           <br><sub style="color:gray">지번:${addr2 }</sub>
         </td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">전화번호</span></th>
         <td width="85%">${vo.tel }</td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">음식종류</span></th>
         <td width="85%">${vo.type }</td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">가격대</span></th>
         <td width="85%">${vo.price }</td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">영업시간</span></th>
         <td width="85%">${vo.time }</td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">주차</span></th>
         <td width="85%">${vo.parking }</td>
       </tr>
       <c:if test="${vo.menu!='no' }">
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">메뉴</span></th>
         <td width="85%">
           <ul>
            <c:forTokens items="${vo.menu }" delims="원" var="m">
           <li>${m }원</li>
         </c:forTokens>
           </ul>
         </td>
       </tr>
       </c:if>
       <tr>
          <td colspan="2" class="text-right">
             <c:if test="${sessionScope.id!=null }">
             
             
                 <c:if test="${mylike_count==0 }">
                  <a href="../like/foodlike_insert.do?fno=${vo.fno }" class="circle_btn"><i class="fa-regular fa-thumbs-up"></i></a>(${like_total })
                 </c:if>
                 <c:if test="${mylike_count!=0 }">
                   <span class="circle_btn"><i class="fa-regular fa-thumbs-up"></i></span>(${like_total })
                 </c:if>
                 
                 <c:if test="${myjjim_count==0 }">
                  <a href="../jjim/foodjjim_insert.do?fno=${vo.fno }" class="circle_btn"><i class="fa-sharp fa-solid fa-heart"></i></a>
                 </c:if>
                 <c:if test="${myjjim_count!=0 }">
                   <span class="circle_btn"><i class="fa-sharp fa-solid fa-heart"></i></span>
                 </c:if>
                 
                 <a href="#" class="btn btn-xs btn-warning">예약하기</a>
             </c:if>
              <a href="javascript:history.back()" class="btn btn-xs btn-primary">목록</a>
            </td>
       </tr>
      </table>
   </div>
   <!-- 지도~ -->
    <div class= "col-sm-5">
       <div id="map" style="width:100%;height:350px;"></div>

      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b3cee0c7ab68fc8a8f7906e38fdf071&libraries=services"></script>
      <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };  
      
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${addr1}', function(result, status) {
      
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {
      
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });
      
              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
              });
              infowindow.open(map, marker);
      
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });    
      </script>
    </div>
   </div>
   </div>
</body>
</html>