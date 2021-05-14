<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���߷� ��ȸ</title>
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
					proprice=(dom.productprice)*(dom.productquantity);//��ǰ ���� ��(x) ��ǰ ���簡��
					tprice+=proprice;//��ǰ �� ���� �� ��ġ�� 
					
					temp+="<div style=\"float: left; background-color: white; width: 100%; margin-bottom: 3%; margin-top:3%;\">";
					temp+="<div style=\"width:6%; height:100px; float:left;\">";
					temp+="<input id=\""+dom.no+"\" type=\"checkbox\">";
					temp+="</div>";
					temp+="<div style=\" width:65%; height: 100px; float: left;\">";
					temp+="<img alt=\"��ǰ�̹���\" src=\"/web/store/processedFood/"+dom.productimage+"\" width=\"100px\" height=\"100px\"  style=\"float: left;\">";
					temp+="<b style=\"float: left; margin-left: 5%; width: 70%; height: 35%;\">"+dom.productname+"</b>";
					temp+="<input type=\"button\" value=\"��ǰ������\" style=\" color:gray; font-weight: bold; background-color:white; float: left; margin-left: 5%; width:100px; height:30px;\">";
					temp+="</div>";
					temp+="<div style=\" width:8%; height: 100px; float: left;\">";
					temp+="<b>"+dom.productprice+"��</b>";
					temp+="</div>";
					temp+="<div style=\" width:8%; height: 100px; float: left;\">";
					temp+="<input type=\"text\" name=\""+dom.no+"\" style=\"float:left; width:13px; height: 40px; font-weight: bold; padding-left: 35px;\" value=\""+dom.productquantity+"\">";
					temp+="<b onclick=\"quantityaction()\" style=\"cursor:pointer; color:gray; font-size:10px; float:left; margin-top:7px; padding-right:5px; margin-left:5px;\">��</b> ";
					temp+="<b onclick=\"\" style=\"cursor:pointer; color:gray; font-size:10px; float:left; margin-top:5px; margin-left:5px;\">��</b> ";
					temp+="<input onclick=\"modiBasket("+dom.no+")\" type=\"button\" value=\"����\" style=\"color:gray; font-weight: bold; background-color: white; width: 100%; height: 35px; margin-top: 15%;\">";
					temp+="</div>";
					temp+="<div style=\" width:11.9%; height: 100px; float: left;\">";
					temp+="<b style=\"float:right;\">"+proprice+"��</b>";
					temp+="</div>";
					temp+="</div>";			
					//category,no,productname,productcode,productprice,productunit,productdelivery,productcount,productproduction,productimage
				  });
				
				
				$("#catelist").html(temp);
				$("#totalprice").html(tprice+'��');
			},
			error:function(request,status){
				alert("error code = "+ request.status);
			}	
		});
	};
	 
	 function modiBasket(no){//��ٱ��� ��ǰ ���� ����
		 var quantity=$("input[name="+no+"]").val();//���� �����Ѱ� �޾ƿ���
		
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
	
	 function deleteBasket(no){//��ٱ��� ���� ����
		
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
		  
		  $("#deletebt").click(function(){//��ٱ��� ��� ���� ����
			 
			 $("input[type=checkbox]:checked").each(function(index,dom){//each�� ������ �̾Ƴ��� �Ѵ�.
				
				 deleteBasket(dom.id);
			 });
			 
		  });
		  
		  $("input[type=button]#backbt").click(function(){//���� ����ϱ� ��ư
			  alert("ok");
		  });
		  
		  $("input[type=button]#orderbt").click(function(){//���� �ֹ��ϱ�
			  var tempId='';
			  $("input[type=checkbox]:checked").each(function(index,dom){
				  tempId+=dom.id+'-';//üũ�ڽ� ������ �ֵ� id�� ��� no�� ������,#���� �ٿ��� ���� ù��° ���� ����....#���� �ٿ��� ����ȵȴ�...
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
		<a href="#"><img alt="" src="���߷� ��ȸ.png" width="150px;" height="60px;" style="float: left; margin-left: 15%;"></a>
		<img id="categoryButton" class="category" alt="" src="ī�װ�.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="��¦����.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="�߳�����.png" width="70px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<img class="category" alt="" src="���߷� ������.png" width="90px;" height="30px;" style="cursor: pointer; float: left; margin-left: 5%; margin-top: 1%;">
		<div style="float:right; width: 4%; background-color: white; margin-right:8.5%; margin-top:1%;">
			<img alt="" src="�˻�.png" style="margin-left: 27%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">��ǰ�˻�</b>
		</div>
		<div style="float:right; width: 4%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="��ٱ���.png" style="margin-left: 26%; margin-bottom:8%; float: left;">
		    <b onclick="basket()" class="basket" style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">��ٱ���</b>
		</div>
		<div style="float:right; width: 5%; background-color: white; margin-right:1%; margin-top:1%;">
			<img alt="" src="�����.png" style="margin-left: 32%; margin-bottom:8%; float: left;">
		    <b class="basket"  style="color:gray; float:left; cursor:pointer;  font-family: monospace; font-size: 12px;">### �����</b>
		</div>
	</div>
	<div style="float: left; background-color: white; width: 70%; margin-left: 15%; margin-top: 12%; margin-bottom: 1%;">
		<b style="font-size: 25px;">��ٱ���</b>
	</div>
	
	<div style="float: left; width: 70%; margin-left: 15%; background-color: white; border-top: 1px solid gray; border-bottom: 1px solid #99B0B0; ">
		<div style="width:100%; color:#99B0B0; float: left; background-color: #F6F6F6; font-size: 14px; padding-bottom:1.5% ; padding-top:1.5% ;">
			<b style="float: left; margin-left:2%;">����</b>
			<b style="float: left; margin-left:2%;">��ǰ����</b>
			<b style="float: left; margin-left:60% ;">�ǸŰ�</b>
			<b style="float: left; margin-left:5% ;">����</b>
			<b style="float: left; margin-left:9% ;">�հ�</b>
		</div>
		
	  <div id="catelist"> <!-- ��ٱ��� ��ǰ ����Ʈ -->	
	  </div>
		
	</div>
	
	<div style="float: left; width: 70%; margin-left: 15%; margin-top:2.5%; margin-bottom:2.5%; background-color:white ; border-bottom: 1px solid #99B0B0;">

		<b id="totalprice" style="color:gray; font-size:25px; margin-right:1%; float: right; margin-top: -10px;">0��</b>
		<b style="float: right; margin-right: 3%; font-size: 13px; padding-bottom: 3%;">��ǰ�հ�ݾ�(��ۺ� ����)</b>
		    
    </div>
	
    <div style="float: left;width: 70%; margin-left: 15%; margin-top:2.5%; margin-bottom:2.5%; background-color: white;">
		    <input id="deletebt" type="button" value="���û���" style="cursor:pointer ; float:left;margin-left:17%; border:1px solid gray; width: 15%; background-color: white; color: gray; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		    <input id="" type="button" value="����" style="cursor:pointer ; float:left;margin-left:3%; border:1px solid gray; width: 15%; background-color: white; color: gray; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		    <input id="backbt" type="button" value="���� ����ϱ�" style="cursor:pointer ; float:left;margin-left:3%; border:1px solid gray; width: 15%; background-color: black; color: white; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
		    <input id="orderbt" type="button" value="���� �ֹ��ϱ�" style="cursor:pointer ; float:left;margin-left:3%; border:1px solid gray; width: 15%; background-color: black; color: white; font-weight: bold; padding-top:15px ;padding-bottom:15px ; font-size: 14px;">
    </div>
	

</body>
</html>