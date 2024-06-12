package org.srsel.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.srsel.dao.ManageBugDAO;
import org.srsel.model.ManageBugVO;

@Service
@Transactional
public class ManageBugServiceImpl implements ManageBugService {

	@Autowired
	ManageBugDAO manageBugDAO;

	@Override
	public List viewBugs() {
		List viewBugsList = manageBugDAO.viewBugs();
		return viewBugsList;
	}

	@Override
	public List editBugs(ManageBugVO manageBugVO) {
		List editBugsList = manageBugDAO.editBugs(manageBugVO);
		return editBugsList;
	}

	@Override
	public void deleteBugs(ManageBugVO manageBugVO) {
		manageBugVO.setEnabled(false);
		manageBugDAO.deleteBugs(manageBugVO);

	}

	@Override
	public void openBugs(ManageBugVO manageBugVO) {
		manageBugVO.setBugStatus("OPEN");
		this.manageBugDAO.insertBugs(manageBugVO);
	}
	
	@Override
	public void completeBugs(ManageBugVO manageBugVO) {
		manageBugVO.setBugStatus("RESOLVED");
		this.manageBugDAO.insertBugs(manageBugVO);

	}
	
	@Override
	public void ongoingBugs(ManageBugVO manageBugVO) {
		manageBugVO.setBugStatus("ONGOING");
		this.manageBugDAO.insertBugs(manageBugVO);

	}
	
	@Override
	public void insertBugs(ManageBugVO manageBugVO) {
		manageBugVO.setBugStatus("OPEN");
		manageBugVO.setEnabled(true);
		this.manageBugDAO.insertBugs(manageBugVO);

	}

	@Override
	public List getBugByLoginId(int loginId) {
		return manageBugDAO.getBugByLoginId(loginId);
	}
}
