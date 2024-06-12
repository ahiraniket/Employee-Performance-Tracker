package org.srsel.service;

import java.util.List;

import org.srsel.model.LoginVO;

public interface IndexService {
	public List totalEfforts();
	public List totalBugs();
	public List userEfforts(LoginVO loginVO);
	public List userBugs(LoginVO loginVO);
	public List userHours(LoginVO loginVO);
	public List totalHours();
}
