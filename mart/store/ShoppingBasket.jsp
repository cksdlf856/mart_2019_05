<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리추로 상회</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	function basket(){		
		$.ajax({
			url:'/web/bmbasket.do',
			type:'post',
			dataType:'json',
			success:function(v){
			
				var temp='';
				var proprice=0;
				var tprice=0;
							 
				 
				$(v).each(function(index,dom){
					proprice=(dom.productprice)*(dom.productquantity);//상품 수량 곱(x) 상품 개당가격
					tprice+=proprice;//상품 총 가격 다 합치기 
					
					temp+="<div style=\"float: left; background-color: white; width: 100%; margin-bottom: 3%; margin-top:3%;\">";
					temp+="<div style=\"width:6%; height:100px; float:left;\">";
					temp+="<input id=\""+dom.no+"\" type=\"checkbox\">";
					temp+="</div>";
					temp+="<div style=\" width:65%; height: 100px; float: left;\">";
					temp+="<img alt=\"상품이미지\" src=\"/web/store/processedFood/"+dom.productimage+"\" width=\"100px\" height=\"100px\"  style=\"float: left;\">";
					temp+="<b style=\"float: left; margin-left: 5%; width: 70%; height: 35%;\">"+dom.productname+"</b>";
					temp+="<input type=\"button\" value=\"상품상세정보\" style=\" color:gray; font-weight: bold; background-color:white; float: left; margin-left: 5%; width:100px; height:30px;\">";
					temp+="</div>";
					temp+="<div style=\" width:8%; height: 100px; float: left;\">";
					temp+="<b>"+dom.productprice+"원</b>";
					temp+="</div>";
					temp+="<div style=\" width:8%; height: 100px; float: left;\">";
					temp+="<input type=\"text\" name=\""+dom.no+"\" style=\"float:left; width:13px; height: 40px; font-weight: bold; padding-left: 35px;\" value=\""+dom.productquantity+"\">";
					temp+="<b onclick=\"quantityaction()\" style=\"cursor:pointer; color:gray; font-size:10px; float:left; margin-top:7px; padding-right:5px; margin-left:5px;\">▲</b> ";
					temp+="<b onclick=\"\" style=\"cursor:pointer; color:gray; font-size:10px; float:left; margin-top:5px; margin-left:5px;\">▼</b> ";
					temp+="<input onclick=\"modiBasket("+dom.no+")\" type=\"button\" value=\"수정\" style=\"color:gray; font-weight: bold; background-color: white; width: 100%; height: 35px; margin-top: 15%;\">";
					temp+="</div>";
					temp+="<div style=\" width:11.9%; height: 100px; float: left;\">";
					temp+="<b style=\"float:right;\">"+proprice+"원</b>";
					temp+="</div>";
					temp+="</div>";			
					//category,no,productname,productcode,productprice,productunit,productdelivery,productcount,productproduction,productimage
				  });
				
				
				$("#catelist").html(temp);
				$("#totalprice").html(tprice+'원');
			},
			error:function(request,status){
				alert("error code = "+ request.status);
			}	
		});
	};
	 
	 function modiBasket(no){//장바구니 상품 수량 수정
		 var quantity=$("input[name="+no+"]").val();//수량 수정한값 받아오기
		
		 $.ajax({
			
			 url:'/web/bmbasketmodi.do',
			 data:'no='+no+'&quantity='+quantity,
			 type:'post',
			 success:function(){
				 basket();
			 },
			 error:function(request,status){
				 alert("code="+request.status);
			 }
			 
		 });
		 	 
	 }
	
	 function deleteBasket(no){//장바구니 선택 삭제
		
		$.ajax({
			
			url: '/web/bmbasketdelete.do',
			data:'no='+no,
			type:'post',
			success:function(){
				basket();		
			},
			error:function(request,status){
				alert("code="+request.status);
			}
			
		});
		
	}
	 
	function quantityaction(){
		alert("ok");
		
	}
	
	
	
	$(function(){
		  $('#categoryButton,#cateShow').mouseenter(function(){
		    $('#cateShow').css("display","block");
		  });
		  $('#categoryButton,#cateShow').mouseleave(function(){
		    $('#cateShow').css("display","none");
		  });
		  
		  $("#deletebt").click(function(){//장바구니 목록 선택 삭제
			 
			 $("input[type=checkbox]:checked").each(function(index,dom){//each로 돌려서 뽑아내야 한다.
				
				 deleteBasket(dom.id);
			 });
			 
		  });
		  
		  $("input[type=button]#backbt").click(function(){//쇼핑 계속하기 버튼
			  alert("ok");
		  });
		  
		  $("input[type=button]#orderbt").click(function(){//선택 주문하기
			  var tempId='';
			  $("input[type=checkbox]:checked").each(function(index,dom){
				  tempId+=dom.id+'-';//체크박스 선택한 애들 id에 담긴 no값 합쳐줌,#으로 붙여서 가면 첫번째 값만 들어간다....#으로 붙여서 가면안된다...
			  });
			  
			  window.location.href="/web/orderPageMove.do?tempId="+tempId+"&page=2";
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
	
	
</style>
</head>
<body onload="basket()">
	<div style="position:fixed; background-color:white; padding-bottom:1.5%; padding-top:1.5%; float: left; width: 100%; margin-top: -10px; border-bottom: 1px solid gray;">
		<a href="#"><img alt="" src="리추로 상회.png" width="150px;" height="60px;" style="float: left; margin-left: 15%;"></a>
		<img id="categoryButton" class="category" alt="" src="카테고리.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="깜짝세일.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="잘나가요.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="리추로 연구소.png" width="90px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<div style="float:right; width: 4%; background-color: white; margin-right:8.5%; margin-top:1%;">
			<img alt="" src="검색.png" style="margin-left: 27%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">상품검색</b>
		</div>
		<div style="float:right; width: 4%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="장바구니.png" style="margin-left: 26%; margin-bottom:8%; float: left;">
		    <b onclick="basket()" class="basket" style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">장바구니</b>
		</div>
		<div style="float:right; width: 5%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="사장님.png" style="margin-left: 32%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">### 사장님</b>
		</div>
	</div>
	<div style="float: left; background-color: white; width: 70%; margin-left: 15%; margin-top: 12%; margin-bottom: 1%;">
		<b style="font-size: 25px;">장바구니</b>
	</div>
	
	<div style="float: left; width: 70%; margin-left: 15%; background-color: white; border-top: 1px solid gray; border-bottom: 1px solid #99B0B0; ">
		<div style="width:100%; color:#99B0B0; float: left; background-color: #F6F6F6; font-size: 14px; padding-bottom:1.5% ; padding-top:1.5% ;">
			<b style="float: left; margin-left:2%;">선택</b>
			<b style="float: left; margin-left:2%;">상품정보</b>
			<b style="float: left; margin-left:60% ;">판매가</b>
			<b style="float: left; margin-left:5% ;">수량</b>
			<b style="float: left; margin-left:9% ;">합계</b>
		</div>
		
	  <div id="catelist"> <!-- 장바구니 상품 리스트 -->	
	  </div>
		
	</div>
	
	<div style="float: left; width: 70%; margin-left: 15%; margin-top:2.5%; margin-bottom:2.5%; background-color:white ; border-bottom: 1px solid #99B0B0;">

		<b id="totalprice" style="color:gray; font-size:25px; margin-right:1%; float: right; margin-top: -10px;">0원</b>
		<b style="float: right; margin-right: 3%; font-size: 13px; padding-bottom: 3%;">상품합계금액(배송비 별도)</b>
		    
    </div>
	
    <div style="float: left;width: 70%; margin-left: 15%; margin-top:2.5%; margin-bottom:2.5%; background-color: white;">
		    <input id="deletebt" type="button" value="선택삭제" style="cursor:pointer ; float:left;margin-left:17%; border:1px solid gray; width: 15%; background-color: white; color: gray; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		    <input id="" type="button" value="비우기" style="cursor:pointer ; float:left;margin-left:3%; border:1px solid gray; width: 15%; background-color: white; color: gray; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		    <input id="backbt" type="button" value="쇼핑 계속하기" style="cursor:pointer ; float:left;margin-left:3%; border:1px solid gray; width: 15%; background-color: black; color: white; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		    <input id="orderbt" type="button" value="선택 주문하기" style="cursor:pointer ; float:left;margin-left:3%; border:1px solid gray; width: 15%; background-color: black; color: white; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
    </div>
	

</body>
</html>