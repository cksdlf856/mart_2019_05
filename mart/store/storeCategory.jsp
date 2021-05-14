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
	}
	
	
</style>
</head>
<body>
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
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">장바구니</b>
		</div>
		<div style="float:right; width: 5%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="사장님.png" style="margin-left: 32%; margin-bottom:8%; float: left;">
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
	
<div style="margin-top: 6.6%; float: left;">		
	<div style="width: 100%; float: left;">
		<strong style="margin-left: 50%; margin-top:2%; margin-bottom:2%; float:left; font-size: 20px; ">- 닭/계육 -</strong>
	</div>
	<div>
		<hr style="color: gray;">
	</div>
	<div style="float: left; width: 85%; margin-left: 7.5%;">
		
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
			<div style="float:left; width: 260px; margin-left: 1.5%;">
			   <img alt="" src="/web/store/chicken/1553685731000_m.jpg" width="260px" height="300px">
			     <div style="width: 100%; background-color: white; margin-top: 2%;">
			        <b>50호닭 통닭 25수</b>
			     </div>
			     <div style="width: 100%; margin-top: 2%; margin-bottom: 18%;">
			        <img alt="" src="my_icon_14678843180.gif">
			        <b style="float: right; border-bottom: 3px solid black;">25,000</b>
			     </div>
			</div>
			
	</div>
</div>

	
</body>
</html>