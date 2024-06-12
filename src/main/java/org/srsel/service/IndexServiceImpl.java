package org.srsel.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.srsel.dao.IndexDAO;
import org.srsel.model.LoginVO;

@Service
@Transactional
public class IndexServiceImpl implements IndexService {
	@Autowired
	IndexDAO indexDAO;

	@Override
	public List totalEfforts() {
		List totalEffortsList = this.indexDAO.totalEfforts();
		return totalEffortsList;
	}

	@Override
	public List totalBugs() {
		List totalBugsList = this.indexDAO.totalBugs();
		return totalBugsList;
	}

	@Override
	public List userEfforts(LoginVO loginVO) {
		List userEffortsList = this.indexDAO.userEfforts(loginVO);
		return userEffortsList;
	}

	@Override
	public List userBugs(LoginVO loginVO) {
		List userBugsList = this.indexDAO.userBugs(loginVO);
		return userBugsList;
	}

	@Override
	public List userHours(LoginVO loginVO) {
		List userTimeList = this.indexDAO.userHours(loginVO);
		int totalHours = 0;
		System.out.println(userTimeList.get(0));
		if (userTimeList.get(0) != null) {
			totalHours = Integer.parseInt(userTimeList.get(0).toString())
					+ (Integer.parseInt(userTimeList.get(1).toString()) / 60);
		}
		List userHoursList = new ArrayList<Integer>();
		userHoursList.add(totalHours);
		return userHoursList;
	}

	@Override
	public List totalHours() {
		List totalTimeList = this.indexDAO.totalHours();
		int totalHours = Integer.parseInt(totalTimeList.get(0).toString())
				+ (Integer.parseInt(totalTimeList.get(1).toString()) / 60);
		List totalHoursList = new ArrayList<Integer>();
		totalHoursList.add(totalHours);
		return totalHoursList;
	}
}
