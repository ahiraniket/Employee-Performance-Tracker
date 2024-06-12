package org.srsel.dao;

import java.util.List;

import org.srsel.model.ManageBugVO;

public interface ManageBugDAO {
	public void insertBugs(ManageBugVO manageBugVO);

	public List viewBugs();

	public List editBugs(ManageBugVO manageBugVO);

	public void deleteBugs(ManageBugVO manageBugVO);

	public List getBugByLoginId(int loginId);
}
