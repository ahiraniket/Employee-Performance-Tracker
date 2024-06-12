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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.srsel.model.LoginVO;
import org.srsel.service.IndexService;
import org.srsel.service.LoginService;
import org.srsel.service.ManageBugService;
import org.srsel.service.ManageEffortService;
import org.srsel.utils.Basemethods;

@Controller
public class LoginController {
	@Autowired
	IndexService indexService;
	@Autowired
	Basemethods basemethods;
	@Autowired
	LoginService loginService;
	@Autowired
	ManageEffortService manageEffortService;
	@Autowired
	ManageBugService manageBugService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView loadLogin() {
		return new ModelAndView("login");
	}

	@RequestMapping(value = "effortlogger/admin/index", method = RequestMethod.GET)
	public ModelAndView adminIndex() {
		List viewEffortList = this.manageEffortService.viewEfforts();
		List viewBugList = this.manageBugService.viewBugs();
		List adminEfforts = this.indexService.totalEfforts();
		List adminBugs = this.indexService.totalBugs();
		List adminHours = this.indexService.totalHours();
		return new ModelAndView("admin/index").addObject("recentAdminEfforts", viewEffortList)
				.addObject("recentAdminBugs", viewBugList).addObject("adminEfforts", adminEfforts.get(0))
				.addObject("adminBugs", adminBugs.get(0)).addObject("adminHours", adminHours.get(0));
	}

	@RequestMapping(value = "/user/index", method = RequestMethod.GET)
	public ModelAndView userIndex() {
		LoginVO loginVO = loginService.getByUsername(basemethods.getUserName());
		List userEfforts = this.indexService.userEfforts(loginVO);
		List userBugs = this.indexService.userBugs(loginVO);
		List userHours = this.indexService.userHours(loginVO);
		List viewEffortList = this.manageEffortService.getEffortByLoginId(loginVO.getId());
		List viewBugList = this.manageBugService.getBugByLoginId(loginVO.getId());
		return new ModelAndView("user/index").addObject("userEfforts", userEfforts.get(0))
				.addObject("userBugs", userBugs.get(0)).addObject("userHours", userHours.get(0))
				.addObject("recentUserEfforts", viewEffortList).addObject("recentUserBugs", viewBugList);
	}

	@RequestMapping(value = "logout", method = { RequestMethod.POST, RequestMethod.GET })
	public String viewUserDetails(ModelMap model, HttpServletResponse response, HttpServletRequest request) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			request.getSession().invalidate();
			request.getSession().setAttribute("tempStatus", "success");
			request.getSession().setAttribute("statusText", "Logout Successfully!");
		}
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView load() {

		return new ModelAndView("login");
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView load403() {

		return new ModelAndView("login");
	}

	@RequestMapping(value = "/user/aboutUs", method = RequestMethod.GET)
	public ModelAndView loadAboutUs() {

		return new ModelAndView("user/aboutUs");
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView loadTest() {

		return new ModelAndView("test");
	}

}