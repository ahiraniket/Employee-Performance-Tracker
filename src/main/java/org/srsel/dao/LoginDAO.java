package org.srsel.dao;

import org.srsel.model.LoginVO;

public interface LoginDAO {

	public LoginVO getByUsername(String userName);
	
	
}