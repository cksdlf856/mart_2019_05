<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���߷� ��ȸ</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">	  
		  
	$(function(){
		  var change=0;//������ ȭ�� �����ֱ� ���� ���� 0�̸� �����ְ� 1�̸� �����.	
		  
		  
		  if($("#term").val()==''?true:false){
		  $(document).ready(function(){
			  term=1;//�ѹ��� ���� ������ �ٲ���. 
			  window.location.href="/web/orderDiscount.do?ownerno=1&term=0";
		  });
		  }
		  
		  $("div#message").hide();//���� �޼��� �����
		  
		  $("div#iphon").hide();//������ �����
		
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
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////��ٱ��� �����ϱ�	
	
	
	      $("#basketButton").click(function(){
	    	 $("#frm").submit();
	    	  	  
	      });
		  
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////�ֹ��ϱ�
			
		  $("#orderButton").click(function(){
			 
			 var supportPrice=$("#supportReserve").html().substr(0,$("#supportReserve").html().length-1);//�Ŀ� ������			 
			 
			 var frm=$("#frm").attr("action","/web/orderMove.do?page=1&supportPrice="+supportPrice);//�ֹ��ϱ� ������ �̵� �� ������������ ���ƿö� page=1��  storeOrder�������� �̵�
			 //�ֹ��ϱ� �Ҷ� �Ŀ� �����ݵ� ������ ����.
			 frm.submit();
			 
			 $("#frm").attr("action","/web/bmbasketInfo.do");//�ٽ� action�� ������ �ǵ�����.
			 
		  });
		  	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////������ ���� �����
			 
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
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////��Ͻð�,�����ð� ����ִ°�
	        var countRentarTime=setInterval(function(){//��Ͻð�, �����ð�, ���� �ð� �����(���� ��Ͻð��̶� �����ð��� ���� �ȿ� ���� �ʾƵ� ������ �߻��Ǵ� ���� ������ �� �� �־���)
	        	
				var startdate=new Date();
				var styear=startdate.getFullYear();//��Ͻð� �⵵
				var stmon=startdate.getMonth()+1;//��Ͻð� ��
				var stday=startdate.getDate();//��Ͻð� ��
				var todayHours=startdate.getHours();//����ð� 
				var todayMi=startdate.getMinutes();//���� ��
				var todaySe=startdate.getSeconds();//���� ��
				startdate.setHours(14);//��Ͻð� 2��
				var sthour=startdate.getHours();//�ٷ� ������ �ð��� �־��ְ� �̾���� �Ѵ�. var sthour=startdate.setHours("14");�־��ذ� �ٷ� ������ �־ ����ϸ� �ȵȴ�...(���⼭ 20�� �ҿ� �Ѥ�..)
				startdate.setHours(20);//�����ð� 8��
				var enhour=startdate.getHours();//�����ð� �ð�
				startdate.setMinutes(0);
				var stmi=startdate.getMinutes();//��Ͻð� �����ð����� ���� ��
				
				var rentarHours=(enhour-todayHours-1);//8�� �������� ���� �ð��� ���� -1�ð��� �� ���ش�.
				var rentarMi=(60-todayMi-1);//60�п��� ���� ���� ���ش�.-1�� ����� 2�ð� 59�� ���Ҵٰ� ǥ�ð� �ȴ�. �ƴϸ� 2�ð� 60�� ���Ҵٰ� ǥ�õȴ�.
				var rentarSe=(60-todaySe);//60�ʿ��� ���� �ʸ� ���ش�.
					
			  	$("b#startTime").html(styear+'��'+' '+stmon+'��'+' '+stday+'��'+' '+sthour+'��'+' '+stmi+"��");//��Ͻð�
			  	$("b#endTime").html(styear+'��'+' '+stmon+'��'+' '+stday+'��'+' '+enhour+'��'+' '+stmi+"��");//�����ð�
				$("b#rentarTime").html(rentarHours+'�ð�'+' '+rentarMi+"��"+' '+rentarSe+"��")//�����ð�
				
			    var supportReserve=($("input[name='productprice']").val())*eval("${discountrate}")//10�ۼ�Ʈ ������ �ִ� �Ŀ�������, ex) 36000�� * 0.1�� = 3600��
			  		   
			  	var totalTimeToSeconds=6*3600;//�Ŀ��������� ����Ǵ� �ð� �� �ʷ� ��ȯ .6�ð� * 3600�� = 21600��
			  		   
			    var supportReserveUpSeconds=(totalTimeToSeconds/supportReserve); 
			  	//��ü �� 21600 ������ �Ŀ������� 3600 = 6�� (6�ʸ��� 1���� ����)
			  		  
			    var rentarTimeToSeconds=(rentarHours*3600)+(rentarMi*60)+rentarSe;//�����ð��� �ʷ� ��ȯ
			  		   
			    var currentSupportReserve=supportReserve-((totalTimeToSeconds-rentarTimeToSeconds)/supportReserveUpSeconds);
			    //6�ʸ��� 1���� �����Ǵ� ���� �Ŀ� ������
			    //���� �Ŀ������� 3600 - ((6�ð��� �ʷ� ��ȯ 21600�� - �����ð��� �ʷ� ��ȯ ) / 6�ʷ� ������ �ָ� �սð����� ���� �Ŀ��������� �� �� �ִ� ) �ű⿡ �� �Ŀ� �������� ���� ���� �Ŀ��������� 6�ʸ��� �����ȴ�.
			    $("b#supportReserve").html(Math.floor(currentSupportReserve)+"��");
			  		   
			  	if((rentarHours==0&&rentarMi==0&&rentarSe==1)||rentarHours<0||rentarHours>5){
			  		$("b#rentarTime").html("�Ŀ� ������ ����");
			  		$("b#supportReserve").html(0+"��");
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
		      <b style="font-size: 30px;">��ȭ ��ǥ���������� 14KG</b>
		      <input type="hidden" name="productname" value="��ȭ ��ǥ���������� 14KG">
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">��Ͻð�</b><b id="startTime" style="color:red; font-size: 13px; float: right;"></b>	      
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">�����ð�</b><b id="endTime" style="color:red; font-size: 13px; float: right;"></b>	      
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">�����ð�</b><b id="rentarTime" style="color:red; font-size: 13px; float: right;"></b>	      
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">�Ŀ�������</b><b id="supportReserve" style="color:red; font-size: 13px; float: right;"></b>	      
		    </div>
		   
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">��ǰ�ڵ�</b><b style="float: right;">F13-RM-C87-00002</b>
		      <input type="hidden" name="productcode" value="F13-RM-C87-00002">
		    </div> 
		    
		     <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">����ܰ�</b><b style="float: right;">�� �� 36000��</b>
		    </div>
		     <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">������/�Ǹ���</b><b style="float: right;">��ȭ</b>
		    </div>
		     <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">��ۻ�</b><b style="float: right;">CJ�������</b>
		    </div>
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">�ǸŰ���</b><b style="float: right;">36000��</b>
		      <input type="hidden" name="productprice" value="36000">
		    </div>
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <b style="font-size: 13px;">����</b>
		      <b style="font-size: 13px; float: right; margin-top: 13px; margin-left: 5px;">��</b>
		      <b style="cursor:pointer; color:gray; font-size:10px; float:right; margin-top:20px; margin-left:-15px;  ">��</b>
		      <b style="cursor:pointer; color:gray; font-size:10px; float:right ; margin-top:7px; margin-left:5px; ">��</b>
		      <input name="productquantity" type="text" style="width:18px; height: 40px; float: right;padding-left: 35px;" value="1">
		    </div>
		    
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <input id="orderButton" type="button" value="�ֹ��ϱ�" style="border:1px solid black; width: 100%; background-color: black; color: white; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		    </div>
		    <div style="float: left;margin-bottom:2.5%; width: 100%; background-color: white;">
		      <input id="basketButton" type="button" value="��ٱ���" style="cursor:pointer; float:left; border:1px solid gray; width: 48.5%; background-color: white; color: gray; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		      <input id="recommendButton" type="button" value="��õ��ǰ" style="cursor:pointer; float:right; border:1px solid gray; width: 48.5%; background-color: white; color: gray; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
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


</body>
</html>