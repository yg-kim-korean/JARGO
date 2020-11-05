<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var uAgent = navigator.userAgent.toLowerCase();
				var mobilePhones = ['iphone' , 'ipod' , 'android' ] ;
				
				for(var i=0 ; i < mobilePhones.length ; i++) {
					if( uAgent.indexOf(mobilePhones[i]) != -1 ) {
						document.location.replace("mobilemain.jargo");
						break;
					}
					if( uAgent.indexOf(mobilePhones[i]) == -1 ) {
						document.location.replace("main.jargo");
						//document.location.replace("mobilemain.jargo");

					}
				}
 			});
		</script>
</head>
<body>

</body>
</html>