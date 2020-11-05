<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
	function updateCheck(f) {
		/* f.method = "POST";
		f.action = "realupdateImpl.jargo";
		f.submit(); */
		
		var option = {
				url:"realupdateImpl.jargo",
			    type : "post",
			    data : $("#boarddetail").serialize(),
			    success : function(data) {
			    }
			   };
		  $("#boarddetail").ajaxSubmit(option);
		  alert("Modify success");
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
	}  
	
	function boardDelete(f) {
		/* f.method = "POST";
		f.action = "deleteImpl.jargo";
		f.submit(); */
		var option = {
				url:"deleteImpl.jargo",
			    type : "post",
			    data : $("#boarddetail").serialize(),
			    success : function(data) {
			    }
			   };
		  $("#boarddetail").ajaxSubmit(option);
		  alert("Remove success");
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
	}


	function boardUpdate(board_number) {
		$.ajax({
			url: "updateImpl.jargo?board_number="+board_number,
			dataType: "json",
			success: function(data){
				$("#board_body2").empty();
				$("#board_body2").append("<input type='hidden' name='board_number' value='"+data.board_number+"'>");
				$("#board_body2").append("<input type='hidden' name='board_time' value='"+data.board_time+"'>");
				$("#board_body2").append("<input type='hidden' name='store_number' value='"+data.store_number+"'>");
				$("#board_body2").append("<tr>");
				$("#board_body2").append("<td width='25%' align='center' style='color:white;'>Title</td>");
				$("#board_body2").append("<td width='75%'><input type='text' name='board_title' required='required' value='"+data.board_title+"' style='width:100%; background-color:transparent; color: white;'></td>");
				$("#board_body2").append("</tr>");
				$("#board_body2").append("<tr>");
				$("#board_body2").append("<td width='25%' align='center' style='color:white;'>ID</td>");
				$("#board_body2").append("<td width='75%'><input type='text' name='customer_id' readonly='readonly' value='"+data.customer_id+"' style='width:100%; background-color:transparent; color: white;'></td>");
				$("#board_body2").append("</tr>");
				$("#board_body2").append("<tr>");
				$("#board_body2").append("<td colspan='2' style='border: 0px;'><textarea name='board_memo' cols='197' rows='10' required='required' style='border: 0px; background-color:transparent; color: white;'>"+data.board_memo+"</textarea></td>");
				$("#board_body2").append("</tr>");
				$("#board_body2").append("<tr>");
				$("#board_body2").append("<td colspan='2' align='center' style='height: 40px; border: 0px;'><a href='#' id='button_write' onclick='updateCheck(this.form);'>Modify</a></td>");
				$("#board_body2").append("</tr>");
			},
			error:function(){
				alert('error');
			}
		});
	}
</script>