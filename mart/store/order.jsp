<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리추로 상회</title>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	   var countDown=null;//카운트 다운
	   
	   
	   function actionCountDown(){
		   var count=$("#timer").html();
		  
			  countDown=setInterval(function(){
				  temp=""+count+"";
				  $("#timer").html(temp);
				  count--;
				  
				  var stop=$("#timer").html();
				  if(stop==0){
					  clearInterval(countDown);
					  alert("입력 시간 초과");
					  $("#timer").html(60);//타이머 초기화 
					  $("div#payment").hide();//결제창 숨기기	
					  $("div#paymentInerTwo").hide(); //휴대폰인증창
					  $("div#message").hide();//문자메세지 없애줌
									  
					  $("#phonTwo").val("");//번호 초기화
					  $("#phonThree").val("");//번호 초기화
					  
					  $("#rn1").val("");//주민 초기화
					  $("#rn2").val("");//주민 초기화
					  
					  $("input[name='ra']:checked").removeAttr("checked");//통신사 체크 초기화
					  $("input[type=checkbox]#agree").removeAttr("checked");//약관 동의 체크 초기화
					  				  
				  } 
							    
			  },1000);
			  
			  }
	   
   $(function() {
	   var change=0;//아이폰 화면 보여주기 위한 조건 0이면 보여주고 1이면 숨긴다.	
	
	   
	    
       $("div#payment").hide();	//결제창 
			
	   $("div#paymentInerTwo").hide(); //휴대폰인증창
		  
	   $("div#message").hide();//문자 메세지 숨기기
		  
	   $("div#iphon").hide();//아이폰 숨기기
	   
	   $("#couponWindow").hide();//쿠폰적용 창 숨기기
	   
	   
      $('#categoryButton,#cateShow').mouseenter(function() {
         $('#cateShow').css("display", "block");
      });
      $('#categoryButton,#cateShow').mouseleave(function() {
         $('#cateShow').css("display", "none");
      });
   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////쿠폰적용 창 띄우기 
   
   	  $("#couponBt").click(function(){//쿠폰적용 버튼
   		$("#couponWindow").show(100);
   		couponSelect();
   	  });
   		
   	  $("#couponCancel").click(function(){//쿠폰 취소
   		$("#couponWindow").hide();
   	  });
   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////쿠폰	 확인 버튼 
   
   	  $("#couponOk").click(function(){//상품 총 금액에 할인율 적용해서 붙여주기
   		  $("#couponWindow").hide();
   	      var totalPrice=$("#totalPrice").html().substr(0,$("#totalPrice").html().length-1);//총 토탈 가격  	 	  
   		  $("#couponApplication").val(Math.floor(totalPrice*($("input[type=radio]:checked").val())));//총 상품 금액을 가져와서 끝에 있는 원이라는 글자를 잘라주고 할인%를 먹여준다.
   		  $("font#totalPrice2").html((totalPrice-($("#couponApplication").val())+2500)+"원");
   		  
   		  $("b#paymentTotalPrice").html((totalPrice-($("#couponApplication").val())+2500)+"원");
   	  });
      
   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////이전으로
   	
   		
      $("#pageback").click(function(){
    	  var page=${page};//이전으로 눌렀을때 page번호로 장바구니로 갈지 상품상세페이지로 갈지 정한다.
    	  
    	  if(page=='1'){//page=1은 상품 상세페이지
    	  $("#frm").submit();
    	  }else{//page=2는 장바구니 페이지
    		  var frm2=$("#frm").attr("action","/web/basketPageBack.do");
    		  frm2.submit();
    	  }
      });
      
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////결제창
		
  	
	   $("input[type=button]#orderButton").click(function(){//주문하기 버튼
		  
		  $("div#payment").show(100);	
		  $("div#paymentIner").show(100);
	  });
	  
	   $("input[type=button]#cancel").click(function(){//취소 버튼
		 $("div#payment").hide(); 
	  
		 $("#phonTwo").val("");//번호 초기화
		 $("#phonThree").val("");//번호 초기화
		 
		 $("#rn1").val("");//주민 초기화
		 $("#rn2").val("");//주민 초기화
		 
		 $("input[name='ra']:checked").removeAttr("checked");//통신사 체크 초기화
		 $("input[type=checkbox]#agree").removeAttr("checked");//약관 동의 체크 초기화
		 
		 $("#timer").html(60);//닫기 했을때 타이머 초기화
			 
	  });  
	 
	  $("input[type=button]#paybt").click(function(){//결제 버튼
		  
		 if((!$("#phonTwo").val()=="")&&(!$("#phonThree").val()=="")&&($("#phonTwo").val().length==4)&&($("#phonThree").val().length==4)
				&&(!$("#rn1").val()=="")&&(!$("#rn2").val()=="")&&($("#rn1").val().length==6)&&($("#rn2").val().length==7)
				&&($("input[name='ra']:checked").length>0)){
		//번호를 입력하는 곳이 빈공간이면 실패, 두번째 세번째 번호가 4자리가 아니면 실패, 주민번호 빈공간 실패, 주민 6자리 7자리 아니면 실패, 통신사 체크안하면 실패 
		
			if($("input[type=checkbox]#agree:checked").length>0){//약관 동의 체크 확인
		            $("div#paymentIner").hide(); 
		            $("div#paymentInerTwo").show();
		 
		            var phon=$("#phonOne").val()+"-"+$("#phonTwo").val()+"-"+$("#phonThree").val();					 
		            $("#phonCheck").html(phon);//결제 버튼 누르고 인증 부분에서 적은 번호를 붙인다.
		            
		              var randomCode1=Math.floor(Math.random()*10);//랜덤한 인증번호 
			          var randomCode2=Math.floor(Math.random()*10);//랜덤한 인증번호
			          var randomCode3=Math.floor(Math.random()*10);//랜덤한 인증번호
			          var randomCode4=Math.floor(Math.random()*10);//랜덤한 인증번호
			          var randomCode5=Math.floor(Math.random()*10);//랜덤한 인증번호
			          var randomCode6=Math.floor(Math.random()*10);//랜덤한 인증번호
			        
					  var randomCode=('['+randomCode1+''+randomCode2+''+randomCode3+''+randomCode4+''+randomCode5+''+randomCode6+']');
					  var randomCodeOri=(randomCode1+''+randomCode2+''+randomCode3+''+randomCode4+''+randomCode5+''+randomCode6);
			          
					  $("div#message").show(1000);//문자 메세지를 보여준다
			          
					  $("b#code").html(randomCode);//폰 화면에 인증번호 뿌려준다.
		              $("b#hicode").html(randomCodeOri);//히든처리된 곳에 인증번호를 넣어준다.
		              
					  
					  
					  actionCountDown();//카운트 시작하기
					  		            
			}else{
				alert("결제정보 제공 및 이용약관에 동의해 주세요.");
			}
		 }else{
			 alert("휴대폰 결제정보를 확인해 주세요.");
		 }
	  });
	  
	  $("input[type=button]#exit").click(function(){//닫기 버튼 시 타이머를 초기화 하기 위해 clearInterval을 위해선 setInterval안에 있어야한다.
		  $("div#payment").hide();
		  $("div#paymentInerTwo").hide();
		  
		  $("#phonTwo").val("");//번호 초기화
		  $("#phonThree").val("");//번호 초기화
		  
		  $("#rn1").val("");//주민 초기화
		  $("#rn2").val("");//주민 초기화
		  
		  $("input[name='ra']:checked").removeAttr("checked");//통신사 체크 초기화
		  $("input[type=checkbox]#agree").removeAttr("checked");//약관 동의 체크 초기화
		  
		  clearInterval(countDown);//인터발 초기화
		  $("#timer").html(60);//닫기 했을때 타이머 초기화 
	  });
	  
	  $("#btpayment").click(function(){ //결제 확인 버튼
			 
		  var numberCheck=$("#verificationnumber").val();//인증번호 칸에 입력한 숫자
		  var code=$("#hicode").html();//문자메세지에 온 인증번호
		  
		  
		  if(numberCheck==code){//인증번호랑 적은 숫자가 같은지 판별 ,결제완료 부분
			  alert("결제완료");
			  clearInterval(countDown);//인터발 초기화	
			  var orderProductNo=$("#basketNo").val();//장바구니 에서 넘어올때 상품들 no
			  
		      $("#frm").attr("action","/web/productInsert.do");//form action을 상품 하나만 보낼때 bean자체를 보냄
			  var frm= $("#frm");
			  
			  if(orderProductNo.length>1){
				   
		      window.location.href="/web/productInsert.do?orderProductNo="+orderProductNo+"&ownerno="+1;
			  }else{
				  
				  frm.submit();	
				  $("#frm").attr("action","/web/pageback.do");//다시 되돌려줌
			  }
		      
		  }else{//인증실패시
			  
			  $("#verificationnumber").val('');//인증실패시 인증번호 적는곳 초기화
			  $("div#message").hide();//인증실패시 문자메세지 없애줌
			  $("#timer").html(60);//인증실패시 타이머 초기화
			  clearInterval(countDown);//인터발 초기화
			  
		  }	  
	  });
	  
	  $("input#numberRe").click(function(){//재전송 버튼
		  clearInterval(countDown);//인터발 초기화
		  
		  var randomCode11=Math.floor(Math.random()*10);//랜덤한 인증번호 
          var randomCode22=Math.floor(Math.random()*10);//랜덤한 인증번호
          var randomCode33=Math.floor(Math.random()*10);//랜덤한 인증번호
          var randomCode44=Math.floor(Math.random()*10);//랜덤한 인증번호
          var randomCode55=Math.floor(Math.random()*10);//랜덤한 인증번호
          var randomCode66=Math.floor(Math.random()*10);//랜덤한 인증번호
        
		  var randomCode=('['+randomCode11+''+randomCode22+''+randomCode33+''+randomCode44+''+randomCode55+''+randomCode66+']');
		  var randomCodeOri=(randomCode11+''+randomCode22+''+randomCode33+''+randomCode44+''+randomCode55+''+randomCode66);
		  
		  $("b#code").html(randomCode);//폰 화면에 인증번호 다시 뿌려준다.
          $("b#hicode").html(randomCodeOri);//히든처리된 곳에 인증번호를 다시 넣어준다.
		  $("#timer").html(60);// 타이머 초기화
		  actionCountDown();//카운트 다시 시작
		  
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         
   });   
   
   var orderlistToBasket=function(){//장바구니 페이지에서 보낸no를 사용해 ajax로 뿌려준다.
	   
	    var basketList=$("input[type=hidden]#basketNo").val();
   		if(basketList!=''){
		 $.ajax({
			url:'/web/orderlistToBasket.do',
			data:'basketList='+basketList,
			type:'post',
			 dataType:'json', 
			success:function(v){
				var temp='';
				var totalPrice=0;
				var totalProduct=0;//상품 총 수
				$.each(v,function(index,dom){
					totalPrice+=(dom.productprice*dom.productquantity);//상품들 총 가격
					totalProduct+=1;//상품 총 수
					
					temp+="<div style=\"float: left; background-color: white; width: 100%; padding-bottom: 3%;\">";     
					temp+="<div style=\"float: left; background-color: white; width: 100%;\">";
					temp+="<div style=\" width:62%; height: 100px; float: left;\">";
					temp+="<img alt=\"상품이미지\" src=\"/web/store/processedFood/"+dom.productimage+"\" width=\"100px\" height=\"100px\"  style=\" float: left;\">";
					temp+="<b id=\"productName\" style=\"background-color:white; float: left;margin-top:3%; margin-left: 5%; width: 70%; height: 35%;\">"+dom.productname+"</b>";
					temp+="</div>";
					temp+="<div style=\"background-color:white ; width:15.5%; height: 100px; float: left;\">";
					temp+="<b style=\"margin-top:12%; float: left;\">"+dom.productprice+"원</b>";
					temp+="</div>";
					temp+="<div style=\"background-color:white ; width:10%; height: 100px; float: left;\">";
					temp+="<b style=\"margin-top:20%; float: left;\">"+dom.productquantity+"개</b>";
					temp+="</div>";
					temp+="<div style=\"background-color:white ; width:11.9%; height: 100px; float: left;\">";
					temp+="<b style=\"float:right; margin-top:17%;\">"+dom.productprice*dom.productquantity+"원</b>";
					temp+="</div>";
					temp+="</div>";			         
					temp+="</div>";
								
				});
				
				$("div#list").html(temp);
				$("b#totalPrice").html(totalPrice+'원');
				$("font#totalPrice").html(totalPrice+'원');				
				$("font#totalPrice2").html(totalPrice+2500+'원');
				
				$("b#paymentTotalPrice").html(totalPrice+2500+'원');//결제창 안의 총금액
				if(totalProduct>1){
					$("b#paymentTotalProduct").html($("#productName").html()+'(등+'+totalProduct+')');//결제창 안의 총 상품이름
				}else{
					$("b#paymentTotalProduct").html($("#productName").html());//결제창 안의 총 상품이름
				}
				
			},
			error:function(request,status){
				alert("code="+request.status);
			}
			
		 }); //ajax
		 
   		}//if
   }
   
   var couponSelect=function(){//처음 쿠폰 목록을 뿌려줌
		
	   $.ajax({
		  
		   url:'/web/couponSelect.do',
		   dataType:'json',
		   type:'post',
		   success:function(v){
			   var coupontemp='';//쿠폰 리스트 담아줌
			   var couponPageTemp='';//총 페이지 수 담아줌
			   
			   for(var i=1;i<=v.totalpage;i++){//hashmap으로 가져온 토탈 페이지 뽑아주기
				   couponPageTemp+= "<b onclick=\"couponPaging("+i+")\" style=\"font-size:14px ; color:skyblue ; cursor: pointer; margin-left:15px; \">"+i+"</b>";
			   }
			   
			   $("#couponPaging").html(couponPageTemp);
			   
			   $.each(v,function(index,dom){
				   $.each(dom,function(j,jj){
					   
					   coupontemp+= "<div style=\"border-bottom: 1px solid skyblue; height:32px;\">";
					   coupontemp+= "<div style=\"margin-top: 2.5%;\">";
					   coupontemp+="<input name=\"couponRadio\" type=\"radio\" value=\""+jj.discount+"\"  style=\"float: left; margin-left:4%;\">";
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:5%;\">"+jj.cname+"</b>";
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:5%;\">"+jj.enddate+"</b>";
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:9%;\">할인</b>";
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:6%;\">"+jj.discount+"%</b>";
					   coupontemp+="</div>";	 
					   coupontemp+= "</div>";
					   
				   });
				   
			   });
			   $("#couponList").html(coupontemp);
			 
		   },
		   error:function(request,status){
			   alert("code="+request.status);
		   }
		   
	   });  
   } 
   
  
   
    function couponPaging(currentpage){//쿠폰 페이징 해주는 부분	
    	
	   $.ajax({
		  url:'/web/couponSelect.do',
		  type:'post',
		  dataType:'json',
		  data:'currentpage='+currentpage,
		  success:function(v){
			   var coupontemp='';//쿠폰 리스트 담아줌
			   var couponPageTemp='';//총 페이지 수 담아줌
			   
			   for(var i=1;i<=v.totalpage;i++){//hashmap으로 가져온 토탈 페이지 뽑아주기
				   couponPageTemp+= "<b onclick=\"couponPaging("+i+")\" style=\"font-size:14px ; color:skyblue ; cursor: pointer; margin-left:15px; \">"+i+"</b>";
			   }
			   
			   $("#couponPaging").html(couponPageTemp);
			   
			   $.each(v,function(index,dom){
				   $.each(dom,function(j,jj){
					   coupontemp+= "<div style=\"border-bottom: 1px solid skyblue; height:32px;\">";
					   coupontemp+= "<div style=\"margin-top: 2.5%;\">";
					   coupontemp+="<input name=\"couponRadio\" type=\"radio\" value=\""+jj.discount+"\" style=\"float: left; margin-left:4%;\">";
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:5%;\">"+jj.cname+"</b>";
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:5%;\">"+jj.enddate+"</b>";
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:9%;\">할인</b>";
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:6%;\">"+jj.discount+"%</b>";
					   coupontemp+="</div>";	 
					   coupontemp+= "</div>";

				   });
				   
			   });
			   $("#couponList").html(coupontemp);
			 
		   },
		  error:function(request,status){
			  alert("code="+request.status);
		  }
		   
	   });
   } 
   
  
</script>
<style type="text/css">
.category:hover {
   border-bottom: 3px solid black;
}

.basket:hover {
   border-bottom: 2px solid gray;
}

th {
   font-size: 13px;
   color: gray;
}
</style>
</head>
<body onload="orderlistToBasket()">
<input id="basketNo" type="hidden" value="${tempId}"> <!-- 장바구니 페이지 에서 선택한 상품들의 no를 합쳐서 가져와서 여기에 담아둔다.-->
<%-- <input id="supportPrice" type="hidden" value="${supportPrice}"> --%>

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
   
   
   <div
      style="float: left; background-color: white; width: 70%; margin-left: 15%; margin-top: 7%; margin-bottom: 1%;">
      <b style="font-size: 20px;">주문하기</b>
   </div>
   <div style="float: left; width: 70%; margin-left: 15%; background-color: white; border-top: 1px solid gray; border-bottom: 1px solid #99B0B0;">
      <div style="width: 100%; color: #99B0B0; float: left; background-color: #F6F6F6; font-size: 14px; padding-bottom: 1.5%; padding-top: 1.5%;">
          <b
            style="float: left; margin-left: 2%;">상품정보</b> <b
            style="float: left; margin-left: 55%;">판매가</b> <b
            style="float: left; margin-left: 10%;">수량</b> <b
            style="float: left; margin-left: 14%;">합계</b>
      </div>
      
      <form id="frm" method="post" action="/web/pageback.do">
      <input type="hidden" name="productcode" value="${bmbean.productcode}">
      <input type="hidden" name="ownerno" value="${bmbean.ownerno}">
      <div style="float: left; background-color: white; width: 100%; padding-bottom: 3%; "><!--주문목록 비율 맞추기 위해 맨위 공간을 3%로 잡아둠  -->
      </div>	
      	 
      <div id="list">	
         <div style="float: left; background-color: white; width: 100%; padding-bottom: 3%; ">     
             <div style="float: left; background-color: white; width: 100%;">
			    <div style=" width:62%; height: 100px; float: left;">
					 <img alt="상품이미지" src="/web/store/processedFood/${bmbean.productimage}" width="100px" height="100px"  style=" float: left;">
					 <b style="background-color:white; float: left;margin-top:3%; margin-left: 5%; width: 70%; height: 35%;">${bmbean.productname}</b>
					  <input type="hidden" name="productname" value="${bmbean.productname}">
				</div>
			    <div style="background-color:white ; width:15.5%; height: 100px; float: left;">
					 <b style="margin-top:12%; float: left;">${bmbean.productprice}원</b>
					 <input type="hidden" name="productprice" value="${bmbean.productprice*bmbean.productquantity}">
				</div>
				<div style="background-color:white ; width:10%; height: 100px; float: left;">
					<b style="margin-top:20%; float: left;">${bmbean.productquantity}개</b>
					<input type="hidden" name="productquantity" value="${bmbean.productquantity}">
			    </div>
				<div style="background-color:white ; width:11.9%; height: 100px; float: left;">
					<b style="float:right; margin-top:17%;">${bmbean.productprice*bmbean.productquantity}원</b>	
				</div>
		     </div>				         
          </div>        
      </div> 
          
      </form>
      
      <div style="float: left; width: 100%; text-align: right; padding-bottom: 3%; padding-top: 3%; margin-right: 3%; border-top: 1px solid gray;">
         <b>상품합계금액 (배송비 별도)</b><br> 
         <b id="totalPrice" style="font-size: x-large; color: rgb(70, 205, 223);">${bmbean.productprice*bmbean.productquantity}원</b>
      </div>
   </div>
   <div
      style="float: left; background-color: white; width: 70%; margin-left: 15%; margin-top: 3%; margin-bottom: 1%;">
      <b style="font-size: 20px;">주문서 작성</b>
   </div>
   <div
      style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
      <div>
         <b style="font-size: 15px;">주문자 정보</b>
      </div>
      <div
         style="float: left; background-color: white; width: 100%; padding-top: 2%">
         <table style="width: 100%;">
            <tbody>
               <tr>
                  <td style="font-size: 13px; color: gray; width: 25%;"><b>주문하시는
                        분 :</b></td>
                  <td><input type="text" style="height: 30px;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>주소
                        :</b></td>
                  <td></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>주문자
                        핸드폰 :</b></td>
                  <td><input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"> - <input
                     type="text" style="width: 60px; height: 30px; margin-top: 2%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>주문자
                        전화 :</b></td>
                  <td><input type="text"
                     style="width: 60px; height: 30px; margin-top: 1.5%;"> - <input
                     type="text" style="width: 60px; height: 30px; margin-top: 1.5%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 1.5%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>이메일
                        :</b></td>
                  <td><input type="text"
                     style="height: 30px; margin-top: 2%; width: 20%;"></td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <div
      style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
      <div>
         <b style="font-size: 15px;">배송 정보</b>
      </div>
      <div
         style="float: left; background-color: white; width: 100%; padding-top: 2%">
         <table style="width: 100%;">
            <tbody>
               <tr>
                  <td style="font-size: 13px; color: gray; width: 15%;"><b>배송지
                        확인 :</b></td>
                  <td><input type="checkbox"><font
                     style="font-size: 13px;">주문고객 정보와 동일합니다</font></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 20%; padding-top: 2%;"><b>받으실분
                        :</b></td>
                  <td><input type="text" style="height: 30px; margin-top: 2%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 15%; padding-top: 2%;"><b>받으실
                        곳 :</b></td>
                  <td><input type="text"
                     style="width: 70px; height: 30px; margin-top: 2%;"> ( <input
                     type="text" style="width: 60px; height: 30px; margin-top: 2%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"> ) <input
                     type="button"
                     style="font-size: 13px; background-color: white; border-color: gray; width: 130px; height: 35px; color: gray;"
                     value="우편번호 검색"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 15%; padding-top: 2%;"><b>핸드폰
                        번호 :</b></td>
                  <td><input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"> - <input
                     type="text" style="width: 60px; height: 30px; margin-top: 2%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 15%; padding-top: 2.5%;"><b>전화번호
                        :</b></td>
                  <td><input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"> - <input
                     type="text" style="width: 60px; height: 30px; margin-top: 2%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 25%; padding-top: 2%;"><b>남기실
                        말씀 :</b></td>
                  <td><input type="text"
                     style="height: 30px; margin-top: 2%; width: 50%"></td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <div
      style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
      <div>
         <b style="font-size: 15px;">결제금액</b>
      </div>
      <div
         style="float: left; background-color: white; width: 100%; padding-top: 2%">
         <table style="width: 100%;">
            <tbody>
               <tr>
                  <td style="font-size: 13px; color: gray; width: 25%;"><b>상품합계금액
                        :</b></td>
                  <td><font id="totalPrice" style="font-size: 13px;">${bmbean.productprice*bmbean.productquantity}원</font></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>배송비
                        :</b></td>
                  <td style="padding-top: 2%"><font style="font-size: 13px;">+2,500원</font></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>쿠폰
                        적용 :</b></td>
                  <td><font style="font-size: 13px;">할인 </font><input id="couponApplication"
                     type="text"
                     style="text-align: right; width: 100px; height: 30px; margin-top: 2%;"
                     placeholder="0"><font style="font-size: 13px;">원 </font><input id="couponBt"
                     type="button"
                     style="cursor:pointer ; font-size: 13px; background-color: white; border-color: gray; width: 130px; height: 35px; color: gray;"
                     value="쿠폰조회 및 적용"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>총
                        결제금액 :</b></td>
                  <td style="padding-top: 2%"><font id="totalPrice2" style="font-size: 30px; font-weight: bold; color: rgb(70, 205, 223);">${bmbean.productprice*bmbean.productquantity+2500}원</font></td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <div
      style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
      <div>
         <b style="font-size: 15px;">결제수단</b>
      </div>
      <div
         style="float: left; background-color: white; width: 100%; padding-top: 2%">
         <table style="width: 100%;">
            <tbody>
               <tr>
                  <td style="font-size: 13px; color: gray; width: 25%;"><b>일반결제
                        :</b></td>
                  <td><input type="radio"><font
                     style="font-size: 13px;">신용카드</font><input type="radio"><font
                     style="font-size: 13px;">핸드폰</font></td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <div
      style="float: left; width: 70%; margin-left: 15%; margin-top: 2.5%; margin-bottom: 2.5%; background-color: white;">
      <input id="pageback" type="button" value="이전으로"
         style="cursor:pointer; float: left; margin-left: 33%; border: 1px solid gray; width: 15%; background-color: white; color: gray; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
      <input id="orderButton" type="button" value="결제하기"
         style="cursor:pointer; float: left; margin-left: 3%; border: 1px solid gray; width: 15%; background-color: black; color: white; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
   </div>
   

<div id="payment" style="position:absolute; position:fixed ; top:6%; left:35%; background-color: #F8F8F8; width:400px; height:600px; border: 1px solid gray;">
	<div style="margin-top: 3%; margin-left: 4%;">
	<img alt="" src="/web/store/바로결제.png" width="40%" height="20%">
    </div>
	<div id="paymentIner" style="background-color: white; width: 94%; height: 88%; margin-top: 1%; margin-left: 3%; border: 1px solid gray;">
	   <div style="margin-top: 5%;">
	   <b style="font-size: 12px; margin-left: 3%;">구매정보를 확인해 주세요</b>
	   </div>
	   <div style="background-color: #F8F8F8; width: 95%; height:11%; margin-top: 1%; margin-left: 2%; border: 1px solid gray;">
	   		<div style="background-color: #F8F8F8; margin-left:5%; margin-top: 2%; float: left; width: 80%;">
	   			<b style="float: left; font-size: 11.5px;">·   상품명</b>
	   			<b id="paymentTotalProduct" style="float:right ; font-size: 11.5px;">${bmbean.productname}</b>
	   		</div>
	   		<div  style="background-color: #F8F8F8; margin-left:5%; margin-top: 2%; float: left; width: 80%;">
	   			<b style="float: left; font-size: 11.5px;">·   결제금액</b>
	   			<b id="paymentTotalPrice" style="float: right; font-size: 11.5px;">${bmbean.productprice*bmbean.productquantity+2500}원</b>
	   		</div>   				   		
	   </div>
	    <div style="margin-top: 1%;">
	    <b style="font-size: 12px; margin-left: 3%;">휴대폰 결제정보를 입력해 주세요</b>
	    </div>
	   <div style="background-color: #F8F8F8; width: 95%; height:22%; margin-top: 1%; margin-left: 2%; border: 1px solid gray;">
	   		<div style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 100%;">
	   			<b style="font-size: 12px; margin-left:5%;">·   휴대폰번호</b>
	   			<div style="float: right; margin-right: 8%;">
	   			<select id="phonOne">
	   				<option>010</option>
	   				<option>011</option>
	   				<option>017</option>
	   			</select>
	   			<b>-</b>
	   			<input type="text" style="width: 50px;" id="phonTwo">
	   			<b>-</b>
	   			<input type="text" style="width: 50px;" id="phonThree">
	   			</div>
	   		</div>
	   		<div  style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 100%;">
	   			<b style="font-size: 12px;  margin-left:5%;">·   주민번호</b>
	   			<div style="float: right; margin-right: 9%;">
	   			<input id="rn1" type="text" style="width: 80px;">
	   			<b>-</b>
	   			<input id="rn2" type="text" style="width: 80px;">
	   			</div>
	   		</div>  
	   		<div  style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 100%;">
	   			<b style="float: left; font-size: 12px;  margin-left:5%;">·   이동통신사</b>
	   			<div style="float: right; margin-right: 15%;">
	   			<input type="radio" name="ra" id="skt" value="skt">
	   			<b>SKT</b>
	   			<input type="radio" name="ra" id="kt" value="kt">
	   			<b>KT</b>
	   			<input type="radio" name="ra" id="lg" value="lg">
	   			<b>LG</b>
	   			</div>
	   		</div>  
	   		<div  style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 100%;">
	   			<b style="float: left; font-size: 12px;  margin-left:5%;">·   결제방식</b>
	   			<b style="font-size: 12px; float: right; margin-right: 7%;">휴대폰 문자메세지로 승인번호 전송</b>
	   		</div> 				   		
	   </div>
	    <div style="margin-top: 1%; margin-left: 3%;">
	    <b style="font-size: 12px; ">결제정보 제공 및 이용약관에 동의해 주세요</b>
	    </div>
	   <div style="background-color: #F8F8F8; width: 95%; height:12%; margin-top: 1%; margin-left: 2%; border: 1px solid gray;">
	   		<div style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 90%; margin-left:2%;">
	   			<input type="checkbox" id="agree">
	   			<b style="font-size: 12px;">결제대행업체 이용약관에 동의합니다.</b>
	   			<input type="button" value="자세히보기">
	   		</div>
	   		<div  style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 90%; margin-left:5%;">
	   			<b style="font-size: 12px;">·   입력하신 정보는 결제대행업체에 제공됩니다.</b>
	   			
	   		</div>   				   		
	   </div>
	   
	   <div style="background-color: white; width: 95%; height:24%; margin-top: 2%; margin-left: 2%; border-bottom: 1px solid gray;">
	   		<b style="background-color: gray; color: white; font-size: 12px; padding: 1px 5px 1px 5px;">안내</b><br>
	   		<b style="font-size: 11px;">'만 19세 미만 미성년자 명의/법인 명의/요금미납 휴대폰은 결제가 되지 않습니다.</b><br>
	   		<b style="font-size: 11px;">'타인의 휴대폰/개인정보를 허락없이 이용하면 형법상 처벌을 받을 수 있습니다.</b>
	   		
	   </div>
	   
	   <div style="margin-left: 38%; margin-top: 4%;">
	   	  <input id="paybt" type="button" value="결제" style="font-weight: bold;">
	   	  <input id="cancel" type="button" value="취소" style="font-weight: bold;">
	   </div>
	   
	</div>
</div>

<div id="paymentInerTwo" style="background-color: white; border: 1px solid gray; width: 374px; height: 526px;position:absolute; position:fixed; left: 35.8%; top: 12%;">
	<div style="margin-left:5%; margin-top:3%; width: 90%; height: 7%; float: left; border-bottom: 1px solid black;">	
		<b>휴대폰 본인인증</b>	
	</div>
	
	<div style="margin-left:5%; margin-top:3%; width: 90%; height: 18%; float: left; border-bottom: 1px solid black;">
		<div style="margin-left: 3%; width: 96%;">	
		<b style="font-size: 12px;">※ 고객님의 개인정보는 항상 암호화되어 처리되고, 본인인증으로만 사용하여, 보관하지 않습니다.</b>
		</div>
		<div style="margin-top: 3%;">
		<b style="font-size: 12px; color: red; border-bottom: 1px solid red; margin-left: 8%;">인증 요청하신 휴대폰 번호</b>
		<b id="phonCheck" style="font-size: 14px; margin-left: 5%;"></b>
		</div>	
	</div>
	
	<div style="margin-left:5%; margin-top:3%; width: 90%; height: 30%; float: left; border: 1px solid gray; border-radius: 5px 5px 5px 5px;">	
		<div style="margin-top: 1%; margin-left: 2%; width: 97%;">
			<b style="font-size: 12px; color: gray;">※ 휴대폰에 문자메세지로 전송된 인증번호 6자리를 입력하신 후 확인 버튼을 눌러주세요.</b>
		</div>
		<div style="margin-left: 20%; margin-top: 3%;">
			<b style="font-size: 12px; ">인증번호</b>
			<input id="verificationnumber" type="text" style="width: 90px; ">
			<input id="numberRe" type="button" value="재전송" style="height: 22px; font-size: 12px; font-weight: bold;">
		</div>
		<div style="margin-left: 25%; margin-top: 2%;">
			<b style="font-size: 11px; ">(남은시간</b>
			<b id="timer" style="font-size: 11px;  color: red;">60</b>
			<b style="font-size: 11px;  color: red;">초</b>
			<b style="font-size: 11px; ">)</b>
			
			<input type="button" value="시간연장" style="height: 18px;  margin-left: 3%; background-color: red; color: white; font-size: 10px;">
		</div>
		<div style="margin-left: 38%; margin-top: 4%;">
			<input type="button" id="btpayment" value="확인" style="font-weight: bold; width: 80px; float: left;">
		</div>
		
	</div>
	
	<div style="margin-left:5%; margin-top:3%; width: 90%; height: 25%; float: left;">	
		<b style="font-size: 11px; color: gray;">※승인번호가 도착하지 않은 경우</b>	
		  <div style=" width: 98%; margin-left: 2%;">
		    <b style="font-size: 11px; color: gray;">1.문자메세지 수신가능 지역 확인</b><br>	
		    <b style="font-size: 11px; color: gray;">2.통신사 번호 114(예 018,014)로 전화를 건 후 신호음이 들리면 바로 끊습니다.</b><br>	
		    <b style="font-size: 11px; color: gray;">3.상기사항 확인 후에도 도착하지 않는 경우 고객센터(1588-1234)로 연락하시면 친절히 안내해 드립니다.</b>
		  </div>	
	</div>
	
	<div style="margin-left:40%; margin-top:3%; float: left;">
		<input id="exit" type="button" value="닫기" style="font-weight: bold; width: 80px;">
	</div>
</div>


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

<div id="couponWindow" style="width: 500px; height: 500px; position: absolute; position: fixed; background-color: white; border:1px solid skyblue ; top:5% ; left:35% ;">
  <div style="margin-left: 3%; width:94%; height: 85%;">
  	<img alt="" src="/web/store/리추로 상회.png" width="90px" height="40px" style="margin-top: 3%;">	
	<div style="background-color: white; border: 1px solid skyblue; width: 100%; height: 100%;">
	   <div style="width:94%; margin-left: 2.5%; margin-top: 5%; float: left;">
	   		<div style="width: 100%; border-top: 1px solid skyblue; border-bottom: 1px solid skyblue; background-color: rgb(240, 240, 240); height:40px;">
	   		   <div style="margin-top: 2.5%; ">
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:3%;">선택</b>
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:11%;">쿠폰</b>
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:25%;">종료일</b>
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:20%;">기능</b>
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:5%;">할인율</b>   
	   		   </div>
	   		 </div>
	   		   
	   		 <div id="couponList"><!--쿠폰 리스트 ajax로 뿌려주는곳 -->  		 
	   		<!--  <div style="border-bottom: 1px solid skyblue; height:32px;">
	   		    <div style="margin-top: 2.5%; ">
	   		   		<input name="couponRadio" type="radio" style="float: left; margin-left: 4%;">
	   		   		<b style="font-size: 12px; float: left; margin-left:13%;">쿠폰이름</b>
	   		   		<b style="font-size: 12px; float: left; margin-left:10%;">2019-5-13</b>
	   		   		<b style="font-size: 12px; float: left; margin-left:12%;">할인</b>
	   		   		<b style="font-size: 12px; float: left; margin-left:16%;">0.01%</b>
	   		    </div>		 
	   		 </div> -->	   		 
	   		 </div> 
	   		  		   	   		
	   </div>
	   <div id="couponPaging" style="float: left; width: 35%; margin-left: 31%; text-align: center;"><!--text-align: center; 쓰면 자식들인 text들이 가운데 정렬된다. --><!--페이징 ajax 뿌려주는곳-->
	   		<!-- <b style="font-size:14px ; color:skyblue ; cursor: pointer; margin-left:15px;">1</b> -->
	   </div>
	   <div style="float: left; margin-left: 37%; margin-top: 1%;">
	   	   <input id="couponOk" type="button" value="확인" style="cursor:pointer ; width:60px ; height:30px ; border-radius: 10px 10px 10px 10px; background-color: rgb(240,240,240); font-weight: bold;">
	   	   <input id="couponCancel" type="button" value="취소" style="cursor:pointer ; width:60px ; height:30px ; border-radius: 10px 10px 10px 10px; background-color: rgb(240,240,240); font-weight: bold;">
	   </div>
	   <div style="float: left; margin-top: 14%; margin-reft:10px; width: 94%; margin-left: 1%; position: fixed;">
	   		<b style="font-size: 12px; color: skyblue;">* 아래와 같이 정상 결제되지 않은 경우 사용된 쿠폰을 미사용 상태로 변경하여</b><br>
	   		<b style="font-size: 12px; color: skyblue;">재사용하실 수 있습니다.</b><br>
            <b style="font-size: 12px; color: skyblue;">1) 결제가 진행되는 과정에서 직접 취소한 경우</b><br>
			<b style="font-size: 12px; color: skyblue;">2) 인터넷 환경 등의 시스템 문제로 인하여 결제가 완료되지 못한 경우</b><br>
			<b style="font-size: 12px; color: skyblue;">3) 신용카드 상태 등의 문제로 결제가 실패한 경우</b><br>
			<b style="font-size: 12px; color: skyblue;">→ 위치 : 마이페이지 > 주문내역/배송조회 > 결제시도(또는 결제실패) 주문 ></b><br> 
			<b style="font-size: 12px; color: skyblue;">상세보기 > 쿠폰사용취소</b>	   		
	   </div>
	</div>
  </div>
</div>


</body>
</html>