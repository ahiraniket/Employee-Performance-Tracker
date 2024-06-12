package org.srsel.service;


import org.srsel.model.LoginVO;

public interface LoginService {

	public LoginVO getByUsername(String userName);
	

}