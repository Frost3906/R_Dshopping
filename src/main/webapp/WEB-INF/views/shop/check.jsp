<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
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
		let csrfHeaderName = "${_csrf.headerName}";
		let csrfTokenValue = "${_csrf.token}";
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
            		
            		console.log(details);
                    let data ={
                    		fullname : details.payer.name.given_name + details.payer.name.surname,
                    		streetaddress : details.purchase_units[0].shipping.address.address_line_1,
                    		detailaddress : details.purchase_units[0].shipping.address.address_line_2,
                    		city : details.purchase_units[0].shipping.address.admin_area_2,
                    		state : details.purchase_units[0].shipping.address.admin_area_1,
                    		country : details.purchase_units[0].shipping.address.country_code,
                    		zipcode : details.purchase_units[0].shipping.address.postal_code,
                    		total : details.purchase_units[0].amount.value
                    }
                    
                    $.ajax({
            			url : "/shop/order",
            			type : "post",
            			data : data,
             			beforeSend : function(xhr){
            				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            			}, 
            			success : function(result){
            				alert('Transaction completed by ' + details.payer.name.given_name + '!');
            				location.href="/shop/payment";
            			},
            			error : function(){
            				alert("잠시 후 다시 시도 해 주세요")
            			}

            		})
   					
                    
                    
                });
            }


        }).render('#paypal-button-container');
    </script>

<%@ include file="../includes/footer.jsp" %> 

