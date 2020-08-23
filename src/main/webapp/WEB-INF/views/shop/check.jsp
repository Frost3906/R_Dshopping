<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <script src="https://www.paypal.com/sdk/js?client-id=AR_CHzSOXRVxZqZF9tf109tj_lt_QQfkKjkbwigr0PzHP53CO3mB2dpEqJ_260xoSamejcstYPhHzqjP&currency=USD"></script>
<div class="container mt-5 mb-5">
<h1>Payment</h1>
	<div class="row">
      <div class="col-lg-12">
        <div class="row mt-5">
        	<img src="http://placehold.it/400x400" style='width: 400px; height: 552px;'/>
        	<div class="product-details ml-5 col-lg">
        		<form action="" method="post" role="form">
	        	<br>
        	<div class="mt-3 mb-3">
        		<div id="paypal-button-container"></div>
			    <input type="hidden" id="amount" value=""/>
        	</div>
        		<input type="hidden" name='_csrf' value='${_csrf.token}'/>
        	</form>
        	</div>
        		
        </div>
        	
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
      	
</div>

<script>
		
		let amount = ${total};
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: amount
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    // Show a success message to the buyer
                    console.log("result",details);
                    console.log(details.payer.address);
                    
                    let fullname = details.payer.name.given_name + details.payer.name.surname;
                    let streetaddress = details.purchase_units.shipping.address.address_line_1;
                    let detailaddress = details.purchase_units.shipping.address.address_line_2;
                    let city = details.purchase_units.shipping.address.admin_area_2;
                    let state = details.purchase_units.shipping.address.admin_area_1;
                    let country = details.purchase_units.shipping.address.country_code;
                    let zipcode = details.purchase_units.shipping.address.postal_code;
                    let email = details.payer.email_address;
                    let total = details.purchase_units.amount.value;
                    //컨트롤러에서 해당 유저 아이디로 통관번호 받고 없으면 입력하라고 띄우기
                    
                    
                    alert('Transaction completed by ' + details.payer.name.given_name + '!');
                });
            }


        }).render('#paypal-button-container');
    </script>

<%@ include file="../includes/footer.jsp" %> 

