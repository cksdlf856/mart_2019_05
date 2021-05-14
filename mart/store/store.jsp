<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리추로 상회</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
    var change=1;//여기로 빼줘야 10초 다 완료시 1또는 -1로 바꿔주고 다시 클릭 했을때 바로 먹힘
	var couponCountNumber=10;
	var couponCount=null;
		
	
	function startInterval(){//쿠폰 퀴즈 시간초 시작		
		     couponCount=setInterval(function(){
		    	  couponCountNumber=couponCountNumber-1;
		          $("#couponCount").html(couponCountNumber+"초");
		          if(couponCountNumber==0){
		        	 
		        	  clearInterval(couponCount);
		      		  $("#couponCount").html(10+"초");//뷰딴 10초로 초기화
		      		  couponCountNumber=10;//실제 카운트 되는 곳 10초로 초기화
		      		  $("#couponPaper").hide(100);
		        	  alert("못 가져갔네...");
		        	  change=change*-1;//이걸 해줘야 바로 다시 클릭 했을때 바로 반응 한다.
		          }
		    },1000);
	}
	function stopInterval(){//쿠폰 퀴즈 시간초 멈춤
		clearInterval(couponCount);//전역으로 빼줘야 clear를 사용 할 수 있다.
		$("#couponCount").html(10+"초");
		couponCountNumber=10;
		$("#couponPaper").hide(100);
	}
	function couponQuize(){//쿠폰 문제
		 randomNumber= Math.floor(Math.random()*6);
		if(randomNumber==0){
			$("#couponQuestion").html("족발에서 많이 쓰이는 다리는 어디 부위인가 ?");
			$("#answer1").html("앞다리");
			$("input[type=radio]#quiz1").val("앞다리");
			$("#answer2").html("뒷다리");
			$("input[type=radio]#quiz2").val("뒷다리");
			$("#answer3").html("양쪽 다리 다");
			$("input[type=radio]#quiz3").val("양쪽 다리 다");
		}else if(randomNumber==1){
			$("#couponQuestion").html("피자의 원산지는 ?");
			$("#answer1").html("몽골");
			$("input[type=radio]#quiz1").val("몽골");
			$("#answer2").html("이탈리아");
			$("input[type=radio]#quiz2").val("이탈리아");
			$("#answer3").html("프랑스");
			$("input[type=radio]#quiz3").val("프랑스");
		}else if(randomNumber==2){
			$("#couponQuestion").html("고기 염지에 필요한 재료는 ?");
			$("#answer1").html("설탕");
			$("input[type=radio]#quiz1").val("설탕");
			$("#answer2").html("후추");
			$("input[type=radio]#quiz2").val("후추");
			$("#answer3").html("소금");
			$("input[type=radio]#quiz3").val("소금");
		}else if(randomNumber==3){
			$("#couponQuestion").html("닭은 어디에서 오래 살까 ?");
			$("#answer1").html("양계장");
			$("input[type=radio]#quiz1").val("양계장");
			$("#answer2").html("야생");
			$("input[type=radio]#quiz2").val("야생");
			$("#answer3").html("상관없다");
			$("input[type=radio]#quiz3").val("상관없다");
		}else if(randomNumber==4){
			$("#couponQuestion").html("쌀을 냉장 보관하면  신선도가 얼마나 갈까 ?");
			$("#answer1").html("1 개월");
			$("input[type=radio]#quiz1").val("1 개월");
			$("#answer2").html("3 ~ 4 개월");
			$("input[type=radio]#quiz2").val("3 ~ 4 개월");
			$("#answer3").html("1 년");
			$("input[type=radio]#quiz3").val("1 년");
		}else if(randomNumber==5){
			$("#couponQuestion").html("짜장면은 유래는 ?");
			$("#answer1").html("북경");
			$("input[type=radio]#quiz1").val("북경");
			$("#answer2").html("산둥");
			$("input[type=radio]#quiz2").val("산둥");
			$("#answer3").html("충칭");
			$("input[type=radio]#quiz3").val("충칭");
		}
	}
	
	function couponSuccess(){//쿠폰 퀴즈 성공 했을때
		alert("맞춰버렸네 :( ");
		window.location.href="/web/couponinsert.do?ownerno="+1;
	}
	
	$(function(){
		
     
		
		  ////////////////////////////////////////////////////////////쿠폰
		  $("#couponPaper").hide();
		  
		  $("#couponbt").click(function(){
			  change=change*-1;
			  if(change==-1){//문제 풀기
			     $("#couponPaper").show(100);
			     couponQuize();
			     startInterval();
			  }else if(change==1){//문제 닫기
				  stopInterval();
			      $("input[type=radio]").prop("checked",false);//닫기 누르면 체크 해제
			  }
		  });
		  
		  
		  $("input[type=radio]").click(function(){
			  
			  
			  if($("input[type=radio]:checked").val()=="앞다리"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="이탈리아"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="소금"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="야생"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="3 ~ 4 개월"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="산둥"){
				  couponSuccess();
			  }else{//정답 이외의 답(틀린답)을 선택시
				  
				  clearInterval(couponCount);
	      		  $("#couponCount").html(10+"초");//뷰딴 10초로 초기화
	      		  couponCountNumber=10;//실제 카운트 되는 곳 10초로 초기화
	      		  $("#couponPaper").hide(100);
	      		  alert("그대 틀렸다네.. 내일을 기약하지");
	        	  change=change*-1;//이걸 해줘야 바로 다시 클릭 했을때 바로 반응 한다.
	        	  $("input[type=radio]").prop("checked",false);//문제가 틀리면 체크 상태를 해제 시켜준다.
			  }
			 
			  
		  });
		 
			  
		
		  
		 ///////////////////////////////////////////////////////////// 
		 
		  $('#categoryButton,#cateShow').mouseenter(function(){
			    $('#cateShow').css("display","block");
			  });
			  $('#categoryButton,#cateShow').mouseleave(function(){
			    $('#cateShow').css("display","none");
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
		cursor: pointer;
		background-color: pink;
	}
	
	
</style>
</head>
<body>
	<div style="position:fixed; background-color: white; padding-bottom:1.5%; padding-top:1.5%; float: left; width: 100%; margin-top: -10px; border-bottom: 1px solid gray;">
	    
		<img alt="" src="/web/store/리추로 상회.png" width="150px;" height="60px;" style=" float: left; margin-left: 15%;">
		<img id="categoryButton" class="category" alt="" src="/web/store/카테고리.png" width="70px;" height="30px;" style=" cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="/web/store/깜짝세일.png" width="70px;" height="30px;" style=" cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="/web/store/잘나가요.png" width="70px;" height="30px;" style=" cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="/web/store/리추로 연구소.png" width="90px;" height="30px;" style=" cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<div style=" float:right; width: 4%; background-color: white; margin-right:8.5%; margin-top:1%;">
			<img alt="" src="/web/store/검색.png" style="margin-left: 27%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">상품검색</b>
		</div>
		<div style=" float:right; width: 4%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="/web/store/장바구니.png" style="margin-left: 26%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">장바구니</b>
		</div>
		<div style=" float:right; width: 5%; background-color: white; margin-right:1%; margin-top:1%;">
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
<div style="margin-top: 6.6%; float: left; width: 100%; height: 100%; background-color: white;">
	
	<div style="float: left; margin-left: 7%; margin-top: 2%; cursor: pointer;">
		<img alt="" src="/web/store/메인사진.jpg">
	</div>
	<div style="float: left; margin-left:3%; margin-top: 2%;  background-color: skyblue; width: 275px; height:183px;">
		<img alt="" src="/web/store/배민쿠폰.png" style="position: fixed;"><!--top:41.5%; left:67.5%;  -->
        <input id="couponbt" type="button" style="position:absolute; padding:5px 10px 5px 10px ;margin-top:95px ;margin-left:55px ; border-radius:20px 20px 20px 20px ; background-color: white; font-weight: bold; color:skyblue" value="문제 풀기">
	</div>		
</div>


<div id="couponPaper" style="width:300px; height:300px; background-color: white; border: 1px solid skyblue; position: absolute; position: fixed; top: 20%; left: 40%;">
	<div style="width: 93%; height: 20%; background-color: white;border: 1px solid skyblue; float: left; margin-top:3%;margin-left:3%;">
		<b id="couponQuestion" style="margin-top:5% ; margin-left:3% ; float: left;"></b>
	</div>
	<div style="width: 93%; height:37%; background-color: white;border: 1px solid skyblue; float: left; margin-top: 3%; margin-left: 3%; ">
		<div style="width: 100%; float: left; margin-top: 4%; margin-left: 3%;">
		<input name="couponRadio" type="radio" id="quiz1" ><b id="answer1" ></b>
		</div>
		<div style="width: 100%; float: left; margin-top: 4%; margin-left: 3%;">
		<input name="couponRadio" type="radio" id="quiz2" ><b id="answer2" ></b>
		</div>
		<div style="width: 100%; float: left; margin-top: 4%; margin-left: 3%;">
		<input name="couponRadio" type="radio" id="quiz3" ><b id="answer3" ></b>
		</div>
	</div>
	<div style="width: 93%; height: 28%; background-color: white;border: 1px solid skyblue; float: left; margin-top:3%;margin-left:3%;">
		<b id="couponCount" style="margin-top:5% ; margin-left:34% ; float: left; font-size: 40px; color: red;">10초</b>
	</div>
</div>	

</body>
</html>