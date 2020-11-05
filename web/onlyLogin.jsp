<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <br>
    <div class="bs-example bs-example-tabs">
            
              <a href="#signin" data-toggle="tab">Login</a></li>
              
          
        </div>
        
        <div class="modal-body">
        <div id="myTabContent" class="tab-content">
      
        <div class="tab-pane fade active in" id="signin">
            <form name="loginform" class="form-horizontal" method="POST" action="loginimpl.jargo">
            <fieldset>
            <!-- Sign In Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="customer_id">ID:</label>
              <div class="controls">
                <input required="" id="customer_id" name="customer_id" type="text" class="form-control" class="input-medium" required="">
              </div>
            </div>

            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="customer_pwd">Password:</label>
              <div class="controls">
                <input required="" id="customer_pwd" name="customer_pwd" class="form-control" type="password" class="input-medium">
              </div>
            </div>

            <!-- Multiple Checkboxes (inline) -->
            

            <!-- Button -->
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button id="signin" name="signin" class="btn btn-success">Login</button>
              </div>
            </div>
            </fieldset>
            </form>
        </div>
        
        </div>
        </div>
        </div>
        </div>
