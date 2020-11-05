<%@page import="java.util.ArrayList"%>
<%@page import="jargo.vo.OwnerVO"%>
<%@page import="jargo.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	OwnerVO owner = (OwnerVO)session.getAttribute("loginuser1");
%>

<script>

function modifystore(owner_id){
	$.ajax({
		url:"storebyowner.jargo?owner_id="+owner_id,
		dataType:"json",
		success:function(data){			
			$("#store_number").prop("value",data.store_number) ;
			$("#storeownerid").empty();
			$("#storeownerid").append("<input required='' id='owner_id' name='owner_id' type='text' class='form-control' class='input-medium' value='"+data.owner_id+"'>");
			$("#store_name").prop("value",data.store_name) ; 
			$("#store_phone").prop("value",data.store_phone) ;
			$("#store_addr").prop("value",data.store_addr) ;
			$("#store_desc").prop("value",data.store_desc) ;
			$("#store_subway").prop("value",data.store_subway) ;
			$("#store_lat").prop("value",data.store_lat);
			$("#store_lng").prop("value",data.store_lng);
			$("#master_number").prop("value",data.master_number);
			$("#store_img").prop("value",data.store_img) ;
			/* alert(data.store_img); */
		},
		error : function(){
			alert("error");
		}
		
	});
}

function supdate(s){
	/* alert("supdate·Î µé¾î¿È"); */
	var option = {
			url:"storemodifyimpl.jargo",
			type:"post",
			data:$("#sform").serialize(),
			success:function(data){
				alert("s~~update");
			}
	};
	$("#sform").ajaxSubmit(option);
	/* alert("ajaxsubmit¹Ø¿¡ ¾ó·¯Æ®"); */
	
}
	
</script>


<!-- ---------modify--------- -->
				<div class="modal fade bs-modal-sm-store" id="myModal" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  			<div class="modal-dialog modal-sm">
		    			<div class="modal-content">

						        <div class="bs-example bs-example-tabs">
						            <a href="#" data-toggle="tab">Modify Store</a>
						        </div>
		        
		     					 <div class="modal-body">
		        					<div id="myTabContent" class="tab-content">
		      
		        						<div class="tab-pane fade active in" id="modify">	
		            						<form id="sform" class="form-horizontal" method="post" action="storemodifyimpl.jargo" enctype="multipart/form-data">
		            							<fieldset>
		            							<!-- Form -->
		            							
		            								<div class="control-group">
										              <label class="control-label" for="store_number">Store Number</label>
										              <div class="controls">
										                <input required="" id="store_number" name="store_number" type="text" class="form-control" class="input-medium" value="">
										              </div>
										            </div>
										            
										            <div class="control-group">
										              <label class="control-label" for="owner_id">Owner ID</label>
										              <div class="controls" id="storeownerid">
										                <!-- <input required="" id="owner_id" name="owner_id" type="text" class="form-control" class="input-medium" value=""> -->
										              </div>
										            </div>
		            							
										            <div class="control-group">
										              <label class="control-label" for="store_name">Store Name</label>
										              <div class="controls">
										                <input required="" id="store_name" name="store_name" type="text" class="form-control" class="input-medium" value="">
										              </div>
										            </div>
										            
										            <div class="control-group">
										              <label class="control-label" for="store_phone">Phone</label>
										              <div class="controls">
										                <input required="" id="store_phone" name="store_phone" class="form-control" type="text" class="input-medium" value="">
										              </div>
										            </div>
		            
										            <div class="control-group">
										              <label class="control-label" for="store_addr">Address</label>
										              <div class="controls">
										                <input required="" id="store_addr" name="store_addr" class="form-control" type="text" class="input-medium" value="">
										              </div>
										            </div>
										            
										            <div class="control-group">
										              <label class="control-label" for="store_desc">Description</label>
										              <div class="controls">
										                <!-- <textarea rows="4" cols="33"></textarea> -->
										                <input required="" id="store_desc" name="store_desc" class="form-control" type="text" class="input-medium" value="">
										              </div>
										            </div>
										            
										            <div class="control-group">
										              <label class="control-label" for="store_subway">Subway</label>
										              <div class="controls">
										                <input required="" id="store_subway" name="store_subway" class="form-control" type="text" class="input-medium" value="">
										              </div>
										            </div>
		
										             <div class="control-group">
										              <label class="control-label" for="store_lat">Latitude</label>
										              <div class="controls">
										                <input required="" id="store_lat" name="store_lat" class="form-control" type="text" class="input-medium" value="">
										              </div>
										            </div>
										            
										             <div class="control-group">
										              <label class="control-label" for="store_lng">Longitude</label>
										              <div class="controls">
										                <input required="" id="store_lng" name="store_lng" class="form-control" type="text" class="input-medium" value="">
										              </div>
										            </div>
										            
							
										            <div class="control-group">
										              <label class="control-label" for="store_img">New Image</label>
										             <div class="controls">
										                <input id="file" name="file" class="form-control" type="file" class="input-medium">
										              <!--   <input type="hidden" id="store_img" name="store_img" class="form-control" class="input-medium" value=""> -->
										              </div>
										            </div> 
									
										            <div class="control-group">
										              <label class="control-label" for="store_img">Old Image</label>
										             <div class="controls">
										             	<!--  <input type="hidden" id="store_img_b" name="file_b" class="form-control" class="input-medium" value="">
										                <input type="hidden" id="store_img_b" name="store_img_b" class="form-control" class="input-medium" value=""> -->
										               <input id="store_img" name="store_img" class="form-control" type="text" class="input-medium" value="">
										              </div>
										            </div>
										            
										            
										             <div class="control-group">
										              <label class="control-label" for=master_number>Master Number</label>
										              <div class="controls">
										                <input required="" id="master_number" name="master_number" class="form-control" type="text" class="input-medium" value="">
										              </div>
										            </div>

		           							 <!-- Button -->
										            <div class="control-group">
										              <label class="control-label" for="modify"></label>
										              <div class="controls">
										                <button id="modify" name="modify" class="btn btn-success" onclick="javascript:supdate(this.form)">Modify</button>                                                
										               
										              </div>
										            </div>
										            
		            							</fieldset>
		            							
		            							
		            						</form>
		        						</div>	<!-- class="tab-pane fade active in" id="signin" -->

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
				   <!-- ---------modify--------- -->
