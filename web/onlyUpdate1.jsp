<%@page import="jargo.vo.OwnerVO"%>
<%@page import="jargo.biz.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	OwnerVO owner = (OwnerVO)session.getAttribute("loginuser1");
%>

         <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <br>
        <div class="bs-example bs-example-tabs">

             <a href="#modefy_o" data-toggle="tab">My Info</a>  

        </div>
        

   <div class="tab-pane fade active in" id="signup">        
            <form class="form-horizontal">
            <fieldset>
            <!-- Sign Up Form -->
            <!-- Text input-->

            
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="owner_id">ID</label>
              <div class="controls">
                <input id="owner_id" readonly="readonly" name="owner_id" value="<%=owner.getOwner_id() %>" class="form-control" type="text" class="input-large" required="">
              </div>
            </div>
            
            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="owner_pwd">Password</label>
              <div class="controls">
                <input id="owner_pwd" name="owner_pwd" value="<%=owner.getOwner_pwd()%>" class="form-control" type="password"  class="input-large" required="">
                <em>1-8 Characters</em>
              </div>
            </div>
            
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="reenterpwd">Re-Enter Password</label>
              <div class="controls">
                <input id="reenterpwd" class="form-control" name="reenterpwd" type="password"class="input-large" required="">
              </div>
            </div>
            
             <div class="control-group">
              <label class="control-label" for="owner_name">Name</label>
              <div class="controls">
                <input id="owner_name" class="form-control" name="owner_name" value="<%=owner.getOwner_name() %>" type="text"class="input-large" required="">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="owner_phone">Phone</label>
              <div class="controls">
                <input id="owner_phone" class="form-control" name="owner_phone" value="<%=owner.getOwner_phone() %>" type="tel"class="input-large" required="">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="owner_position">Position</label>
              <div class="controls">
                <input id="owner_position" class="form-control" name="owner_position" value="<%=owner.getOwner_position() %>" type="text" class="input-large" required="">
              </div>
            </div>
   
            <!-- Button -->
            <div class="control-group">
              <label class="control-label" for="confirmsignup"></label>
              <div class="controls">
                <button id="confirmsignup" name="confirmsignup" class="btn btn-success" onclick="update_o(this.form);">modify</button>
              </div>
            </div>
            </fieldset>
          </form>
    	  </div>
   		 </div>
   		       </div>


  	