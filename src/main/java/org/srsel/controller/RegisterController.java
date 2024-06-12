package org.srsel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import org.srsel.model.RegisterVO;
import org.srsel.service.RegisterService;

@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public ModelAndView loadRegister() {

		return new ModelAndView("register", "registerVO", new RegisterVO());
	}

	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute RegisterVO registerVO) {

		registerService.registerLogin(registerVO.getLoginVO());
		registerService.registerUser(registerVO);
		return new ModelAndView("redirect:/");
	}

}