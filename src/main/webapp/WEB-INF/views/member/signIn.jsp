	<!-- <script>
	let info=${info};
	let error=${error};
	
	if(info === " "){
		alert(error);
		return false;
	}else if(error === " "){
		alert(info);
		return false;	
	}
	</script> -->
<%@include file="../includes/header.jsp" %>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
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
                                    <a href="${naver_url}"><li><i class="fab fa-instagram"></i></li></a>
                                    <a href="${google_url}"><li><i class="fab fa-google"></i></li></a>
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
                                    <input type="password" name="password" class="form-control" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                                   <p>
                            <label class="container">
                              <input type="checkbox">
                              <span class="checkmark"></span>Remember me
                            </label>
                            <a href="" id="forgetPwd" >forget password ?</a></p>
                               
                                <div class="input-group center  mb-3">                                           
                                    <button type="submit" class="btn btn-success ">Sign In</button>
                                    <button type="button" class="btn btn-primary " onclick="location.href='signUp'">Sign up</button>                                    
                                </div>    
                            </div>  
                          </form>                          
                        </div>
                    </div>
                </div>
            </div>
         </div>
         
<%-- 비밀번호 찾기 Modal --%>
<div class="modal fade" id="forgetPwdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Forgot your password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	     <form action="forgetPwd" method="post" id="sendInfo">
	         <input type="text" name="email" class="form-control" placeholder="Email Address" aria-label="Username" aria-describedby="basic-addon1">
	         <input type="text" name="mobile" class="form-control" placeholder="ex)000-0000-0000" aria-label="Username" aria-describedby="basic-addon1">
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success sendInfo" >Send E-mail</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
let forgetPwdForm=$("#sendInfo");
$(function(){
	$("#forgetPwd").click(function(e){
		e.preventDefault();
		$("#forgetPwdModal").modal("show");
	})
	
	$(".sendInfo").click(function (){
		console.log(forgetPwdForm);
		forgetPwdForm.submit();
		$("#forgetPwdModal").modal("hide");
	})
})
</script>
</body>
<!-- <script src="/resources/signIn/js/jquery-3.2.1.min.js"></script>
<script src="/resources/signIn/js/popper.min.js"></script>
<script src="/resources/signIn/js/bootstrap.min.js"></script>
<script src="/resources/signIn/js/script.js"></script> -->
</html>
