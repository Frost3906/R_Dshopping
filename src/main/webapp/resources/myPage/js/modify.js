$(function(){
	$("#modify").validate({
		rules:{
			firstName:{
				required:true
			},
			lastName:{
				required:true
			},
			new_password:{
				validPwd:true
			},
			confirm_password:{
				equalTo:new_password
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
			new_password:{
				validPwd:"8 digits or more, including uppercase and lowercase, special characters"
			},
			confirm_password:{
				equalTo:"Do not match."
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