<%@page import="jargo.vo.OwnerVO"%>
<%@page import="jargo.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	CustomerVO customer = (CustomerVO)session.getAttribute("loginuser");
%>
<%if(customer==null){ %>

		<div class="bf_footer">
			<a class="bf_left" href="#signin" data-toggle="modal" data-target=".bs-modal-lo" id="lo">Login</a>
			<a class="bf_left" href="#signup" data-toggle="modal" data-target=".bs-modal-re">Register</a>
		</div>
		
<%}else{ %>

		<div class="bf_footer">
			<a class="bf_left" ><%=customer.getCustomer_id() %></a>
			<a class="bf_left" href="logout.jargo">Logout</a>
			<a class="bf_left" href="#modefy" data-toggle="modal" data-target=".bs-modal-up">My info</a>
		</div>
<%} %>