<%@include file="../includes/header.jsp"  %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<div class="row mp_main">
  <div class="col-3">
	<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	  <a class="nav-link active" id="v-pills-order-tab" data-toggle="pill" href="#v-pills-order" role="tab" aria-controls="v-pills-order" aria-selected="true">Order</a>
	  <a class="nav-link" id="v-pills-shipping-tab" data-toggle="pill" href="#v-pills-shipping" role="tab" aria-controls="v-pills-shipping" aria-selected="false">Shipping</a>
	  <a class="nav-link" id="v-pills-account-tab" data-toggle="pill" href="#v-pills-account" role="tab" aria-controls="v-pills-account" aria-selected="false">Your Account</a>	  
	  <a class="nav-link" id="v-pills-question-tab" data-toggle="pill" href="#v-pills-question" role="tab" aria-controls="v-pills-question" aria-selected="false">Question</a>
	</div>
  </div>	
  <div class="col-9">
	<div class="tab-content" id="v-pills-tabContent">
	  <div class="tab-pane fade show active" id="v-pills-order" role="tabpanel" aria-labelledby="v-pills-order-tab">
	  	Order
	  </div>
	  <div class="tab-pane fade" id="v-pills-shipping" role="tabpanel" aria-labelledby="v-pills-shipping-tab">
	  	Shipping
	  </div>
	  <div class="tab-pane fade" id="v-pills-account" role="tabpanel" aria-labelledby="v-pills-account-tab">
	  	<table>
	  		<tbody>
		  		<tr>
		  			<th scope="row">
		  				E-Mail  				
		  			</th>
		  			<td scope="col"> 
		  				<input type="text" name="email" class="form-control form-control-sm" value="${auth.email}" readonly>
		  			</td>
		  		</tr>
		  		<tr>
		  			<th scope="row">
		  				Current Password  				
		  			</th>
		  			<td scope="row">
		  				<input type="password" name="Current_password" class="form-control form-control-sm">
		  			</td>
	  			</tr>
	  			<tr>
		  			<th scope="row">
		  				New Password   				
		  			</th>
		  			<td scope="row">
		  				<input type="password" name="New_password" class="form-control form-control-sm">
		  			</td>
		  		</tr>
		  		<tr>
		  			<th scope="row">
		  				Confirm Password   				
		  			</th>
		  			<td scope="row">
		  				<input type="password" name="Confirm_Password" class="form-control form-control-sm">
		  			</td>				  	
		  		</tr>	
		  		<tr>
		  			<th scope="row">
		  				Mobile   				
		  			</th>
		  			<td scope="row">
		  				<input type="text" name="mobile" class="form-control form-control-sm">
		  			</td>				  	
		  		</tr>	
		  		<tr>
		  			<th scope="row">
		  				Street  				
		  			</th>
		  			<td scope="row">
		  				<input type="text" name="street" class="form-control form-control-sm">
		  			</td>				  	
		  		</tr>	
		  		<tr>
		  			<th scope="row">
		  				Address  				
		  			</th>
		  			<td scope="row">
		  				<input type="text" name="address" class="form-control form-control-sm">
		  			</td>				  	
		  		</tr>	
		  		<tr>
		  			<th scope="row">
		  				City  				
		  			</th>
		  			<td scope="row">
		  				<input type="text" name="City" class="form-control form-control-sm">
		  			</td>				  	
		  		</tr>	
		  		<tr>
		  			<th scope="row">
		  				Postcode  				
		  			</th>
		  			<td scope="row">
		  				<input type="text" name="postcode" class="form-control form-control-sm">
		  			</td>				  	
		  		</tr>	
	  		</tbody>
	  	</table>
		<button type="button" class="btn btn-secondary">Confirm</button>
		<button type="reset" class="btn btn-secondary">Cancel</button>
	  </div>
	  <div class="tab-pane fade" id="v-pills-question" role="tabpanel" aria-labelledby="v-pills-settings-tab">
	  	Question
	  </div>
	</div>
  </div>
</div>
    
<%@include file="../includes/footer.jsp"  %>