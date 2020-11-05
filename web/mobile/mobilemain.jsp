<%@page import="jargo.vo.CustomerVO"%>
<%@ page 	language="java" 
					contentType="text/html; charset=EUC-KR"
    				pageEncoding="EUC-KR" %>    			
    					
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css"></style>
<style type="text/css">
#slidesContainer {
   overflow: hidden;   
}
</style>
<title>Insert title here</title>
<%	CustomerVO user = (CustomerVO)session.getAttribute("loginuser") ;%>
	<meta name="viewport" 
				content="width=device-width,
							initial-scale=1.0,
							maximum-scale=1.0,
							minimum-scale=1.0,
							user-scalable=no" />
							
	<link rel="shortcut icon" href="JARGO../images/logo.png">
	<link rel="apple-touch-icon" href="JARGO../images/logo.png">
	<script type="text/javascript" 
		src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	
   <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'/> 


	<link rel="stylesheet" 
		href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
								
								
	
	<script type="text/javascript" 
		src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
	<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
	<link href="css/mobile.css" rel="stylesheet" type='text/css' />
	<script src="js/jQuery.slide.js"></script>	

	
	<script type="text/javascript">  

    		function update(f) {
    			var pwd = f.customer_pwd.value;
    			var reenterpwd = f.reenterpwd.value;

    			if(pwd != reenterpwd) {
    				alert("pwd error");
    				f.customer_pwd.value = "";
    				f.reenterpwd.value= "";
    				f.customer_pwd.focus();
    				return false;
    				
    			} else {
    				f.action = "modifyImpl.jargo?mobile=ok";    				
    				f.method = "POST";
    			}
    			
    		}
    		<!--달력-->
    		$(function() {
    			// $.datepicker.setDefaults($.datepicker.regional["ko"]);
    			    $(".datePicker").datepicker({ 
    			     dateFormat: 'yy-mm-dd',
    			     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    			     dayNamesMin: ['일','월','화','수','목','금','토'],
    			     weekHeader: 'Wk',
    			     minDate:"0d",
    			     changeMonth: true, //월변경가능
    			     changeYear: true, //년변경가능
    			     yearRange:'2014:3', // 연도 셀렉트 박스 범위(현재와 같으면 1988~현재년)
    			     showMonthAfterYear: true, //년 뒤에 월 표시
    			     buttonImageOnly: true, //이미지표시  
    			     buttonText: '날짜를 선택하세요', 
    			     autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
    			        			         
    			  });
    			 });

    		<!--달력-->
    		</script>
    		<script>
    		<!-- logout-->
			$(document).ready(function() {
				$("#mainlogout").bind("click" , function(event) {
					location.href="logout.jargo?mobile=ok";
				}) ;
			});
				
			$(document).ready(function(){
				$('#slideshow').slideView({					
					viewElementLength:1,
					  viewElementPadding:5,      //li element 사이의 여백사용
					slideAutoplay:true,          //true이면 양쪽 슬라이드버튼 사라짐(slideBtnLeft, slideBtnRight)
					slideLoop:true,
					slideInterval:2000,	
					slideBtnLeft:'btnleft',
					slideBtnRight:'btnright'
				});
			});
			
			function reservationcheck(f) {
    			  if (confirm("Are you sure about that?") == true){    //확인
    				f.action = "";    				
    			  	f.method = "POST";
    			  }else{   //취소
    			      return false;
    			  }				
			}
		
			function reservationfix(f) {
				  if (confirm("Are you sure?") == true){
				$.ajax({
					url:"reservationdelete.jargo?reservation_number="+f,
					dataType:"json",
					success:function(data){
						alert("delete ok");
						}
					});
				  }
				  <% if(user != null) { %>
				  
				  myreservation("<%=user.getCustomer_id()%>");
				<%}%>
			}
			
			function myreservation(customer_id){
				$.ajax({
					url:"getstoreonreser.jargo?customer_id="+customer_id,
					dataType:"json",
					success:function(data){
						$("#mobilereser").empty();
					$.each(data, function(index, item){
						mytime="";
						$.ajax({
							url:"Myreservationlist.jargo?store_number="+item.store_number+"&reservation_number="+item.reservation_number,
							dataType:"json",
							success:function(store){
									$("#mobilereser").append("<form>");
									$("#mobilereser").append("<tr>");
									$("#mobilereser").append("<td width='20%' align='center'>" + store.store_name + "</td>");
									$("#mobilereser").append("<td width='15%' align='center'>" + store.store_phone + "</td>");
									$("#mobilereser").append("<td width='15%' align='center'>" + store.store_subway + "</td>");					
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
									$("#mobilereser").append("<td width='20%' align='center'>" + store.reservation_date + "</td>");
									$("#mobilereser").append("<td width='20%' align='center'>" + mytime + "</td>");
									$("#mobilereser").append("<td width='10%' align='center'>" + store.seat_location + "</td>");
									$("#mobilereser").append("<td  align='center'><a href='#' onclick='reservationfix("+item.reservation_number+")'>Cancel</a></td>");
									$("#mobilereser").append("</tr>");
									$("#mobilereser").append("</form>");
									$("#tablemobilelist").table("refresh");
							}
						});			
					});
					
				}			
			});
		}
		$(document).ready(function () {
			$("#findseat").on("click", timeseatlist);
		
		});		

			function timeseatlist(){
				
				if(document.reservationform.time_store_number.value!=null){
				
				global_store=document.reservationform.time_store_number.value;
				global_date=document.reservationform.reservation_date.value;
				global_time=document.reservationform.reservation_time.value;
				
				for(var i=0; i<5; i++){
					for(var j=0; j<5; j++){
						$('#'+i+''+j).prop("value", null);
						$("#"+i+''+j).prop("disabled", "disabled");
						$('#'+i+''+j).css({'background-color':'#ffe6f2'});
						$("."+i+''+j).css({'background-color':'transparent'});
						
					  }
				  }
				$.ajax({
					url:"seat_all.jargo",
					dataType:"json",
					success: function(data3){
						$.each(data3, function(index3, item3){
							if(document.reservationform.time_store_number.value==item3.store_number){
								$("."+item3.seat_location).css({'background-color':'blue'});
								$("#"+item3.seat_location).removeAttr('disabled');
								$("#"+item3.seat_location).prop("value" , item3.seat_status);
								$("#"+item3.seat_location).prop("dis" , item3.seat_status);
							}
							});
						},
						error : function(){
							alert("error");
						}
					});
						
				$.ajax({
					url:"timelist.jargo?reservation_date="+document.reservationform.reservation_date.value+"&reservation_time="+document.reservationform.reservation_time.value,
					dataType:"json",
					success: function(data){
					//	$("#tablebody").empty();
						$.each(data, function(index, item){					
							$.ajax({
								url:"seat_all.jargo",
								dataType:"json",
								success: function(data2){
									$("#tablebody").empty();
									$.each(data2, function(index2, item2){
										
										if(document.reservationform.time_store_number.value==item2.store_number){
											if(item.seat_number==item2.seat_number){
												//time의 seat_number와 seat의 seat_number가 같고 seat의 store_number가 입력받은 store_number와 일치하면	
												//예약현황이있으면
												$("."+item2.seat_location).css({'background-color':'red'});
												$("#"+item2.seat_location).prop("disabled", "disabled");
												$("#"+item2.seat_location).prop("value" , item2.seat_status);
												$("#"+item2.seat_location).prop("dis" , item2.seat_status);
											}
										} 
										 
									});
								},
								error : function(){
									alert("error");
								}
							});
							
							
						});
					},
					error : function(){
						alert("error");
					}
				});
				}
				else{
					alert("예약할 지점을 선택해주세요");
				}
				$("#seat_table").prop("data-collapsed", "false");
				return false ;
			}
			
			
			

			function reserseat(el) {
				$.ajax({
			url:"seat_detail.jargo?store_number="+global_store+"&seat_location="+el, // data2 : seat에 관한정보
			dataType:"json",
			success:function(data2){
				var showtime="";
				<%if( user != null ) {%>	
				$("#table_customer_id").prop("value", "<%=user.getCustomer_id()%>" );
				<%}%>
				$("#table_store_number").prop("value", global_store);
				
				$("#table_reservation_date").prop("value", global_date);
				
				if(global_time==1){
					showtime="8:00 ~ 10:00";
				}else if(global_time==2){
					showtime="10:00 ~ 12:00";
				}else if(global_time==3){
					showtime="12:00 ~ 14:00";
				}else if(global_time==4){
					showtime="14:00 ~ 16:00";
				}else if(global_time==5){
					showtime="16:00 ~ 18:00";
				}else if(global_time==6){
					showtime="18:00 ~ 20:00";
				}else if(global_time==7){
					showtime="20:00 ~ 22:00";
				}					
				$("#table_reservation_showtime").prop("value", showtime);
				$("#table_reservation_time").prop("value", global_time);
				
				$("#table_seat_number").prop("value", data2.seat_number);
				
				$("#table_seat_location").prop("value", el);
				
				$("#table_seat_img").prop("src","images/seat/"+data2.seat_img);

}
		
		});}
			
			function reservationregister(f){
				$.ajax({
					url:"timeandreservationregister.jargo?reservation_date="+f.table_reservation_date.value+"&reservation_time="+f.table_reservation_time.value+
							"&seat_number="+f.table_seat_number.value+"&store_number="+f.table_store_number.value+"&customer_id="+f.table_customer_id.value
							,
					dataType:"json",
					success: function(data){
						$("#seatact").prop("class",null);
						$("#completeact").attr("class","active");
						$("#time_seat_list").prop("class","tab-pane");
						$("#realfinal").prop("class","tab-pane active");
						}
					});
				alert("BOOK OK");
				location.href="mobilemain.jargo";
			}

    		</script>
  

				
	
</head>

<body>
		
	<div data-role="page" id="mainPage">
		<div data-role="panel" id="menuPanel" data-theme="a">
		<div data-role="collapsible" data-collapsed="true">
		<%if(user!=null&&!user.equals("")){ %> 
			<h1>My Info</h1>
		<form>
			<ul data-role="listview" data-inset="true" data-theme="a" data-dividertheme="b">
			
			<li data-role="fieldcontain">
	        	My Name : <input type="text" data-theme="c" id="customer_name" name="customer_name" value="<%=user.getCustomer_name() %>" required="required">
			</li>
			<li data-role="fieldcontain">
	        	My Pwd : <input type="password" data-theme="c" id="customer_pwd" name="customer_pwd" value="<%=user.getCustomer_pwd()%>" required="required">
			</li>
			<li data-role="fieldcontain"> 
	        	Pwd Check : <input type="password"  data-theme="c" id="reenterpwd" name="reenterpwd" required="required">
			</li>
			<li data-role="fieldcontain">
	        	My E-mail:<input type="email" data-theme="c" id="customer_email" name="customer_email" value="<%=user.getCustomer_email() %>" required="required">
	        	
			</li>
			<li data-role="fieldcontain">
	        	My Address: <input type="text" data-theme="c" id="customer_addr" name="customer_addr" value="<%=user.getCustomer_addr() %>" required="required">
	        	
			</li>
			<li data-role="fieldcontain">
	        	My Phone: <input type="text" data-theme="c" id="customer_phone" name="customer_phone" value="<%=user.getCustomer_phone() %>" required="required">
			</li>
			<li data-role="fieldcontain">
	        	My Favor: <input type="text" data-theme="c" id="customer_favor" name="customer_favor" value="<%=user.getCustomer_favor() %>" required="required">
			</li>
			<li data-role="fieldcontain">
				<button id="confirmsignup" data-theme="c" name="confirmsignup" onclick="update(this.form);">modify</button>
			</li>
			
			</ul>
			<input type="hidden" id="customer_id" name="customer_id" value="<%=user.getCustomer_id()%>" >
		
				
		</form>
		<a href="#popupMyreser" type="button">My Reservation</a>
			<%} %>
		</div>
		
		</div>
		<div data-role="header" data-position="fixed">
	
			
			<h1>JARGO</h1>
			
			
				<jsp:include page="mobileLoginform.jsp" />
			<%if( user == null ) {%>
			<a href="#popupLogin" data-rel="popup" data-icon="check" data-position-to="window"  data-transition="pop">Login</a>
			
			<%}else {%>
				<a href="#menuPanel" data-icon="home" onclick="myreservation('<%=user.getCustomer_id()%>')"><%=user.getCustomer_id()%></a>
				<a href="#" data-icon="check" id="mainlogout" rel="external">logout</a>
			<%} %>
		</div>
		
		<div data-role="content" class="mobilebody">
		
			<div data-role="collapsible" data-collapsed="true"> 
			<h1>About Us</h1>
				<table>
				<tr>
					<td width="40%" style="text-align: right; padding-right: 10px;">
						<img src="images/slide/btnLeft.png" id="btnleft"
						style="cursor: pointer;" width="100%" height="100%" />
					</td>
					<td>
						<div id="slideshow">
							<div id="slidesContainer">
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-1.jpg" width="100%" height="100%" />
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-2.jpg" width="100%" height="100%" />
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-3.jpg" width="100%" height="100%"/>
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-4.jpg" width="100%" height="100%"/>
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-5.jpg" width="100%" height="100%"/>
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-6.jpg" width="100%" height="100%"/>
								</div>
							</div>
						</div>
					</td>
					<td width="40%" style="padding-left: 10px;"><img
						src="images/slide/btnRight.png" id="btnright"
						style="cursor: pointer;" width="100%" height="100%" /></td>
				</tr>
			</table>
			</div>			
			
				<jsp:include page="mobilemenu.jsp" />			

			
	<%if(user!=null&&!user.equals("")){ %>
			<div data-role="collapsible" data-collapsed="true"> 

			<h1>Reservation</h1>
			<form id="reservationform" name="reservationform">
				<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
					<li>						
						<div data-role="collapsible" data-collapsed="true">
							<h1>Store</h1>
							<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
						 		<select name="time_store_number" id="time_store_number" data-native-menu="false" data-mini="true" required="required">
						 		 </select>
						 	</ul>
						</div>
					</li>
					
					<li>
						<h1>Date</h1>
						 <input type="text" id="reservation_date" name="reservation_date" class="datePicker" required="required">
					</li>
					<li>
						<div data-role="collapsible" data-collapsed="true">
							<h1>Time</h1>
							<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
								<select name="reservation_time" id="reservation_time" data-native-menu="false" data-mini="true" required="required">
						        	 <option value="1">8:00 ~ 10:00</option>
						        	 <option value="2">10:00 ~ 12:00</option>
						        	 <option value="3">12:00 ~ 14:00</option>
						        	 <option value="4">14:00 ~ 16:00</option>
						        	 <option value="5">16:00 ~ 18:00</option>
						        	 <option value="6">18:00 ~ 20:00</option>
						        	 <option value="7">20:00 ~ 22:00</option>
						    	</select>
						    	<br>
									<a data-role="button" id="findseat" >Find Seat</a>
								</form>
						    </ul>
						</div>
					</li>
					<li>
						<div id="seat_table" data-role="collapsible" data-collapsed="true">
							<h1>Seat</h1>
							<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
								<!-- <select name="seat" id="seat" data-native-menu="false" data-mini="true" required="required" >
						        	 
						    	</select>  -->   	 
						    	
						    	<center>
						    		<form id = "store_time_seat_list">
			<table border='0.1'id="store_time_seat_table" width="100%" height="100%">
		<tr>
				<td class="00"><input type="button" class="seatbutton" id="00" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="01"><input type="button" class="seatbutton" id="01" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="02"><input type="button" class="seatbutton" id="02" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="03"><input type="button" class="seatbutton" id="03" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="04"><input type="button" class="seatbutton" id="04" value=""
						onclick="reserseat(id);return false;"></td>
</tr>
<tr align="center">
				<td class="10"><input type="button" class="seatbutton" id="10" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="11"><input type="button" class="seatbutton" id="11" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="12"><input type="button" class="seatbutton" id="12" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="13"><input type="button" class="seatbutton" id="13" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="14"><input type="button" class="seatbutton" id="14" value=""
						onclick="reserseat(id);return false;"></td>
</tr>
<tr align="center">
				<td class="20"><input type="button" class="seatbutton" id="20" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="21"><input type="button" class="seatbutton" id="21" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="22"><input type="button" class="seatbutton" id="22" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="23"><input type="button" class="seatbutton" id="23" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="24">  <input type="button" class="seatbutton" id="24" value=""
						onclick="reserseat(id);return false;"></td>
</tr>
<tr align="center">
				<td class="30"><input type="button" class="seatbutton" id="30" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="31"> <input type="button" class="seatbutton" id="31" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="32"><input type="button" class="seatbutton" id="32" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="33"><input type="button" class="seatbutton" id="33" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="34"><input type="button" class="seatbutton" id="34" value=""
						onclick="reserseat(id);return false;"></td>
</tr>
<tr align="center">
				<td class="40"><input type="button" class="seatbutton" id="40" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="41"><input type="button" class="seatbutton" id="41" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="42"><input type="button" class="seatbutton" id="42" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="43"><input type="button" class="seatbutton" id="43" value=""
						onclick="reserseat(id);return false;"></td>
				<td class="44"><input type="button" class="seatbutton" id="44" value=""
						onclick="reserseat(id);return false;"></td>
			</tr>
			
			</table>
			
			<form id='reservationform' enctype="multipart/form-data">
						<table id="reservationformtable">
<tr><td colspan="2"><img id="table_seat_img" src="" width="100%" height="100%" align="center"></td></tr>
<tr><td>CUSTOMER ID</td><td><input id ='table_customer_id' type='text' name='table_customer_id' value=''  readonly></td></tr>
<tr><td>STORENUMBER</td><td><input id ='table_store_number' type='text' name='table_store_number' value=''  readonly></td></tr>
<tr><td>SEAT_NUMBER</td><td><input id ='table_seat_number' type='text' name='table_seat_number' value=''  readonly></td></tr>
<tr><td width="100px">DATE</td><td width="167px"><input id='table_reservation_date' type='text' name='table_reservation_date' value=''  readonly></td></tr>
<tr><td width="100px">TIME</td><td width="167px"><input id='table_reservation_showtime' type='text' name='table_reservation_showtime' value=''  readonly></td></tr>
<tr><td>LOCATION</td><td><input id='table_seat_location' type='number' name='table_seat_location' value='' readonly></td></tr>	
<tr><td colspan='2' align='center'>
<input class='cbtn' type="button" onclick='javascript: reservationregister(this.form)' value='RESERVATION'></td></tr>		
						</table>
						<input id='table_reservation_time' type='hidden' name='table_reservation_time' value=''  readonly>
					</form>
			</form></center>

							</ul>
						</div>
					</li>
					<!-- <li>
						<button onclick="reservationregister()">Book!!</button></form>
					</li>	 -->			
				</ul>
				
			</div>
	<%} %>
		<!-- 	<div data-role="collapsible" data-collapsed="true" id="visit" class="bf_page" > 
			<h1>Visit us</h1>
				<script>
				$.ajax({
					url:"storelist.jargo",
					dataType:"json",
					success: function(data){
						var markers=[];
						$.each(data, function(index, item){				

							markers[index] = {
									    lat: Number(item.store_lat), 
									  	lng: Number(item.store_lng),
							            //name: item.store_name,
							            info: 
							            	
							            	
							           "<table align='center' border='0'>"+
							           "<tr><td>점포명</td><td>"+item.store_name+"</td><td rowspan=9>"+item.store_img+"</td></tr>" +
							           "<tr><td>전화번호</td><td>"+item.store_phone+"</td></tr>"+
							           "<tr><td>주소</td><td>"+item.store_addr+"</td></tr>"+
							           "<tr><td>설명</td><td>"+item.store_desc+"</td></tr>"+
							           "<tr><td>가까운역</td><td>"+item.store_subway+"</td></tr>"+
							           "<tr><td>위도</td><td>"+item.store_lat+"</td></tr>"+
							           "<tr><td>경도</td><td>"+item.store_lng+"</td></tr>"+
							           "<tr><td>마스터NUM</td><td>"+item.master_number+"</td></tr>"+
							           "<tr><td>점주</td><td>"+item.owner_id+"</td></tr>" +
							           "<tr><td colspan='2'><a href='#' onclick='BGMap.showMap()'>되돌아가기</a></td></tr></table>"
							
							};
						});e
				display = true;
				var point = new google.maps.LatLng(37.5251, 126.98955);
				var myLatlng = new google.maps.LatLng(33.444736, 126.732199);
				var parliament = new google.maps.LatLng(33.444736, 126.732199);
				var marker;
				var map;
				var myicon = new google.maps.MarkerImage("images/logo.png", null, null, null, new google.maps.Size(30,30));
				
							
				var iterator = 0;
				var map;


				mapOptions = {
					zoom : 13,
					center :  point
				};
				map = new google.maps.Map(document.getElementById("map"),
						mapOptions);
				/*var transitLayer = new google.maps.TransitLayer();
				  transitLayer.setMap(map);*/
				/*var bikeLayer = new google.maps.BicyclingLayer();
				  bikeLayer.setMap(map);*/
				/* var trafficLayer = new google.maps.TrafficLayer();
				 trafficLayer.setMap(map);*/
				  marker=[];
				map.setTilt(45);
					}
				});
				</script>
			</div> -->

		</div>
		

		<div data-role="footer" data-position="fixed" id="footer" >
			 <div align="center" id="si">
			 


        
			 <p>&#169; 2014 JARGO.com</p>
						 <a href="#" >Connect with us</a>
			 </div>
		</div>
		
		
	</div>
	

	<div data-role="page" id="popupMyreser" data-theme="a" class="ui-corner-all">
        	<div data-role="header"  data-position="fixed" > 
        		<a data-rel="back" data-icon="back">Back</a>
        		 <h3>My Reservation List</h3>
        	</div>
        <div data-role="content" style="padding:10px 20px;" data-theme="b" >
           	<table id="tableclist" style="font-size: 15px" width="100%">
			<thead>
				<tr>
					<th width="20%">Store Name</th>
					<th width="15%">Phone</th>
					<th width="15%">Subway</th>
					<th width="20%">Date</th>
					<th width="20%">Time</th>
					<th width="10%">Seat</th>
				</tr>
				</thead>
				<tbody id="mobilereser"></tbody>
			</table>     
        </div>
        <div data-role="footer" data-position="fixed" id="footer" >
			 <div align="center" id="si">        
			 <p>&#169; 2014 JARGO.com</p>
						 <a href="#" >Connect with us</a>
			 </div>
		</div>
    
</div>


</body>

</html>

















