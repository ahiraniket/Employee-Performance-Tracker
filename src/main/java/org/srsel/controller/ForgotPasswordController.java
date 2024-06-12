package org.srsel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.srsel.model.ForgotPasswordVO;
import org.srsel.model.LoginVO;
import org.srsel.service.ForgotPasswordService;

@Controller
public class ForgotPasswordController {

	@Autowired
	ForgotPasswordService forgotPasswordService;

	@RequestMapping(value = "forgotPassword", method = RequestMethod.GET)
	public ModelAndView loadForgotPassword() {
		return new ModelAndView("forgotPassword", "forgotPasswordVO", new ForgotPasswordVO());
	}

	@RequestMapping(value = "sendResetEmail", method = RequestMethod.GET)
	public ModelAndView sendResetEmail(@ModelAttribute ForgotPasswordVO forgotPasswordVO) {

		this.forgotPasswordService.insertUser(forgotPasswordVO);

		return new ModelAndView("login");
	}

	@RequestMapping(value = "verify-token", method = RequestMethod.GET)
	public ModelAndView sendResetEmail(@RequestParam("token") String token) {

		List<ForgotPasswordVO> forgotPasswordList = this.forgotPasswordService.verifyToken(token);

		if (forgotPasswordList.size() > 0) {
			LoginVO loginVO = new LoginVO();
			
			List forgotPasswordUserList=this.forgotPasswordService.loginDetailsOfUser(forgotPasswordList.get(0).getEmailId()); 
			
			loginVO=(LoginVO)forgotPasswordUserList.get(0);
			return new ModelAndView("changePassword", "loginVO", loginVO);
			
		} else {
			System.out.println("Wrong token or didn't used forgot password");
			return new ModelAndView("login");
		}
	}

	@RequestMapping(value = "changePassword", method = RequestMethod.GET)
	public ModelAndView changePassword(@ModelAttribute LoginVO loginVO, @RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword) {

		if(newPassword.equals(confirmPassword)){
			System.out.println("passwords are same");
			loginVO.setPassword(newPassword);
			this.forgotPasswordService.updatePassword(loginVO);
			return new ModelAndView("login");
		}else{
			System.out.println("passwords are wrong");
			return new ModelAndView("changePassword").addObject("wrongPassword","Wrong Password");
		}
		
		
	}

}
