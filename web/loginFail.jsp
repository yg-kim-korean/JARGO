<%@page import="jargo.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

		<script>
			<%
				String log = (String)request.getAttribute("log");
				String register = (String)request.getAttribute("register");
			%>
			<%
			if(log != null && log.equals("fail")) { %>
				alert("Login Fail!!!!!!!!!!!");
			<% } %>
			<%
			if(register.equals("fail")) { %>
				alert("Register Fail.. ID exists");
			<% } %>
			window.location.href="index.jsp";
			
		</script>
		
		
		