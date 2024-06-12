package org.srsel.dao;

import java.util.List;

import org.srsel.model.ManageEffortVO;

public interface ManageEffortDAO {
	public void insertEfforts(ManageEffortVO manageEffortVO);

	public List viewEfforts();

	public List editEfforts(ManageEffortVO manageEffortVO);

	public void deleteEfforts(ManageEffortVO manageEffortVO);

	public List getEffortByLoginId(int loginId);

	public boolean approveEffort(ManageEffortVO manageEffortVO);
}
