<!-- <!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="shortcut icon" href="/resources/signIn/images/fav.jpg">
    <link rel="stylesheet" href="/resources/signIn/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/signIn/css/fontawsom-all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/signIn/css/style.css" />
    <script>
	let info=${info};
	let error=${error};
	
	if(info === " "){
		alert(error);
		return false;
	}else if(error === " "){
		alert(info);
		return false;	
	}
	</script>
</head> -->
<%@include file="../includes/header.jsp" %>
	<link rel="shortcut icon" href="/resources/signIn/images/fav.jpg">
    <link rel="stylesheet" href="/resources/signIn/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/signIn/css/fontawsom-all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/signIn/css/style.css" />
<title>RDS SignUp</title>
    <div class="container-fluid h-100">
       
            <div class="row no-margin h-100">
                
                <div class="col-sm-12 no-padding login-box h-100">
                    <div class="row no-margin w-100">
                       <div class="col-lg-6 col-md-6 box-de">
                           <div class="small-logo">
                                <a href=""><i class="fab fa-asymmetrik"></i>RDS Shopping</a>
                            </div>
                            <div class="ditk-inf sup-oi">
                                <h2 class="w-100">We are the Best <br>Internet Partner for You</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut consectetur maximus justo, et malesuada dolor dictum in. Maecenas nec elit risus. Nunc ut nunc aliquam, blandit magna et, tempus quam</p>
                                <ul>
                                    <li><i class="fas fa-check"></i> Nam facilisis nibh sed nunc aliquam, et volutpat ipsum</li>
                                    <li><i class="fas fa-check"></i> dignissim sapien. Vestibulum non leo fringilla, luctus turpis quis</li>
                                    <li> <i class="fas fa-check"></i> Aliquam vitae augue nisi. Phasellus ut dui a neque</li>
                                </ul>
                                <a href="index.html">
                                    <button type="button" class="btn btn-outline-light" onclick="location.href='signUp'">Sign Up</button>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 log-det">
                            
                            <h2>Welcome Back</h2>
                            <div class="row">
                                <ul>
                                    <a href=""><li><i class="fab fa-facebook-f"></i></li></a>
                                    <a href=""><li><i class="fab fa-twitter"></i></li></a>
                                    <a href=""><li><i class="fab fa-google"></i></li></a>
                                </ul>
                            </div>
                            <div class="row">
                                <p class="small-info">or use your email account</p>
                            </div>

							<form id="signIn" action="" method="post">
                            <div class="text-box-cont">
                               
                                 <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">
                                            <i class="far fa-envelope"></i>
                                        </span>
                                    </div>
                                    <input type="text" name="email" class="form-control" placeholder="Email Address" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                                 <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
                                    </div>
                                    <input type="password" class="form-control" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                                   <p>
                            <label class="container">
                              <input type="checkbox">
                              <span class="checkmark"></span>Remember me
                            </label>
                            <a href="">forget password ?</a></p>
                               </form>
                                <div class="input-group center  mb-3">
                                           
                                    <button type="submit" class="btn btn-success ">Sign In</button>
                                    <button type="button" class="btn btn-primary " onclick="location.href='signUp'">Sign up</button>
                                </div>    
                            </div>
                            


                        </div>
                       
                    </div>
                </div>
                 
            </div>
        </div>
   
</body>

<!-- <script src="/resources/signIn/js/jquery-3.2.1.min.js"></script>
<script src="/resources/signIn/js/popper.min.js"></script>
<script src="/resources/signIn/js/bootstrap.min.js"></script>
<script src="/resources/signIn/js/script.js"></script> -->
</html>
