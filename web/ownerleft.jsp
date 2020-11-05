<%@page import="jargo.vo.StoreVO"%>
<%@page import="jargo.vo.OwnerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	OwnerVO owner = (OwnerVO)session.getAttribute("loginuser1");
%>

<script type="text/javascript">

	function clist(){

		$.ajax({
			url:"clist.jargo",
			dataType:"json",
			success: function(data){
				$("#tablebody").empty();
				$.each(data, function(index, item){					
					$("#tablebody").append("<tr>");
					$("#tablebody").append("<td>" + item.customer_id + "</td>");
					$("#tablebody").append("<td>" + item.customer_name + "</td>");
					$("#tablebody").append("<td>" + item.customer_phone + "</td>");
					$("#tablebody").append("<td>" + item.customer_addr + "</td>");
					$("#tablebody").append("<td>" + item.customer_email + "</td>");
					$("#tablebody").append("<td>" + item.customer_favor + "</td>");			
					$("#tablebody").append("</tr>");
				});
			},
			error : function(){
				alert("error");
			}
		});
	}
	function mystore(owner_id){
		$.ajax({
			url:"storebyowner.jargo?owner_id="+owner_id,
			dataType:"json",
			success:function(data){
				$("#table_detailbody").empty();
				$("#table_detailbody").append("<tr><td rowspan='6'><img id='store_image' src='images/store/"+data.store_img+"' align='left' width='500px' height='350px'></td><td class='store_detail_head'>Store Number</td><td class='store_detail_content'>"+data.store_number+"</td></tr>");
				$("#table_detailbody").append("<tr><td class='store_detail_head'>Store Name</td><td class='store_detail_content'>"+data.store_name+"</td></tr>");
				$("#table_detailbody").append("<tr><td class='store_detail_head'>Store Phone</td><td class='store_detail_content'>"+data.store_phone+"</td></tr>");
				$("#table_detailbody").append("<tr><td class='store_detail_head'>Store Address</td><td class='store_detail_content'>"+data.store_addr+"</td></tr>");
				$("#table_detailbody").append("<tr><td class='store_detail_head'>Store Subway</td><td class='store_detail_content'>"+data.store_subway+"</td></tr>");
				$("#table_detailbody").append("<tr><td class='store_detail_head'>Master Number</td><td class='store_detail_content'>"+data.master_number+"</td></tr>");

				$("#store_description").empty();
				$("#store_description").append(data.store_desc);
			},
			error : function(){
				alert("error");
			}
			
		});
	}
	
	function coupon(owner_id){
		$.ajax({
			url:"storebyowner.jargo?owner_id="+owner_id,
			dataType:"json",
			success:function(data){				
				$.ajax({
					url:"couponbystore.jargo?store_number="+data.store_number,
					dataType:"json",
					success:function(data1){
						$("#table_couponlist").empty();
						$.each(data1, function(index, item){					
							$("#table_couponlist").append("<tr>");
							$("#table_couponlist").append("<td><img id='coupon_image' src='images/coupon/" + item.coupon_img + "' align='left' width='150px' height='100px'></td>");
							$("#table_couponlist").append("<td>" + item.coupon_number + "</td>");
							$("#table_couponlist").append("<td>" + item.coupon_id + "</td>");
							$("#table_couponlist").append("<td>" + item.coupon_expired + "</td>");
							$("#table_couponlist").append("<td>" + item.coupon_usable + "</td>");
							$("#table_couponlist").append("<td>" + item.store_number + "</td>");
							$("#table_couponlist").append("<td><a href='#' class='cbtn' onclick='deletecoupon("+item.coupon_number+","+item.store_number+")'>DELETE</a></td>");
							$("#table_couponlist").append("</tr>");
						});
					},
					error:function(){
						alert("error2");
					}
				});
			},
			error : function(){
				alert("error");
			}
		});
		createcoupon('<%=owner.getOwner_id() %>');
	}
	
	function deletecoupon(coupon_number,store_number){
		/* alert("coupon number : "+coupon_number+"   store number : "+store_number); */
		alert("Delete this coupon!");
		$.ajax({
			url:"coupondeleteimpl.jargo?coupon_number="+coupon_number,
			dataType:"json",
			success:function(data){
				alert("Deleted");
				
				$.ajax({
					url:"couponbystore.jargo?store_number="+store_number,
					dataType:"json",
					success:function(data1){
						$("#table_couponlist").empty();
						$.each(data1, function(index, item){					
							$("#table_couponlist").append("<tr>");
							$("#table_couponlist").append("<td><img id='coupon_image' src='images/coupon/" + item.coupon_img + "' align='left' width='150px' height='100px'></td>");
							$("#table_couponlist").append("<td>" + item.coupon_number + "</td>");
							$("#table_couponlist").append("<td>" + item.coupon_id + "</td>");
							$("#table_couponlist").append("<td>" + item.coupon_expired + "</td>");
							$("#table_couponlist").append("<td>" + item.coupon_usable + "</td>");
							$("#table_couponlist").append("<td>" + item.store_number + "</td>");
							$("#table_couponlist").append("<td><a href='#' class='cbtn' onclick='deletecoupon("+item.coupon_number+","+item.store_number+")'>DELETE</a></td>");
							$("#table_couponlist").append("</tr>");
						});
					},
					error:function(){
						alert("error2");
					}
				});
				
				
			},
			error:function(){
				alert('error');
			}
		});
	}

	

	 function seat_list(owner_id){
		$.ajax({
			url: "seat_list.jargo?owner_id="+owner_id,
			dataType: "json",
			success:function(data){
				$.each(data,function(index, item){
					$("#"+item.seat_location).prop("value" , item.seat_status) ;
				});
			},
			error:function(){
				alert('error');
			}
		});} 
	 
	 
	 
	 
	 

</script>

<!-- tableseat setting 팝업창 script -->
<script type="text/javascript">
	function setseat(el,value,owner_id) {
		 successseat = 0;
		$.ajax({
			url:"storebyowner.jargo?owner_id="+owner_id,
			dataType:"json",
			
			success:function(data){//data : owner에 과한 정보
					
				$.ajax({
					url:"seat_detail.jargo?store_number="+data.store_number+"&seat_location="+value, // data2 : seat에 관한정보
					dataType:"json",
					success:function(data2){
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수
		if (bg) {
	if(data2!=null){
		
$('.layer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다.
$("#seattbody").empty();
$("#seattbody").append("<tr><td colspan='2'>좌석 수정/삭제</td></tr>");
$("#seattbody").append("<tr><td>매장번호</td><td><input id ='store_number' type='text' name='store_number' value='"+data2.store_number+"' style='width: 20%' readonly></td></tr>");
$("#seattbody").append("<tr><td>좌석번호</td><td><input id ='seat_number' type='text' name='seat_number'value='"+data2.seat_number+"' style='width: 20%' readonly></td></tr>");
$("#seattbody").append("<tr><td>좌석위치</td><td><input id='location' type='text' name='seat_location' value='"+data2.seat_location+"' style='width: 20%' readonly></td></tr>");
$("#seattbody").append("<tr><td>테이블인원</td><td><input id='persons' type='number' name='seat_persons' value='"+data2.seat_persons+"' style='width: 20%'></td></tr>");
$("#seattbody").append("<tr><td id='tabletitle'>상태</td><td><input id='status' type='text' name='seat_status' value='"+data2.seat_status+"' style='width: 20%'></td></tr>"); 
$("#seattbody").append("<td>사진첨부</td><td><input type='file' id='file' name='file'></td></tr>");
$("#seattbody").append("</tr><tr><td colspan='2' align='center'><a class='btn-r'> <a href='#' onclick='javascript: seatmodify(this.form)'  class='cbtn'>수정</a></td></tr>");
$("#seattbody").append("</tr><tr><td colspan='2' align='center'><a class='btn-r'> <a href='#' onclick='javascript: seatdelete(this.form)'  class='cbtn'>삭제</a></td></tr>");
	}
	else{
		$('.layer').fadeIn();
		$("#seattbody").empty();
		$("#seattbody").append("<tr><td colspan='2'>좌석 등록</td></tr>");
		$("#seattbody").append("<tr><td>매장번호</td><td><input id ='store_number2' value='"+data.store_number+"' type='text' name='store_number' style='width: 20%' readonly></td></tr>");
		$("#seattbody").append("<tr><td>좌석위치</td><td><input id='location' type='text' value='"+value+"' name='seat_location' style='width: 20%' readonly></td></tr>");
		$("#seattbody").append("<tr><td>테이블인원</td><td><input id='persons' type='number' name='seat_persons' style='width: 20%'></td></tr>");
		$("#seattbody").append("<tr><td id='tabletitle'>상태</td><td><input id='status' type='text' name='seat_status' style='width: 20%'></td></tr><tr>");
		$("#seattbody").append("<td>사진첨부</td><td><input type='file' name='file'></td></tr>");
		$("#seattbody").append("<tr><td colspan='2' align='center'><a class='btn-r'> <a href='#' onclick='javascript: seatregister(this.form)'  class='cbtn'>등록</a></td> </tr>");
				/* $("#store_number").prop("value" , data.stroe_number);
				$("#seat_number").prop("value" , null);
				$("#location").prop("value" , value) ;  //좌석 위치정보를 팝업div로 넘긴다.
				$("#persons").prop("value" , null); 
				$("#status").prop("value" , null);  */
	}
}
		 else {
			temp.fadeIn();
		}
		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height())
			temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
		else	
			temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width())
			temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
		else
			temp.css('left', '0px');
		temp.find('a.cbtn').click(function(e) {
			if (bg) {
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			} else {
				temp.fadeOut();
			}
			e.preventDefault();
		});
		$('.layer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

			}// in
		,
			error : function(){
				alert("error");
			}
		
		});
			}//out
		,error : function(){
				alert("error");
			}
		
		});
	
	}
	function seatregister(s){
		var option = {
				url:"seatregisterimpl.jargo",
			    type : "post",
			    data : $("#seatform").serialize(),
			    success : function(data) {
			    }
			   };
		  $("#seatform").ajaxSubmit(option);
		  alert("등록완료");
		  $.ajax({
				url: "seat_list.jargo?owner_id="+'<%=owner.getOwner_id()%>',
				dataType: "json",
				success:function(data){
					$.each(data,function(index, item){
						$("#"+item.seat_location).prop("value" , item.seat_status) ;
					});
				},
				error:function(){
					alert('error');
				}
			}); 
		  }
		  
	function seatdelete(s){
				var option = {
						url:"seatdelete.jargo",
					    type : "post",
					    data : $("#seatform").serialize(),
					    success : function(data) {
					    }
					   };
				  $("#seatform").ajaxSubmit(option);
				  alert("삭제완료");
									
				  $.ajax({
						url: "seat_list.jargo?owner_id="+'<%=owner.getOwner_id()%>',
						dataType: "json",
						success:function(data){
							for(i=0; i<5; i++){
								for(j=0; j<5; j++){
									$('#'+i+''+j).prop("value", null);
								  }
							  }
							$.each(data,function(index, item){
								$("#"+item.seat_location).prop("value" , item.seat_status) ;
							});
						},
						error:function(){
							alert('error');
						}
					}); 
				  
		  }
	
	function seatmodify(s){
		var option = {
				url:"seatmodify.jargo",
			    type : "post",
			    data : $("#seatform").serialize(),
			    success : function(data) {
			    }
			   };
		  $("#seatform").ajaxSubmit(option);
		  alert("수정완료");
							
		  $.ajax({
				url: "seat_list.jargo?owner_id="+'<%=owner.getOwner_id()%>',
				dataType: "json",
				success:function(data){
					for(i=0; i<5; i++){
						for(j=0; j<5; j++){
							$('#'+i+''+j).prop("value", null);
						  }
					  }
					$.each(data,function(index, item){
						$("#"+item.seat_location).prop("value" , item.seat_status) ;
					});
				},
				error:function(){
					alert('error');
				}
			}); 
		  
  }
		/* $.ajax({			
			url:"seatregisterimpl.jargo",
			dataType:"multipart/form-data",
			type:"POST",	
			data : $("#form").serialize(),
			
			success:function(data){
				alert("등록성공");
				
			},
			error : function(XHR,  textStatus,  errorThrown){
				alert("등록실패");
				alert(errorThrown);
			}
		}); */
		
		
		function reservationlist(owner_id){
			$.ajax({
				url:"storebyowner.jargo?owner_id="+owner_id,
				dataType:"json",
				success:function(data){
					getreservationlist(data.store_number);
				},
				error : function(){
					alert("error");
				}
				
			});
		}
		function getreservationlist(sttt){
		$.ajax({
			url:"getstoreonreserbystore.jargo?store_number="+sttt,
			dataType:"json",
			success:function(data){
				$("#resertablebody").empty();
			$.each(data, function(index, item){
				mytime="";
				$.ajax({
					url:"reservationlist.jargo?reservation_number="+item.reservation_number,
					dataType:"json",
					success:function(store){
						$("#resertablebody").append("<tr>");
						$("#resertablebody").append("<td>" + store.customer_name + "</td>");
						$("#resertablebody").append("<td>" + store.customer_phone + "</td>");			
						if(store.reservation_time==1){
							mytime="8:00 ~ 10:00";
						}else if(store.reservation_time==2){
							mytime="10:00 ~ 12:00";
						}else if(store.reservation_time==3){
							mytime="12:00 ~ 14:00";
						}else if(store.reservation_time==4){
							mytime="14:00 ~ 16:00";
						}else if(store.reservation_time==5){
							mytime="16:00 ~ 18:00";
						}else if(store.reservation_time==6){
							mytime="18:00 ~ 20:00";
						}else if(store.reservation_time==7){
							mytime="20:00 ~ 22:00";
						}					
							$("#resertablebody").append("<td>" + store.reservation_date + "</td>");
							$("#resertablebody").append("<td>" + mytime + "</td>");
							$("#resertablebody").append("<td>" + store.seat_location + "</td>");										
							$("#resertablebody").append("</tr>");
					},
					error : function(){
						alert("error");
					}
				});			
			});
			
		}			
	});
		}
		
</script>



<div id="bf_container" class="bf_container">
	<div id="bf_background" class="bf_background">
		<img src="images/background/default.jpg" alt="image1"
			style="display: none;" />
		<div class="bf_overlay"></div>
	</div>
	<div id="bf_page_menu" class="bf_menu">
		<a href="main.jsp"><h1 class="title">
				JARGO<span>Steak House</span>
			</h1></a>
		<ul>
			<li><a href="#" data-content="store"
				onclick="mystore('<%=owner.getOwner_id()%>');"><span
					class="bf_hover"></span><span>My Store</span></a></li>
			<li><a href="#" data-content="seat" onclick="seat_list('<%=owner.getOwner_id()%>')"><span class="bf_hover"></span><span>Seat</span></a></li>
			<li><a href="#" data-content="customer" onclick="clist('<%=owner.getOwner_id()%>');"><span
					class="bf_hover"></span><span>Customer</span></a></li>

			<li><a href="#" data-content="board" onclick="ownerboard_list();"><span class="bf_hover"></span><span>Board</span></a></li>

			<li><a href="#" data-content="coupon" onclick="coupon('<%=owner.getOwner_id() %>');"><span 
					class="bf_hover"></span><span>Coupon</span></a></li>
			<li><a href="#" data-content="Reservation" onclick="reservationlist('<%=owner.getOwner_id() %>')"><span 
					class="bf_hover"></span><span>Reservation</span></a></li>		
		</ul>
	</div>
	<!-- ====================================================================================================== -->

	<div class="bf_page" id="store">

		<div class="bf_content_text_owner">
			<h2>My Store</h2>

			<table class="table_detail">
				<tbody id="table_detailbody"></tbody>
			</table>

			<br clear='left' />
			
			<p id="store_description"></p>

			<a id="store_modify" href="#" data-toggle="modal" data-target=".bs-modal-sm-store" 
			onclick="modifystore('<%=owner.getOwner_id() %>');">Modify</a>
		</div>

		<!-- ---------modify--------- -->
		<jsp:include page='store.jsp' />
		<!-- ---------modify--------- -->

	</div>
	<!-- class="bf_page" id="store" -->

	<!-- ====================================================================================================== -->




	<div class="bf_page" id="seat">
		<div class="bf_content_text_owner">
			<h2>테이블 설정</h2>
			<center>
			<form id = "seatlistform">
			<table border='1'id="seattable" width="500px" height="500px">
<tr align="center">
				<td><input type="button" class="seatbutton" id="00" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="01" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="02" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="03" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="04" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
</tr>
<tr align="center">
				<td><input type="button" class="seatbutton" id="10" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="11" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="12" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="13" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="14" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
</tr>
<tr align="center">
				<td><input type="button" class="seatbutton" id="20" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="21" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="22" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="23" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="24" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
</tr>
<tr align="center">
				<td><input type="button" class="seatbutton" id="30" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="31" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="32" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="33" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="34" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
</tr>
<tr align="center">
				<td><input type="button" class="seatbutton" id="40" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="41" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="42" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="43" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
				<td><input type="button" class="seatbutton" id="44" value=""
						onclick="setseat('layer2', id,'<%=owner.getOwner_id() %>');return false;"></td>
			</tr>
			
			</table>
			</form>
</center>
		</div>
	</div>



	<div class="layer">
		<div class="bg"></div>
		<div id="layer2" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<form id='seatform' action="#" enctype="multipart/form-data">
						<table id="tablesetting">
						<tbody id="seattbody">
						
				
						</tbody>
													
						</table>
					</form>

				</div>
				<!--// content-->
			</div>
		</div>
	</div>



	<!-- ====================================================================================================== -->

	<div class="bf_page" id="customer">
		<div class="bf_content_text_owner" id="customers">
			<h2>고객명단</h2>
			<form style="overflow-y:scroll; height: 650px;">
			<table id="tableclist">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>선호매장</th>
				</tr>
				<tbody id="tablebody"></tbody>
			</table>
			</form>
		</div>
	</div>

	<!-- ====================================================================================================== -->

	<div class="bf_page" id="board">
		<div class="bf_content_text_owner">
			<jsp:include page='/board/ownerboard_list.jsp' />
			
			
		</div>
	</div>

	<!-- ====================================================================================================== -->
	
	<div class="bf_page" id="coupon">
		<div class="bf_content_text_owner">

			<h2>My Store's Coupon</h2>

			<div id="coupons">
			
				<a  id="create_coupon" href="#" data-toggle="modal" data-target=".bs-modal-sm-coupon" >
				Let's make COUPON !</a>
				
				<table class="table_coupon">
					<tr>
						<th>Image</th>
						<th>Coupon Number</th>
						<th>Coupon ID</th>
						<th>Expired</th>
						<th>Usable</th>
						<th>Store Number</th>
						<th></th>
					</tr>			
					<tbody id="table_couponlist"></tbody>
				</table>

			</div>
			
		</div>
		
		<jsp:include page='coupon.jsp' />
	</div>



	<!-- ====================================================================================================== -->

	
	<div class="bf_page" id="Reservation">
		<div class="bf_content_text_owner">
			<h2>My Store Reservation List</h2>
			<form style="overflow-y:scroll; height: 650px;">
			<table id="tableclist">
			<thead>
			<tr>
					<th>Store Name</th>
					<th>Phone</th>
					<th>Date</th>
					<th>Time</th>
					<th>Seat</th>
				</tr>
				</thead>
				<tbody id="resertablebody"></tbody>
			</table>
			</form>
		</div>
	</div>
	
	

	

	
	
	
</div>

