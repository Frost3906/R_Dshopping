/**
 *  이메일 형식 
 *  비밀번호 형식 (8자리 이상 대,소문자, 특수기호 포함)  
 */
$(function(){
	$("#signUp").validate({
		rules:{
			firstName:{
				required:true
			},
			lastName:{
				required:true
			},
			email:{
				required:true,
				email:true
			},
			password:{
				required:true,
				validPwd:true
			},
			mobile:{
				required:true
			}
		},
		messages:{
			firstName:{
				required:"REQUIRED INPUT"
			},
			lastName:{
				required:"REQUIRED INPUT"
			},
			email:{
				required:"REQUIRED INPUT",
				email:"It is not in E-mail format."
			},
			password:{
				required:"REQUIRED INPUT",
				validPwd:"8 digits or more, including uppercase and lowercase and special characters"
			},
			mobile:{
				required:"REQUIRED INPUT"
			}
		}
	})
})

$.validator.addMethod("validPwd", function(value){
	const regPwd= /^(?=.*[A-z])(?=.*\d)(?=.*[!@#$%^&])[A-z\d!@#$%^&]{8,50}$/;
	return regPwd.test(value);
}, " 8 digits, A-z, !@#$%^&");