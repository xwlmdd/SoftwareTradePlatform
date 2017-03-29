package com.yzq.stp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/stp/")
public class ToViewController {
	
	@RequestMapping("toRegister")
	public String toRegister(){
		return "register";
	}
	
	@RequestMapping("toLogin")
	public String toLogin(){
		return "login";
	}
	
	@RequestMapping("toPublicProject")
	public String toPublicProject(){
		return "sendPublic";
	}
	
	
}
