<%@page import="jargo.vo.OwnerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<script>

function createcoupon (owner_id){
	$.ajax({
		url:"storebyowner.jargo?owner_id="+owner_id,
		dataType:"json",
		success:function(data){
			/* alert(data.store_number); */
			$("#couponstorenumber").append("<input id='store_number' name='store_number' type='hidden' class='form-control' class='input-medium' value='"+data.store_number+"'>"); 
		},
		error:function(){
			alert("get store number fail");
		}
	});
}

function registercoupon (c){

	/* alert("register coupon start"); */
	
	var option={
		url:"couponregisterimpl.jargo",
		type:"POST",
		
		success:function(){			
			alert("coupon 등록 성공!!"); 
			$.ajax({
				url:"couponbystore.jargo?store_number="+c.store_number.value,
				dataType:"json",
				success:function(data1){
					$("#table_couponlist").empty();
					$.each(data1, function(index, item){					
						$("#table_couponlist").append("<tr>");
						$("#table_couponlist").append("<td><img id='coupon_image' src='images/coupon/" + item.coupon_img + "' align='left' width='150px' height='100px'></td>");
						$("#table_couponlist").append("<td>" + item.coupon_number + "</td>");
						$("#table_couponlist").append("<td>" + item.coupon_id + "</td>");
						$("#table_couponlist").append("<td>" + item.coupon_expired + "</td>");
						$("#table_couponlist").append("<td>" + item.coupon_usable + "</td>");
						$("#table_couponlist").append("<td>" + item.store_number + "</td>");
						$("#table_couponlist").append("<td><a href='#' class='cbtn' onclick='deletecoupon("+item.coupon_number+","+item.store_number+")'>DELETE</a></td>");
						$("#table_couponlist").append("</tr>");
					});
				},
				error:function(){
					alert("error2");
				}
			});
		},
		error:function(){
			alert(" error!!");
		}
		
	};
	$("#couponform").ajaxSubmit(option);

	$(".btn-default").click();

}

</script>










<div class="modal fade bs-modal-sm-coupon" id="myModal" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
		
		
		
			<div class="bs-example bs-example-tabs">
				<a href="#" data-toggle="tab">Make Coupon</a>
			</div>
		
		
			<div class="modal-body">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade active in" id="create">
						<!--  action="couponregisterimpl.jargo" -->
						<form method="POST" class="form-horizontal" id="couponform" enctype="multipart/form-data">
						
							<!-- <div class="control-croup">
								<label class="control-label" for="coupon_number">Coupon Number</label>
								<div class="controls">
									<input required="required" id="coupon_number" name="coupon_number" type="text" class="form-control" class="input-medium" disabled>
								</div>
							</div> -->
							
							<div class="control-group">
								<label class="control-label" for="coupon_id">Coupon ID</label>
								<div class="controls">
									<input required="required" id="coupon_id" name="coupon_id" type="text" class="form-control" class="input-medium">
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="coupon_expired">Coupon Expired</label>
								<div class="controls">
									<input required="required" id="coupon_expired" name="coupon_expired" type="text" class="form-control" class="input-medium">
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="coupon_usable">Coupon Usable</label>
								<div class="controls">
									<input required="required" id="coupon_usable" name="coupon_usable" type="text" class="form-control" class="input-medium" value="1">
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="store_number"><!-- Store Number --></label>
								<div class="controls" id="couponstorenumber">
									
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="coupon_img">Coupon Image</label>
								<div class="controls">
									<input required="required" id="file" name="file" type="file" class="form-control" class="input-medium">
								</div>
							</div>
							
							
							
							<div class="control-group">
								<label class="control-label" for="create"></label>
								<div class="controls">
									
									<button type="button" id="create" name="create" class="btn btn-success" onclick="javascript:registercoupon(this.form)">
									Create Coupon</button>
									   
								</div>
							</div>
						
						</form>
						
					</div>
					
					
					<div class="modal-footer">
						  <center>
						      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						  </center>
		    		</div>
					
					
					
				</div>
			</div>
		
		
		
		</div>
	</div>
</div>




