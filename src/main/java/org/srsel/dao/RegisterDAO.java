package org.srsel.dao;

import org.srsel.model.LoginVO;
import org.srsel.model.RegisterVO;

public interface RegisterDAO {

	public void registerUser(RegisterVO registerVO);

	public void registerLogin(LoginVO loginVO);

}
