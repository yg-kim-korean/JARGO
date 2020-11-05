<%@page import="jargo.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	CustomerVO customer = (CustomerVO) session.getAttribute("loginuser");
%>

<script type="text/javascript">
function getStoreNumber(){
	$.ajax({
		url: "getstores.jargo",
		dataType: "json",
		success:function(data){
			var output="";
			$.each(data,function(index, item){
				output+= "<option value='"+item.store_number+"'>"+item.store_name+"</option>";
			});
			$("#store_number").empty();
			$("#store_number").append(output);
		}
		});
	}
	function writeCheck(f) {
		var option = {
				url:"writeImpl.jargo",
			    type : "post",
			    data : $("#writeform").serialize(),
			    success : function(data) {
			    }
			};
		
		  $("#writeform").ajaxSubmit(option);
		  
		  alert("Writing success");
		  $.ajax({
				url: "board_list.jargo",
				dataType: "json",
				success:function(data){
					$("#board_body1").empty();
					$("#board_body2").empty();
					$.each(data,function(index, item){
						$("#board_body1").append("<tr>");
						$("#board_body1").append("<td width='1%'></td>");
						$("#board_body1").append("<td width='10%' align='center'><font color='white'>"+item.board_number+"</font></td>");
						$("#board_body1").append("<td width='40%' align='center'><a href='#' onclick=board_view("+item.board_number+");><font color='white'>"+item.board_title+"</font></a></td>");
						$("#board_body1").append("<td width='15%' align='center'><font color='white'>"+item.customer_id+"</font></td>");
						$("#board_body1").append("<td width='20%' align='center'><font color='white'>"+item.board_time+"</font></td>");
						$("#board_body1").append("<td width='15%' align='center'><font color='white'>"+item.store_number+"</font></td>");
						$("#board_body1").append("<td width='1%'></td>");
						$("#board_body1").append("</tr>");
					});
				},
				error:function(){
					alert('error');
				}
			});
		
	}
</script>

 <script type="text/javascript">
	function boardWrite(el, value) {
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('board_bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		if (bg) {
			$('.board_layer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
			$("#location").prop("value" , value) ;  //좌석 위치정보를 팝업div로 넘긴다.
		} else {
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
				$('.board_layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			} else {
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.board_layer .board_bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.board_layer').fadeOut();
			e.preventDefault();
		});
		$('#writeclick').click(function(e) {
			$('.board_layer').fadeOut();
			e.preventDefault();
		});

	}
</script>

	<div class="board_layer">
		<div class="board_bg"></div>
		<div id="layer3" class="board_pop-layer">
			<div class="board_pop-container">
				<!-- <div class="board_pop-conts"> -->
					<table id="boardsetting">
						<form id="writeform" enctype="multipart/form-data">
							<tr>
								<td>
									<table width="100%">
										<tr style="height:50px; text-align: center; font-weight:bold; font-size: 2em;">
											<td><font color="white">W R I T E</font></td>
										</tr>
									</table>
									<table width="100%">
										<tr>
										<td align="center"><font color="white">Title</font></td>
										<td><input type="text" name="board_title" id="board_title" style="width:100%; background-color:transparent; color: white;"></td>
									</tr>
									<tr>
										<td align="center"><font color="white">Customer ID</font></td>
										<td>
											<input name="customer_id" class="boardtext" value="<%=customer.getCustomer_id() %>" 
											style="width:100%; background-color:transparent; border: 0px; color: white;" readonly="readonly">
										</td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td align="center"><font color="white">Memo</font></td>
										<td><textarea name="board_memo" id="board_memo" style="background-color:transparent; color: white; border: 0px;" 
										class="boardtext" cols="70" rows="15"></textarea></td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr height="1" bgcolor="#82B5DF">
										<td colspan="4"></td>
									</tr>
									<tr>
										<td colspan="4" style="color: white;">
											Select Store &nbsp;&nbsp;&nbsp;
											<select id="store_number" name="store_number" style="color: black;">
												
											</select>
										</td>
									</tr>
									<tr height="1" bgcolor="#dddddd">
										<td colspan="4"></td>
									</tr>
									<tr height="1" bgcolor="#82B5DF">
										<td colspan="4"></td>
									<!-- <tr align="center"">
										<td colspan="2" style="border: 0xp;">
											<a href="#" id="writeclick" OnClick="javascript:writeCheck(this.form);">Write</a>
									</tr> -->
									</table>
									</td>
							</tr>
							<tr>
								<td style="height: 50px; border: 0px;">
									<a href="#" id="writeclick" OnClick="javascript:writeCheck(this.form);">Write</a>
								</td>
							</tr>
						</form>
					</table>
				<!-- </div> -->
				<!--// content-->
			</div>
		</div>
	</div>
