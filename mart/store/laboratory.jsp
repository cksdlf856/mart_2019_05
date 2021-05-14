<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리추로 상회</title>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
   google.charts.load('current', {
    'packages':['geochart'],
    // Note: you will need to get a mapsApiKey for your project.
    // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
    'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
   });
   

   function drawRegionsMap(tempArea2) {
	 var tempArea3=eval(tempArea2);
	
     var data = google.visualization.arrayToDataTable(tempArea3);

     var options = {
             region: '002', // Africa
             colorAxis: {colors: ['#00FFBF', '#00FF80', '#00BFFF']},
             backgroundColor: 'white',
             datalessRegionColor: '#ebf2f3',
             defaultColor: '#f5f5f5',
           };

     var chart = new google.visualization.GeoChart(document.getElementById('supportArea'));

     chart.draw(data, options);
   }
   
   
    var autoscroll=null;//자동스크롤 펑션
    var scrollmove=0;//스크롤 위치
    var scrollchange=1;
    
    function startAutoScroll(){
    	autoscroll=setInterval(function(){
    		scrollmove=scrollmove-1;
    		$("img#garbage").css("margin-top",""+scrollmove+"px");
    		if(scrollmove<(-4900)){
    			clearInterval(autoscroll);
    			scrollmove=0;
    		}
    		
    	},1);
    } 
	
	var actionlaboratory=function(change){
		
		$("#whatrichuro").hide();
		$("#garbage").hide();
		$("#suntorch2").hide();
		$("#gift").hide();
		$("#contribution").hide();
		$("#joo").hide();
		$("#ssi").hide();
		$("#supportArea").hide();
		$("#supportPie").hide();
		$("#supportBar").hide();
		$("body").scrollTop(0);
		
		clearInterval(autoscroll);//자동으로 스크롤바 내리기 초기화
		scrollmove=0;//이미지 위치 초기화
		
		//scrollchange=scrollchange*-1;//스크롤을 멈추고 다시 들어올때도 바꿔줘야한다.
		
		if(change==1){//리추로상회는
			$("#whatrichuro").show();
		}else if(change==3){//후원지역
			$("#supportArea").show();
			$("#supportPie").show();
			$("#supportBar").show();
			supportArea();
			
			$("#effectImg").show(10000);
		}else if(change==4||change=='a'){//쓰레기장
			
			$("#garbage").show();			
			startAutoScroll();
		}else if(change==5||change=='b'){//태양광랜턴
			$("#suntorch2").show();
		}else if(change==6||change=='c'){//선물보내기
			$("#gift").show();
		}else if(change==7||change=='d'){//소액기부
			$("#contribution").show();
		}else if(change==8||change=='e'){//주빌린 후원
			$("#joo").show();
		}else if(change==9||change=='f'){//씨유마이 후원
			$("#ssi").show();
		}
		
	}

	$(function(){
		
		  $('#categoryButton,#cateShow').mouseenter(function(){
		    $('#cateShow').css("display","block");
		  });
		  $('#categoryButton,#cateShow').mouseleave(function(){
		    $('#cateShow').css("display","none");
		  });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////아이폰 띄우고 숨기기
		  $("#effectImg").hide();

		  var change=0;//아이폰 화면 보여주기 위한 조건 0이면 보여주고 1이면 숨긴다.
			
		  $("#supportWindow").hide();//후원하기 창 숨기기
		  
	      $("div#iphon").hide();//아이폰 숨기기
	      $("div#message").hide();//문자 메세지 숨기기
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////후원 선택했을때 후원상세 페이지를  보여주는곳      
	     $(document).ready(function(){//onload보다 빠르다.
	    	  
	    	
	    	  actionlaboratory($("#change").val()==''?1:$("#change").val());//change값이 안들어 올땐 무조건 1을 보내서 연구소 메인 보여주기.	    	  
	    	  
	    	  $("#supportpriceH").val("${supportprice}");//사장님 후원 적립금 후원창에 붙여주기
	     });
	      
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////자동스크롤을 이미지를 눌렀을때 멈춰주고 다시 한번 누르면 다시 움직이게 한다.	      
	      
	      $("#garbage").click(function(){//자동스크롤을 이미지를 눌렀을때 멈춰주고 다시 한번 누르면 다시 움직이게 한다.	
	    	  scrollchange=scrollchange*-1;
	    	  if(scrollchange==-1){
	    	  clearInterval(autoscroll);
	    	  }else if(scrollchange==1){
	    		  startAutoScroll();
	    	  }
	    	  
	      });
	      
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////후원하기 버튼
		
	      		
		  $("input[type=button]").click(function(){//후원하기 버튼
			 //suntorch2bt,giftbt,contributionbt,joobt,ssibt 
		  
			  if(this.id=='garbagebt'){//후원 버튼 누르면 창 띄워주고 이름 바꿔주기
				  
			      $("#supportWindow").show(1000);//후원하기 창 보여주기
			      $("#supportName").html("쓰레기장 후원");
			      
			      $("#ownerSupportPrice").html($("#supportpriceH").val());//후원 창에 후원 적립금 적어주기.
			      
			      $("#supportGo").click(function(){//후원하기 확인 버튼
			    	  //ownerno,supportprice,name
			    	  supportGoFunction(1,$("#supportpriceGo").val(),'쓰레기장');
					  
				  });
			  }else if(this.id=='suntorch2bt'){
				  $("#supportWindow").show(1000);//후원하기 창 보여주기
				  $("#supportName").html("태양광랜턴 후원");
				  $("#supportGo").click(function(){//후원하기 확인 버튼
					  supportGoFunction(1,$("#supportpriceGo").val(),'태양광랜턴');
					  
				  });
			  }else if(this.id=='giftbt'){
				  $("#supportWindow").show(1000);//후원하기 창 보여주기
				  $("#supportName").html("선물 보내기");
				  $("#supportGo").click(function(){//후원하기 확인 버튼
					  supportGoFunction(1,$("#supportpriceGo").val(),'선물');
				  
				  });
			  }else if(this.id=='contributionbt'){
				  $("#supportWindow").show(1000);//후원하기 창 보여주기
				  $("#supportName").html("소액 기부");
				  $("#supportGo").click(function(){//후원하기 확인 버튼
					  supportGoFunction(1,$("#supportpriceGo").val(),'소액기부'); 
					  
				  });
			  }else if(this.id=='joobt'){
				  $("#supportWindow").show(1000);//후원하기 창 보여주기
				  $("#supportName").html("주빌린 후원");
				  $("#supportGo").click(function(){//후원하기 확인 버튼
					  supportGoFunction(1,$("#supportpriceGo").val(),'주빌린 후원'); 
					  
				  });
			  }else if(this.id=='ssibt'){
				  $("#supportWindow").show(1000);//후원하기 창 보여주기
				  $("#supportName").html("씨유마이 후원");
				  $("#supportGo").click(function(){//후원하기 확인 버튼
					  supportGoFunction(1,$("#supportpriceGo").val(),'씨유마이 후원');
					  
				  });
			  }  
			    
		  });
		  $("#supportCencal").click(function(){//후원 취소 버튼
			  $("#supportWindow").hide(1000);//후원하기 창 숨기기
		  });
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		  


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		});
	var supportGoFunction=function(ownerno,supportprice,name){//후원적립금을 후원테이블에 넣어주고 사장님 후원적립금 차감해주는 곳
		
		window.location.href="/web/bmSupportGo.do?name="+encodeURIComponent(name)+"&supportPrice="+supportprice+"&ownerno="+ownerno;//후원 적립금 추가,한글 깨짐 방지 // 사장님쪽 후원 적립금 차감 (동시 수행)
		//window.location.href="/web/bmOwnerSupportGo.do?ownerno="+ownerno+"&supportPrice="+supportprice;//사장님쪽 후원 적립금 차감
	}
	
	
	
	var supportArea=function(){
		
		$.ajax({
			url:'/web/bmsupport.do',
			dataType:'json',
			type:'post',
			success:function(v){
				//[['Country', 'Popularity'],['Germany', 200],['United States', 300]]
				var tempArea="[[\"Country\",\"Popularity\"]";
				//[{name: 'Brands',colorByPoint: true, data: [{ name: 'Chrome', y: 61.41}, {name: 'Internet Explorer',y: 11.84}]}]
				var tempPie="[{name: \"Brands\",colorByPoint: true, data: [";
				//[{name: "Browsers",colorByPoint: true,data: [{ name: "ㅈㅈ",y: 62.74 }, ]}]
				var tempBar="[{name: \"Browsers\",colorByPoint: true,data: [";
				$.each(v,function(index,dom){
					
					tempArea+=",[\""+dom.supportarea+"\","+dom.supportprice+"]";
					tempPie+="{ name: \""+dom.name+"\", y: "+dom.supportprice+"},";
					tempBar+="{ name: \""+dom.name+"\", y: "+dom.supportprice+"},";
				});
				
				var tempArea2=tempArea+"]";
				var tempPie2=tempPie.substr(0,tempPie.length-1)+"]}]";
				var tempBar2=tempBar.substr(0,tempBar.length-1)+"]}]";
				
				drawRegionsMap(tempArea2);
				google.charts.setOnLoadCallback(drawRegionsMap);
				
				supportPieList(tempPie2);
				
				supportBarList(tempBar2);
			},
			error:function(request,status){
				alert("code="+request.status);
			}
				
		});	
	}
	
	var supportPieList=function(tempPie2){
		Highcharts.chart('supportPie', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: '2019년, 리추로 상회 후원 현황'
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                style: {
		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                }
		            }
		        }
		    },
		    series: eval(tempPie2)
		});
	}
	
	var supportBarList=function(tempBar2){
		Highcharts.chart('supportBar', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: ''
		    },
		    subtitle: {
		        text: ''
		    },
		    xAxis: {
		        type: 'category'
		    },
		    yAxis: {
		        title: {
		            text: 'Total percent market share'
		        }

		    },
		    legend: {
		        enabled: false
		    },
		    plotOptions: {
		        series: {
		            borderWidth: 0,
		            dataLabels: {
		                enabled: true,
		                format: '{point.y:.1f}%'
		            }
		        }
		    },

		    tooltip: {
		        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
		    },

		    series: eval(tempBar2)
		});
	}
	
	
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
<body style="background-image: url('/web/store/jango rainok-46.gif'); background-size: 100%;">
	<input id="change" type="hidden" value="${change}">
	<input id="supportpriceH" type="hidden" value="${supportprice}"> 
	
	
	
	
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
	
	 <div id="supportArea" style="position:fixed; position:absolute;  width:100%; top: 15.3%;">
	  </div>
	
<div style="margin-left:15%; margin-top: 11%; float: left; width: 1030px; height:600px; background-color: white ;">
	<div style="width: 11%; height:600px; float: left; position: fixed;">
	  <div style="width: 100%; height: 6%; border-bottom: 1px solid gray;">	
		   <b style="font-size: 17px;">리추로 연구소</b>
	  </div>
	  <div style="width: 100%; margin-top: 13px;">
	  	 <div style="width: 100%; height: 30px; ">	
		   <b id="introduce" onclick="actionlaboratory(1)" style="font-size: 12px; cursor: pointer;">리추로상회는</b>
		 </div>  
		 <div style="width: 100%; height: 40px; border-bottom: 1px solid gray;">	
		   <b id="activityarea" onclick="actionlaboratory(3)" style="font-size: 12px; color: red; cursor: pointer;">후원 현황,지역</b>
		 </div>
	  </div>
	  <div style="width: 100%; margin-top: 13px;">
		 <div style="width: 100%; height: 30px;">	
		   <b onclick="actionlaboratory(4)" style="font-size: 12px; color:gray; cursor: pointer;">쓰레기장(Algeria)</b>
		   <input id="garbagebt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="후원하기">
		 </div>
		 <div style="width: 100%; height: 30px; ">	
		   <b onclick="actionlaboratory(5)" style="font-size: 12px; color:gray; cursor: pointer;">태양광랜턴(Zambia)</b>
		   <input id="suntorch2bt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="후원하기">
		 </div>
		 <div style="width: 100%; height: 30px; ">	
		   <b onclick="actionlaboratory(6)" style="font-size: 12px; color:gray; cursor: pointer;">선물보내기(Uganda)</b>
		   <input id="giftbt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="후원하기">
		 </div>
		 <div style="width: 100%; height: 30px; ">	
		   <b  onclick="actionlaboratory(7)" style="font-size: 12px; color:gray; cursor: pointer;">소액기부(Madagascar)</b>
		   <input id="contributionbt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="후원하기">
		 </div>
		 <div style="width: 100%; height: 30px; ">	
		   <b  onclick="actionlaboratory(8)" style="font-size: 12px; color:gray; cursor: pointer;">주빌린 후원(Niger)</b>
		   <input id="joobt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ; border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="후원하기">
		 </div>
		 <div style="width: 100%; height: 40px; border-bottom: 1px solid gray;">	
		   <b  onclick="actionlaboratory(9)" style="font-size: 12px; color:gray; cursor: pointer;">씨유마이 후원(Sudan)</b>
		   <input id="ssibt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="후원하기">
		 </div>
	  </div>
	  
	</div>
	
	<div id="showlaboratory" style="background-color: white; width:79% ; height: 100%; float: right; margin-right: -10%;">
	
	  <div id="whatrichuro" style="background-color: white; width:100% ; height: 100%; float: right;">
		<div style="background-color:#F6F6F6; width: 100%; height: 13%; border-bottom: 1px solid gray;">
			<b style="font-size: 40px; margin-top: 10px; float: left;">리추로상회는</b>
		</div>	
		<div style="width: 60%; height: 13%; margin-top:2%; float: left;">
			<h3 style="color: gray;">리추로상회는 어린이들이 빈곤에서 벗어나 그들이 가진 잠재력을
                           발휘할 수 있는 세상을 만들기 위해 노력합니다.</h3>
		</div>		
		<div style="width: 47%; height: 30%; margin-top:2%; float: left;">
			<b style="color: gray; font-size: 13px;">리추로상회는 <b style="font-size: 14px; color: blue;">어린이들의 권리 보장</b>을 위해 노력하고 있으며, 리추로상회의 모든 개발 프로그램은 어린이의 잠재력을 키울 수 있는 생활환경을 조성하기 위해</b>
			<b style="font-size: 14px; color: blue;"> 어린이 중심 지역개발, 
			CCCD(Child Centred Community Development)</b><b style="color: gray; font-size: 13px;">를 기반으로 실시되고 있습니다. 
			어린이 중심 지역개발의 핵심은 어린이들에게 지역개발에 대한 생각과 의견을 어른들과 공유할 수 있는 장을 마련해주고, 
			어린이들이 지역개발 과정에 참여할 수 있도록 돕는 것입니다.</b>
		</div>		
		<div style="width: 47%; height: 13%; margin-top:2%; float: right ;">
			<b style="color: gray; font-size: 13px;">지역개발은 어른들 뿐만 아니라, 어린이들에게도 영향을 주기 때문에 어린이들의 의견을 참고하고, 참여를 장려하는 것이 필요합니다. 
			이렇게 플랜은 사업을 진행함에 있어서 <b style="font-size: 14px; color:blue;">어린이, 
			청소년 및 취약계층의 참여를 유도</b>하고 전세계 50개국의 지역사회 및 시민단체, 
			정부와 긴밀히 협력하고 있습니다.</b>
		</div>	
		<div style="float: left; margin-top: 2%; ">
			<img alt="" src="/web/store/리추로상회는.png" >
		</div>	
		<div style="float: left;width:40%; ">
			<b style="opacity: 1; color:#DFE9F2; font-size: 110px; font-style: italic;">what we work</b>
		</div>
	  </div>
	  
	  <div id="supportPie" style=" width:70%; height:60%; float: right; margin-right: -70%; opacity: 0.5; margin-top: -8%;">
	  </div>
	  <div id="supportBar" style=" width:70%; height:64%; float: right; margin-right: -70%; opacity: 0.5; margin-top: 36%;">
	  </div>
	 
	  
		<img id="garbage" alt="" src="/web/store/쓰레기장.jpg" width="100%" style="display: none; ">
		<img id="suntorch2" alt="" src="/web/store/태양광랜턴2.jpg" width="100%" style="display: none;">
		<img id="gift" alt="" src="/web/store/선물보내기.png" width="100%" style="display: none;">
		<img id="contribution" alt="" src="/web/store/소액기부.jpg" width="100%" style="display: none;">
		<img id="joo" alt="" src="/web/store/주빌린후원.jpg" width="100%" style="display: none;">
		<img id="ssi" alt="" src="/web/store/씨유마이후원.jpg" width="100%" style="display: none;">
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

<div id="supportWindow" style="top:37.5% ;left:26.7% ; width: 250px; height:180px ; position: absolute; position: fixed; border: 1px solid gray; background-color: white;">
	<div style="width: 100%; height:20%; margin-top:5% ; text-align: center;">
		<b id="supportName" style="border-bottom: 2px solid gray;">쓰레기장 후원</b>
	</div>
	<div style="width: 95%; height:17%; ">
		<b style="float: left; margin-left: 5%; font-size: 15px; color:green ;border-bottom: 2px solid green; ">신경재</b>
		<b style="float: left; margin-left: 2%; font-size: 12px; margin-top: 1%;">님</b>
		<b style="float: right; font-size: 12px; color: blue; margin-top: 1%;">어벤져스</b>
	</div>	
	<div style="width:95%; height:15%; ">
		<b style="float: left; margin-left: 5%; font-size: 12px;">후원적립금 :</b>
		<b style="float: right; font-size: 12px; ">원</b>
		<b id="ownerSupportPrice" style="float: right; font-size: 12px; color: blue;"></b>
	</div>	
	<div style="width: 95%; height:19%; ">
		<b style="float: left; margin-left: 5%; font-size: 12px;">후원금 </b>
		<b style="float: left; margin-left: 11.7%; font-size: 12px;">:</b>
		<input id="supportpriceGo" type="text" style="width: 35%; float:right ; margin-left: 2%;">
	</div>
	<div style="width: 95%; height:11%; ">
		<input id="supportGo" type="button" style="float:left ;margin-left:25% ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="후원하기">
		<input id="supportCencal" type="button" style="float:left ;margin-left:5% ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="취소">
	</div>
</div>
	<img id="effectImg" alt="" src="/web/store/jango rainok-46.gif" width="100%" style="position: absolute; top:0px; left:0px;">
</body>
</html>