package org.srsel.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ManageEffort_table")
public class ManageEffortVO {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "effort_id")
	private int effortId;

	@Column(name = "effort_name")
	private String effortName;

	@Column(name = "effort_description")
	private String effortDescription;

	@Column(name = "effort_time_hours")
	private int effortTimeHours;

	@Column(name = "effort_time_minutes")
	private int effortTimeMinutes;

	@Column(name = "effort_status")
	private String effortStatus;

	@Column(name = "effort_date")
	private String effortDate;

	@Column(name = "enabled")
	private boolean enabled;

	@ManyToOne
	private LoginVO loginVO;

	public int getEffortId() {
		return effortId;
	}

	public void setEffortId(int effortId) {
		this.effortId = effortId;
	}

	public String getEffortName() {
		return effortName;
	}

	public void setEffortName(String effortName) {
		this.effortName = effortName;
	}

	public String getEffortDescription() {
		return effortDescription;
	}

	public void setEffortDescription(String effortDescription) {
		this.effortDescription = effortDescription;
	}

	public int getEffortTimeHours() {
		return effortTimeHours;
	}

	public void setEffortTimeHours(int effortTimeHours) {
		this.effortTimeHours = effortTimeHours;
	}

	public int getEffortTimeMinutes() {
		return effortTimeMinutes;
	}

	public void setEffortTimeMinutes(int effortTimeMinutes) {
		this.effortTimeMinutes = effortTimeMinutes;
	}

	public String getEffortStatus() {
		return effortStatus;
	}

	public void setEffortStatus(String effortStatus) {
		this.effortStatus = effortStatus;
	}

	public LoginVO getLoginVO() {
		return loginVO;
	}

	public void setLoginVO(LoginVO loginVO) {
		this.loginVO = loginVO;
	}

	public String getEffortDate() {
		return effortDate;
	}

	public void setEffortDate(String effortDate) {
		this.effortDate = effortDate;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

}
