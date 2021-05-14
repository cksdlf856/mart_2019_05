<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���߷� ��ȸ</title>

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
   
   
    var autoscroll=null;//�ڵ���ũ�� ���
    var scrollmove=0;//��ũ�� ��ġ
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
		
		clearInterval(autoscroll);//�ڵ����� ��ũ�ѹ� ������ �ʱ�ȭ
		scrollmove=0;//�̹��� ��ġ �ʱ�ȭ
		
		//scrollchange=scrollchange*-1;//��ũ���� ���߰� �ٽ� ���ö��� �ٲ�����Ѵ�.
		
		if(change==1){//���߷λ�ȸ��
			$("#whatrichuro").show();
		}else if(change==3){//�Ŀ�����
			$("#supportArea").show();
			$("#supportPie").show();
			$("#supportBar").show();
			supportArea();
			
			$("#effectImg").show(10000);
		}else if(change==4||change=='a'){//��������
			
			$("#garbage").show();			
			startAutoScroll();
		}else if(change==5||change=='b'){//�¾籤����
			$("#suntorch2").show();
		}else if(change==6||change=='c'){//����������
			$("#gift").show();
		}else if(change==7||change=='d'){//�Ҿױ��
			$("#contribution").show();
		}else if(change==8||change=='e'){//�ֺ��� �Ŀ�
			$("#joo").show();
		}else if(change==9||change=='f'){//�������� �Ŀ�
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////������ ���� �����
		  $("#effectImg").hide();

		  var change=0;//������ ȭ�� �����ֱ� ���� ���� 0�̸� �����ְ� 1�̸� �����.
			
		  $("#supportWindow").hide();//�Ŀ��ϱ� â �����
		  
	      $("div#iphon").hide();//������ �����
	      $("div#message").hide();//���� �޼��� �����
	      $("#phonImoticon").click(function(){//������ �����ְ� �ٽ� ������
			  if(change==0){
			  $("div#iphon").show(1000);
			  change=1;
			  
			  var sysdate=new Date();//������ ȭ�� ���� �ð�	 
			  var year=sysdate.getFullYear();
			  var mon=sysdate.getMonth()+1;
			  var day=sysdate.getDate();
				
			  var hour=sysdate.getHours();
			  var mi=sysdate.getMinutes();
			  
			  $("b#date").html(year+'��'+' '+mon+'��'+' '+day+'��'+' '+hour+'��'+' '+mi+'��'+' ');//���� ��¥ �ð� �־���
		  
			  
			  }
			  else if(change==1){
				  $("div#iphon").hide(1000);
				  change=0; 
			  }
		  });	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////�Ŀ� ���������� �Ŀ��� ��������  �����ִ°�      
	     $(document).ready(function(){//onload���� ������.
	    	  
	    	
	    	  actionlaboratory($("#change").val()==''?1:$("#change").val());//change���� �ȵ�� �ö� ������ 1�� ������ ������ ���� �����ֱ�.	    	  
	    	  
	    	  $("#supportpriceH").val("${supportprice}");//����� �Ŀ� ������ �Ŀ�â�� �ٿ��ֱ�
	     });
	      
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////�ڵ���ũ���� �̹����� �������� �����ְ� �ٽ� �ѹ� ������ �ٽ� �����̰� �Ѵ�.	      
	      
	      $("#garbage").click(function(){//�ڵ���ũ���� �̹����� �������� �����ְ� �ٽ� �ѹ� ������ �ٽ� �����̰� �Ѵ�.	
	    	  scrollchange=scrollchange*-1;
	    	  if(scrollchange==-1){
	    	  clearInterval(autoscroll);
	    	  }else if(scrollchange==1){
	    		  startAutoScroll();
	    	  }
	    	  
	      });
	      
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////�Ŀ��ϱ� ��ư
		
	      		
		  $("input[type=button]").click(function(){//�Ŀ��ϱ� ��ư
			 //suntorch2bt,giftbt,contributionbt,joobt,ssibt 
		  
			  if(this.id=='garbagebt'){//�Ŀ� ��ư ������ â ����ְ� �̸� �ٲ��ֱ�
				  
			      $("#supportWindow").show(1000);//�Ŀ��ϱ� â �����ֱ�
			      $("#supportName").html("�������� �Ŀ�");
			      
			      $("#ownerSupportPrice").html($("#supportpriceH").val());//�Ŀ� â�� �Ŀ� ������ �����ֱ�.
			      
			      $("#supportGo").click(function(){//�Ŀ��ϱ� Ȯ�� ��ư
			    	  //ownerno,supportprice,name
			    	  supportGoFunction(1,$("#supportpriceGo").val(),'��������');
					  
				  });
			  }else if(this.id=='suntorch2bt'){
				  $("#supportWindow").show(1000);//�Ŀ��ϱ� â �����ֱ�
				  $("#supportName").html("�¾籤���� �Ŀ�");
				  $("#supportGo").click(function(){//�Ŀ��ϱ� Ȯ�� ��ư
					  supportGoFunction(1,$("#supportpriceGo").val(),'�¾籤����');
					  
				  });
			  }else if(this.id=='giftbt'){
				  $("#supportWindow").show(1000);//�Ŀ��ϱ� â �����ֱ�
				  $("#supportName").html("���� ������");
				  $("#supportGo").click(function(){//�Ŀ��ϱ� Ȯ�� ��ư
					  supportGoFunction(1,$("#supportpriceGo").val(),'����');
				  
				  });
			  }else if(this.id=='contributionbt'){
				  $("#supportWindow").show(1000);//�Ŀ��ϱ� â �����ֱ�
				  $("#supportName").html("�Ҿ� ���");
				  $("#supportGo").click(function(){//�Ŀ��ϱ� Ȯ�� ��ư
					  supportGoFunction(1,$("#supportpriceGo").val(),'�Ҿױ��'); 
					  
				  });
			  }else if(this.id=='joobt'){
				  $("#supportWindow").show(1000);//�Ŀ��ϱ� â �����ֱ�
				  $("#supportName").html("�ֺ��� �Ŀ�");
				  $("#supportGo").click(function(){//�Ŀ��ϱ� Ȯ�� ��ư
					  supportGoFunction(1,$("#supportpriceGo").val(),'�ֺ��� �Ŀ�'); 
					  
				  });
			  }else if(this.id=='ssibt'){
				  $("#supportWindow").show(1000);//�Ŀ��ϱ� â �����ֱ�
				  $("#supportName").html("�������� �Ŀ�");
				  $("#supportGo").click(function(){//�Ŀ��ϱ� Ȯ�� ��ư
					  supportGoFunction(1,$("#supportpriceGo").val(),'�������� �Ŀ�');
					  
				  });
			  }  
			    
		  });
		  $("#supportCencal").click(function(){//�Ŀ� ��� ��ư
			  $("#supportWindow").hide(1000);//�Ŀ��ϱ� â �����
		  });
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		  


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		});
	var supportGoFunction=function(ownerno,supportprice,name){//�Ŀ��������� �Ŀ����̺� �־��ְ� ����� �Ŀ������� �������ִ� ��
		
		window.location.href="/web/bmSupportGo.do?name="+encodeURIComponent(name)+"&supportPrice="+supportprice+"&ownerno="+ownerno;//�Ŀ� ������ �߰�,�ѱ� ���� ���� // ������� �Ŀ� ������ ���� (���� ����)
		//window.location.href="/web/bmOwnerSupportGo.do?ownerno="+ownerno+"&supportPrice="+supportprice;//������� �Ŀ� ������ ����
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
				//[{name: "Browsers",colorByPoint: true,data: [{ name: "����",y: 62.74 }, ]}]
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
		        text: '2019��, ���߷� ��ȸ �Ŀ� ��Ȳ'
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
      <a href="#"><img alt="" src="/web/store/���߷� ��ȸ.png" width="150px;" height="60px;" style="float: left; margin-left: 15%;"></a>
      <img id="categoryButton" class="category" alt="" src="/web/store/ī�װ�.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
      <img class="category" alt="" src="/web/store/��¦����.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
      <img class="category" alt="" src="/web/store/�߳�����.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
      <img class="category" alt="" src="/web/store/���߷� ������.png" width="90px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
      
        <div id="phonImoticon" style="float:right; width: 4%; background-color: white; margin-right:8.5%; margin-top:1%;">
			<img alt="" src="/web/store/����.png" style="cursor:pointer ; margin-left: 27%; margin-bottom:5%; float: left;" width="42%" height="42%">
		    <b id="phonImoticon" class="basket"  style="color:gray; float:left; margin-left:13%; cursor:pointer;  font-family: monospace; font-size: 12px;">�޼���</b>
		</div>
		
		<div style="float:right; width: 4%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="/web/store/�˻�.png" style="margin-left: 27%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">��ǰ�˻�</b>
		</div>
		<div style="float:right; width: 4%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="/web/store/��ٱ���.png" style="margin-left: 26%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">��ٱ���</b>
		</div>
		<div style="float:right; width: 5%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="/web/store/�����.png" style="margin-left: 32%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">### �����</b>
		</div>
		
      <div id="cateShow" class="cateShow" style="background-color:white; position:absolute; display:none; margin-left:30%; margin-top:3.4%; border:1px solid black; width: 600px; height: 200px;">
         <table style="width: 100%; height: 100%;">
            <tr>
               <th >��/��/��/����</th>
               <th >���ڹڽ�</th>
               <th >��Һ���</th>
               <th >������ǰ</th>
               <th >��/����</th>
            </tr>
            
            <tr>
               <th>�ҽ�/��/����</th>
               <th>ġŲ�ڽ�</th>
               <th>���̺���</th>
               <th>���左</th>
               <th>��/���</th>
            </tr>
            
            <tr>
               <th>�������</th>
               <th></th>
               <th>����</th>
               <th></th>
               <th>������ǰ</th>
            </tr>
            
            <tr>
               <th></th>
               <th></th>
               <th></th>
               <th></th>
               <th>����/�õ���ǰ</th>
            </tr>
            
            <tr>
               <th></th>
               <th></th>
               <th></th>
               <th></th>
               <th>��/���깰</th>
            </tr>
            
            <tr>
               <th></th>
               <th></th>
               <th></th>
               <th></th>
               <th>����</th>
            </tr>
         </table>
        
      </div>         
       
   </div>
	
	 <div id="supportArea" style="position:fixed; position:absolute;  width:100%; top: 15.3%;">
	  </div>
	
<div style="margin-left:15%; margin-top: 11%; float: left; width: 1030px; height:600px; background-color: white ;">
	<div style="width: 11%; height:600px; float: left; position: fixed;">
	  <div style="width: 100%; height: 6%; border-bottom: 1px solid gray;">	
		   <b style="font-size: 17px;">���߷� ������</b>
	  </div>
	  <div style="width: 100%; margin-top: 13px;">
	  	 <div style="width: 100%; height: 30px; ">	
		   <b id="introduce" onclick="actionlaboratory(1)" style="font-size: 12px; cursor: pointer;">���߷λ�ȸ��</b>
		 </div>  
		 <div style="width: 100%; height: 40px; border-bottom: 1px solid gray;">	
		   <b id="activityarea" onclick="actionlaboratory(3)" style="font-size: 12px; color: red; cursor: pointer;">�Ŀ� ��Ȳ,����</b>
		 </div>
	  </div>
	  <div style="width: 100%; margin-top: 13px;">
		 <div style="width: 100%; height: 30px;">	
		   <b onclick="actionlaboratory(4)" style="font-size: 12px; color:gray; cursor: pointer;">��������(Algeria)</b>
		   <input id="garbagebt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="�Ŀ��ϱ�">
		 </div>
		 <div style="width: 100%; height: 30px; ">	
		   <b onclick="actionlaboratory(5)" style="font-size: 12px; color:gray; cursor: pointer;">�¾籤����(Zambia)</b>
		   <input id="suntorch2bt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="�Ŀ��ϱ�">
		 </div>
		 <div style="width: 100%; height: 30px; ">	
		   <b onclick="actionlaboratory(6)" style="font-size: 12px; color:gray; cursor: pointer;">����������(Uganda)</b>
		   <input id="giftbt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="�Ŀ��ϱ�">
		 </div>
		 <div style="width: 100%; height: 30px; ">	
		   <b  onclick="actionlaboratory(7)" style="font-size: 12px; color:gray; cursor: pointer;">�Ҿױ��(Madagascar)</b>
		   <input id="contributionbt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="�Ŀ��ϱ�">
		 </div>
		 <div style="width: 100%; height: 30px; ">	
		   <b  onclick="actionlaboratory(8)" style="font-size: 12px; color:gray; cursor: pointer;">�ֺ��� �Ŀ�(Niger)</b>
		   <input id="joobt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ; border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="�Ŀ��ϱ�">
		 </div>
		 <div style="width: 100%; height: 40px; border-bottom: 1px solid gray;">	
		   <b  onclick="actionlaboratory(9)" style="font-size: 12px; color:gray; cursor: pointer;">�������� �Ŀ�(Sudan)</b>
		   <input id="ssibt" type="button" style="float:right ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="�Ŀ��ϱ�">
		 </div>
	  </div>
	  
	</div>
	
	<div id="showlaboratory" style="background-color: white; width:79% ; height: 100%; float: right; margin-right: -10%;">
	
	  <div id="whatrichuro" style="background-color: white; width:100% ; height: 100%; float: right;">
		<div style="background-color:#F6F6F6; width: 100%; height: 13%; border-bottom: 1px solid gray;">
			<b style="font-size: 40px; margin-top: 10px; float: left;">���߷λ�ȸ��</b>
		</div>	
		<div style="width: 60%; height: 13%; margin-top:2%; float: left;">
			<h3 style="color: gray;">���߷λ�ȸ�� ��̵��� ��￡�� ��� �׵��� ���� �������
                           ������ �� �ִ� ������ ����� ���� ����մϴ�.</h3>
		</div>		
		<div style="width: 47%; height: 30%; margin-top:2%; float: left;">
			<b style="color: gray; font-size: 13px;">���߷λ�ȸ�� <b style="font-size: 14px; color: blue;">��̵��� �Ǹ� ����</b>�� ���� ����ϰ� ������, ���߷λ�ȸ�� ��� ���� ���α׷��� ����� ������� Ű�� �� �ִ� ��Ȱȯ���� �����ϱ� ����</b>
			<b style="font-size: 14px; color: blue;"> ��� �߽� ��������, 
			CCCD(Child Centred Community Development)</b><b style="color: gray; font-size: 13px;">�� ������� �ǽõǰ� �ֽ��ϴ�. 
			��� �߽� ���������� �ٽ��� ��̵鿡�� �������߿� ���� ������ �ǰ��� ���� ������ �� �ִ� ���� �������ְ�, 
			��̵��� �������� ������ ������ �� �ֵ��� ���� ���Դϴ�.</b>
		</div>		
		<div style="width: 47%; height: 13%; margin-top:2%; float: right ;">
			<b style="color: gray; font-size: 13px;">���������� ��� �Ӹ� �ƴ϶�, ��̵鿡�Ե� ������ �ֱ� ������ ��̵��� �ǰ��� �����ϰ�, ������ ����ϴ� ���� �ʿ��մϴ�. 
			�̷��� �÷��� ����� �����Կ� �־ <b style="font-size: 14px; color:blue;">���, 
			û�ҳ� �� �������� ������ ����</b>�ϰ� ������ 50������ ������ȸ �� �ùδ�ü, 
			���ο� ����� �����ϰ� �ֽ��ϴ�.</b>
		</div>	
		<div style="float: left; margin-top: 2%; ">
			<img alt="" src="/web/store/���߷λ�ȸ��.png" >
		</div>	
		<div style="float: left;width:40%; ">
			<b style="opacity: 1; color:#DFE9F2; font-size: 110px; font-style: italic;">what we work</b>
		</div>
	  </div>
	  
	  <div id="supportPie" style=" width:70%; height:60%; float: right; margin-right: -70%; opacity: 0.5; margin-top: -8%;">
	  </div>
	  <div id="supportBar" style=" width:70%; height:64%; float: right; margin-right: -70%; opacity: 0.5; margin-top: 36%;">
	  </div>
	 
	  
		<img id="garbage" alt="" src="/web/store/��������.jpg" width="100%" style="display: none; ">
		<img id="suntorch2" alt="" src="/web/store/�¾籤����2.jpg" width="100%" style="display: none;">
		<img id="gift" alt="" src="/web/store/����������.png" width="100%" style="display: none;">
		<img id="contribution" alt="" src="/web/store/�Ҿױ��.jpg" width="100%" style="display: none;">
		<img id="joo" alt="" src="/web/store/�ֺ����Ŀ�.jpg" width="100%" style="display: none;">
		<img id="ssi" alt="" src="/web/store/���������Ŀ�.jpg" width="100%" style="display: none;">
	</div>
			
</div>

<div id="iphon" style="position:absolute; position:fixed ; top:17%; left:77%;   width: 300px; height: 500px; background-color:#F5F6F8 ; border: 1px solid skyblue; border-radius: 25px 25px 25px 25px;">
	<div style="background-color:#F5F6F8 ; border: 1px solid skyblue; margin-left:38%; margin-top:6%; width: 25%; height:1.5%; border-radius: 25px 25px 25px 25px;">
	</div>
	<div style="margin-left:4.5%; margin-top:5%; width: 90%; height:80%; background-color: white; border: 1px solid skyblue;">
	
		<div style="margin-top: 2%; margin-left: 40%;">
			<b style="color: gray; font-size: 11px;">���� �޼���</b>
		</div>
		
		<div style="margin-left: 25%;">
			<b id="date" style="color: gray; font-size: 11px;"></b>
		</div>
		
		<div id="message" style="width: 70%; padding:8px 8px 8px 8px; background-color: #EEEFF2; border-radius: 20px 20px 20px 20px; margin-left: 2%; margin-top: 2%;">
			<b style="font-size: 14px;">  [���߷λ�ȸ]����Ȯ�� ������ȣ�� </b>
			<b id="code" style="font-size: 14px; color: red; border-bottom: 1px solid red;"></b>
			<b id="hicode" style="display: none;"></b>
			<b style="font-size: 14px;">�Դϴ�.</b>
		</div>
	</div>
	<div style="background-color:#F5F6F8 ;cursor:pointer; border: 2px solid skyblue; margin-left:43%; margin-top:2%; width: 14%; height:8%; border-radius: 35px 35px 35px 35px;">
	</div>	
</div>	

<div id="supportWindow" style="top:37.5% ;left:26.7% ; width: 250px; height:180px ; position: absolute; position: fixed; border: 1px solid gray; background-color: white;">
	<div style="width: 100%; height:20%; margin-top:5% ; text-align: center;">
		<b id="supportName" style="border-bottom: 2px solid gray;">�������� �Ŀ�</b>
	</div>
	<div style="width: 95%; height:17%; ">
		<b style="float: left; margin-left: 5%; font-size: 15px; color:green ;border-bottom: 2px solid green; ">�Ű���</b>
		<b style="float: left; margin-left: 2%; font-size: 12px; margin-top: 1%;">��</b>
		<b style="float: right; font-size: 12px; color: blue; margin-top: 1%;">�����</b>
	</div>	
	<div style="width:95%; height:15%; ">
		<b style="float: left; margin-left: 5%; font-size: 12px;">�Ŀ������� :</b>
		<b style="float: right; font-size: 12px; ">��</b>
		<b id="ownerSupportPrice" style="float: right; font-size: 12px; color: blue;"></b>
	</div>	
	<div style="width: 95%; height:19%; ">
		<b style="float: left; margin-left: 5%; font-size: 12px;">�Ŀ��� </b>
		<b style="float: left; margin-left: 11.7%; font-size: 12px;">:</b>
		<input id="supportpriceGo" type="text" style="width: 35%; float:right ; margin-left: 2%;">
	</div>
	<div style="width: 95%; height:11%; ">
		<input id="supportGo" type="button" style="float:left ;margin-left:25% ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="�Ŀ��ϱ�">
		<input id="supportCencal" type="button" style="float:left ;margin-left:5% ; cursor:pointer ; font-size:11px ; width:60px ;height:22px ;  border-radius:15px 15px 15px 15px ;  background-color: rgb(240,240,240); border:1px solid skyblue;" value="���">
	</div>
</div>
	<img id="effectImg" alt="" src="/web/store/jango rainok-46.gif" width="100%" style="position: absolute; top:0px; left:0px;">
</body>
</html>