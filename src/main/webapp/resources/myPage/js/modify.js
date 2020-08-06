/**
 *  이메일 형식 
 *  비밀번호 형식 (8자리 이상 대,소문자, 특수기호 포함)  
 */
$(function(){
	$("#modify").validate({
		rules:{
			password:{
				required:true,
				remote:{
					url:"checkPwd",
					type:"post",
					data:{
						email:function(){
							return $("input[name='password']").val();
						}
					}
				},
				checkPwd:true,				
			},
			new_password:{
				required:true,
				validPwd:true
			},
			confirm_password:{
				required:true,
				equalTo:"input[name='new_password'"
			}
		},
		messages:{
			password:{
				required:"REQUIRED INPUT",
				checkPwd:"8 digits or more, including uppercase and lowercase and special characters"				
			},
			new_password:{
				required:"REQUIRED INPUT",
				validPwd:"8 digits or more, including uppercase and lowercase and special characters"
			},
			confirm_password:{
				required:"REQUIRED INPUT",
				equalTo:"Passwords do not match."
			}
		}
	})
})

$.validator.addMethod("validPwd", function(value){
	const regPwd= /^(?=.*[A-z])(?=.*\d)(?=.*[!@#$%^&])[A-z\d!@#$%^&]{8,50}$/;
	return regPwd.test(value);
}, " 8 digits, A-z, !@#$%^&");