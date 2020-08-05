<%@include file="../includes/header.jsp"  %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<div class="row mp_main">
  <div class="col-3">
	<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	  <a class="nav-link active" id="v-pills-order-tab" data-toggle="pill" href="#v-pills-order" role="tab" aria-controls="v-pills-order" aria-selected="true">Order</a>
	  <a class="nav-link" id="v-pills-shipping-tab" data-toggle="pill" href="#v-pills-shipping" role="tab" aria-controls="v-pills-shipping" aria-selected="false">Shipping</a>
	  <a class="nav-link" id="v-pills-password-tab" data-toggle="pill" href="#v-pills-password" role="tab" aria-controls="v-pills-password" aria-selected="false">Change Password</a>
	  <a class="nav-link" id="v-pills-address-tab" data-toggle="pill" href="#v-pills-address" role="tab" aria-controls="v-pills-address" aria-selected="false">Change Address</a>
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
	  <div class="tab-pane fade" id="v-pills-password" role="tabpanel" aria-labelledby="v-pills-password-tab">
	  	<label for="">${auth.email}</label>
	  	<div class="mb-3">
	  		<input type="password" name="password" placeholder="Current Password" class="form-control form-control-sm">	  	
	  	</div>
	  	<div class="mb-2">
	  		<input type="password" name="password" placeholder="New Password" class="form-control form-control-sm">
	  	</div>
		<div class="mb-2">
		  	<input type="password" name="password" placeholder="Confirm Password" class="form-control form-control-sm">
		</div>
	  </div>
	  <div class="tab-pane fade" id="v-pills-address" role="tabpanel" aria-labelledby="v-pills-address-tab">
	  	Address
	  </div>
	  <div class="tab-pane fade" id="v-pills-question" role="tabpanel" aria-labelledby="v-pills-settings-tab">
	  	Question
	  </div>
	</div>
  </div>
</div>
    
<%@include file="../includes/footer.jsp"  %>