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
import org.srsel.model.ManageBugVO;
import org.srsel.model.ManageEffortVO;
import org.srsel.service.LoginService;
import org.srsel.service.ManageBugService;
import org.srsel.utils.Basemethods;

@Controller
public class ManageBugController {

	@Autowired
	ManageBugService manageBugService;

	@Autowired
	Basemethods basemethods;

	@Autowired
	LoginService loginService;

	@GetMapping(value = "user/addBugs")
	public ModelAndView addBugs() {
		LoginVO loginVO = loginService.getByUsername(basemethods.getUserName());
		List viewBugList = this.manageBugService.getBugByLoginId(loginVO.getId());
		return new ModelAndView("user/addBugs", "manageBugVO", new ManageBugVO()).addObject("formName", "Add your Bug");
	}

	@GetMapping(value = "user/viewBugs")
	public ModelAndView viewUserBugs() {
		LoginVO loginVO = loginService.getByUsername(basemethods.getUserName());
		List viewBugList = this.manageBugService.getBugByLoginId(loginVO.getId());
		return new ModelAndView("user/viewBugs").addObject("viewBugList", viewBugList);
	}

	@GetMapping(value = "admin/completeBug")
	public ModelAndView completeBug(@RequestParam("bugId") int bugId) {
		ManageBugVO manageBugsVO = new ManageBugVO();
		manageBugsVO.setBugId(bugId);
		List bugList = manageBugService.editBugs(manageBugsVO);
		System.out.println(bugList.size());
		manageBugsVO = (ManageBugVO) bugList.get(0);
		manageBugService.completeBugs(manageBugsVO);
		return new ModelAndView("redirect:viewBugs");
	}

	@GetMapping(value = "admin/ongoingBug")
	public ModelAndView ongoingBug(@RequestParam("bugId") int bugId) {
		ManageBugVO manageBugsVO = new ManageBugVO();
		manageBugsVO.setBugId(bugId);
		List bugList = manageBugService.editBugs(manageBugsVO);
		System.out.println(bugList.size());
		manageBugsVO = (ManageBugVO) bugList.get(0);
		manageBugService.ongoingBugs(manageBugsVO);
		return new ModelAndView("redirect:viewBugs");
	}

	@GetMapping(value = "admin/openBug")
	public ModelAndView openBug(@RequestParam("bugId") int bugId) {
		ManageBugVO manageBugsVO = new ManageBugVO();
		manageBugsVO.setBugId(bugId);
		List bugList = manageBugService.editBugs(manageBugsVO);
		System.out.println(bugList.size());
		manageBugsVO = (ManageBugVO) bugList.get(0);
		manageBugService.openBugs(manageBugsVO);
		return new ModelAndView("redirect:viewBugs");
	}

	@GetMapping(value = "user/insertBug")
	public ModelAndView insertBug(@ModelAttribute ManageBugVO manageBugVO) {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		manageBugVO.setBugDate(format.format(new Date()));

		LoginVO loginVO = loginService.getByUsername(basemethods.getUserName());
		manageBugVO.setLoginVO(loginVO);
		this.manageBugService.insertBugs(manageBugVO);
		return new ModelAndView("redirect:addBugs");
	}

	@GetMapping(value = "admin/viewBugs")
	public ModelAndView viewBugs() {
		List viewBugsList = manageBugService.viewBugs();
		return new ModelAndView("admin/viewBugs", "viewBugsList", viewBugsList);
	}

	@GetMapping(value = "user/editBug")
	public ModelAndView editBug(@RequestParam("bugId") int bugId) {
		ManageBugVO manageBugVO = new ManageBugVO();
		manageBugVO.setBugId(bugId);
		List editBugList = manageBugService.editBugs(manageBugVO);
		manageBugVO = (ManageBugVO) editBugList.get(0);
		return new ModelAndView("user/addBug", "manageBugVO", manageBugVO).addObject("formName", "Edit your Bug");
	}

	@GetMapping(value = "user/deleteBug")
	public ModelAndView deleteBug(@RequestParam("bugId") int bugId) {
		ManageBugVO manageBugsVO = new ManageBugVO();
		manageBugsVO.setBugId(bugId);
		List bugList = manageBugService.editBugs(manageBugsVO);
		System.out.println(bugList.get(0));
		manageBugsVO = (ManageBugVO) bugList.get(0);
		manageBugService.deleteBugs(manageBugsVO);
		return new ModelAndView("redirect:viewBugs");
	}
}
