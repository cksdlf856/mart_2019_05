<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���߷� ��ȸ</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
    var change=1;//����� ����� 10�� �� �Ϸ�� 1�Ǵ� -1�� �ٲ��ְ� �ٽ� Ŭ�� ������ �ٷ� ����
	var couponCountNumber=10;
	var couponCount=null;
		
	
	function startInterval(){//���� ���� �ð��� ����		
		     couponCount=setInterval(function(){
		    	  couponCountNumber=couponCountNumber-1;
		          $("#couponCount").html(couponCountNumber+"��");
		          if(couponCountNumber==0){
		        	 
		        	  clearInterval(couponCount);
		      		  $("#couponCount").html(10+"��");//��� 10�ʷ� �ʱ�ȭ
		      		  couponCountNumber=10;//���� ī��Ʈ �Ǵ� �� 10�ʷ� �ʱ�ȭ
		      		  $("#couponPaper").hide(100);
		        	  alert("�� ��������...");
		        	  change=change*-1;//�̰� ����� �ٷ� �ٽ� Ŭ�� ������ �ٷ� ���� �Ѵ�.
		          }
		    },1000);
	}
	function stopInterval(){//���� ���� �ð��� ����
		clearInterval(couponCount);//�������� ����� clear�� ��� �� �� �ִ�.
		$("#couponCount").html(10+"��");
		couponCountNumber=10;
		$("#couponPaper").hide(100);
	}
	function couponQuize(){//���� ����
		 randomNumber= Math.floor(Math.random()*6);
		if(randomNumber==0){
			$("#couponQuestion").html("���߿��� ���� ���̴� �ٸ��� ��� �����ΰ� ?");
			$("#answer1").html("�մٸ�");
			$("input[type=radio]#quiz1").val("�մٸ�");
			$("#answer2").html("�޴ٸ�");
			$("input[type=radio]#quiz2").val("�޴ٸ�");
			$("#answer3").html("���� �ٸ� ��");
			$("input[type=radio]#quiz3").val("���� �ٸ� ��");
		}else if(randomNumber==1){
			$("#couponQuestion").html("������ �������� ?");
			$("#answer1").html("����");
			$("input[type=radio]#quiz1").val("����");
			$("#answer2").html("��Ż����");
			$("input[type=radio]#quiz2").val("��Ż����");
			$("#answer3").html("������");
			$("input[type=radio]#quiz3").val("������");
		}else if(randomNumber==2){
			$("#couponQuestion").html("��� ������ �ʿ��� ���� ?");
			$("#answer1").html("����");
			$("input[type=radio]#quiz1").val("����");
			$("#answer2").html("����");
			$("input[type=radio]#quiz2").val("����");
			$("#answer3").html("�ұ�");
			$("input[type=radio]#quiz3").val("�ұ�");
		}else if(randomNumber==3){
			$("#couponQuestion").html("���� ��𿡼� ���� ��� ?");
			$("#answer1").html("�����");
			$("input[type=radio]#quiz1").val("�����");
			$("#answer2").html("�߻�");
			$("input[type=radio]#quiz2").val("�߻�");
			$("#answer3").html("�������");
			$("input[type=radio]#quiz3").val("�������");
		}else if(randomNumber==4){
			$("#couponQuestion").html("���� ���� �����ϸ�  �ż����� �󸶳� ���� ?");
			$("#answer1").html("1 ����");
			$("input[type=radio]#quiz1").val("1 ����");
			$("#answer2").html("3 ~ 4 ����");
			$("input[type=radio]#quiz2").val("3 ~ 4 ����");
			$("#answer3").html("1 ��");
			$("input[type=radio]#quiz3").val("1 ��");
		}else if(randomNumber==5){
			$("#couponQuestion").html("¥����� ������ ?");
			$("#answer1").html("�ϰ�");
			$("input[type=radio]#quiz1").val("�ϰ�");
			$("#answer2").html("���");
			$("input[type=radio]#quiz2").val("���");
			$("#answer3").html("��Ī");
			$("input[type=radio]#quiz3").val("��Ī");
		}
	}
	
	function couponSuccess(){//���� ���� ���� ������
		alert("������ȳ� :( ");
		window.location.href="/web/couponinsert.do?ownerno="+1;
	}
	
	$(function(){
		
     
		
		  ////////////////////////////////////////////////////////////����
		  $("#couponPaper").hide();
		  
		  $("#couponbt").click(function(){
			  change=change*-1;
			  if(change==-1){//���� Ǯ��
			     $("#couponPaper").show(100);
			     couponQuize();
			     startInterval();
			  }else if(change==1){//���� �ݱ�
				  stopInterval();
			      $("input[type=radio]").prop("checked",false);//�ݱ� ������ üũ ����
			  }
		  });
		  
		  
		  $("input[type=radio]").click(function(){
			  
			  
			  if($("input[type=radio]:checked").val()=="�մٸ�"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="��Ż����"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="�ұ�"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="�߻�"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="3 ~ 4 ����"){
				  couponSuccess();
			  }else if($("input[type=radio]:checked").val()=="���"){
				  couponSuccess();
			  }else{//���� �̿��� ��(Ʋ����)�� ���ý�
				  
				  clearInterval(couponCount);
	      		  $("#couponCount").html(10+"��");//��� 10�ʷ� �ʱ�ȭ
	      		  couponCountNumber=10;//���� ī��Ʈ �Ǵ� �� 10�ʷ� �ʱ�ȭ
	      		  $("#couponPaper").hide(100);
	      		  alert("�״� Ʋ�ȴٳ�.. ������ �������");
	        	  change=change*-1;//�̰� ����� �ٷ� �ٽ� Ŭ�� ������ �ٷ� ���� �Ѵ�.
	        	  $("input[type=radio]").prop("checked",false);//������ Ʋ���� üũ ���¸� ���� �����ش�.
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
	    
		<img alt="" src="/web/store/���߷� ��ȸ.png" width="150px;" height="60px;" style=" float: left; margin-left: 15%;">
		<img id="categoryButton" class="category" alt="" src="/web/store/ī�װ�.png" width="70px;" height="30px;" style=" cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="/web/store/��¦����.png" width="70px;" height="30px;" style=" cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="/web/store/�߳�����.png" width="70px;" height="30px;" style=" cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="/web/store/���߷� ������.png" width="90px;" height="30px;" style=" cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<div style=" float:right; width: 4%; background-color: white; margin-right:8.5%; margin-top:1%;">
			<img alt="" src="/web/store/�˻�.png" style="margin-left: 27%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">��ǰ�˻�</b>
		</div>
		<div style=" float:right; width: 4%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="/web/store/��ٱ���.png" style="margin-left: 26%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">��ٱ���</b>
		</div>
		<div style=" float:right; width: 5%; background-color: white; margin-right:1%; margin-top:1%;">
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
<div style="margin-top: 6.6%; float: left; width: 100%; height: 100%; background-color: white;">
	
	<div style="float: left; margin-left: 7%; margin-top: 2%; cursor: pointer;">
		<img alt="" src="/web/store/���λ���.jpg">
	</div>
	<div style="float: left; margin-left:3%; margin-top: 2%;  background-color: skyblue; width: 275px; height:183px;">
		<img alt="" src="/web/store/�������.png" style="position: fixed;"><!--top:41.5%; left:67.5%;  -->
        <input id="couponbt" type="button" style="position:absolute; padding:5px 10px 5px 10px ;margin-top:95px ;margin-left:55px ; border-radius:20px 20px 20px 20px ; background-color: white; font-weight: bold; color:skyblue" value="���� Ǯ��">
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
		<b id="couponCount" style="margin-top:5% ; margin-left:34% ; float: left; font-size: 40px; color: red;">10��</b>
	</div>
</div>	

</body>
</html>