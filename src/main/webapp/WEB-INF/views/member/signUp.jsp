<!-- <!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="shortcut icon" href="/resources/signUp/images/fav.jpg">
    <link rel="stylesheet" href="/resources/signUp/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/signUp/css/fontawsom-all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/signUp/css/style.css" />
</head>

<body> -->          
	<%@include file="../includes/header.jsp" %>
	
	<!-- SignUp Page CSS -->
	<link rel="shortcut icon" href="/resources/signUp/images/fav.jpg">
    <link rel="stylesheet" href="/resources/signUp/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/signUp/css/fontawsom-all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/signUp/css/style.css" />
        
    <!-- <script src="/resources/signUp/js/signup.js"></script> -->
    
    <title>RDS SignUp</title>
           <div class="register">
               <div class="container">
                  <div class="row">
                      <div class="col-lg-7 col-md-6">
                           <div class="ditk-inf sup-oi">
                                <h2 class="w-100">We are the Best <br>Internet Partner for You</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut consectetur maximus justo, et malesuada dolor dictum in. Maecenas nec elit risus. Nunc ut nunc aliquam, blandit magna et, tempus quam</p>
                                <ul>
                                    <li><i class="fas fa-check"></i> Nam facilisis nibh sed nunc aliquam, et volutpat ipsum</li>
                                    <li><i class="fas fa-check"></i> dignissim sapien. Vestibulum non leo fringilla, luctus turpis quis</li>
                                    <li> <i class="fas fa-check"></i> Aliquam vitae augue nisi. Phasellus ut dui a neque</li>
                                </ul>
                                
                            </div> 
                       </div>
                       <div class="col-lg-5 col-md-6 ">
                           <div class="register-box">
                               <h2>Sign Up</h2>                               
                               <form id="signUp" action="" method="post">
                               <div class="row form-row">
                                   <div class="col-md-4">
                                       <label for="">Email Address</label>
                                   </div>
                                   <div class="col-md-8">
                                       <input type="text" name="username" placeholder="example@example.com" value="${google.username}" class="form-control form-control-sm">
                                   </div>
                               </div>
                               <div class="row form-row">
                                   <div class="col-md-4">
                                       <label for="">Password</label>
                                   </div>
                                   <div class="col-md-8">
                                       <input type="password" name="password" placeholder="Enter Password" class="form-control form-control-sm">
                                   </div>
                               </div>
                               <div class="row form-row">
                                   <div class="col-md-4">
                                       <label for="">Country</label>
                                   </div>
                                   <div class="col-md-8">
                                   	   <select name="country"> 
                                   	   		<option value="country" selected="selected">Country</option>
                                   	   </select>                                      
                                   </div>
                               </div>
                               <div class="row form-row">
                                   <div class="col-md-4">
                                       <label for="">First Name</label>
                                   </div>
                                   <div class="col-md-8">
                                       <input type="text" name="firstName" placeholder="Enter First Name" value="${google.firstName}" class="form-control form-control-sm">
                                   </div>
                               </div>
                               <div class="row form-row">
                                   <div class="col-md-4">
                                       <label for="">Last Name</label>
                                   </div>
                                   <div class="col-md-8">
                                       <input type="text" name="lastName" placeholder="Enter Last Name" value="${google.lastName}" class="form-control form-control-sm">
                                   </div>
                               </div>
                               <div class="row form-row">
                                   <div class="col-md-4">
                                       <label for="">Mobile Number</label>
                                   </div>
                                   <div class="col-md-8">
                                       <input type="text" name="mobile" placeholder="Enter Mobile Number" class="form-control form-control-sm">
                                   </div>
                               </div>
                               <div class="row form-row">
                                   <div class="col-md-4">
                                      
                                   </div>
                                   <div class="col-md-8">
                                   	   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                       <button type="submit" class="btn btn-info">Sign Up</button>
                                       <button type="reset" class="btn btn-danger">Cancel</button>
                                   </div>
                               </div>
                               </form>
                           </div>
                           
                       </div>
                  </div>
               </div>
           </div>     
</body>

<!-- <script src="/resources/signUp/js/jquery-3.2.1.min.js"></script>
<script src="/resources/signUp/js/popper.min.js"></script>
<script src="/resources/signUp/js/bootstrap.min.js"></script>
<script src="/resources/signUp/js/script.js"></script> -->


</html>
