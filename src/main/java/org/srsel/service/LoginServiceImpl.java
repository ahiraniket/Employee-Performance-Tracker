package org.srsel.service;

import org.srsel.dao.LoginDAO;
import org.srsel.model.LoginVO;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginDAO loginDAO;
	
	@Override
	public LoginVO getByUsername(String userName) {
		return loginDAO.getByUsername(userName);
	}

}
