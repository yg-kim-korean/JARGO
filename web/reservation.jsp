		<%@page import="java.security.acl.Owner"%>
<%@page import="jargo.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%
	CustomerVO customer = (CustomerVO)session.getAttribute("loginuser");
%>

<script>
function reservationregister(f){
	var dd = f.table_customer_id.value;
	
	$.ajax({
		url:"timeandreservationregister.jargo?reservation_date="+f.table_reservation_date.value+"&reservation_time="+f.table_reservation_time.value+
				"&seat_number="+f.table_seat_number.value+"&store_number="+f.table_store_number.value+"&customer_id="+f.table_customer_id.value
				,
		dataType:"json",
		success: function(data){
			alert("register");
			$("#seatact").prop("class",null);
			$("#completeact").attr("class","active");
			$("#time_seat_list").prop("class","tab-pane");
			$("#realfinal").prop("class","tab-pane active");
			},
			error : function(){
				alert("error");
			}
		});
	
}
///////////////////////////////////
function timeseatlist(f){
	
	if(f.time_store_number.value!=null){
	$("#dateact").prop("class",null);
	$("#seatact").attr("class","active");
	$("#timeselect").prop("class","tab-pane");
	$("#time_seat_list").prop("class","tab-pane active");
	
	
	global_store=f.time_store_number.value;
	global_date=f.reservation_date.value;
	global_time=f.reservation_time.value;
	
	for(var i=0; i<5; i++){
		for(var j=0; j<5; j++){
			$('#'+i+''+j).prop("value", null);
			$('#'+i+''+j).css({'background-color':'#ffe6f2'});
			$("."+i+''+j).css({'background-color':'transparent'});
		  }
	  }
	
	$.ajax({
		url:"seat_all.jargo",
		dataType:"json",
		success: function(data3){
			$.each(data3, function(index3, item3){
				if(f.time_store_number.value==item3.store_number){
					$("."+item3.seat_location).css({'background-color':'white'});
					$("#"+item3.seat_location).css({'background-color':'white'});
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
		url:"timelist.jargo?reservation_date="+f.reservation_date.value+"&reservation_time="+f.reservation_time.value,
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
							
							if(f.time_store_number.value==item2.store_number){
								if(item.seat_number==item2.seat_number){
									//time의 seat_number와 seat의 seat_number가 같고 seat의 store_number가 입력받은 store_number와 일치하면	
									//예약현황이있으면
									$("#"+item2.seat_location).css({'background-color':'gray'});
									$("."+item2.seat_location).css({'background-color':'gray'});
									$("#"+item2.seat_location).prop("disabled", "disabled");
									$("#"+item2.seat_location).css({'color':'black'});
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
	}
		  
	/////////////////////////////////// time에 대한 seatlist를  select하고 table에 출력한다./////////////////////////
	/* function reserseat2(el,value) {
	$("#"+item.seat_location).prop("value" , item.seat_status) ;
	$.ajax({
			url:"seat_detail.jargo?store_number="+global_store+"&seat_location="+value, // data2 : seat에 관한정보
			ataType:"json",
			success:function(data2){
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수
		
		if (bg) {
	$('.layer').fadeIn();
	
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
			
			 */
			
			
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function reserseat(el,value) {
				$.ajax({
					url:"seat_detail.jargo?store_number="+global_store+"&seat_location="+value, // data2 : seat에 관한정보
					dataType:"json",
					success:function(data2){
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수
		if (bg) {
	if(data2!=null){
		
$('.layer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다.

$("#table_customer_id").prop("value", "<%=customer.getCustomer_id()%>" );

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

$("#table_seat_location").prop("value", value);

$("#table_seat_img").prop("src","images/seat/"+data2.seat_img);

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
		temp.find('input.btn').click(function(e) {
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
		
		});}



</script>
     	<script>
			/* reservation  */
			$(function(){
				$('a[title]').tooltip();
				})
				
				/*
Please consider that the JS part isn't production ready at all, I just code it to show the concept of merging filters and titles together !
*/
$(document).ready(function(){
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});
function next(store_number){	
	$.ajax({
		url:"storeselect.jargo?store_number=" + store_number,
		dataType:"json",
		success: function(data){			
			$("#time_store_name").text(data.store_name);
		},
		error : function(){
			alert("error");
		}
	});
		$("#time_store_number").prop("value",store_number);
		$("#storeact").prop("class",null);
		$("#dateact").attr("class","active");
		$("#store").prop("class","tab-pane");
		$("#timeselect").prop("class","tab-pane active");}
		
			function getStores(){
				$.ajax({
					url: "getstores.jargo",
					dataType: "json",
					success:function(data){
						var output="";
						$("#storebody").empty();
						$.each(data,function(index, item){
							output+="<tr id='select'><td><a href='#' onclick='next("+item.store_number+");'>"+item.store_name+"</a></td><td>"+item.store_subway+"</td><td>"+item.store_phone+"</td></tr>";
						});
						$("#storebody").append(output);
					}
					});
				}
			</script>
    
    
    
	

<div class="bf_page" id="reservation">
	<div class="bf_reservation_text">

		<section style="background: background:transparent url(../images/pattern.png) repeat top left;">
			<div class="container">
				<div class="row">
					<div class="board" style="margin-top: -30px">
						<!-- <h2>Welcome to IGHALO!<sup>™</sup></h2>-->
						<div class="board-inner">
							<ul class="nav nav-tabs" id="myTab">
								<div class="liner"></div>
								<li id="storeact" class="active"><a href="#store" data-toggle="tab"
									title="Store"> <span class="round-tabs one"> <i
											class="glyphicon glyphicon-tower"></i>
									</span>
								</a></li>


								<li id="dateact"><a href="#timeselect" data-toggle="tab" title="Date">
										<span class="round-tabs two"> <i
											class="glyphicon glyphicon-time"></i>
									</span>
								</a></li>


								<li id="seatact"><a href="#messages" data-toggle="tab" title="Seat">
										<span class="round-tabs three"> <i
											class="glyphicon glyphicon-print"></i>
									</span>
								</a></li>


								<li id="completeact"><a href="#final" data-toggle="tab" title="completed">
										<span class="round-tabs four"> <i
											class="glyphicon glyphicon-ok"></i>
									</span>
								</a></li>


							</ul>
						</div>





<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div class="tab-content">

							<div class="tab-pane active" id="store">

							
							<h3 class="head text-center">Select Store</h3>

								<div class="row">
									<div class="panel panel-primary filterable">
										<div class="panel-heading">
											<h3 class="panel-title">Store</h3>
											<div class="pull-right">
												<button class="btn btn-default btn-xs btn-filter">
													<span class="glyphicon glyphicon-filter"></span> Filter
												</button>
											</div>
										</div>
										
										<table class="table">
											<thead>
												<tr class="filters">
													<th><input type="text" class="form-control"
														placeholder="Store Name" disabled></th>
													<th><input type="text" class="form-control"
														placeholder="Store Subway" disabled></th>
													<th></th>													
												</tr>
											</thead>
											<tbody id="storebody">	</tbody>
										</table>
									</div>
								</div>
							</div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

							<div class="tab-pane" id="timeselect">
								<h3 class="head text-center">Select Date, Time</h3>
								<form id=timeform name=timeform>
								<p class="reser_select_detail" id="time_store_name">									
									</p>
									<p class="reser_select_detail">Date <input type="text" id="reservation_date" name="reservation_date" class="datePicker" required="required"/></p>
									
									<p class="reser_select_detail">Time
									<select name="reservation_time" id="reservation_time" data-native-menu="false" data-mini="true" required="required">
							        	 <option value="1">8:00 ~ 10:00</option>
							        	 <option value="2">10:00 ~ 12:00</option>
							        	 <option value="3">12:00 ~ 14:00</option>
							        	 <option value="4">14:00 ~ 16:00</option>
							        	 <option value="5">16:00 ~ 18:00</option>
							        	 <option value="6">18:00 ~ 20:00</option>
							        	 <option value="7">20:00 ~ 22:00</option>
							    	</select>
							    	</p>
							    	
							    	<input type="hidden" id="time_store_number" name="time_store_number" readonly>
							    	
							    	<!-- <p class="reser_select_detail">Store
									<input type="hidden" id="time_store_number" name="time_store_number" readonly>
									</p> -->
									
									
									
									<input id="reser_next" type="button" value="NEXT" onclick='javascript: timeseatlist(this.form)' class='btn btn-success'>
								</form>
							</div>

							<div class="tab-pane" id="messages">
								<h3 class="head text-center">first select STORE name, Date, Time  </h3>
								
							</div>
							<div class="tab-pane" id="final">
								<h3 class="head text-center">first select seat and reserve</h3>
								
							</div>
							
	<!-- <div class="layer">
		<div class="bg"></div>
		<div id="layer4" class="sdetailpop-layer">
			<div class="pop-container">
				<div class="pop-conts">
				
					<table id="storedetail" border="1px solid white">
							<tr>								
								<td height="480"  id="detail_img" colspan="2" rowspan="8" ></td>
								<td height="60" width="120" id="tabletitle">매장번호</td>
								<td height="60" width="180" id="detail_num"></td>
							</tr>							
							<tr>
								<td height="60"  id="tabletitle">매장명</td>
								<td height="60"  id="detail_name"></td>
							</tr>
							<tr>
								<td height="60" id="tabletitle">전화번호</td>
								<td height="60" id="detail_phone"></td>
							</tr>
							<tr>
								<td height="60" id="tabletitle">주소</td>
								<td height="60" id="detail_addr"></td>
							</tr>							
							<tr>
								<td height="60" id="tabletitle">지하철역</td>
								<td height="60" id="detail_subway"></td>
							</tr>
							<tr>
								<td height="60" id="tabletitle">매장위도</td>
								<td height="60" id="detail_lat"></td>
							</tr>
							<tr>
								<td height="60" id="tabletitle">매장경도</td>
								<td height="60" id="detail_lng"></td>
							</tr>
							<tr>
								<td height="60" id="tabletitle">고유번호</td>
								<td height="60" id="detail_master_number"></td>
							</tr>	
							<tr>
								<td height="60" id="tabletitle">매장설명</td>
								<td><textarea rows="5" cols="70" name="store_desc"></textarea></td>
								<td height="60" id="detail_desc"></td>
								<td height="60" id="tabletitle">점주 ID</td>
								<td height="60" id="detail_owner_id"></td>						
								
							</tr>
							<tr>
								<td colspan="4" align="center"><a class="btn-r"> <a href="#"   class="cbtn">닫기</a></td> 							
							</tr>
						</table>
				

				</div>
				
			</div>
		</div>
	</div> -->
							
<!--   //////////////////////////////////////////////////////////////////////////////////////////////  -->
					<div class="layer">
		<div class="bg"></div>
		<div id="layer2" class="pop-layer-reser">
			<div class="pop-container">
				<div class="pop-conts">
					<form id='reservationform' enctype="multipart/form-data">
						<table id="reservationformtable">
						
<tr class="reser_confirm_table_tr">
	<td class="reser_confirm_table">CUSTOMER ID</td>
	<td><input class="reser_confirm_table_input" id ='table_customer_id' type='text' name='table_customer_id' value=''  readonly></td>
	<td rowspan="6" class="reser_confirm_table"><img id="table_seat_img" src="" width="350px" height="250px" align="center"></td>
</tr>
<tr class="reser_confirm_table_tr">
	<td class="reser_confirm_table">STORE NUMBER</td>
	<td><input class="reser_confirm_table_input" id ='table_store_number' type='text' name='table_store_number' value=''  readonly></td>
</tr>
<tr class="reser_confirm_table_tr">
	<td class="reser_confirm_table">SEAT NUMBER</td>
	<td><input class="reser_confirm_table_input" id ='table_seat_number' type='text' name='table_seat_number' value=''  readonly></td>
</tr>
<tr class="reser_confirm_table_tr">
	<td class="reser_confirm_table">DATE</td>
	<td><input class="reser_confirm_table_input" id='table_reservation_date' type='text' name='table_reservation_date' value=''  readonly></td>
</tr>
<tr class="reser_confirm_table_tr">
	<td class="reser_confirm_table">TIME</td>
	<td><input class="reser_confirm_table_input" id='table_reservation_showtime' type='text' name='table_reservation_showtime' value=''  readonly></td>
</tr>
<tr class="reser_confirm_table_tr">
	<td class="reser_confirm_table">LOCATION</td>
	<td><input class="reser_confirm_table_input" id='table_seat_location' type='number' name='table_seat_location' value='' readonly></td>
</tr>
<tr class="reser_confirm_table_tr">
	<td colspan='3' align='center'><!--  class='cbtn'    -->
	<input class='btn btn-success' type="button" onclick='javascript: reservationregister(this.form)' value='RESERVATION'></td>
</tr>				
						</table>
<input class="reser_confirm_table_input" id='table_reservation_time' type='hidden' name='table_reservation_time' value=''  readonly>

					</form>
				</div>
				<!--// content-->
			</div>
		</div>
	</div>
				
							
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<div class="tab-pane" id="time_seat_list">
						
								<div class="text-center">
									<i class="img-intro icon-checkmark-circle"></i>
								</div>
								<h3 class="head text-center">
									SEAT LIST</h3>
										<center>
			<form id = "store_time_seat_list">
			<table border='1'id="store_time_seat_table" width="500px" height="500px">
		<tr align="center">
				<td class="00"><input type="button" class="seatbutton" id="00" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="01"><input type="button" class="seatbutton" id="01" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="02"><input type="button" class="seatbutton" id="02" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="03"><input type="button" class="seatbutton" id="03" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="04"><input type="button" class="seatbutton" id="04" value=""
						onclick="reserseat('layer2', id);return false;"></td>
</tr>
<tr align="center">
				<td class="10"><input type="button" class="seatbutton" id="10" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="11"><input type="button" class="seatbutton" id="11" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="12"><input type="button" class="seatbutton" id="12" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="13"><input type="button" class="seatbutton" id="13" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="14"><input type="button" class="seatbutton" id="14" value=""
						onclick="reserseat('layer2', id);return false;"></td>
</tr>
<tr align="center">
				<td class="20"><input type="button" class="seatbutton" id="20" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="21"><input type="button" class="seatbutton" id="21" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="22"><input type="button" class="seatbutton" id="22" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="23"><input type="button" class="seatbutton" id="23" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="24">  <input type="button" class="seatbutton" id="24" value=""
						onclick="reserseat('layer2', id);return false;"></td>
</tr>
<tr align="center">
				<td class="30"><input type="button" class="seatbutton" id="30" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="31"> <input type="button" class="seatbutton" id="31" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="32"><input type="button" class="seatbutton" id="32" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="33"><input type="button" class="seatbutton" id="33" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="34"><input type="button" class="seatbutton" id="34" value=""
						onclick="reserseat('layer2', id);return false;"></td>
</tr>
<tr align="center">
				<td class="40"><input type="button" class="seatbutton" id="40" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="41"><input type="button" class="seatbutton" id="41" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="42"><input type="button" class="seatbutton" id="42" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="43"><input type="button" class="seatbutton" id="43" value=""
						onclick="reserseat('layer2', id);return false;"></td>
				<td class="44"><input type="button" class="seatbutton" id="44" value=""
						onclick="reserseat('layer2', id);return false;"></td>
			</tr>
			
			</table>
			</form>
						</center>
							</div>
							
							
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<div class="clearfix"></div>
							
							


<div class="tab-pane" id="realfinal">
						
		<div class="text-center">
			<i class="img-intro icon-checkmark-circle"></i>
		</div>
		REGISTER OK! Please Check My Reservation
		
</div>







<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->



							
						</div>

					</div>
				</div>
			</div>
		</section>
	</div>
</div>
