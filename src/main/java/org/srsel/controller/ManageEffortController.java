package org.srsel.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.srsel.model.LoginVO;
import org.srsel.model.ManageEffortVO;
import org.srsel.service.LoginService;
import org.srsel.service.ManageEffortService;
import org.srsel.utils.Basemethods;

@Controller
public class ManageEffortController {

	@Autowired
	ManageEffortService manageEffortService;

	@Autowired
	Basemethods basemethods;

	@Autowired
	LoginService loginService;

	@GetMapping(value = "user/addEfforts")
	public ModelAndView addEfforts() {
		LoginVO loginVO = loginService.getByUsername(basemethods.getUserName());
		List viewEffortList = this.manageEffortService.getEffortByLoginId(loginVO.getId());
		return new ModelAndView("user/addEfforts", "manageEffortVO", new ManageEffortVO())
				.addObject("formName", "Add your Effort").addObject("viewEffortList", viewEffortList);
	}

	@GetMapping(value = "user/viewEfforts")
	public ModelAndView viewUserEfforts() {
		LoginVO loginVO = loginService.getByUsername(basemethods.getUserName());
		List viewEffortList = this.manageEffortService.getEffortByLoginId(loginVO.getId());
		return new ModelAndView("user/viewEfforts").addObject("viewEffortList", viewEffortList);
	}
	
	@GetMapping(value = "admin/approveEffort")
	public ModelAndView approveEffort(@RequestParam("effortId") int effortId) {
		ManageEffortVO manageEffortsVO = new ManageEffortVO();
		manageEffortsVO.setEffortId(effortId);
		List effortList = manageEffortService.editEfforts(manageEffortsVO);
		System.out.println(effortList.get(0));
		manageEffortsVO = (ManageEffortVO) effortList.get(0);
		manageEffortService.approveEfforts(manageEffortsVO);
		return new ModelAndView("redirect:viewEfforts");
	}
	
	@GetMapping(value = "user/deleteEffort")
	public ModelAndView deleteEffort(@RequestParam("effortId") int effortId) {
		ManageEffortVO manageEffortsVO = new ManageEffortVO();
		manageEffortsVO.setEffortId(effortId);
		List effortList = manageEffortService.editEfforts(manageEffortsVO);
		System.out.println(effortList.get(0));
		manageEffortsVO = (ManageEffortVO) effortList.get(0);
		manageEffortService.deleteEfforts(manageEffortsVO);
		return new ModelAndView("redirect:viewEfforts");
	}
	
	@GetMapping(value = "admin/rejectEffort")
	public ModelAndView rejectEffort(@RequestParam("effortId") int effortId) {
		ManageEffortVO manageEffortsVO = new ManageEffortVO();
		manageEffortsVO.setEffortId(effortId);
		List effortList = manageEffortService.editEfforts(manageEffortsVO);
		System.out.println(effortList.get(0));
		manageEffortsVO = (ManageEffortVO) effortList.get(0);
		manageEffortService.rejectEfforts(manageEffortsVO);
		return new ModelAndView("redirect:viewEfforts");
	}

	@GetMapping(value = "user/insertEffort")
	public ModelAndView insertEffort(@ModelAttribute ManageEffortVO manageEffortVO) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		manageEffortVO.setEffortDate(format.format(new Date()));
		LoginVO loginVO = loginService.getByUsername(basemethods.getUserName());
		manageEffortVO.setLoginVO(loginVO);
		this.manageEffortService.insertEfforts(manageEffortVO);
		return new ModelAndView("redirect:addEfforts").addObject("op", "true");
	}

	@GetMapping(value = "admin/viewEfforts")
	public ModelAndView viewEfforts() {
		List viewEffortsList = manageEffortService.viewEfforts();
		
		return new ModelAndView("admin/viewEfforts", "viewEffortsList", viewEffortsList);
	}

	@GetMapping(value = "user/editEffort")
	public ModelAndView editEffort(@RequestParam("effortId") int effortId) {
		ManageEffortVO manageEffortVO = new ManageEffortVO();
		manageEffortVO.setEffortId(effortId);
		List editEffortList = manageEffortService.editEfforts(manageEffortVO);
		manageEffortVO = (ManageEffortVO) editEffortList.get(0);
		return new ModelAndView("user/addEfforts", "manageEffortVO", manageEffortVO).addObject("formName",
				"Edit your Effort");
	}

}
