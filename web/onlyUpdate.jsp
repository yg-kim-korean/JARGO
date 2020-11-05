<%@page import="jargo.vo.CustomerVO"%>
<%@page import="jargo.biz.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	CustomerVO customer = (CustomerVO)session.getAttribute("loginuser");
%>

         <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <br>
        <div class="bs-example bs-example-tabs">

             <a href="#modefy" data-toggle="tab">My Info</a>  

        </div>
        

   <div class="tab-pane fade active in" id="signup">        
            <form class="form-horizontal">
            <fieldset>
            <!-- Sign Up Form -->
            <!-- Text input-->

            
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="customer_id">ID:</label>
              <div class="controls">
                <input id="customer_id" readonly="readonly" name="customer_id" value="<%=customer.getCustomer_id() %>" class="form-control" type="text" class="input-large" required="">
              </div>
            </div>
            
            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="customer_pwd">Password:</label>
              <div class="controls">
                <input id="customer_pwd" name="customer_pwd" value="<%=customer.getCustomer_pwd()%>" class="form-control" type="password"  class="input-large" required="">
                <em>1-8 Characters</em>
              </div>
            </div>
            
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="reenterpwd">Re-Enter Password:</label>
              <div class="controls">
                <input id="reenterpwd" class="form-control" name="reenterpwd" type="password"class="input-large" required="">
              </div>
            </div>
            
             <div class="control-group">
              <label class="control-label" for="customer_name">name:</label>
              <div class="controls">
                <input id="customer_name" class="form-control" name="customer_name" value="<%=customer.getCustomer_name()%>" type="text"class="input-large" required="">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="customer_phone">phone:</label>
              <div class="controls">
                <input id="customer_phone" class="form-control" name="customer_phone" value="<%=customer.getCustomer_phone() %>" type="tel"class="input-large" required="">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label" for="customer_addr">addr:</label>
              <div class="controls">
                <input id="customer_addr" class="form-control" name="customer_addr" value="<%=customer.getCustomer_addr()%>" type="text" class="input-large" required="">
              </div>
            </div>
            
             <div class="control-group">
              <label class="control-label" for="customer_email">E-mail:</label>
              <div class="controls">
                <input id="customer_email" name="customer_email" class="form-control" value="<%=customer.getCustomer_email() %>" type="email" class="input-large" required="">
              </div>
            </div>
            
            <div class="control-group">
            	<label class="control-label" for="customer_favor">Favorite:</label>
            	<div class="controls">
            		<input id="customer_favor" name="customer_favor" class="form-control" value="<%=customer.getCustomer_favor() %>" type="text" class="input-large">
            	</div>
            </div>
            
            <!-- Button -->
            <div class="control-group">
              <label class="control-label" for="confirmsignup"></label>
              <div class="controls">
                <button id="confirmsignup" name="confirmsignup" class="btn btn-success" onclick="update(this.form);">modify</button>
              </div>
            </div>
            </fieldset>
          </form>
    	  </div>
   		 </div>
   		       </div>


  	