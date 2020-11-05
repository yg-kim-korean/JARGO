<%@page import="jargo.vo.AdminVO"%>
<%@page import="jargo.vo.OwnerVO"%>
<%@page import="jargo.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>JARGO</title>
		<meta charset=utf-8>
        <meta name="description" content="Restaurant Website and Gallery Template with jQuery and Google Maps" />
        <meta name="keywords" content="jquery, gallery, images, css3, html5, photography, website, template, google maps, sliding, background"/>
		<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
        
        <!-- css -->
        <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
		<link href='http://fonts.googleapis.com/css?family=Terminal+Dosis+Light' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow&v1' rel='stylesheet' type='text/css' />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300&v2' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
		   
		<link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'/> 
		
		
		<!-- CSS files -->
        <link href="css/layout.css" rel="stylesheet" />

 		
 		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
		
		<link href="css/reservation.css" rel="stylesheet" type="text/css" />
		
	    <link href="css/tableallset.css" rel="stylesheet" />
	    <link href="css/boardsetting.css" rel="stylesheet" />
	    
	    
	    
	    

		<!-- css-->

		<!-- script -->
		<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
		<script type="text/javascript" src="js/jquery.vaccordion.js"></script>
		<!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- liteAccordion jQuery library -->
        <script src="js/liteaccordion.jquery.js"></script>
       
        <!--  jquery ajax file upload -->
        <script src="js/jquery.form.js"></script>
		
		<!-- About us slide js-->
		<script src="js/jQuery.slide.js"></script>	
		<!--  -->
		
		
		<script>
				$(function() {
					$('#va-accordion').vaccordion({
						visibleSlices	: 5,
						expandedHeight	: 250,
						animOpacity		: 0.5,
						contentAnimSpeed: 100
					});

				}); 
		</script>
			<!-- -->
			 
			 <script>
			   $(document).ready(function() {
			      $('#js_version').liteAccordion({
			         theme : 'dark',
			         rounded : true, // square or rounded corners
			         enumerateSlides : false, // put numbers on slides
			         firstSlide : 1,
			         linkable : true, //false로 해놓으면 화살표 안먹음
			         easing : 'easeInOutSine',
			         containerWidth : 1280, // fixed (px)
			         containerHeight : 600, // fixed (px)
			         autoPlay : false, // automatically cycle through slides
			         pauseOnHover :false // pause on hover
			      //cycleSpeed : 6000, // time between slide cycles
			      //   easing : 'swing' // custom easing function
			      //headerWidth: 48,                        // fixed (px)
			      //slideSpeed : 1200 ,                      // slide animation speed
			      //activateOn : 'click'                   // click or mouseover
			      });
			   });
			   
			   
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
	    			     yearRange:'1988:+0', // 연도 셀렉트 박스 범위(현재와 같으면 1988~현재년)
	    			     showMonthAfterYear: true, //년 뒤에 월 표시
	    			     buttonImageOnly: true, //이미지표시  
	    			     buttonText: '날짜를 선택하세요', 
	    			     autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
	    			        			         
	    			  });
	    			 });

	    		<!--달력-->
			</script>
        
			
		
		<!-- -->
		<%
		CustomerVO customer = (CustomerVO)session.getAttribute("loginuser");
		OwnerVO owner = (OwnerVO)session.getAttribute("loginuser1");
		AdminVO admin = (AdminVO)session.getAttribute("loginuser2");
		%>
	<%
	if(customer==null){
		if(owner==null){
			if(admin==null){%>
					<script type="text/javascript">
						$(function(){ 
		    				$('#go').click(); 
						});  
					</script>
	<%}}}%>
			 

    	<script type="text/javascript">
    		function signup(f) {
    			var pwd = f.customer_pwd.value;
    			var reenterpwd = f.reenterpwd.value;

    			if(pwd != reenterpwd) {
    				alert("pwd error");
    				f.customer_pwd.value = "";
    				f.reenterpwd.value= "";
    				f.customer_pwd.focus();
    				return false;
    				
    			} else {
    				f.method = "POST";
    				f.action = "registerImpl.jargo";
    				f.submit("main.jsp");
    			}
    		}
    	</script>
    	
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
    				f.action = "modifyImpl.jargo";
    				f.method = "POST";
    				f.submit();

    			}
    		}
    		
    		function update_o(o) {
    			var pwd = o.owner_pwd.value;
    			var reenterpwd = o.reenterpwd.value;

    			if(pwd != reenterpwd) {
    				alert("pwd error");
    				o.owner_pwd.value = "";
    				o.reenterpwd.value= "";
    				o.owner_pwd.focus();
    				return false;
    				
    			} else {
    				o.action = "modifyimpl_owner.jargo";

    				o.method = "POST";
    				o.submit();
    			}
    		}
    	</script>
    	
    	
    	
    </head>
    
    	
			<script type="text/javascript">
				function menu(idx){
					var m = $('.menu_detail');
					$(m).not(m[idx]).hide();
					$(m[idx]).show();
				};
			</script>




    <body>

    
  <!-- -->       
         <a id="go" href="#myLogo" data-toggle="modal" data-target=".logo"></a>
   	
    
    <div id="myLogo"class="modal fade logo" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    	<div class="modal-dialog modal-sm">
    	<div class="modal-body">
    	<div class="tab-pane fade active in" id="logo">
    		<img src="images/logo.png">
    	</div>
    	</div>
    	</div>
    </div>
    
    

<!-- -->       

<!-- -->
	<div class="modal fade bs-modal-lo" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
 		<jsp:include page="onlyLogin.jsp" />
	</div>
	
	<div class="modal fade bs-modal-re" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<jsp:include page="onlyRegister.jsp" />
	</div>	
	
	<%if(customer!=null){ %>
	<div class="modal fade bs-modal-up" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<jsp:include page="onlyUpdate.jsp" />
	</div>	 <%}%>
	
	<%if(owner!=null){ %>
	<div class="modal fade bs-modal-up-o" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<jsp:include page="onlyUpdate1.jsp" />
	</div>	 <%}%>
	

	
	
	
   <!---->

				
   

   			<%-- <jsp:include page='left.jsp' /> --%>
   			<%-- <jsp:include page='ownerleft.jsp' /> --%>

   			<jsp:include page="${view.left}" />

   	
			<jsp:include page="${view.foot}" />
		<!-- The JavaScript -->
		
		<script type="text/javascript" src="js/jquery.template.min.js"></script>
    </body>
</html>