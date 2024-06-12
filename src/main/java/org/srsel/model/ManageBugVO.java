package org.srsel.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.srsel.model.LoginVO;

@Entity
@Table(name = "ManageBug_table")
public class ManageBugVO {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "bug_id")
	private int bugId;

	@Column(name = "bug_name")
	private String bugName;

	@Column(name = "bug_description")
	private String bugDescription;

	@Column(name = "bug_date")
	private String bugDate;

	@Column(name = "bug_status")
	private String bugStatus;

	@Column(name = "enabled")
	private boolean enabled;

	@ManyToOne
	private LoginVO loginVO;

	public int getBugId() {
		return bugId;
	}

	public void setBugId(int bugId) {
		this.bugId = bugId;
	}

	public String getBugName() {
		return bugName;
	}

	public void setBugName(String bugName) {
		this.bugName = bugName;
	}

	public String getBugDescription() {
		return bugDescription;
	}

	public void setBugDescription(String bugDescription) {
		this.bugDescription = bugDescription;
	}

	public String getBugDate() {
		return bugDate;
	}

	public void setBugDate(String bugDate) {
		this.bugDate = bugDate;
	}

	public String getBugStatus() {
		return bugStatus;
	}

	public void setBugStatus(String bugStatus) {
		this.bugStatus = bugStatus;
	}

	public LoginVO getLoginVO() {
		return loginVO;
	}

	public void setLoginVO(LoginVO loginVO) {
		this.loginVO = loginVO;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
}
