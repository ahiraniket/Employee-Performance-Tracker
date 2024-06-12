package org.srsel.service;

import org.srsel.model.LoginVO;
import org.srsel.model.RegisterVO;

public interface RegisterService {

	public void registerLogin(LoginVO loginVO);

	public void registerUser(RegisterVO registerVO);

}