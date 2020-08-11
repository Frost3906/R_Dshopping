package com.spring.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
	
	public class EmailSender  {
	     
	    @Autowired
	    protected JavaMailSender  mailSender;
	 
	    public void SendEmail(EmailVO email) throws Exception {
	         
	        MimeMessage msg = mailSender.createMimeMessage();
	        try {
	        	msg.setSubject(email.getSubject());
		        msg.setText(email.getContent());
		        msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReciver()));
		        
	        }catch(MessagingException e) {
	        	System.out.println("MessagingException");
	        	e.printStackTrace();
	        }
	        try {
	        	mailSender.send(msg);
	        }catch(MailException e) {
	        	System.out.println("MailException�߻�");
	        	e.printStackTrace();
	        }
	        
	        
	        
	    }

}
