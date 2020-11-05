<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

	

	
<!-- tableseat setting 팝업창 script -->
<script type="text/javascript">

	
function ownerregister(s){
	var option = {
			url:"ownerregisterimpl.jargo",
		    type : "post",
		    //data : $("#form").serialize(),
		    success : function(data) {
		  	  alert("등록성공");
		    }
		   };
	  $("#form").ajaxSubmit(option);
	}
	
function storeregister(s){
	alert(s);
	alert($("store_name").val());
	var option = {
			url:"storeregisterimpl.jargo",
		    type : "post",
		    success : function(data) {
			  alert("등록성공");
		    }
		   };
	  $("#storeform").ajaxSubmit(option);
	}	
		
	
function menuregister(s){
	alert(s);
	var option = {
			url:"menuregisterimpl.jargo",
		    type : "post",
		    //data : $("#menuform").serialize(),
		    success : function(data) {
			  alert("등록성공");
		    }
		   };
	  $("#menuform").ajaxSubmit(option);
	}
	
	
function menuupdate(s){
	alert(s);
	alert("menuupdate함수 들어옴");
	var option = {
			url:"menuupdateimpl.jargo",
		    type : "post",
		    //data : $("#updateform").serialize(),
		    success : function(data) {
			  alert("등록성공");
			  menuall();
		    }
		   };
	  $("#updateform").ajaxSubmit(option);
	}
	
	
/* 	============================================================================== */

	function storepop(el) {
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		if (bg) {
			$('.storelayer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 			
			$("#store_number").val("");
			$("#store_name").val("");
			$("#store_phone").val("");
			$("#store_addr").val("");
			$("#store_desc").val("");
			$("#store_subway").val("");
			$("#store_lat").val("");
			$("#store_lng").val("");
			$("#owner_idstore").val("");
			$("#filestore").val("");
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
				$('.storelayer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			} else {
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.storelayer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.storelayer').fadeOut();
			e.preventDefault();
		});
	}
	


	function ownerpop(el) {
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		if (bg) {
			$('.ownerlayer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
			$("#owner_id").val("");
			$("#owner_pwd").val("");
			$("#owner_name").val("");
			$("#owner_phone").val("");
			$("#owner_position").val("");
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
				$('.ownerlayer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			} else {
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.ownerlayer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.ownerlayer').fadeOut();
			e.preventDefault();
		});
}
	
	
	function menupop(el) {
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		if (bg) {
			$('.menulayer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
			$("#menu_category").val("");
			$("#menu_name").val("");
			$("#menu_price").val("");
			$("#menu_desc").val("");
			$("#filemenu").val("");

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
				$('.menulayer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			} else {
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.menulayer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.menulayer').fadeOut();
			e.preventDefault();
		});
}

	
	
	
	
/* 	메뉴정보를 받아서 팝업창을 띄워주는 함수 */
	function menuselect(menu_number){
		$.ajax({
			url:"menuselect.jargo?menu_number=" + menu_number,
			dataType:"json",
			success:function(data){
				updatepop('layer4', data);
			},
			error : function(){
				alert("error");
			}
		});
	}
	
	
	function updatepop(el, item) {
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		if (bg) {
			$('.layer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
			$("#number").prop("value" , item.menu_number) ;  //좌석 위치정보를 팝업div로 넘긴다.
			$("#name").prop("value" , item.menu_name) ;  //좌석 위치정보를 팝업div로 넘긴다.
			$("#price").prop("value" , item.menu_price) ;  //좌석 위치정보를 팝업div로 넘긴다.
			$("#category").prop("value" , item.menu_category) ;  //좌석 위치정보를 팝업div로 넘긴다.
			$("#desc").prop("value" , item.menu_desc) ;  //좌석 위치정보를 팝업div로 넘긴다.
			$("#img").prop("value" , item.menu_img) ;  //좌석 위치정보를 팝업div로 넘긴다.

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
}
	
		
	
	

	function storelist(){
		$.ajax({
			url:"storelist.jargo",
			dataType:"json",
			success: function(data){
				$("#stolistbody").empty();
				$.each(data, function(index, item){
					$("#stolistbody").append("<tr>");
					$("#stolistbody").append("<td>" + item.store_number + "</td>");
					$("#stolistbody").append("<td>" + item.store_name + "</td>");
					$("#stolistbody").append("<td>" + item.store_phone + "</td>");
					$("#stolistbody").append("<td>" + item.store_addr + "</td>");
					$("#stolistbody").append("<td>" + item.store_subway + "</td>");
					$("#stolistbody").append("<td>" + item.owner_id + "</td>");
					$("#stolistbody").append("<td><a href='#' class='cbtn' onclick='storeselect(" + item.store_number + ")'>Detail</a></td>");
					$("#stolistbody").append("<td><a href='#' class='cbtn' onclick='storedelete(" + item.store_number + ")'>Delete</a></td>");
					$("#stolistbody").append("</tr>");
				});
			},
			error : function(){
				alert("error");
			}
		});
	}
	
	function storedelete(store_number){
		alert("선택하신 매장을 폐업시키기겠습니까?");		
		$.ajax({
			url:"storedeleteimpl.jargo?store_number="+store_number,
			success: function(data){
				alert("삭제성공");
				storelist();
			},
			error : function(){
				alert("error");
			}
		});	
	}
	function ownerdelete(owner){
		var owner_id=owner;
		alert("해당 ID를 삭제시키기겠습니까?");				
		$.ajax({
			url:"ownerdeleteimpl.jargo?owner_id="+owner_id,
			success: function(data){
				alert("삭제성공");
				ownerlist();
			},
			error : function(){
				alert("error");
			}
		});	
	}
	
	
	function menudelete(menu_number) {
		alert(menu_number);
		alert("해당 메뉴를 삭제하시겠습니까?");		
		$.ajax({
			url : "menudeleteimpl.jargo?menu_number=" + menu_number,
			success : function(data) {
				alert("삭제성공");
				menuall();
			},
			error : function() {
				alert("error");
			}
		});
	}
	
	
	
	function ownerlist() {
		$.ajax({
			url : "ownerlist.jargo",
			dataType : "json",
			success : function(data) {
				$("#ownlistbody").empty();
				$.each(data, function(index, item) {
					$("#ownlistbody").append("<tr>");
					$("#ownlistbody").append("<td>" + item.owner_id + "</td>");
					$("#ownlistbody")
							.append("<td>" + item.owner_name + "</td>");
					$("#ownlistbody").append(
							"<td>" + item.owner_phone + "</td>");
					$("#ownlistbody").append(
							"<td>" + item.owner_position + "</td>");					
					$("#ownlistbody").append(
							"<td><a href='#' class='cbtn' onclick=ownerdelete('"
									+ item.owner_id + "')>삭제</a></td>");
					$("#ownlistbody").append("</tr>");
				});
			},
			error : function() {
				alert("error");
			}
		});
	}
	
	
	
	/* 	매장정보를 받아서 팝업창을 띄워주는 함수 */
	function storeselect(store_number){
		$.ajax({
			url:"storeselect.jargo?store_number=" + store_number,
			dataType:"json",
			success: function(data){
				detailpop('layer5', data);
			},
			error : function(){
				alert("error");
			}
		});
	}
	
	
	function detailpop(el, item) {
		alert("이미지파일" + item.store_img);
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		if (bg) {			
			$('.sdetaillayer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
			$("#detail_num").text(item.store_number);
			$("#detail_img").empty();
			$("#detail_img").append("<img width='600' height='460' src='images/store/" + item.store_img + "'>");
			$("#detail_name").text(item.store_name);
			$("#detail_phone").text(item.store_phone);
			$("#detail_addr").text(item.store_addr);
			$("#detail_subway").text(item.store_subway);
			$("#detail_lat").text(item.store_lat);
			$("#detail_lng").text(item.store_lng);
			$("#detail_master_number").text(item.master_number);
			$("#detail_owner_id").text(item.owner_id)	;
			$("#detail_desc").text(item.store_desc);
			
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
				$('.sdetaillayer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			} else {
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.sdetaillayer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.sdetaillayer').fadeOut();
			e.preventDefault();
		});
}
	
	
	
	

	/* 	============================================================================== */

	var dataValue;
	function menuall() {
		$
				.ajax({
					url : "menuall.jargo",
					dataType : "json",
					success : function(data) {
						dataValue = data;
						var output1 = "";
						var count1 = "0";
						var output2 = "";
						var count2 = "4";
						var output3 = "";
						var count3 = "8";
						var output4 = "";
						var count4 = "12";
						var output5 = "";
						var count5 = "16";
						var ct1 = 1;
						var ct2 = 1;
						var ct3 = 1;
						var ct4 = 1;
						var ct5 = 1;
						$.each(data, function(index, item) {
						
											if (item.menu_category == "Steak") {
												output1 += "<li class='menu_click' id='steak"+ct1+"'><a href='#' onclick='menu("
														+ count1
														+ ");'>"
														+ item.menu_name
														+ "</a></li>";
												count1++;
												ct1++;
											} else if (item.menu_category == "Pasta") {
												output2 += "<li class='menu_click' id='pasta"+ct2+"'><a href='#' onclick='menu("
														+ count2
														+ ");'>"
														+ item.menu_name
														+ "</a></li>";
												count2++;
												ct2++;
											} else if (item.menu_category == "Appetizer") {
												output3 += "<li class='menu_click' id='appetizer"+ct3+"'><a href='#' onclick='menu("
														+ count3
														+ ");'>"
														+ item.menu_name
														+ "</a></li>";
												count3++;
												ct3++;
											} else if (item.menu_category == "Salad") {
												output4 += "<li class='menu_click' id='salad"+ct4+"'><a href='#' onclick='menu("
														+ count4
														+ ");'>"
														+ item.menu_name
														+ "</a></li>";
												count4++;
												ct4++;
											} else if (item.menu_category == "DessertBeverage") {
												output5 += "<li class='menu_click' id='dessertBeverage"+ct5+"'><a href='#' onclick='menu("
														+ count5
														+ ");'>"
														+ item.menu_name
														+ "</a></li>";
												count5++;
												ct5++;
											}
										});

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
		st1+="<table class='menu_detail' id='steak"+ct1+"_detail'><tr><td rowspan='4' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='90'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='90'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='290'>"+item.menu_desc+"</td></tr><tr><td height='30'><a href='#' onclick=menuselect("+ item.menu_number+ ") class='cbtn'>Modify</a><a href='#' onclick=menudelete('"+ item.menu_number+ "') class='cbtn'>Delete</a></td></tr></table>";   
		         ct1++;
		         }         
		         else if(item.menu_category=="Pasta"){
		st2+="<table class='menu_detail' id='pasta"+ct2+"_detail'><tr><td rowspan='4' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='90'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='90'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='290'>"+item.menu_desc+"</td></tr><tr><td height='30'><a href='#' onclick=menuselect("+ item.menu_number+ ") class='cbtn'>Modify</a><a href='#' onclick=menudelete('"+ item.menu_number+ "') class='cbtn'>Delete</a></td></tr></table>";            ct2++;
		         }
		         else if(item.menu_category=="Appetizer"){
		st3+="<table class='menu_detail' id='appetizer"+ct3+"_detail'><tr><td rowspan='4' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='90'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='90'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='290'>"+item.menu_desc+"</td></tr><tr><td height='30'><a href='#' onclick=menuselect("+ item.menu_number+ ") class='cbtn'>Modify</a><a href='#' onclick=menudelete('"+ item.menu_number+ "') class='cbtn'>Delete</a></td></tr></table>";            ct3++;   
		         }
		         else if(item.menu_category=="Salad"){
		st4+="<table class='menu_detail' id='salad"+ct4+"_detail'><tr><td rowspan='4' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='90'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='90'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='290'>"+item.menu_desc+"</td></tr><tr><td height='30'><a href='#' onclick=menuselect("+ item.menu_number+ ") class='cbtn'>Modify</a><a href='#' onclick=menudelete('"+ item.menu_number+ "') class='cbtn'>Delete</a></td></tr></table>";            ct4++;
		         }
		         else if(item.menu_category=="DessertBeverage"){
		st5+="<table class='menu_detail' id='dessertBeverage"+ct5+"_detail'><tr><td rowspan='4' width='550' height='500'><img class='menu_image' src=images/food/"+item.menu_img+"></td><td class='menu_name' height='90'><h3>"+item.menu_name+"</h3></td><tr><td class='menu_price' height='90'>"+item.menu_price+"원</td></tr><tr><td class='menu_desc' height='290'>"+item.menu_desc+"</td></tr><tr><td height='30'><a href='#' onclick=menuselect("+ item.menu_number+ ") class='cbtn'>Modify</a><a href='#' onclick=menudelete('"+ item.menu_number+ "') class='cbtn'>Delete</a></td></tr></table>";            ct5++;
		         }         
		         });   
		      $(".bf_menu_detail").empty();
		      $(".bf_menu_detail").append(st1);
		      $(".bf_menu_detail").append(st2);
		      $(".bf_menu_detail").append(st3);
		      $(".bf_menu_detail").append(st4);
		      $(".bf_menu_detail").append(st5);
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
			<li><a href="#" onclick="storepop('layer1')"><span class="bf_hover"></span><span>Store Register</span></a></li>
			<li><a href="#" data-content="storelist"  onclick="storelist()"><span class="bf_hover"></span><span>Store List</span></a></li>
			<li><a href="#" onclick="ownerpop('layer2')"><span class="bf_hover"></span><span>Owner Register</span></a></li>
			<li><a href="#" data-content="ownerlist" onclick="ownerlist()"><span class="bf_hover"></span><span>Owner List</span></a></li>
			<li><a href="#" onclick="menupop('layer3')" ><span class="bf_hover"></span><span>New Menu Register</span></a></li>
			<li><a href="#" data-content="menu" onclick="menuall();" ><span class="bf_hover"></span><span>Our Menu</span></a></li>
		</ul>
	</div>
	
	
	<!-- owner등록 popup========================================================= -->
	<div class="ownerlayer">
		<div class="bg"></div>
		<div id="layer2" class="ownerpop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<form name="form" id="form" method="POST">
					<table id="ownersetting">
							<tr>
								<td id="tabletitle">점주 ID</td>
								<td><input type="text" id="owner_id" name="owner_id" style="width: 50%" ></td>
							</tr>
							<tr>
								<td id="tabletitle">password</td>
								<td><input type="password" id="owner_pwd" name="owner_pwd"  style="width: 50%" ></td>
							</tr>
							<tr>
								<td id="tabletitle">이름</td>
								<td><input type="text" id="owner_name" name="owner_name" style="width: 50%"></td>
							</tr>
							<tr>
								<td id="tabletitle">전화번호</td>
								<td><input type="text" id="owner_phone" name="owner_phone"	style="width: 50%"></td>
							</tr>
							<tr>
								<td id="tabletitle">직책</td>
								<td><input type="text" id="owner_position" name="owner_position"  style="width: 50%" ></td>
							</tr>
							
							<tr>
								<td colspan="2" align="center"><a class="btn-r"> <a
										href="#"  onclick="javascript: ownerregister(this.form)"  class="cbtn">등록하기</a></td> 
										<!-- <td colspan="2" align="center"><input type="submit" value="등록하기"></td> -->
							</tr>
						</table>
					</form>

				</div>
				<!--// content-->
			</div>
		</div>
	</div>
	<!-- owner등록 popup 끝========================================================= -->
	



 <!-- store등록 popup창 ============================================================-->
	<div class="storelayer">
		<div class="bg"></div>
		<div id="layer1" class="storepop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<form name="storeform" id="storeform" method="POST" enctype="multipart/form-data">
					<table id="storesetting">
							<tr>
								<td id="tabletitle">매장번호</td>
								<td><input type="text" id="store_number" name="store_number" style="width: 30%" ></td>
							</tr>							
							<tr>
								<td id="tabletitle">매장명</td>
								<td><input  type="text" id="store_name" name="store_name" style="width: 30%" ></td>
							</tr>
							<tr>
								<td id="tabletitle">전화번호</td>
								<td><input  type="text" id="store_phone" name="store_phone"	style="width: 30%" ></td>
							</tr>
							<tr>
								<td id="tabletitle">주소</td>
								<td><input type="text" id="store_addr" name="store_addr" style="width: 100%" ></td>
							</tr>
							<tr>
								<td id="tabletitle">매장설명</td>
								<!-- <td><textarea rows="5" cols="70" name="store_desc"></textarea></td> -->
								<td><input type="text" id="store_desc"  name="store_desc" style="width: 100%" ></td>
							</tr>
							<tr>
								<td id="tabletitle">지하철역</td>
								<td><input type="text" id="store_subway" name="store_subway" style="width: 30%" ></td>
							</tr>
							<tr>
								<td id="tabletitle">매장위도</td>
								<td><input type="text" id="store_lat"  name="store_lat" style="width: 20%" ></td>
							</tr>
							<tr>
								<td id="tabletitle">매장경도</td>
								<td><input type="text" id="store_lng"  name="store_lng" style="width: 20%" ></td>
							</tr>
							<tr>
								<td id="tabletitle">고유번호</td>
								<td><input type="text" id="master_number"  name="master_number" value=1 style="width: 20%" readonly></td>
							</tr>	
							<tr>
								<td id="tabletitle">점주 ID</td>
								<td><input type="text" id="owner_idstore" name="owner_id"
									style="width: 30%" ></td>
							</tr>						
							<tr>
								<td id="tabletitle">사진첨부</td>
								<td><input id="filestore" type="file" name="file"></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><a class="btn-r"> <a
										href="#"  onclick="javascript: storeregister(this.form)" class="cbtn">등록하기</a></td> 
							<!-- <td colspan="2" align="center"><input type="submit" value="등록하기"></td> -->
							</tr>
						</table>
					</form>

				</div>
				
			</div>
		</div>
	</div>
 <!-- store등록 popup창 끝============================================================-->
 
 
 
 
 <!-- storedetail popup창 ============================================================-->
	<div class="sdetaillayer">
		<div class="bg"></div>
		<div id="layer5" class="sdetailpop-layer">
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
								<!-- <td><textarea rows="5" cols="70" name="store_desc"></textarea></td> -->
								<td height="60" id="detail_desc"></td>
								<td height="60" id="tabletitle">점주 ID</td>
								<td height="60" id="detail_owner_id"></td>						
								
							</tr>
							<tr>
								<td colspan="4" align="center"><a class="btn-r"> <a
										href="#"   class="cbtn">닫기</a></td> 							
							</tr>
						</table>
				

				</div>
				
			</div>
		</div>
	</div>
 <!-- storedetail popup창 끝============================================================-->
 
 
 
 
 <!-- menu등록 popup창 ============================================================-->
	<div class="menulayer">
		<div class="bg"></div>
		<div id="layer3" class="menupop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<form name="menuform" id="menuform" method="POST"	enctype="multipart/form-data">
						<table id="menusetting">
							<tr>
								<td id="tabletitle">카테고리</td>
								<td><select id="menu_category" name="menu_category">
										<option value="Appetizer">Appetizer
										<option value="Salad">Salad
										<option value="Steak">Steak
										<option value="Pasta">Pasta
										<option value="DessertBeverage">Dessert & Beverage
								</select></td>
							</tr>
							<tr>
								<td id="tabletitle">메뉴이름</td>
								<td><input type="text" id="menu_name" name="menu_name" style="width: 100%"></td>
							</tr>
							<tr>
								<td id="tabletitle">가격</td>
								<!-- <td><textarea rows="5" cols="70" name="store_desc"></textarea></td> -->
								<td><input type="text" id="menu_price" name="menu_price"  style="width: 30%"></td>
							</tr>
							<tr>
								<td id="tabletitle">메뉴정보</td>
								<td><input type="text" id="menu_desc"name="menu_desc" style="width: 100%"></td>
							</tr>
							<tr>
								<td id="tabletitle">사진첨부</td>
								<td><input type="file" id="filemenu" name="file"></td>
							</tr>

							<tr>
								<td  colspan="2" align="center"><a class="btn-r"> <a
										href="#" onclick="javascript: menuregister(this.form)"
										class="cbtn">등록하기</a></td>		
													
							</tr>
						</table>
					</form>
				</div>				
			</div>
		</div>
	</div>
 <!-- menu등록 popup창 끝============================================================-->
 
 
 
 
 <!-- menu수정 popup창 ============================================================-->
	<div class="layer">
		<div class="bg"></div>
		<div id="layer4" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<form name="updateform" id="updateform" method="POST"	enctype="multipart/form-data">
						<table id="menusetting">
						<input id="number" type="hidden" name="menu_number" >
						<input id="img" type="hidden" name="menu_img" >
						
							<tr>
								<td id="tabletitle">카테고리</td>
								<td><select id="category" name="menu_category">
										<option value="Appetizer">Appetizer
										<option value="Salad">Salad
										<option value="Steak">Steak
										<option value="Pasta">Pasta
										<option value="DessertBeverage">Dessert & Beverage
								</select></td>
							</tr>
							<tr>
								<td id="tabletitle">메뉴이름</td>
								<td><input id="name" type="text" name="menu_name" style="width: 100%"></td>
							</tr>
							<tr>
								<td id="tabletitle">가격</td>
								<!-- <td><textarea rows="5" cols="70" name="store_desc"></textarea></td> -->
								<td><input id="price" type="text" name="menu_price"  style="width: 30%"></td>
							</tr>
							<tr>
								<td id="tabletitle">메뉴정보</td>
								<td><input id ="desc"  type="text" name="menu_desc" style="width: 100%"></td>
							</tr>
							<tr>
								<td id="tabletitle">사진첨부</td>
								<td><input type="file" name="file"></td>
							</tr>

							<tr>
								<td colspan="2" align="center"><a class="btn-r"> <a
										href="#"  onclick="javascript: menuupdate(this.form)" class="cbtn">Modify</a></td>							
							</tr>
						</table>
					</form>
				</div>				
			</div>
		</div>
	</div>
 <!-- menu수정 popup창 끝============================================================-->
  
 
 
	

<!-- 매장 LIST 출력 ==================================================================-->
	<div class="bf_page" id="storelist">
		<div class="bf_content_text_owner">
			<h2>Store List</h2>
			<form style="overflow-y:scroll; height: 650px;">
			<table  id="tablestlist" >
				<tr>
				<th>매장번호</th>
				<th>매장명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>지하철역</th>
				<th>담당점주ID</th>
				<th>상세보기</th>
				<th>삭제</th>								
				</tr>
				<tbody id="stolistbody"></tbody>
			</table>			
			</form>
		</div>
	</div>
<!-- 매장 LIST 출력 끝==================================================================-->



<!-- 점주 LIST 출력 ==================================================================-->
	<div class="bf_page" id="ownerlist">
		<div class="bf_content_text_owner">
			<h2>Owner List</h2>
			<form style="overflow-y:scroll; height: 650px;">
			<table id="tableownlist">
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>직책</th>					
					<th>삭제</th>
				</tr>
				<tbody id="ownlistbody"></tbody>
			</table>
			</form>
		</div>
	</div>
<!-- 점주 LIST 출력 끝==================================================================-->


			
<!-- =========MENU START=========================================================== -->
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
<!-- =====MENU END======================================================== -->



	