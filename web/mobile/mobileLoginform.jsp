<%@ page 	language="java" 
					contentType="text/html; charset=EUC-KR"
    				pageEncoding="EUC-KR" %>

		<script type="text/javascript">
			function logingo(f){
				f.action="loginimpl.jargo?mobile=ok";
				f.method="POST";
				
			}	
		<%
			String log = (String)request.getAttribute("log");
		%>
		<%
		if(log != null && log.equals("fail"))  {%>
		alert("Login Fail!");	
		/* $('#loginfff').click(); */
		<% } %>

		</script>

<div data-role="popup" id="popupLogin" data-theme="a" class="ui-corner-all">
    <form class="form-horizontal" data-ajax="false">
        <div style="padding:10px 20px;">
            <h3>Please sign in</h3>
            <label for="un" class="ui-hidden-accessible">Id:</label>
            <input type="text" name="customer_id" id="customer_id" value="" placeholder="Id" data-theme="a">
            <label for="pw" class="ui-hidden-accessible">Password:</label>
            <input type="password" name="customer_pwd" id="customer_pwd" value="" placeholder="password" data-theme="a">
            <button class="ui-icon-check" onclick="logingo(this.form)">Login</button>
        </div>
    </form>
</div>


		