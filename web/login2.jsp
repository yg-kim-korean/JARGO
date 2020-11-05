<%@page import="jargo.vo.AdminVO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	AdminVO admin = (AdminVO)session.getAttribute("loginuser2");
%>
<%if(admin==null){ %>

		<div class="bf_footer">
			<a class="bf_left" href="#signin" data-toggle="modal" data-target=".bs-modal-lo">Login</a>
			<a class="bf_left" href="#signup" data-toggle="modal" data-target=".bs-modal-re">Register</a>
		</div>
		

<%}else{ %>

		<div class="bf_footer">
			<a class="bf_left" ><%=admin.getAdmin_id() %></a>
			<a class="bf_left" href="logout.jargo">Logout</a>
		</div>
<%} %>