<%@page import="jargo.vo.BoardVO"%>
<%@page import="jargo.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	CustomerVO customer = (CustomerVO)session.getAttribute("loginuser");

%>
<style type="text/css">
#slidesContainer {
	overflow: hidden;	
}
</style>

	
<script type="text/javascript">
	var dataValue ; 
	function menuall(){
		$.ajax({
			url : "menuall.jargo", 
			dataType : "json" , 
			success : function(data) {
				dataValue = data ;
				var output1="";
				var count1="0";
				var output2="";
				var count2="4";
				var output3="";
				var count3="8";
				var output4="";
				var count4="12";
				var output5="";
				var count5="16";
				var ct1=1;
				var ct2=1;
				var ct3=1;
				var ct4=1;
				var ct5=1;
				$.each(data, function(index , item) {
					if(item.menu_category=="Steak"){
						output1+="<li class='menu_click' id='steak"+ct1+"'><a href='#' onclick='menu("+count1+");'>"+item.menu_name+"</a></li>";
						count1++;
						ct1++;
					}
					else if(item.menu_category=="Pasta"){
						output2+="<li class='menu_click' id=pasta"+ct2+"><a href='#' onclick='menu("+count2+");'>"+item.menu_name+"</a></li>";
						count2++;
						ct2++;
					}
					else if(item.menu_category=="Appetizer"){
						output3+="<li class='menu_click' id='appetizer"+ct3+"'><a href='#' onclick='menu("+count3+");'>"+item.menu_name+"</a></li>";
						count3++;
						ct3++;
					}
					else if(item.menu_category=="Salad"){
						output4+="<li class='menu_click' id='salad"+ct4+"'><a href='#' onclick='menu("+count4+");'>"+item.menu_name+"</a></li>";
						count4++;
						ct4++;
					}
					else if(item.menu_category=="DessertBeverage"){
						output5+="<li class='menu_click' id='dessertBeverage"+ct5+"'><a href='#' onclick='menu("+count5+");'>"+item.menu_name+"</a></li>";
						count5++;
						ct5++;
					}
				}) ;
				
				$("#Steak").empty();
				$("#Pasta").empty();
				$("#Appetizer").empty();
				$("#Salad").empty();
				$("#DessertBeverage").empty();
				$("#Steak").append(output1);
				$("#Pasta").append(output2);
				$("#Appetizer").append(output3);
				$("#Salad").append(output4);
				$("#DessertBeverage").append(output5);
				menudetail(data);
			}
		});	
	}
	

	   function menudetail(ta){
		      var st1="";
		      var st2="";   
		      var st3="";      
		      var st4="";      
		      var st5="";
		      var ct1=1;
		      var ct2=1;
		      var ct3=1;
		      var ct4=1;
		      var ct5=1;   
		      $.each(ta, function(index , item) {
		         if(item.menu_category=="Steak"){
		st1+="<table class='menu_detail' id='steak"+ct1+"_detail'><tr><td rowspan='3' style='word-break:break-all' width=550 height=500><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";   
		         ct1++;
		         }         
		         else if(item.menu_category=="Pasta"){
		st2+="<table class='menu_detail' id='pasta"+ct2+"_detail'><tr><td rowspan='3' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";            ct2++;
		         }
		         else if(item.menu_category=="Appetizer"){
		st3+="<table class='menu_detail' id='appetizer"+ct3+"_detail'><tr><td rowspan='3' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";            ct3++;   
		         }
		         else if(item.menu_category=="Salad"){
		st4+="<table class='menu_detail' id='salad"+ct4+"_detail'><tr><td rowspan='3' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";            ct4++;
		         }
		         else if(item.menu_category=="DessertBeverage"){
		st5+="<table class='menu_detail' id='dessertBeverage"+ct5+"_detail'><tr><td rowspan='3' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";            ct5++;
		         }         
		         });   
		      $(".bf_menu_detail").empty();
		      $(".bf_menu_detail").append(st1);
		      $(".bf_menu_detail").append(st2);
		      $(".bf_menu_detail").append(st3);
		      $(".bf_menu_detail").append(st4);
		      $(".bf_menu_detail").append(st5);
		   }
	   function menudetail(ta){
		      var st1="";
		      var st2="";   
		      var st3="";      
		      var st4="";      
		      var st5="";
		      var ct1=1;
		      var ct2=1;
		      var ct3=1;
		      var ct4=1;
		      var ct5=1;   
		      $.each(ta, function(index , item) {
		         if(item.menu_category=="Steak"){
		st1+="<table class='menu_detail' id='steak"+ct1+"_detail'><tr><td rowspan='3' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";   
		         ct1++;
		         }         
		         else if(item.menu_category=="Pasta"){
		st2+="<table class='menu_detail' id='pasta"+ct2+"_detail'><tr><td rowspan='3' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";            ct2++;
		         }
		         else if(item.menu_category=="Appetizer"){
		st3+="<table class='menu_detail' id='appetizer"+ct3+"_detail'><tr><td rowspan='3' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";            ct3++;   
		         }
		         else if(item.menu_category=="Salad"){
		st4+="<table class='menu_detail' id='salad"+ct4+"_detail'><tr><td rowspan='3' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";            ct4++;
		         }
		         else if(item.menu_category=="DessertBeverage"){
		st5+="<table class='menu_detail' id='dessertBeverage"+ct5+"_detail'><tr><td rowspan='3' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='100'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='100'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='300'>"+item.menu_desc+"</td></tr></table>";            ct5++;
		         }         
		         });   
		      $(".bf_menu_detail").empty();
		      $(".bf_menu_detail").append(st1);
		      $(".bf_menu_detail").append(st2);
		      $(".bf_menu_detail").append(st3);
		      $(".bf_menu_detail").append(st4);
		      $(".bf_menu_detail").append(st5);
		   }
	

	function logincheck(){
		var check =<%=customer%>;
		 if(check==null || check==""){
			alert("Please Login!");			
				$("#lo").click();
				reserv="ok";
		}else { 
			getStores();
			$("#reservationShow").attr("data-content","reservation");
		}
			/*onclick="getStores();"*/
	}

	$(document).ready(function(){
			$('#slideshow').slideView({
				viewWidth:800,
				viewHeight:450,
				viewElementLength:1,
				viewElementPadding:5,		//li element 사이의 여백사용
				slideAutoplay:true,          //true이면 양쪽 슬라이드버튼 사라짐(slideBtnLeft, slideBtnRight)
				slideLoop:true,
				slideInterval:1000,	
				slideBtnLeft:'btnleft',
				slideBtnRight:'btnright'
			});
		});
		/*
			{
				slideDebug:false,							// debug깅 모드 사용여부					[true / false]
				viewWidth:202,								//필수											[px값 사용]
				viewHeight:282,								//필수											[px값 사용]
				viewElementLength:3,						//화면에 보여질 view 영역의 개수			[숫자]
				viewElementPadding:10,					//화면의 li element 사이의 여백			[px값 사용]
				slideAutoplay:false,							//자동으로 slide 실행 여부					[true / false]
				slideLoop:false,								//li element의 반복 slide 여부				[true / false]
				slideClickDirectionBtn:'right',			//슬라이드 이동 방향에 대한 버튼 타입	[right / left]=> right:오른쪽 버튼 효과, left:왼쪽버튼 효과
				slideInterval:1500,							//슬라이드 실행 시간차						[1/1000초]
				slideBtnLeft:'btnleft',						//왼쪽 버튼의 id값
				slideBtnRight:'btnright'						//오른쪽 버튼의 id값
			}
			
		*/	
		function myreservationlist(customer_id){
			$.ajax({
				url:"getstoreonreser.jargo?customer_id="+customer_id,
				dataType:"json",
				success:function(data){
					$("#myresertablebody").empty();
				$.each(data, function(index, item){
					mytime="";
					$.ajax({
						url:"Myreservationlist.jargo?store_number="+item.store_number+"&reservation_number="+item.reservation_number,
						dataType:"json",
						success:function(store){
								$("#myresertablebody").append("<form>");
								$("#myresertablebody").append("<tr>");
								$("#myresertablebody").append("<td>" + store.store_name + "</td>");
								$("#myresertablebody").append("<td>" + store.store_phone + "</td>");
								$("#myresertablebody").append("<td>" + store.store_addr + "</td>");
								$("#myresertablebody").append("<td>" + store.store_subway + "</td>");					
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
								$("#myresertablebody").append("<td>" + store.reservation_date + "</td>");
								$("#myresertablebody").append("<td>" + mytime + "</td>");
								$("#myresertablebody").append("<td>" + store.seat_location + "</td>");
								$("#myresertablebody").append("<td><button onclick='reservationfix("+item.reservation_number+")' class='btn btn-success'>Cancel</button></td>");
								$("#myresertablebody").append("</tr>");
								$("#myresertablebody").append("</form>");

						},
						error : function(){
							alert("error");
						}
					});			
				});
				
			}			
		});
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
			  <% if(customer != null) { %>
			  
			  myreservationlist("<%=customer.getCustomer_id()%>");
			<%}%>
		}
</script>

	
	<div id="map"></div>
	
	
<div id="bf_container" class="bf_container">
			<div id="bf_background" class="bf_background">
				<img src="images/background/default.jpg" alt="image1" style="display:none;"/>
				<div class="bf_overlay"></div>
			</div>
			<div id="bf_page_menu" class="bf_menu" >
				<a href="main.jargo"><h1 class="title">JARGO<span>Steak House</span></h1></a>
				<ul>
					<li><a href="#" data-content="about"><span class="bf_hover"></span><span>About us</span></a></li>
					<li><a href="#" data-content="menu" onclick="menuall();" ><span class="bf_hover"></span><span>Our Menu</span></a></li>
					<li><a href="#"  id="reservationShow" onclick="logincheck();" ><span class="bf_hover"></span><span>Reservation</span></a></li>
					<li><a href="#" data-content="visit"><span class="bf_hover"></span><span>Visit us</span></a></li>
					<li><a href="#" id="boardview" data-content="board" onclick="board_list();"><span class="bf_hover"></span><span>Board</span></a></li>
			<%if(customer!=null){ %>
					<li><a href="#" id="myreservationview" data-content="myreservation" onclick="myreservationlist('<%=customer.getCustomer_id()%>');"><span class="bf_hover"></span><span>My Reservation</span></a></li>
			<%} %>
				</ul>
			</div>
			
			
	<!-- =========ABOUT START============================================================================================= -->
	<div class="bf_page" id="about">

		<div id="aboutus" class="bf_aboutus_text">
			<h2>About Jargo</h2>
			<table id="aboutslide">			
				<tr>
					<td width="40%" style="text-align: right; padding-right: 10px;">
						<img src="images/slide/btnLeft.png" id="btnleft"
						style="cursor: pointer;" />
					</td>
					<td width="20%">
						<div id="slideshow">
							<div id="slidesContainer">
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-1.jpg" />
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-2.jpg" />
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-3.jpg" />
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-4.jpg" />
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-5.jpg" />
								</div>
								<div class="slideLI">
									<img id="aboutimg" src="images/slide/Views-6.jpg" />
								</div>
							</div>
						</div>
					</td>
					<td width="40%" style="padding-left: 10px;"><img
						src="images/slide/btnRight.png" id="btnright"
						style="cursor: pointer;" /></td>
				</tr>
			</table>
			<div>
				<p id="aboutusmain">My NO.1 Steakhouse Jargo</p>
				<p id="aboutusinfo">자르고만의 특별한 스테이크를 맛볼 수 있는 My NO.1 스테이크하우스, JARGO</p>
			</div>
		</div>


	</div>


	<!-- =========MENU START============================================================================================= -->
			<div class="bf_page" id="menu">
				<div class="bf_content_text">
					<h2 id="ourmenu">Our Menu</h2>
					<div id="va-accordion" class="va-container">
						<div class="va-wrapper" id= "menus">
						
							<div class="va-slice va-slice-3">
								<h3 class="va-title">Appetizer</h3>
								<div class="va-content">
									<ul id="Appetizer">
									
									</ul>
								</div>	
							</div>
							
							<div class="va-slice va-slice-4">
								<h3 class="va-title">Salad</h3>
								<div class="va-content">
									<ul id="Salad"></ul>
								</div>	
							</div>
							
							<div class="va-slice va-slice-1">
								<h3 class="va-title">Steak</h3>
								<div class="va-content">
									<ul id="Steak"></ul>
								</div>
							</div>
							
							<div class="va-slice va-slice-2">
								<h3 class="va-title">Pasta</h3>
								<div class="va-content">
									<ul id="Pasta">
										
									</ul>
								</div>	
							</div>							
							
							<div class="va-slice va-slice-5">
								<h3 class="va-title">Dessert & Beverage</h3>
								<div class="va-content">
									<ul id="DessertBeverage">
										
									</ul>
								</div>	
							</div>
						</div><!-- va-wrapper -->
					</div><!-- va-container -->					
				</div><!-- bf_content_text -->
				
					 <!-- menu detail -->
				<div class="bf_menu_detail"></div><!-- menu detail -->
			
				
			</div><!-- class="bf_page" id="menu" -->
<!-- =====MENU END================================================================================================= -->



<!-- =====RESERVATION Start================================================================================================= -->
			<% if(customer != null) { %>
			<jsp:include page='reservation.jsp' /><%}%>>
<!-- =====RESERVATION END================================================================================================ -->



 			<div class="bf_page" id="board">
 			<div class="bf_content_text_board" id="board_div"> 			
 				<h2>Board</h2>
 				<jsp:include page='/board/board_list.jsp' />
 				</div>
 			</div>

			<div class="bf_page" id="visit">
				
			</div>
			

			

			
	<div class="bf_page" id="myreservation">
		<div class="bf_content_text_owner" id="myreservation_div">
			<h2>My Reservation List</h2>
			<table id="tableclist">
			<thead>
			<tr>
					<th>Store Name</th>
					<th>Phone</th>
					<th>Address</th>
					<th>Subway</th>
					<th>Date</th>
					<th>Time</th>
					<th>Seat</th>
				</tr>
				</thead>
				<tbody id="myresertablebody"></tbody>
			</table>
		</div>
	</div>



				
</div>