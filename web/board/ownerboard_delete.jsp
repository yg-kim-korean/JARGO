<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
	
	function ownerboardDelete(f) {
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
						if(data1.store_number == item.store_number) {
							$("#board_body1").append("<tr>");
							$("#board_body1").append("<td width='1%'></td>");
							$("#board_body1").append("<td width='10%' align='center'><font color='white'>"+item.board_number+"</font></td>");
							$("#board_body1").append("<td width='40%' align='center'><a href='#' onclick=ownerboard_view("+item.board_number+");><font color='white'>"+item.board_title+"</font></a></td>");
							$("#board_body1").append("<td width='15%' align='center'><font color='white'>"+item.customer_id+"</font></td>");
							$("#board_body1").append("<td width='20%' align='center'><font color='white'>"+item.board_time+"</font></td>");
							$("#board_body1").append("<td width='15%' align='center'><font color='white'>"+item.store_number+"</font></td>");
							$("#board_body1").append("<td width='1%'></td>");
							$("#board_body1").append("</tr>");
						}
					});
				},
				error:function(){
					alert('error');
				}
			});
	}
</script>