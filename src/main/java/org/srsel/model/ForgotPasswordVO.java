package org.srsel.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="forgot_password")
public class ForgotPasswordVO {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="forgot_password_id")
	private int forgotPasswordId;
	
	@Column(name="email_id")
	private String emailId;
	
	@Column(name="status")
	private boolean status;
	
	@Column(name="token")
	private String token;

	public int getForgotPasswordId() {
		return forgotPasswordId;
	}

	public String getEmailId() {
		return emailId;
	}

	public boolean isStatus() {
		return status;
	}

	public String getToken() {
		return token;
	}

	public void setForgotPasswordId(int forgotPasswordId) {
		this.forgotPasswordId = forgotPasswordId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public void setToken(String token) {
		this.token = token;
	}
	
	
	
}
