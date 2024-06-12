package org.srsel.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import org.srsel.model.ManageBugVO;

public interface ManageBugService {
	public void insertBugs(ManageBugVO manageBugVO);

	public List viewBugs();

	public List editBugs(ManageBugVO manageBugVO);

	public void deleteBugs(ManageBugVO ManageBugVO);

	public List getBugByLoginId(int loginId);

	public void completeBugs(ManageBugVO manageBugVO);

	public void openBugs(ManageBugVO manageBugVO);

	public void ongoingBugs(ManageBugVO manageBugVO);
}
