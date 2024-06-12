package org.srsel.service;


import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.srsel.dao.RegisterDAO;
import org.srsel.model.LoginVO;
import org.srsel.model.RegisterVO;

@Service
@Transactional
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	RegisterDAO registerDAO;
	
	@Override
	public void registerUser(RegisterVO registerVO) {
		
		registerDAO.registerUser(registerVO);
	}

	@Override
	public void registerLogin(LoginVO loginVO) {
		loginVO.setRole("ROLE_USER");
		loginVO.setEnabled(true);
		registerDAO.registerLogin(loginVO);
		
	}

}