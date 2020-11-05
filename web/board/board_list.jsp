<%@page import="jargo.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	CustomerVO customer = (CustomerVO) session.getAttribute("loginuser");
%>
<!-- <style>
	#board_detail tr td {
		color: white;
	}
</style> -->

<script>
function board_list() {
		<% if(customer != null) { %>
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
		<% } else { %>
		$("#board_table1").empty();
		$("#board_table2").empty();
		$("#board").empty();
		$("#lo").click();
		<%}%>
		getStoreNumber();
	}
	
function board_view(board_number) {
		<% if(customer != null) { %>
		$.ajax({
			url: "board_list2.jargo?board_number="+board_number,
			dataType: "json",
			success:function(data){
				$("#board_body2").empty();
					$("#board_body2").append("<input type='hidden' name='board_number' value='"+data.board_number+"'>");
					$("#board_body2").append("<tr>");
					$("#board_body2").append("<td width='15%' align='center'><font color='white'>Title</font></td>");
					$("#board_body2").append("<td width='50%' align='center'><font color='white'>"+data.board_title+"</font></td>");
					$("#board_body2").append("<td width='15%' align='center'><font color='white'>Store</font></td>");
					$("#board_body2").append("<td width='20%' align='center'><font color='white'>"+data.store_number+"</font></td>");
					$("#board_body2").append("</tr>");
					$("#board_body2").append("<tr>");
					$("#board_body2").append("<td width='15%' align='center'><font color='white'>Writer</font></td>");
					$("#board_body2").append("<td width='35%' align='center'><font color='white'>"+data.customer_id+"</font></td>");
					$("#board_body2").append("<td width='15%' align='center'><font color='white'>Date</font></td>");
					$("#board_body2").append("<td width='35%' align='center'><font color='white'>"+data.board_time+"</font></td>");
					$("#board_body2").append("</tr>");
					$("#board_body2").append("<tr>");
					$("#board_body2").append("<td colspan='4' height='300'><textarea style='background-color:transparent; color: white; border: 0px;' cols='197' rows='12' readonly='readonly'>"+data.board_memo+"</textarea></td>");
					$("#board_body2").append("</tr>");
					if(data.customer_id == '<%=customer.getCustomer_id()%>') {
					$("#board_body2").append("</table>");
					$("#board_body2").append("<table border='0' width='100%'>");
					$("#board_body2").append("<tr>");
					$("#board_body2").append("<td colspan='4' align='center' style='border: 0px; height: 40px;'><a href='#' id='button_write' onclick='boardUpdate("+data.board_number+
							");'>Modify</a>&nbsp;&nbsp;<a href='#' id='button_write' onclick='boardDelete(this.form);'>Remove</a>&nbsp;&nbsp;<a href='#' id='button_write' onclick='board_list();'>List</a></td>");
					$("#board_body2").append("</tr>");
					} else {
						$("#board_body2").append("</table>");
						$("#board_body2").append("<table border='0' width='100%'>");
						$("#board_body2").append("<tr width='100%'>");
						$("#board_body2").append("<td colspan='4' align='center' style='border: 0px; height: 40px;'><a href='#' id='button_write' onclick='board_list();'>List</a></td>");
						$("#board_body2").append("</tr>");
					}
				
			},
			error:function(){
				alert('error');
			}
		});
		
		<% }else { %>
		$("#board_table1").empty();
		$("#board_table2").empty();
		$("#board").empty();
		$("#lo").click();
		<%}%>
	}

</script>

<form id="boarddetail">
<table width="100%" border="1" style="border-color:white;" class="board_list" id="board_detail">
	<tbody id="board_body2"></tbody>
</table>
</form>
<form id="board_overflow">
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="board_list" id="board_table1">
 <tr width="5" height="30" style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
   <th width="10%">No.</th>
   <th width="40%">Title</th>
   <th width="15%">Writer</th>
   <th width="20%">Date</th>
   <th width="15%">Store</th>
  </tr>
  </table>
</form>
<form style="overflow-x: hidden; overflow-y: scroll; height: 300px; position: static;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="board_list" id="board_table1">
<!-- ±Û list -->
	<tbody id="board_body1"></tbody>
<!-- list ³¡ -->

  <tr height="1" bgcolor="#D2D2D2"><td colspan="7"></td></tr>
 <tr height="1" bgcolor="#82B5DF"><td colspan="7"></td></tr>
 </table>
 </form>

<table width="100%" cellpadding="0" cellspacing="0" border="0" class="board_list" id="board_table2">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td style="align: center;"><a href="#" id="button_write" onclick="boardWrite('layer3',1); return false;" style="position: fixed;">Write</a></td>
  </tr>
</table>

<!-- =============================================================================================================== -->
	
	
	
	<%if(customer != null) { %>
		<jsp:include page='../board/board_write.jsp' />
		<jsp:include page='../board/board_update.jsp' />
	<%-- <%@include file='../board/board_write.jsp' %> --%>
	<%} %>

