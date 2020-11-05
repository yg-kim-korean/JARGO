<%@page import="jargo.vo.OwnerVO"%>
<%@page import="jargo.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	OwnerVO owner = (OwnerVO)session.getAttribute("loginuser1");
%>
<%if(owner==null){ %>

		<div class="bf_footer">
			<a class="bf_left" href="#signin" data-toggle="modal" data-target=".bs-modal-lo">Login</a>
			<a class="bf_left" href="#signup" data-toggle="modal" data-target=".bs-modal-re">Register</a>
		</div>
		

<%}else{ %>

		<div class="bf_footer">
			<a class="bf_left" ><%=owner.getOwner_id() %></a>
			<a class="bf_left" href="logout.jargo">Logout</a>
			<a class="bf_left" href="#modefy_o" data-toggle="modal" data-target=".bs-modal-up-o">My info</a>
		</div>
<%} %>