<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���߷� ��ȸ</title>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	   var countDown=null;//ī��Ʈ �ٿ�
	   
	   
	   function actionCountDown(){
		   var count=$("#timer").html();
		  
			  countDown=setInterval(function(){
				  temp=""+count+"";
				  $("#timer").html(temp);
				  count--;
				  
				  var stop=$("#timer").html();
				  if(stop==0){
					  clearInterval(countDown);
					  alert("�Է� �ð� �ʰ�");
					  $("#timer").html(60);//Ÿ�̸� �ʱ�ȭ 
					  $("div#payment").hide();//����â �����	
					  $("div#paymentInerTwo").hide(); //�޴�������â
					  $("div#message").hide();//���ڸ޼��� ������
									  
					  $("#phonTwo").val("");//��ȣ �ʱ�ȭ
					  $("#phonThree").val("");//��ȣ �ʱ�ȭ
					  
					  $("#rn1").val("");//�ֹ� �ʱ�ȭ
					  $("#rn2").val("");//�ֹ� �ʱ�ȭ
					  
					  $("input[name='ra']:checked").removeAttr("checked");//��Ż� üũ �ʱ�ȭ
					  $("input[type=checkbox]#agree").removeAttr("checked");//��� ���� üũ �ʱ�ȭ
					  				  
				  } 
							    
			  },1000);
			  
			  }
	   
   $(function() {
	   var change=0;//������ ȭ�� �����ֱ� ���� ���� 0�̸� �����ְ� 1�̸� �����.	
	
	   
	    
       $("div#payment").hide();	//����â 
			
	   $("div#paymentInerTwo").hide(); //�޴�������â
		  
	   $("div#message").hide();//���� �޼��� �����
		  
	   $("div#iphon").hide();//������ �����
	   
	   $("#couponWindow").hide();//�������� â �����
	   
	   
      $('#categoryButton,#cateShow').mouseenter(function() {
         $('#cateShow').css("display", "block");
      });
      $('#categoryButton,#cateShow').mouseleave(function() {
         $('#cateShow').css("display", "none");
      });
   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////�������� â ���� 
   
   	  $("#couponBt").click(function(){//�������� ��ư
   		$("#couponWindow").show(100);
   		couponSelect();
   	  });
   		
   	  $("#couponCancel").click(function(){//���� ���
   		$("#couponWindow").hide();
   	  });
   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////����	 Ȯ�� ��ư 
   
   	  $("#couponOk").click(function(){//��ǰ �� �ݾ׿� ������ �����ؼ� �ٿ��ֱ�
   		  $("#couponWindow").hide();
   	      var totalPrice=$("#totalPrice").html().substr(0,$("#totalPrice").html().length-1);//�� ��Ż ����  	 	  
   		  $("#couponApplication").val(Math.floor(totalPrice*($("input[type=radio]:checked").val())));//�� ��ǰ �ݾ��� �����ͼ� ���� �ִ� ���̶�� ���ڸ� �߶��ְ� ����%�� �Կ��ش�.
   		  $("font#totalPrice2").html((totalPrice-($("#couponApplication").val())+2500)+"��");
   		  
   		  $("b#paymentTotalPrice").html((totalPrice-($("#couponApplication").val())+2500)+"��");
   	  });
      
   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////��������
   	
   		
      $("#pageback").click(function(){
    	  var page=${page};//�������� �������� page��ȣ�� ��ٱ��Ϸ� ���� ��ǰ���������� ���� ���Ѵ�.
    	  
    	  if(page=='1'){//page=1�� ��ǰ ��������
    	  $("#frm").submit();
    	  }else{//page=2�� ��ٱ��� ������
    		  var frm2=$("#frm").attr("action","/web/basketPageBack.do");
    		  frm2.submit();
    	  }
      });
      
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////����â
		
  	
	   $("input[type=button]#orderButton").click(function(){//�ֹ��ϱ� ��ư
		  
		  $("div#payment").show(100);	
		  $("div#paymentIner").show(100);
	  });
	  
	   $("input[type=button]#cancel").click(function(){//��� ��ư
		 $("div#payment").hide(); 
	  
		 $("#phonTwo").val("");//��ȣ �ʱ�ȭ
		 $("#phonThree").val("");//��ȣ �ʱ�ȭ
		 
		 $("#rn1").val("");//�ֹ� �ʱ�ȭ
		 $("#rn2").val("");//�ֹ� �ʱ�ȭ
		 
		 $("input[name='ra']:checked").removeAttr("checked");//��Ż� üũ �ʱ�ȭ
		 $("input[type=checkbox]#agree").removeAttr("checked");//��� ���� üũ �ʱ�ȭ
		 
		 $("#timer").html(60);//�ݱ� ������ Ÿ�̸� �ʱ�ȭ
			 
	  });  
	 
	  $("input[type=button]#paybt").click(function(){//���� ��ư
		  
		 if((!$("#phonTwo").val()=="")&&(!$("#phonThree").val()=="")&&($("#phonTwo").val().length==4)&&($("#phonThree").val().length==4)
				&&(!$("#rn1").val()=="")&&(!$("#rn2").val()=="")&&($("#rn1").val().length==6)&&($("#rn2").val().length==7)
				&&($("input[name='ra']:checked").length>0)){
		//��ȣ�� �Է��ϴ� ���� ������̸� ����, �ι�° ����° ��ȣ�� 4�ڸ��� �ƴϸ� ����, �ֹι�ȣ ����� ����, �ֹ� 6�ڸ� 7�ڸ� �ƴϸ� ����, ��Ż� üũ���ϸ� ���� 
		
			if($("input[type=checkbox]#agree:checked").length>0){//��� ���� üũ Ȯ��
		            $("div#paymentIner").hide(); 
		            $("div#paymentInerTwo").show();
		 
		            var phon=$("#phonOne").val()+"-"+$("#phonTwo").val()+"-"+$("#phonThree").val();					 
		            $("#phonCheck").html(phon);//���� ��ư ������ ���� �κп��� ���� ��ȣ�� ���δ�.
		            
		              var randomCode1=Math.floor(Math.random()*10);//������ ������ȣ 
			          var randomCode2=Math.floor(Math.random()*10);//������ ������ȣ
			          var randomCode3=Math.floor(Math.random()*10);//������ ������ȣ
			          var randomCode4=Math.floor(Math.random()*10);//������ ������ȣ
			          var randomCode5=Math.floor(Math.random()*10);//������ ������ȣ
			          var randomCode6=Math.floor(Math.random()*10);//������ ������ȣ
			        
					  var randomCode=('['+randomCode1+''+randomCode2+''+randomCode3+''+randomCode4+''+randomCode5+''+randomCode6+']');
					  var randomCodeOri=(randomCode1+''+randomCode2+''+randomCode3+''+randomCode4+''+randomCode5+''+randomCode6);
			          
					  $("div#message").show(1000);//���� �޼����� �����ش�
			          
					  $("b#code").html(randomCode);//�� ȭ�鿡 ������ȣ �ѷ��ش�.
		              $("b#hicode").html(randomCodeOri);//����ó���� ���� ������ȣ�� �־��ش�.
		              
					  
					  
					  actionCountDown();//ī��Ʈ �����ϱ�
					  		            
			}else{
				alert("�������� ���� �� �̿����� ������ �ּ���.");
			}
		 }else{
			 alert("�޴��� ���������� Ȯ���� �ּ���.");
		 }
	  });
	  
	  $("input[type=button]#exit").click(function(){//�ݱ� ��ư �� Ÿ�̸Ӹ� �ʱ�ȭ �ϱ� ���� clearInterval�� ���ؼ� setInterval�ȿ� �־���Ѵ�.
		  $("div#payment").hide();
		  $("div#paymentInerTwo").hide();
		  
		  $("#phonTwo").val("");//��ȣ �ʱ�ȭ
		  $("#phonThree").val("");//��ȣ �ʱ�ȭ
		  
		  $("#rn1").val("");//�ֹ� �ʱ�ȭ
		  $("#rn2").val("");//�ֹ� �ʱ�ȭ
		  
		  $("input[name='ra']:checked").removeAttr("checked");//��Ż� üũ �ʱ�ȭ
		  $("input[type=checkbox]#agree").removeAttr("checked");//��� ���� üũ �ʱ�ȭ
		  
		  clearInterval(countDown);//���͹� �ʱ�ȭ
		  $("#timer").html(60);//�ݱ� ������ Ÿ�̸� �ʱ�ȭ 
	  });
	  
	  $("#btpayment").click(function(){ //���� Ȯ�� ��ư
			 
		  var numberCheck=$("#verificationnumber").val();//������ȣ ĭ�� �Է��� ����
		  var code=$("#hicode").html();//���ڸ޼����� �� ������ȣ
		  
		  
		  if(numberCheck==code){//������ȣ�� ���� ���ڰ� ������ �Ǻ� ,�����Ϸ� �κ�
			  alert("�����Ϸ�");
			  clearInterval(countDown);//���͹� �ʱ�ȭ	
			  var orderProductNo=$("#basketNo").val();//��ٱ��� ���� �Ѿ�ö� ��ǰ�� no
			  
		      $("#frm").attr("action","/web/productInsert.do");//form action�� ��ǰ �ϳ��� ������ bean��ü�� ����
			  var frm= $("#frm");
			  
			  if(orderProductNo.length>1){
				   
		      window.location.href="/web/productInsert.do?orderProductNo="+orderProductNo+"&ownerno="+1;
			  }else{
				  
				  frm.submit();	
				  $("#frm").attr("action","/web/pageback.do");//�ٽ� �ǵ�����
			  }
		      
		  }else{//�������н�
			  
			  $("#verificationnumber").val('');//�������н� ������ȣ ���°� �ʱ�ȭ
			  $("div#message").hide();//�������н� ���ڸ޼��� ������
			  $("#timer").html(60);//�������н� Ÿ�̸� �ʱ�ȭ
			  clearInterval(countDown);//���͹� �ʱ�ȭ
			  
		  }	  
	  });
	  
	  $("input#numberRe").click(function(){//������ ��ư
		  clearInterval(countDown);//���͹� �ʱ�ȭ
		  
		  var randomCode11=Math.floor(Math.random()*10);//������ ������ȣ 
          var randomCode22=Math.floor(Math.random()*10);//������ ������ȣ
          var randomCode33=Math.floor(Math.random()*10);//������ ������ȣ
          var randomCode44=Math.floor(Math.random()*10);//������ ������ȣ
          var randomCode55=Math.floor(Math.random()*10);//������ ������ȣ
          var randomCode66=Math.floor(Math.random()*10);//������ ������ȣ
        
		  var randomCode=('['+randomCode11+''+randomCode22+''+randomCode33+''+randomCode44+''+randomCode55+''+randomCode66+']');
		  var randomCodeOri=(randomCode11+''+randomCode22+''+randomCode33+''+randomCode44+''+randomCode55+''+randomCode66);
		  
		  $("b#code").html(randomCode);//�� ȭ�鿡 ������ȣ �ٽ� �ѷ��ش�.
          $("b#hicode").html(randomCodeOri);//����ó���� ���� ������ȣ�� �ٽ� �־��ش�.
		  $("#timer").html(60);// Ÿ�̸� �ʱ�ȭ
		  actionCountDown();//ī��Ʈ �ٽ� ����
		  
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         
   });   
   
   var orderlistToBasket=function(){//��ٱ��� ���������� ����no�� ����� ajax�� �ѷ��ش�.
	   
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
				var totalProduct=0;//��ǰ �� ��
				$.each(v,function(index,dom){
					totalPrice+=(dom.productprice*dom.productquantity);//��ǰ�� �� ����
					totalProduct+=1;//��ǰ �� ��
					
					temp+="<div style=\"float: left; background-color: white; width: 100%; padding-bottom: 3%;\">";     
					temp+="<div style=\"float: left; background-color: white; width: 100%;\">";
					temp+="<div style=\" width:62%; height: 100px; float: left;\">";
					temp+="<img alt=\"��ǰ�̹���\" src=\"/web/store/processedFood/"+dom.productimage+"\" width=\"100px\" height=\"100px\"  style=\" float: left;\">";
					temp+="<b id=\"productName\" style=\"background-color:white; float: left;margin-top:3%; margin-left: 5%; width: 70%; height: 35%;\">"+dom.productname+"</b>";
					temp+="</div>";
					temp+="<div style=\"background-color:white ; width:15.5%; height: 100px; float: left;\">";
					temp+="<b style=\"margin-top:12%; float: left;\">"+dom.productprice+"��</b>";
					temp+="</div>";
					temp+="<div style=\"background-color:white ; width:10%; height: 100px; float: left;\">";
					temp+="<b style=\"margin-top:20%; float: left;\">"+dom.productquantity+"��</b>";
					temp+="</div>";
					temp+="<div style=\"background-color:white ; width:11.9%; height: 100px; float: left;\">";
					temp+="<b style=\"float:right; margin-top:17%;\">"+dom.productprice*dom.productquantity+"��</b>";
					temp+="</div>";
					temp+="</div>";			         
					temp+="</div>";
								
				});
				
				$("div#list").html(temp);
				$("b#totalPrice").html(totalPrice+'��');
				$("font#totalPrice").html(totalPrice+'��');				
				$("font#totalPrice2").html(totalPrice+2500+'��');
				
				$("b#paymentTotalPrice").html(totalPrice+2500+'��');//����â ���� �ѱݾ�
				if(totalProduct>1){
					$("b#paymentTotalProduct").html($("#productName").html()+'(��+'+totalProduct+')');//����â ���� �� ��ǰ�̸�
				}else{
					$("b#paymentTotalProduct").html($("#productName").html());//����â ���� �� ��ǰ�̸�
				}
				
			},
			error:function(request,status){
				alert("code="+request.status);
			}
			
		 }); //ajax
		 
   		}//if
   }
   
   var couponSelect=function(){//ó�� ���� ����� �ѷ���
		
	   $.ajax({
		  
		   url:'/web/couponSelect.do',
		   dataType:'json',
		   type:'post',
		   success:function(v){
			   var coupontemp='';//���� ����Ʈ �����
			   var couponPageTemp='';//�� ������ �� �����
			   
			   for(var i=1;i<=v.totalpage;i++){//hashmap���� ������ ��Ż ������ �̾��ֱ�
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
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:9%;\">����</b>";
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
   
  
   
    function couponPaging(currentpage){//���� ����¡ ���ִ� �κ�	
    	
	   $.ajax({
		  url:'/web/couponSelect.do',
		  type:'post',
		  dataType:'json',
		  data:'currentpage='+currentpage,
		  success:function(v){
			   var coupontemp='';//���� ����Ʈ �����
			   var couponPageTemp='';//�� ������ �� �����
			   
			   for(var i=1;i<=v.totalpage;i++){//hashmap���� ������ ��Ż ������ �̾��ֱ�
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
					   coupontemp+="<b style=\"font-size: 12px; float: left; margin-left:9%;\">����</b>";
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
<input id="basketNo" type="hidden" value="${tempId}"> <!-- ��ٱ��� ������ ���� ������ ��ǰ���� no�� ���ļ� �����ͼ� ���⿡ ��Ƶд�.-->
<%-- <input id="supportPrice" type="hidden" value="${supportPrice}"> --%>

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
   
   
   <div
      style="float: left; background-color: white; width: 70%; margin-left: 15%; margin-top: 7%; margin-bottom: 1%;">
      <b style="font-size: 20px;">�ֹ��ϱ�</b>
   </div>
   <div style="float: left; width: 70%; margin-left: 15%; background-color: white; border-top: 1px solid gray; border-bottom: 1px solid #99B0B0;">
      <div style="width: 100%; color: #99B0B0; float: left; background-color: #F6F6F6; font-size: 14px; padding-bottom: 1.5%; padding-top: 1.5%;">
          <b
            style="float: left; margin-left: 2%;">��ǰ����</b> <b
            style="float: left; margin-left: 55%;">�ǸŰ�</b> <b
            style="float: left; margin-left: 10%;">����</b> <b
            style="float: left; margin-left: 14%;">�հ�</b>
      </div>
      
      <form id="frm" method="post" action="/web/pageback.do">
      <input type="hidden" name="productcode" value="${bmbean.productcode}">
      <input type="hidden" name="ownerno" value="${bmbean.ownerno}">
      <div style="float: left; background-color: white; width: 100%; padding-bottom: 3%; "><!--�ֹ���� ���� ���߱� ���� ���� ������ 3%�� ��Ƶ�  -->
      </div>	
      	 
      <div id="list">	
         <div style="float: left; background-color: white; width: 100%; padding-bottom: 3%; ">     
             <div style="float: left; background-color: white; width: 100%;">
			    <div style=" width:62%; height: 100px; float: left;">
					 <img alt="��ǰ�̹���" src="/web/store/processedFood/${bmbean.productimage}" width="100px" height="100px"  style=" float: left;">
					 <b style="background-color:white; float: left;margin-top:3%; margin-left: 5%; width: 70%; height: 35%;">${bmbean.productname}</b>
					  <input type="hidden" name="productname" value="${bmbean.productname}">
				</div>
			    <div style="background-color:white ; width:15.5%; height: 100px; float: left;">
					 <b style="margin-top:12%; float: left;">${bmbean.productprice}��</b>
					 <input type="hidden" name="productprice" value="${bmbean.productprice*bmbean.productquantity}">
				</div>
				<div style="background-color:white ; width:10%; height: 100px; float: left;">
					<b style="margin-top:20%; float: left;">${bmbean.productquantity}��</b>
					<input type="hidden" name="productquantity" value="${bmbean.productquantity}">
			    </div>
				<div style="background-color:white ; width:11.9%; height: 100px; float: left;">
					<b style="float:right; margin-top:17%;">${bmbean.productprice*bmbean.productquantity}��</b>	
				</div>
		     </div>				         
          </div>        
      </div> 
          
      </form>
      
      <div style="float: left; width: 100%; text-align: right; padding-bottom: 3%; padding-top: 3%; margin-right: 3%; border-top: 1px solid gray;">
         <b>��ǰ�հ�ݾ� (��ۺ� ����)</b><br> 
         <b id="totalPrice" style="font-size: x-large; color: rgb(70, 205, 223);">${bmbean.productprice*bmbean.productquantity}��</b>
      </div>
   </div>
   <div
      style="float: left; background-color: white; width: 70%; margin-left: 15%; margin-top: 3%; margin-bottom: 1%;">
      <b style="font-size: 20px;">�ֹ��� �ۼ�</b>
   </div>
   <div
      style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
      <div>
         <b style="font-size: 15px;">�ֹ��� ����</b>
      </div>
      <div
         style="float: left; background-color: white; width: 100%; padding-top: 2%">
         <table style="width: 100%;">
            <tbody>
               <tr>
                  <td style="font-size: 13px; color: gray; width: 25%;"><b>�ֹ��Ͻô�
                        �� :</b></td>
                  <td><input type="text" style="height: 30px;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>�ּ�
                        :</b></td>
                  <td></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>�ֹ���
                        �ڵ��� :</b></td>
                  <td><input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"> - <input
                     type="text" style="width: 60px; height: 30px; margin-top: 2%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>�ֹ���
                        ��ȭ :</b></td>
                  <td><input type="text"
                     style="width: 60px; height: 30px; margin-top: 1.5%;"> - <input
                     type="text" style="width: 60px; height: 30px; margin-top: 1.5%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 1.5%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>�̸���
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
         <b style="font-size: 15px;">��� ����</b>
      </div>
      <div
         style="float: left; background-color: white; width: 100%; padding-top: 2%">
         <table style="width: 100%;">
            <tbody>
               <tr>
                  <td style="font-size: 13px; color: gray; width: 15%;"><b>�����
                        Ȯ�� :</b></td>
                  <td><input type="checkbox"><font
                     style="font-size: 13px;">�ֹ��� ������ �����մϴ�</font></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 20%; padding-top: 2%;"><b>�����Ǻ�
                        :</b></td>
                  <td><input type="text" style="height: 30px; margin-top: 2%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 15%; padding-top: 2%;"><b>������
                        �� :</b></td>
                  <td><input type="text"
                     style="width: 70px; height: 30px; margin-top: 2%;"> ( <input
                     type="text" style="width: 60px; height: 30px; margin-top: 2%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"> ) <input
                     type="button"
                     style="font-size: 13px; background-color: white; border-color: gray; width: 130px; height: 35px; color: gray;"
                     value="�����ȣ �˻�"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 15%; padding-top: 2%;"><b>�ڵ���
                        ��ȣ :</b></td>
                  <td><input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"> - <input
                     type="text" style="width: 60px; height: 30px; margin-top: 2%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 15%; padding-top: 2.5%;"><b>��ȭ��ȣ
                        :</b></td>
                  <td><input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"> - <input
                     type="text" style="width: 60px; height: 30px; margin-top: 2%;">
                     - <input type="text"
                     style="width: 60px; height: 30px; margin-top: 2%;"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; width: 25%; padding-top: 2%;"><b>�����
                        ���� :</b></td>
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
         <b style="font-size: 15px;">�����ݾ�</b>
      </div>
      <div
         style="float: left; background-color: white; width: 100%; padding-top: 2%">
         <table style="width: 100%;">
            <tbody>
               <tr>
                  <td style="font-size: 13px; color: gray; width: 25%;"><b>��ǰ�հ�ݾ�
                        :</b></td>
                  <td><font id="totalPrice" style="font-size: 13px;">${bmbean.productprice*bmbean.productquantity}��</font></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>��ۺ�
                        :</b></td>
                  <td style="padding-top: 2%"><font style="font-size: 13px;">+2,500��</font></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>����
                        ���� :</b></td>
                  <td><font style="font-size: 13px;">���� </font><input id="couponApplication"
                     type="text"
                     style="text-align: right; width: 100px; height: 30px; margin-top: 2%;"
                     placeholder="0"><font style="font-size: 13px;">�� </font><input id="couponBt"
                     type="button"
                     style="cursor:pointer ; font-size: 13px; background-color: white; border-color: gray; width: 130px; height: 35px; color: gray;"
                     value="������ȸ �� ����"></td>
               </tr>
               <tr>
                  <td
                     style="font-size: 13px; color: gray; padding-top: 2%; width: 25%;"><b>��
                        �����ݾ� :</b></td>
                  <td style="padding-top: 2%"><font id="totalPrice2" style="font-size: 30px; font-weight: bold; color: rgb(70, 205, 223);">${bmbean.productprice*bmbean.productquantity+2500}��</font></td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <div
      style="float: left; width: 66%; margin-left: 15%; margin-top: 0%; margin-bottom: 2%; border: 1px solid gray; padding: 2%">
      <div>
         <b style="font-size: 15px;">��������</b>
      </div>
      <div
         style="float: left; background-color: white; width: 100%; padding-top: 2%">
         <table style="width: 100%;">
            <tbody>
               <tr>
                  <td style="font-size: 13px; color: gray; width: 25%;"><b>�Ϲݰ���
                        :</b></td>
                  <td><input type="radio"><font
                     style="font-size: 13px;">�ſ�ī��</font><input type="radio"><font
                     style="font-size: 13px;">�ڵ���</font></td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <div
      style="float: left; width: 70%; margin-left: 15%; margin-top: 2.5%; margin-bottom: 2.5%; background-color: white;">
      <input id="pageback" type="button" value="��������"
         style="cursor:pointer; float: left; margin-left: 33%; border: 1px solid gray; width: 15%; background-color: white; color: gray; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
      <input id="orderButton" type="button" value="�����ϱ�"
         style="cursor:pointer; float: left; margin-left: 3%; border: 1px solid gray; width: 15%; background-color: black; color: white; font-weight: bold; padding-top: 15px; padding-bottom: 15px; font-size: 14px;">
   </div>
   

<div id="payment" style="position:absolute; position:fixed ; top:6%; left:35%; background-color: #F8F8F8; width:400px; height:600px; border: 1px solid gray;">
	<div style="margin-top: 3%; margin-left: 4%;">
	<img alt="" src="/web/store/�ٷΰ���.png" width="40%" height="20%">
    </div>
	<div id="paymentIner" style="background-color: white; width: 94%; height: 88%; margin-top: 1%; margin-left: 3%; border: 1px solid gray;">
	   <div style="margin-top: 5%;">
	   <b style="font-size: 12px; margin-left: 3%;">���������� Ȯ���� �ּ���</b>
	   </div>
	   <div style="background-color: #F8F8F8; width: 95%; height:11%; margin-top: 1%; margin-left: 2%; border: 1px solid gray;">
	   		<div style="background-color: #F8F8F8; margin-left:5%; margin-top: 2%; float: left; width: 80%;">
	   			<b style="float: left; font-size: 11.5px;">��   ��ǰ��</b>
	   			<b id="paymentTotalProduct" style="float:right ; font-size: 11.5px;">${bmbean.productname}</b>
	   		</div>
	   		<div  style="background-color: #F8F8F8; margin-left:5%; margin-top: 2%; float: left; width: 80%;">
	   			<b style="float: left; font-size: 11.5px;">��   �����ݾ�</b>
	   			<b id="paymentTotalPrice" style="float: right; font-size: 11.5px;">${bmbean.productprice*bmbean.productquantity+2500}��</b>
	   		</div>   				   		
	   </div>
	    <div style="margin-top: 1%;">
	    <b style="font-size: 12px; margin-left: 3%;">�޴��� ���������� �Է��� �ּ���</b>
	    </div>
	   <div style="background-color: #F8F8F8; width: 95%; height:22%; margin-top: 1%; margin-left: 2%; border: 1px solid gray;">
	   		<div style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 100%;">
	   			<b style="font-size: 12px; margin-left:5%;">��   �޴�����ȣ</b>
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
	   			<b style="font-size: 12px;  margin-left:5%;">��   �ֹι�ȣ</b>
	   			<div style="float: right; margin-right: 9%;">
	   			<input id="rn1" type="text" style="width: 80px;">
	   			<b>-</b>
	   			<input id="rn2" type="text" style="width: 80px;">
	   			</div>
	   		</div>  
	   		<div  style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 100%;">
	   			<b style="float: left; font-size: 12px;  margin-left:5%;">��   �̵���Ż�</b>
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
	   			<b style="float: left; font-size: 12px;  margin-left:5%;">��   �������</b>
	   			<b style="font-size: 12px; float: right; margin-right: 7%;">�޴��� ���ڸ޼����� ���ι�ȣ ����</b>
	   		</div> 				   		
	   </div>
	    <div style="margin-top: 1%; margin-left: 3%;">
	    <b style="font-size: 12px; ">�������� ���� �� �̿����� ������ �ּ���</b>
	    </div>
	   <div style="background-color: #F8F8F8; width: 95%; height:12%; margin-top: 1%; margin-left: 2%; border: 1px solid gray;">
	   		<div style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 90%; margin-left:2%;">
	   			<input type="checkbox" id="agree">
	   			<b style="font-size: 12px;">���������ü �̿����� �����մϴ�.</b>
	   			<input type="button" value="�ڼ�������">
	   		</div>
	   		<div  style="background-color: #F8F8F8; margin-top: 2%; float: left; width: 90%; margin-left:5%;">
	   			<b style="font-size: 12px;">��   �Է��Ͻ� ������ ���������ü�� �����˴ϴ�.</b>
	   			
	   		</div>   				   		
	   </div>
	   
	   <div style="background-color: white; width: 95%; height:24%; margin-top: 2%; margin-left: 2%; border-bottom: 1px solid gray;">
	   		<b style="background-color: gray; color: white; font-size: 12px; padding: 1px 5px 1px 5px;">�ȳ�</b><br>
	   		<b style="font-size: 11px;">'�� 19�� �̸� �̼����� ����/���� ����/��ݹ̳� �޴����� ������ ���� �ʽ��ϴ�.</b><br>
	   		<b style="font-size: 11px;">'Ÿ���� �޴���/���������� ������� �̿��ϸ� ������ ó���� ���� �� �ֽ��ϴ�.</b>
	   		
	   </div>
	   
	   <div style="margin-left: 38%; margin-top: 4%;">
	   	  <input id="paybt" type="button" value="����" style="font-weight: bold;">
	   	  <input id="cancel" type="button" value="���" style="font-weight: bold;">
	   </div>
	   
	</div>
</div>

<div id="paymentInerTwo" style="background-color: white; border: 1px solid gray; width: 374px; height: 526px;position:absolute; position:fixed; left: 35.8%; top: 12%;">
	<div style="margin-left:5%; margin-top:3%; width: 90%; height: 7%; float: left; border-bottom: 1px solid black;">	
		<b>�޴��� ��������</b>	
	</div>
	
	<div style="margin-left:5%; margin-top:3%; width: 90%; height: 18%; float: left; border-bottom: 1px solid black;">
		<div style="margin-left: 3%; width: 96%;">	
		<b style="font-size: 12px;">�� ������ ���������� �׻� ��ȣȭ�Ǿ� ó���ǰ�, �����������θ� ����Ͽ�, �������� �ʽ��ϴ�.</b>
		</div>
		<div style="margin-top: 3%;">
		<b style="font-size: 12px; color: red; border-bottom: 1px solid red; margin-left: 8%;">���� ��û�Ͻ� �޴��� ��ȣ</b>
		<b id="phonCheck" style="font-size: 14px; margin-left: 5%;"></b>
		</div>	
	</div>
	
	<div style="margin-left:5%; margin-top:3%; width: 90%; height: 30%; float: left; border: 1px solid gray; border-radius: 5px 5px 5px 5px;">	
		<div style="margin-top: 1%; margin-left: 2%; width: 97%;">
			<b style="font-size: 12px; color: gray;">�� �޴����� ���ڸ޼����� ���۵� ������ȣ 6�ڸ��� �Է��Ͻ� �� Ȯ�� ��ư�� �����ּ���.</b>
		</div>
		<div style="margin-left: 20%; margin-top: 3%;">
			<b style="font-size: 12px; ">������ȣ</b>
			<input id="verificationnumber" type="text" style="width: 90px; ">
			<input id="numberRe" type="button" value="������" style="height: 22px; font-size: 12px; font-weight: bold;">
		</div>
		<div style="margin-left: 25%; margin-top: 2%;">
			<b style="font-size: 11px; ">(�����ð�</b>
			<b id="timer" style="font-size: 11px;  color: red;">60</b>
			<b style="font-size: 11px;  color: red;">��</b>
			<b style="font-size: 11px; ">)</b>
			
			<input type="button" value="�ð�����" style="height: 18px;  margin-left: 3%; background-color: red; color: white; font-size: 10px;">
		</div>
		<div style="margin-left: 38%; margin-top: 4%;">
			<input type="button" id="btpayment" value="Ȯ��" style="font-weight: bold; width: 80px; float: left;">
		</div>
		
	</div>
	
	<div style="margin-left:5%; margin-top:3%; width: 90%; height: 25%; float: left;">	
		<b style="font-size: 11px; color: gray;">�ؽ��ι�ȣ�� �������� ���� ���</b>	
		  <div style=" width: 98%; margin-left: 2%;">
		    <b style="font-size: 11px; color: gray;">1.���ڸ޼��� ���Ű��� ���� Ȯ��</b><br>	
		    <b style="font-size: 11px; color: gray;">2.��Ż� ��ȣ 114(�� 018,014)�� ��ȭ�� �� �� ��ȣ���� �鸮�� �ٷ� �����ϴ�.</b><br>	
		    <b style="font-size: 11px; color: gray;">3.������ Ȯ�� �Ŀ��� �������� �ʴ� ��� ������(1588-1234)�� �����Ͻø� ģ���� �ȳ��� �帳�ϴ�.</b>
		  </div>	
	</div>
	
	<div style="margin-left:40%; margin-top:3%; float: left;">
		<input id="exit" type="button" value="�ݱ�" style="font-weight: bold; width: 80px;">
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

<div id="couponWindow" style="width: 500px; height: 500px; position: absolute; position: fixed; background-color: white; border:1px solid skyblue ; top:5% ; left:35% ;">
  <div style="margin-left: 3%; width:94%; height: 85%;">
  	<img alt="" src="/web/store/���߷� ��ȸ.png" width="90px" height="40px" style="margin-top: 3%;">	
	<div style="background-color: white; border: 1px solid skyblue; width: 100%; height: 100%;">
	   <div style="width:94%; margin-left: 2.5%; margin-top: 5%; float: left;">
	   		<div style="width: 100%; border-top: 1px solid skyblue; border-bottom: 1px solid skyblue; background-color: rgb(240, 240, 240); height:40px;">
	   		   <div style="margin-top: 2.5%; ">
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:3%;">����</b>
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:11%;">����</b>
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:25%;">������</b>
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:20%;">���</b>
	   		   		<b style="color: gray; font-size: 12px; float: left; margin-left:5%;">������</b>   
	   		   </div>
	   		 </div>
	   		   
	   		 <div id="couponList"><!--���� ����Ʈ ajax�� �ѷ��ִ°� -->  		 
	   		<!--  <div style="border-bottom: 1px solid skyblue; height:32px;">
	   		    <div style="margin-top: 2.5%; ">
	   		   		<input name="couponRadio" type="radio" style="float: left; margin-left: 4%;">
	   		   		<b style="font-size: 12px; float: left; margin-left:13%;">�����̸�</b>
	   		   		<b style="font-size: 12px; float: left; margin-left:10%;">2019-5-13</b>
	   		   		<b style="font-size: 12px; float: left; margin-left:12%;">����</b>
	   		   		<b style="font-size: 12px; float: left; margin-left:16%;">0.01%</b>
	   		    </div>		 
	   		 </div> -->	   		 
	   		 </div> 
	   		  		   	   		
	   </div>
	   <div id="couponPaging" style="float: left; width: 35%; margin-left: 31%; text-align: center;"><!--text-align: center; ���� �ڽĵ��� text���� ��� ���ĵȴ�. --><!--����¡ ajax �ѷ��ִ°�-->
	   		<!-- <b style="font-size:14px ; color:skyblue ; cursor: pointer; margin-left:15px;">1</b> -->
	   </div>
	   <div style="float: left; margin-left: 37%; margin-top: 1%;">
	   	   <input id="couponOk" type="button" value="Ȯ��" style="cursor:pointer ; width:60px ; height:30px ; border-radius: 10px 10px 10px 10px; background-color: rgb(240,240,240); font-weight: bold;">
	   	   <input id="couponCancel" type="button" value="���" style="cursor:pointer ; width:60px ; height:30px ; border-radius: 10px 10px 10px 10px; background-color: rgb(240,240,240); font-weight: bold;">
	   </div>
	   <div style="float: left; margin-top: 14%; margin-reft:10px; width: 94%; margin-left: 1%; position: fixed;">
	   		<b style="font-size: 12px; color: skyblue;">* �Ʒ��� ���� ���� �������� ���� ��� ���� ������ �̻�� ���·� �����Ͽ�</b><br>
	   		<b style="font-size: 12px; color: skyblue;">�����Ͻ� �� �ֽ��ϴ�.</b><br>
            <b style="font-size: 12px; color: skyblue;">1) ������ ����Ǵ� �������� ���� ����� ���</b><br>
			<b style="font-size: 12px; color: skyblue;">2) ���ͳ� ȯ�� ���� �ý��� ������ ���Ͽ� ������ �Ϸ���� ���� ���</b><br>
			<b style="font-size: 12px; color: skyblue;">3) �ſ�ī�� ���� ���� ������ ������ ������ ���</b><br>
			<b style="font-size: 12px; color: skyblue;">�� ��ġ : ���������� > �ֹ�����/�����ȸ > �����õ�(�Ǵ� ��������) �ֹ� ></b><br> 
			<b style="font-size: 12px; color: skyblue;">�󼼺��� > ����������</b>	   		
	   </div>
	</div>
  </div>
</div>


</body>
</html>