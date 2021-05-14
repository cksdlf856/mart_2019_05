<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리추로 상회</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">	  
		  
	$(function(){
		  var change=0;//아이폰 화면 보여주기 위한 조건 0이면 보여주고 1이면 숨긴다.	
		  
		  
		  if($("#term").val()==''?true:false){
		  $(document).ready(function(){
			  term=1;//한번만 돌게 조건을 바꿔줌. 
			  window.location.href="/web/orderDiscount.do?ownerno=1&term=0";
		  });
		  }
		  
		  $("div#message").hide();//문자 메세지 숨기기
		  
		  $("div#iphon").hide();//아이폰 숨기기
		
		  $('#categoryButton,#cateShow').mouseenter(function(){
		    $('#cateShow').css("display","block");
		  });
		  $('#categoryButton,#cateShow').mouseleave(function(){
		    $('#cateShow').css("display","none");
		  });
		  
		  $('#orderButton').mouseenter(function(){
			 $('#orderButton').css("color","black");
			 $('#orderButton').css("background-color","white");
			 
		  });
		  $('#orderButton').mouseleave(function(){
			 $('#orderButton').css("color","white");
			 $('#orderButton').css("background-color","black");
		  });
		  
		  $('#basketButton').mouseenter(function(){				
		     $('#basketButton').css("background-color"," #ebf2f3");				 
		  });
		  $('#basketButton').mouseleave(function(){				 
		     $('#basketButton').css("background-color","white");
		  });		  
		  $('#recommendButton').mouseenter(function(){				
			 $('#recommendButton').css("background-color"," #ebf2f3");					 
	      });
		  $('#recommendButton').mouseleave(function(){					 
			 $('#recommendButton').css("background-color","white");
		  });
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////장바구니 저장하기	
	
	
	      $("#basketButton").click(function(){
	    	 $("#frm").submit();
	    	  	  
	      });
		  
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////주문하기
			
		  $("#orderButton").click(function(){
			 
			 var supportPrice=$("#supportReserve").html().substr(0,$("#supportReserve").html().length-1);//후원 적립금			 
			 
			 var frm=$("#frm").attr("action","/web/orderMove.do?page=1&supportPrice="+supportPrice);//주문하기 페이지 이동 후 이전페이지로 돌아올때 page=1은  storeOrder페이지로 이동
			 //주문하기 할때 후원 적립금도 가지고 간다.
			 frm.submit();
			 
			 $("#frm").attr("action","/web/bmbasketInfo.do");//다시 action을 원래로 되돌린다.
			 
		  });
		  	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////아이폰 띄우고 숨기기
			 
			  $("#phonImoticon").click(function(){//아이폰 보여주고 다시 숨겨줌
				  if(change==0){
				  $("div#iphon").show(1000);
				  change=1;
				  
				  var sysdate=new Date();//아이폰 화면 현재 시간	 
				  var year=sysdate.getFullYear();
				  var mon=sysdate.getMonth()+1;
				  var day=sysdate.getDate();
					
				  var hour=sysdate.getHours();
				  var mi=sysdate.getMinutes();
				  
				  $("b#date").html(year+'년'+' '+mon+'월'+' '+day+'일'+' '+hour+'시'+' '+mi+'분'+' ');//현재 날짜 시간 넣어줌
			  
				  
				  }
				  else if(change==1){
					  $("div#iphon").hide(1000);
					  change=0; 
				  }
			  });	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////등록시간,마감시간 찍어주는곳
	        var countRentarTime=setInterval(function(){//등록시간, 마감시간, 남은 시간 찍어줌(굳이 등록시간이랑 마감시간을 같이 안에 넣지 않아도 되지만 발생되는 순서 때문에 걍 다 넣어줌)
	        	
				var startdate=new Date();
				var styear=startdate.getFullYear();//등록시간 년도
				var stmon=startdate.getMonth()+1;//등록시간 달
				var stday=startdate.getDate();//등록시간 날
				var todayHours=startdate.getHours();//현재시간 
				var todayMi=startdate.getMinutes();//현재 분
				var todaySe=startdate.getSeconds();//현재 초
				startdate.setHours(14);//등록시간 2시
				var sthour=startdate.getHours();//바로 위에서 시간을 넣어주고 뽑아줘야 한다. var sthour=startdate.setHours("14");넣어준걸 바로 변수에 넣어서 사용하면 안된다...(여기서 20분 소요 ㅡㅡ..)
				startdate.setHours(20);//마감시간 8시
				var enhour=startdate.getHours();//마감시간 시간
				startdate.setMinutes(0);
				var stmi=startdate.getMinutes();//등록시간 마감시간에서 쓰는 분
				
				var rentarHours=(enhour-todayHours-1);//8시 마감에서 현재 시간을 빼고 -1시간을 더 빼준다.
				var rentarMi=(60-todayMi-1);//60분에서 현재 분을 빼준다.-1을 해줘야 2시간 59분 남았다고 표시가 된다. 아니면 2시간 60분 남았다고 표시된다.
				var rentarSe=(60-todaySe);//60초에서 현재 초를 빼준다.
					
			  	$("b#startTime").html(styear+'년'+' '+stmon+'월'+' '+stday+'일'+' '+sthour+'시'+' '+stmi+"분");//등록시간
			  	$("b#endTime").html(styear+'년'+' '+stmon+'월'+' '+stday+'일'+' '+enhour+'시'+' '+stmi+"분");//마감시간
				$("b#rentarTime").html(rentarHours+'시간'+' '+rentarMi+"분"+' '+rentarSe+"초")//남은시간
				
			    var supportReserve=($("input[name='productprice']").val())*eval("${discountrate}")//10퍼센트 적용한 최대 후원적립금, ex) 36000원 * 0.1퍼 = 3600원
			  		   
			  	var totalTimeToSeconds=6*3600;//후원적립금이 적용되는 시간 을 초로 변환 .6시간 * 3600초 = 21600초
			  		   
			    var supportReserveUpSeconds=(totalTimeToSeconds/supportReserve); 
			  	//전체 초 21600 나누기 후원적립금 3600 = 6초 (6초마다 1원씩 차감)
			  		  
			    var rentarTimeToSeconds=(rentarHours*3600)+(rentarMi*60)+rentarSe;//남은시간을 초로 변환
			  		   
			    var currentSupportReserve=supportReserve-((totalTimeToSeconds-rentarTimeToSeconds)/supportReserveUpSeconds);
			    //6초마다 1원씩 차감되는 현재 후원 적립금
			    //최초 후원적립금 3600 - ((6시간을 초로 변환 21600초 - 남은시간을 초로 변환 ) / 6초로 나누어 주면 앞시간에서 날라간 후원적립금을 알 수 있다 ) 거기에 총 후원 적립금을 빼면 남은 후원적립금이 6초마다 차감된다.
			    $("b#supportReserve").html(Math.floor(currentSupportReserve)+"원");
			  		   
			  	if((rentarHours==0&&rentarMi==0&&rentarSe==1)||rentarHours<0||rentarHours>5){
			  		$("b#rentarTime").html("후원 적립금 마감");
			  		$("b#supportReserve").html(0+"원");
			  		clearInterval(countRentarTime);
			  	}
				});
				
		});
		 
</script>
<style type="text/css">
	.category:hover{
		border-bottom:3px solid black;
	}
	.basket:hover{
		border-bottom:2px solid gray;
	}
	th{
		font-size:13px;
		color: gray;
		
	}
	#orderButton{
	    cursor: pointer;
	}
	
	
</style>
</head>
<body>
<input id="term" type="hidden" value="${term}">

	<div style="position:fixed; background-color:white; padding-bottom:1.5%; padding-top:1.5%; float: left; width: 100%; margin-top: -10px; border-bottom: 1px solid gray;">
		<a href="#"><img alt="" src="/web/store/리추로 상회.png" width="150px;" height="60px;" style="float: left; margin-left: 15%;"></a>
		<img id="categoryButton" class="category" alt="" src="/web/store/카테고리.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="/web/store/깜짝세일.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="/web/store/잘나가요.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="/web/store/리추로 연구소.png" width="90px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		
		<div id="phonImoticon" style="float:right; width: 4%; background-color: white; margin-right:8.5%; margin-top:1%;">
			<img alt="" src="/web/store/문자.png" style="cursor:pointer ; margin-left: 27%; margin-bottom:5%; float: left;" width="42%" height="42%">
		    <b id="phonImoticon" class="basket"  style="color:gray; float:left; margin-left:13%; cursor:pointer;  font-family: monospace; font-size: 12px;">메세지</b>
		</div>
		
		<div style="float:right; width: 4%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="/web/store/검색.png" style="margin-left: 27%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">상품검색</b>
		</div>
		<div style="float:right; width: 4%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="/web/store/장바구니.png" style="margin-left: 26%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">장바구니</b>
		</div>
		<div style="float:right; width: 5%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="/web/store/사장님.png" style="margin-left: 32%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">### 사장님</b>
		</div>
		<div id="cateShow" class="cateShow" style="background-color:white; position:absolute; display:none; margin-left:30%; margin-top:3.4%; border:1px solid black; width: 600px; height: 200px;">
			<table style="width: 100%; height: 100%;">
				<tr>
					<th >탕/찜/죽/면용기</th>
					<th >피자박스</th>
					<th >비닐봉투</th>
					<th >위생용품</th>
					<th >닭/계육</th>
				</tr>
				
				<tr>
					<th>소스/국/밥용기</th>
					<th>치킨박스</th>
					<th>종이봉투</th>
					<th>포장랩</th>
					<th>쌀/잡곡</th>
				</tr>
				
				<tr>
					<th>반찬용기</th>
					<th></th>
					<th>수저</th>
					<th></th>
					<th>가공식품</th>
				</tr>
				
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th>냉장/냉동식품</th>
				</tr>
				
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th>농/수산물</th>
				</tr>
				
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th>음료</th>
				</tr>
			</table>
		  
		</div>			
	    
	</div>

<form id="frm" method="post" action="/web/bmbasketInfo.do">
<div style="margin-top: 7.5%; float: left; width: 100%;">	
	<div style="float:left;margin-top:4%; margin-left: 17.5%; width: 65%; background-color: white;">
		<div style="float: left; ">
		   <img alt="" src="/web/store/processedFood/F13-RM-C87-00002.jpg" width="400px" height="400px">
		   <input name="productimage" type="hidden" value="F13-RM-C87-00002.jpg">
		   <input name="ownerno" type="hidden" value="1">
		   <input name="no" type="hidden" value="2">
		</div>
	    <div style="float: right;background-color: white; width:45%;">
	    	<div style="float: left;margin-bottom:5%; width: 100%; background-color: white;">
		      <b style="font-size: 30px;">삼화 은표고추장지함 14KG</b>
		      <input type="hidden" name="productname" value="삼화 은표고추장지함 14KG">
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">등록시간</b><b id="startTime" style="color:red; font-size: 13px; float: right;"></b>	      
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">마감시간</b><b id="endTime" style="color:red; font-size: 13px; float: right;"></b>	      
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">남은시간</b><b id="rentarTime" style="color:red; font-size: 13px; float: right;"></b>	      
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">후원적립금</b><b id="supportReserve" style="color:red; font-size: 13px; float: right;"></b>	      
		    </div>
		   
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">제품코드</b><b style="float: right;">F13-RM-C87-00002</b>
		      <input type="hidden" name="productcode" value="F13-RM-C87-00002">
		    </div> 
		    
		     <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">개당단가</b><b style="float: right;">개 당 36000원</b>
		    </div>
		     <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">제조자/판매자</b><b style="float: right;">삼화</b>
		    </div>
		     <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">배송사</b><b style="float: right;">CJ대한통운</b>
		    </div>
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">판매가격</b><b style="float: right;">36000원</b>
		      <input type="hidden" name="productprice" value="36000">
		    </div>
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">수량</b>
		      <b style="font-size: 13px; float: right; margin-top: 13px; margin-left: 5px;">개</b>
		      <b style="cursor:pointer; color:gray; font-size:10px; float:right; margin-top:20px; margin-left:-15px;  ">▼</b>
		      <b style="cursor:pointer; color:gray; font-size:10px; float:right ; margin-top:7px; margin-left:5px; ">▲</b>
		      <input name="productquantity" type="text" style="width:18px; height: 40px; float: right;padding-left: 35px;" value="1">
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <input id="orderButton" type="button" value="주문하기" style="border:1px solid black; width: 100%; background-color: black; color: white; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		    </div>
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <input id="basketButton" type="button" value="장바구니" style="cursor:pointer; float:left; border:1px solid gray; width: 48.5%; background-color: white; color: gray; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		      <input id="recommendButton" type="button" value="추천상품" style="cursor:pointer; float:right; border:1px solid gray; width: 48.5%; background-color: white; color: gray; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		    </div>
	    </div>
	</div>
</div>
</form>


<div id="iphon" style="position:absolute; position:fixed ; top:17%; left:77%;   width: 300px; height: 500px; background-color:#F5F6F8 ; border: 1px solid skyblue; border-radius: 25px 25px 25px 25px;">
	<div style="background-color:#F5F6F8 ; border: 1px solid skyblue; margin-left:38%; margin-top:6%; width: 25%; height:1.5%; border-radius: 25px 25px 25px 25px;">
	</div>
	<div style="margin-left:4.5%; margin-top:5%; width: 90%; height:80%; background-color: white; border: 1px solid skyblue;">
	
		<div style="margin-top: 2%; margin-left: 40%;">
			<b style="color: gray; font-size: 11px;">문자 메세지</b>
		</div>
		
		<div style="margin-left: 25%;">
			<b id="date" style="color: gray; font-size: 11px;"></b>
		</div>
		
		<div id="message" style="width: 70%; padding:8px 8px 8px 8px; background-color: #EEEFF2; border-radius: 20px 20px 20px 20px; margin-left: 2%; margin-top: 2%;">
			<b style="font-size: 14px;">  [리추로상회]본인확인 인증번호는 </b>
			<b id="code" style="font-size: 14px; color: red; border-bottom: 1px solid red;"></b>
			<b id="hicode" style="display: none;"></b>
			<b style="font-size: 14px;">입니다.</b>
		</div>
	</div>
	<div style="background-color:#F5F6F8 ;cursor:pointer; border: 2px solid skyblue; margin-left:43%; margin-top:2%; width: 14%; height:8%; border-radius: 35px 35px 35px 35px;">
	</div>	
</div>


</body>
</html>