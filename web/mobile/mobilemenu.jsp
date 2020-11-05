<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<script>

	window.onload = ourme;	
		
	function ourme() {
		$.ajax({
					url : "menuall.jargo",
					dataType : "json",
					success : function(data) {
						var output1 = "";
						var output2 = "";
						var output3 = "";
						var output4 = "";
						var output5 = "";
						var ct1 = 1;
						var ct2 = 1;
						var ct3 = 1;
						var ct4 = 1;
						var ct5 = 1;
						$.each(data,function(index, item) {
											if (item.menu_category == "Steak") {
												output1 += "<li class='menu_click' ><a href='#steak"+ct1+"' data-rel='popup' >"
														+ item.menu_name
														+ "</a></li>";
											
												ct1++;
											} else if (item.menu_category == "Pasta") {
												output2 += "<li class='menu_click' ><a href='#pasta"+ct2+"' rel='external' >"
														+ item.menu_name
														+ "</a></li>";
											
												ct2++;
											} else if (item.menu_category == "Appetizer") {
												output3 += "<li class='menu_click' ><a href='#appetizer"+ct3+"' data-rel='popup' >"
														+ item.menu_name
														+ "</a></li>";
											
												ct3++;
											} else if (item.menu_category == "Salad") {
												output4 += "<li class='menu_click'><a href='#salad"+ct4+"' data-rel='popup' >"
														+ item.menu_name
														+ "</a></li>";
								
												ct4++;
											} else if (item.menu_category == "DessertBeverage") {

												output5 += "<li class='menu_click'><a href='#dessertBeverage"+ct5+"' data-rel='popup' >"
														+ item.menu_name
														+ "</a></li>";
		
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
						$("#Steak").listview("refresh");
						$("#Pasta").listview("refresh");
						$("#Appetizer").listview("refresh");
						$("#Salad").listview("refresh");
						$("#DessertBeverage").listview("refresh");
						$("#ourmenu").listview("refresh");
						getStores();
						mobilemenudetail();
						
					}
				});
	}


	function mobilemenudetail() {
		$.ajax({
			url : "menuall.jargo",
			dataType : "json",
			success : function(data) {
			var st1 = "";
			var st2 = "";
			var st3 = "";
			var st4 = "";
			var st5 = "";
			var ct1 = 1;
			var ct2 = 1;
			var ct3 = 1;	
			var ct4 = 1;
			var ct5 = 1;
			$.each(data,function(index, item) {
							if (item.menu_category == "Steak") {
								st1 += "<div data-role='popup' data-theme='a' id='steak"+ct1+"'><div class='menu_name'><h3>"
										+ item.menu_name
										+ "</h3></div><img class='menu_image' src=images/food/"+item.menu_img+"><div class='menu_desc'><p>"
										+ item.menu_desc + "</p></div></div>";
								ct1++;
							} else if (item.menu_category == "Pasta") {
								st2 += "<div data-role='popup' data-theme='a' class='ui-corner-all' id='pasta"+ct2+"'><div class='menu_name'><h3>"
										+ item.menu_name
										+ "</h3></div><img class='menu_image' src=images/food/"+item.menu_img+"><div class='menu_desc'><p>"
										+ item.menu_desc + "</p></div></div>";
								ct2++;
							} else if (item.menu_category == "Appetizer") {
								st3 += "<div data-role='popup' data-theme='a' class='ui-corner-all' id='appetizer"+ct3+"'><div class='menu_name'><h3>"
										+ item.menu_name
										+ "</h3></div><img class='menu_image' src=images/food/"+item.menu_img+"><div class='menu_desc'><p>"
										+ item.menu_desc + "</p></div></div>";
								ct3++;
							} else if (item.menu_category == "Salad") {
								st4 += "<div data-role='popup' data-theme='a' class='ui-corner-all' id='salad"+ct4+"'><div class='menu_name'><h3>"
										+ item.menu_name
										+ "</h3></div><img class='menu_image' src=images/food/"+item.menu_img+"><div class='menu_desc'><p>"
										+ item.menu_desc + "</p></div></div>";
								ct4++;
							} else if (item.menu_category == "DessertBeverage") {
								st5 += "<div data-role='popup' data-theme='a' class='ui-corner-all' id='dessertBeverage"+ct5+"'><div class='menu_name'><h3>"
										+ item.menu_name
										+ "</h3></div><img class='menu_image' src=images/food/"+item.menu_img+"><div class='menu_desc'><p>"
										+ item.menu_desc + "</p></div></div>";
								ct5++;
							}
						});
		$("#mainPage").append(st1);
		$("#mainPage").append(st2);
		$("#mainPage").append(st3);
		$("#mainPage").append(st4);
		$("#mainPage").append(st5);
		$("#mainPage").trigger('create');
			}
		
		});
	}
	
	function getStores(){
		$.ajax({
			url: "getstores.jargo",
			dataType: "json",
			success:function(data){
				
				$("#time_store_number").empty();
				$.each(data,function(index, item){
					$("#time_store_number").append($("<option value='"+item.store_number+"'>"+item.store_name+" ÁöÇÏÃ¶¿ª - "+item.store_subway+"</option>"));
				});
				$("#time_store_number").selectmenu('refresh', true);				
			}
			});
		}
</script>





<div data-role="collapsible" data-collapsed="true">
	<h1>Our Menu</h1>
	<ul data-role="listview" data-inset="true" data-theme="c"
		data-dividertheme="b" id="ourmenu">
		<li>
			<div data-role="collapsible" data-collapsed="true">
				<h1>Appetizer</h1>
				<ul data-role="listview" data-inset="true" data-theme="c"
					data-dividertheme="b" id="Appetizer">

				</ul>
			</div>
		</li>

		<li>
			<div data-role="collapsible" data-collapsed="true">
				<h1>Salad</h1>
				<ul data-role="listview" data-inset="true" data-theme="c"
					data-dividertheme="b" id="Salad">

				</ul>
			</div>
		</li>

		<li>
			<div data-role="collapsible" data-collapsed="true">
				<h1>Steak</h1>
				<ul data-role="listview" data-inset="true" data-theme="c"
					data-dividertheme="b" id="Steak">

				</ul>
			</div>
		</li>


		<li>
			<div data-role="collapsible" data-collapsed="true">
				<h1>Pasta</h1>
				<ul data-role="listview" data-inset="true" data-theme="c"
					data-dividertheme="b" id="Pasta">

				</ul>
			</div>
		</li>


		<li>
			<div data-role="collapsible" data-collapsed="true">
				<h1>Dessert & Beverage</h1>
				<ul data-role="listview" data-inset="true" data-theme="c"
					data-dividertheme="b" id="DessertBeverage">

				</ul>
			</div>
		</li>
	</ul>
</div>




