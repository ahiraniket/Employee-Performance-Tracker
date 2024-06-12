package org.srsel.service;

import java.util.List;

import org.srsel.model.ForgotPasswordVO;
import org.srsel.model.LoginVO;

public interface ForgotPasswordService {

	public void insertUser(ForgotPasswordVO forgotPasswordVO);

	public List verifyToken(String token);

	public void updatePassword(LoginVO loginVO);

	public List loginDetailsOfUser(String emailId);
	
}
