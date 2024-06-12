package org.srsel.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.srsel.dao.ManageEffortDAO;
import org.srsel.model.ManageEffortVO;

@Service
@Transactional
public class ManageEffortServiceImpl implements ManageEffortService {

	@Autowired
	ManageEffortDAO manageEffortDAO;

	@Override
	public List viewEfforts() {
		List viewEffortsList = manageEffortDAO.viewEfforts();
		return viewEffortsList;
	}

	@Override
	public List editEfforts(ManageEffortVO manageEffortVO) {
		List editEffortsList = manageEffortDAO.editEfforts(manageEffortVO);
		return editEffortsList;
	}

	@Override
	public void deleteEfforts(ManageEffortVO manageEffortVO) {
		manageEffortVO.setEnabled(false);
		manageEffortDAO.deleteEfforts(manageEffortVO);

	}

	@Override
	public void insertEfforts(ManageEffortVO manageEffortVO) {
		manageEffortVO.setEffortStatus("PENDING");
		manageEffortVO.setEnabled(true);
		this.manageEffortDAO.insertEfforts(manageEffortVO);

	}
	
	@Override
	public boolean approveEfforts(ManageEffortVO manageEffortVO) {
		manageEffortVO.setEffortStatus("APPROVED");
		manageEffortVO.setEnabled(true);
		this.manageEffortDAO.insertEfforts(manageEffortVO);
		return true;

	}
	
	@Override
	public boolean rejectEfforts(ManageEffortVO manageEffortVO) {
		manageEffortVO.setEffortStatus("REJECTED");
		manageEffortVO.setEnabled(true);
		this.manageEffortDAO.insertEfforts(manageEffortVO);
		return true;

	}
	
	@Override
	public List getEffortByLoginId(int loginId) {
		return manageEffortDAO.getEffortByLoginId(loginId);
	}

}
